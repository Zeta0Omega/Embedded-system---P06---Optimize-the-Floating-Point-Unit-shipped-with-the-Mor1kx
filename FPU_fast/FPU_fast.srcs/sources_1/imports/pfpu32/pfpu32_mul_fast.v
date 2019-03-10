//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2019 15:01:13
// Design Name: 
// Module Name: pfpu32_mul
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "mor1kx-defines.v"

module pfpu32_mul_fast(
           // "control" related
           input             clk,
           input             rst,
           input             flush_i,  // flushe pipe
           input             adv_i,    // advance pipe
           input             start_ii,  // start
           input      [1:0]  rmode_ii,
           // input 'a' related values
           input             signa_ii,
           input      [23:0] fract24ash_ii,
           // input 'b' related values
           input             signb_ii,
           input      [23:0] fract24bsh_ii,
           // input related to both 'a' and 'b'
           input             snan_ii,
           input             qnan_ii,
           input             anan_sign_ii,
           input             opc0_ii,
           input             inf_ii,
           input             inv_ii,
           input      [ 9:0] exp10mux_ii,
//            module outputs
           output reg        [31:0] mul_fast_result_o, //operation result
           output reg        mul_fast_ready_o,         //signal operation completed
           output reg  [`OR1K_FPCSR_WIDTH-1:0] fpcsr_o //flags related to the result
      );
      
      reg        start_i;
      reg [ 1:0] rmode_i;
      
      reg        signa_i;
      reg [23:0] fract24ash_i;
      
      reg        signb_i;
      reg [23:0] fract24bsh_i;
      
      reg        snan_i;
      reg        qnan_i;
      reg        anan_sign_i;
      reg        inv_i;
      reg        inf_i;
      reg        opc0_i;
      reg [ 9:0] exp10mux_i;
      
      always@(posedge clk)
        begin
          if(adv_i)
            begin
              rmode_i     <= rmode_ii;
              
              signa_i     <= signa_ii;
              fract24ash_i  <= fract24ash_ii;
              
              signb_i     <= signb_ii;
              fract24bsh_i  <= fract24bsh_ii;
                
              inf_i       <= inf_ii;
              inv_i       <= inv_ii;
              exp10mux_i  <= exp10mux_ii;
              opc0_i      <= opc0_ii;
              
              snan_i      <= snan_ii;
              qnan_i      <= qnan_ii;
              anan_sign_i <= anan_sign_ii;
            end
        end
        
      always @(posedge clk `OR_ASYNC_RST)
        begin
          if (rst) begin
            start_i <= 1'b0;
          end else if(flush_i) begin
            start_i <= 1'b0;
          end else if(adv_i) begin
            start_i <= start_ii;
          end
        end // posedge clock 
      
      // local parameters for exceptions (SNAN,QNAN,INF) for final result
      localparam INF  = 31'b1111111100000000000000000000000;
      localparam QNAN = 31'b1111111110000000000000000000000;
      localparam SNAN = 31'b1111111101111111111111111111111;
    
      
      //**********************************************************************//
      //**********************************************************************//
      //  STAGE 0: input analysis (exceptions, exponent, shifts computed)     //
      //           partial products                                           //
      //**********************************************************************//
      //**********************************************************************//
  
      // force result to zero
      wire [23:0] s0t_fract24a = fract24ash_i & {24{~opc0_i}};
      wire [23:0] s0t_fract24b = fract24bsh_i & {24{~opc0_i}};
      
      // force result to zero: '0' is represented using a 0 exponent
      wire [9:0] s0t_exp10c = exp10mux_i & {10{~opc0_i}};
    
      //compute multipliers
      wire [31:0] itr_mul32a   = {s0t_fract24a,8'd0};
      wire [15:0] s0t_mul16_al = itr_mul32a[15: 0];
      wire [15:0] s0t_mul16_ah = itr_mul32a[31:16];
      wire [31:0] itr_mul32b   = {s0t_fract24b,8'd0};
      wire [15:0] s0t_mul16_bl = itr_mul32b[15: 0];
      wire [15:0] s0t_mul16_bh = itr_mul32b[31:16];
      
      // right shift value and appropriatelly corrected exponent
      wire s0t_exp10c_0             = ~(|s0t_exp10c);
      wire [9:0] s0t_shr_of_neg_exp = 11'h401 - {1'b0,s0t_exp10c}; // 1024-v+1
      // variants:
      wire [9:0] s0t_shr_t;
      wire [9:0] s0t_exp10rx;
      assign {s0t_shr_t,s0t_exp10rx} =
        // force zero result
        opc0_i     ? {10'd0,10'd0} :
        // negative exponent sum
        //   (!) takes 1x.xx case into account automatically
        s0t_exp10c[9] ? {s0t_shr_of_neg_exp,10'd1} :
        // (a) zero exponent sum (denorm. result potentially)
        //   (!) takes 1x.xx case into account automatically
        // (b) normal case
        //   (!) 1x.xx case is processed in next stage
                        {{9'd0,s0t_exp10c_0},(s0t_exp10c | {9'd0,s0t_exp10c_0})};
      // limited by 31 and forced result to zero
      wire [4:0] s0t_shrx = s0t_shr_t[4:0] | {5{|s0t_shr_t[9:5]}};
    
      // stage 0 outputs
      //   input related
      reg s0o_inv, s0o_inf_i, s0o_snan_i, s0o_qnan_i, s0o_anan_i_sign;
      //   computation related
      reg        s0o_signc;
      reg  [9:0] s0o_exp10c;
      reg  [9:0] s0o_exp10rx;
      reg  [4:0] s0o_shrx;
      //   partial products
      reg [31:0] s0o_fract32_albl;
      reg [31:0] s0o_fract32_albh;
      reg [31:0] s0o_fract32_ahbl;
      reg [31:0] s0o_fract32_ahbh;
      reg [ 1:0] s0o_rmode;
      //stage 0 completed
      reg        s0o_ready;
      
      //   registering
      always @(posedge clk) begin
        if(adv_i) begin
          // input related
          s0o_inv          <= inv_i;
          s0o_inf_i        <= inf_i;
          s0o_snan_i       <= snan_i;
          s0o_qnan_i       <= qnan_i;
          s0o_anan_i_sign  <= anan_sign_i;
          // computation related
          s0o_signc        <= signa_i ^ signb_i;
          s0o_exp10c       <= s0t_exp10c;
          s0o_exp10rx      <= s0t_exp10rx;
          s0o_shrx         <= s0t_shrx;
          //partial products needed to compute the result
          s0o_fract32_albl <= s0t_mul16_al * s0t_mul16_bl;
          s0o_fract32_albh <= s0t_mul16_al * s0t_mul16_bh;
          s0o_fract32_ahbl <= s0t_mul16_ah * s0t_mul16_bl;
          s0o_fract32_ahbh <= s0t_mul16_ah * s0t_mul16_bh;
          
          s0o_rmode            <= rmode_i;
        end // advance pipe
      end // posedge clock
     
      always @(posedge clk `OR_ASYNC_RST)
        begin
          if (rst) begin
            s0o_ready <= 1'b0;
          end else if(flush_i) begin
            s0o_ready <= 1'b0;
          end else if(adv_i) begin
            s0o_ready <= start_i;
          end
        end // posedge clock     
     
      
      //**********************************************************************//
      //**********************************************************************//
      //  STAGE 1: sum the partial products, compute shifts, compute sticky,  //
      //           apply shifts                                               //
      //**********************************************************************//
      //**********************************************************************//
      
      
      //build the result on 48 bits
      wire [47:0] fract48 = {s0o_fract32_ahbh,  16'd0} +
                            {16'd0,  s0o_fract32_ahbl} +
                            {16'd0,  s0o_fract32_albh} +
                            {32'd0,  s0o_fract32_albl[31:16]};
                            
      //compute last bit of the result on 28 bits                            
      reg or_high_part;
      reg or_mid_part;
      reg or_low_part;
      
      always@(*)
        begin
          or_high_part = |fract48[20:14];
        end
        
      always@(*)
        begin
          or_mid_part = |fract48[13:7];
        end
        
      always@(*)
        begin
          or_low_part = |fract48[6:0];
        end
      wire last_bit = or_high_part | or_mid_part | or_low_part;
      //result on 28 bits
      wire [27:0] s1t_fract28 = {fract48[47:21],last_bit};
      wire s1t_carry = s1t_fract28[27];
      
      //compute shifts
      wire [4:0] s1t_shr = (|s0o_shrx) ? s0o_shrx : {4'd0,s1t_carry};
      reg [9:0] s1t_exp10;                  
      always@(*)
        begin
          if(|s0o_shrx)
            s1t_exp10 = s0o_exp10rx;
          else //if (~(|s1t_shl))//always true, since s1o_shl is zero
            s1t_exp10 = s0o_exp10c + {9'd0,s1t_carry};
        end
            
      //apply shifts
      wire [27:0] s1t_fract28sh = (|s1t_shr) ? (s1t_fract28 >> s1t_shr) : s1t_fract28; 
      
      //compute sticky for left shift
      //left shift is always 0 in mul
      wire s1l_sticky = s1t_fract28[1] | s1t_fract28[0];       
      
      
     // detect how we will need to round
     wire rm_nearest = (s0o_rmode==2'b00);
     wire rm_to_zero = (s0o_rmode==2'b01);
     wire rm_to_infp = (s0o_rmode==2'b10);
     wire rm_to_infm = (s0o_rmode==2'b11);  
      
      
      
      wire [31:0] s1t_fract32 = s1t_fract28sh[27:3];
      
      wire s1t_r = s1t_fract28sh[2];
      wire s1t_g  = s1t_fract32[0];
       
      wire s1t_lostS0 = s1t_r;
      
      wire s1t_rnd_upS1 = (rm_nearest & s1t_r) | 
                 (rm_to_infp & (~s0o_signc)) |
                     (rm_to_infm &   s0o_signc);
      
      wire s1t_rnd_upS0 = (rm_nearest & s1t_g & s1t_r) | 
                 (rm_to_infp & (~s0o_signc) & s1t_lostS0) |
                     (rm_to_infm &   s0o_signc & s1t_lostS0);
        
      wire [31:0] s1t_rnd_v32S1 = s1t_rnd_upS1 ? 31'd1 : 31'd0;
      wire [31:0] s1t_rnd_v32S0 = s1t_rnd_upS0 ? 31'd1 : 31'd0;
      
      
      reg s1t_stickyh,s1t_stickyl;
        always @(s1t_fract28[13:0] or s1t_shr) 
          begin
            case (s1t_shr)
              5'd0   : s1t_stickyh = |s1t_fract28[ 1:0];
              5'd1   : s1t_stickyh = |s1t_fract28[ 2:0];
              5'd2   : s1t_stickyh = |s1t_fract28[ 3:0];
              5'd3   : s1t_stickyh = |s1t_fract28[ 4:0];
              5'd4   : s1t_stickyh = |s1t_fract28[ 5:0];
              5'd5   : s1t_stickyh = |s1t_fract28[ 6:0];
              5'd6   : s1t_stickyh = |s1t_fract28[ 7:0];
              5'd7   : s1t_stickyh = |s1t_fract28[ 8:0];
              5'd8   : s1t_stickyh = |s1t_fract28[ 9:0];
              5'd9   : s1t_stickyh = |s1t_fract28[10:0];
              5'd10  : s1t_stickyh = |s1t_fract28[11:0];
              5'd11  : s1t_stickyh = |s1t_fract28[12:0];
              //5'd12  : s1t_stickyh = |s1t_fract28[13:0];
              default: s1t_stickyh = |s1t_fract28[13:0];
            endcase
          end
             
      always @(s1t_fract28[27:14] or s1t_shr) 
        begin
          case (s1t_shr)
            5'd13  : s1t_stickyl =  s1t_fract28[14];
            5'd14  : s1t_stickyl = |s1t_fract28[15:14];
            5'd15  : s1t_stickyl = |s1t_fract28[16:14];
            5'd16  : s1t_stickyl = |s1t_fract28[17:14];
            5'd17  : s1t_stickyl = |s1t_fract28[18:14];
            5'd18  : s1t_stickyl = |s1t_fract28[19:14];
            5'd19  : s1t_stickyl = |s1t_fract28[20:14];
            5'd20  : s1t_stickyl = |s1t_fract28[21:14];
            5'd21  : s1t_stickyl = |s1t_fract28[22:14];
            5'd22  : s1t_stickyl = |s1t_fract28[23:14];
            5'd23  : s1t_stickyl = |s1t_fract28[24:14];
            5'd24  : s1t_stickyl = |s1t_fract28[25:14];
            5'd25  : s1t_stickyl = |s1t_fract28[26:14];
            default  : s1t_stickyl = |s1t_fract28[27:14];
          endcase
        end // always
      
      reg stickyfix;
      always@(s1t_shr)
      begin
         case (s1t_shr)
            5'd0   : stickyfix = 1'b0;
            5'd1   : stickyfix = 1'b0;
            5'd2   : stickyfix = 1'b0;
            5'd3   : stickyfix = 1'b0;
            5'd4   : stickyfix = 1'b0;
            5'd5   : stickyfix = 1'b0;
            5'd6   : stickyfix = 1'b0;
            5'd7   : stickyfix = 1'b0;
            5'd8   : stickyfix = 1'b0;
            5'd9   : stickyfix = 1'b0;
            5'd10  : stickyfix = 1'b0;
            5'd11  : stickyfix = 1'b0;
            5'd12  : stickyfix = 1'b0;
            5'd13  : stickyfix = 1'b1;
            5'd14  : stickyfix = 1'b1;
            5'd15  : stickyfix = 1'b1;
            5'd16  : stickyfix = 1'b1;
            5'd17  : stickyfix = 1'b1;
            5'd18  : stickyfix = 1'b1;
            5'd19  : stickyfix = 1'b1;
            5'd20  : stickyfix = 1'b1;
            5'd21  : stickyfix = 1'b1;
            5'd22  : stickyfix = 1'b1;
            5'd23  : stickyfix = 1'b1;
            5'd24  : stickyfix = 1'b1;
            5'd25  : stickyfix = 1'b1;
            default: stickyfix = 1'b1;
         endcase
      end
      
      
      reg        s1o_sign;      // signum
      reg        s1o_inv;       // invalid operation flag
      reg        s1o_inf;       // infinity  reg
      reg        s1o_snan;      // signaling NaN  reg
      reg        s1o_qnan;      // quiet NaN  reg
      reg        s1o_anan_sign; // signum for  nan
      
      reg        s1o_ready;
      reg        s1o_sticky_l;
      reg        s1o_is_shifted;
      reg [9:0]  s1o_exp10;
      reg [31:0] s1o_fract32,s1o_rnd_v32S1,s1o_rnd_v32S0;
      reg        s1o_lostS0;
      reg s1o_stickyh, s1o_stickyl, s1o_stickys;

      always @(posedge clk) begin
        if(adv_i) begin
            // input related
          s1o_inv       <=  s0o_inv;
          s1o_inf       <=  s0o_inf_i;
          s1o_snan      <=  s0o_snan_i;
          s1o_qnan      <=  s0o_qnan_i;
          s1o_anan_sign <=  s0o_anan_i_sign;
            // computation related
          s1o_sign      <=  s0o_signc;
          s1o_is_shifted <= (|s1t_shr);
          //sticky
          s1o_sticky_l  <= s1l_sticky;
          s1o_stickyh       <= s1t_stickyh;
          s1o_stickyl       <= s1t_stickyl;
          s1o_stickys       <= stickyfix;
          //exponent
          s1o_exp10     <= s1t_exp10;
          
          s1o_fract32   <= s1t_fract32;
          s1o_rnd_v32S1 <= s1t_rnd_v32S1;
          s1o_rnd_v32S0 <= s1t_rnd_v32S0;
          s1o_lostS0        <= s1t_lostS0;
        end // advance pipe
      end // posedge clock
      
      always @(posedge clk `OR_ASYNC_RST) 
        begin
          if (rst)
            s1o_ready <= 0;
          else if(flush_i)
            s1o_ready <= 0;
          else if(adv_i)
            s1o_ready <= s0o_ready;
        end // posedge clock   
      
      //**********************************************************************//
      //**********************************************************************//
      //  STAGE 2: rounding                                                   //
      //**********************************************************************//
      //**********************************************************************//
      
      //check which part of the sticky is needed
      wire s2r_sticky = s1o_stickys ? s1o_stickyh | s1o_stickyl : s1o_stickyl;
      //select between right shift and no shift sticky
      wire s2t_sticky = s1o_is_shifted ? s2r_sticky : s1o_sticky_l;    
            
      
      wire [31:0] s2t_fract32_rndS1= s1o_fract32 + s1o_rnd_v32S1;
      wire [31:0] s2t_fract32_rndS0 = s1o_fract32 + s1o_rnd_v32S0;
      
      wire [31:0] s2t_fract32_rnd = s2t_sticky ? s2t_fract32_rndS1 : s2t_fract32_rndS0;
      wire s2t_lost =   s2t_sticky ? 1'b1 : s1o_lostS0;
 
      // floating point output
      wire s2t_f32_shr = s2t_fract32_rnd[24];
      
      // update exponent and fractional part
      wire [9:0]  s2t_f32_exp10   = s1o_exp10 + {9'd0,s2t_f32_shr};
      wire [23:0] s2t_f32_fract24 = s2t_f32_shr ? s2t_fract32_rnd[24:1] :
                                               s2t_fract32_rnd[23:0];
      // denormalized or zero
      wire s2t_f32_fract24_dn = ~s2t_f32_fract24[23];
       
       
       
      // Generate result and flags
      wire s2t_ine, s2t_ovf, s2t_inf, s2t_unf, s2t_zer;
                
      reg [31:0] s2t_opc;
      
      //secondo me quella precedenza nel vecchio assign era necessaria :(
//      assign s2t_zer = (s2t_f32_fract24_dn) ? ~(|s2t_f32_fract24) : 1'b0;
//      assign s2t_unf = (s2t_f32_fract24_dn) ? (s2t_lost & s2t_f32_fract24_dn) : 1'b0;
      assign s2t_zer = ~s1o_snan & ~s1o_qnan & ~s1o_inv & ~((s2t_f32_exp10 > 10'd254) | s1o_inf ) & (s2t_f32_fract24_dn) ? ~(|s2t_f32_fract24) : 1'b0;
      assign s2t_unf = ~s1o_snan & ~s1o_qnan & ~s1o_inv & ~((s2t_f32_exp10 > 10'd254) | s1o_inf ) & (s2t_f32_fract24_dn) ? (s2t_lost & s2t_f32_fract24_dn) : 1'b0;
      assign s2t_inf = ~s1o_snan & ~s1o_qnan & ~s1o_inv & ((s2t_f32_exp10 > 10'd254) | s1o_inf ) ? 1'b1 : 1'b0;//fix condizione causa errore nei flag
      assign s2t_ovf = ~s1o_snan & ~s1o_qnan & ~s1o_inv & ((s2t_f32_exp10 > 10'd254) | s1o_inf ) ? (~s1o_inf) : 1'b0;//fix condizione causa errore nei flag
      assign s2t_ine = s1o_snan | s1o_qnan | s1o_inv ? 1'b0 :
                       (s2t_f32_exp10 > 10'd254) | s1o_inf  ? (s2t_lost | ~s1o_inf) : s2t_lost;
      
        
      always@(*)
        begin
            if(s1o_snan | s1o_qnan)
                s2t_opc = {s1o_anan_sign,QNAN};
            else if(s1o_inv)
                s2t_opc = {s1o_sign,SNAN};
            else if((s2t_f32_exp10 > 10'd254) | s1o_inf)
                s2t_opc = {s1o_sign,INF};
            else if(s2t_f32_fract24_dn)
                s2t_opc = {s1o_sign,8'd0,s2t_f32_fract24[22:0]};
            else
                s2t_opc = {s1o_sign,s2t_f32_exp10[7:0],s2t_f32_fract24[22:0]};
        end
           
           
           
      // Output Register
      always @(posedge clk `OR_ASYNC_RST) begin
        if (rst) begin
          // result
          mul_fast_result_o      <= 32'd0;
          mul_fast_ready_o <=  1'b0;
          // exeptions
          fpcsr_o         <= {`OR1K_FPCSR_WIDTH{1'b0}};
        end
        else if(flush_i) begin
          // result
          mul_fast_result_o      <= 32'd0;
          mul_fast_ready_o <=  1'b0;
          // exeptions
          fpcsr_o         <= {`OR1K_FPCSR_WIDTH{1'b0}};
        end
        else if(adv_i) begin
          // result
          mul_fast_result_o      <= s2t_opc;
          mul_fast_ready_o <= s1o_ready;
          // exeptions
          fpcsr_o[`OR1K_FPCSR_OVF] <= s2t_ovf;//overflow
          fpcsr_o[`OR1K_FPCSR_UNF] <= s2t_unf;//underflow
          fpcsr_o[`OR1K_FPCSR_SNF] <= s1o_inv;//invalid input
          fpcsr_o[`OR1K_FPCSR_QNF] <= s1o_qnan;//qnan input
          fpcsr_o[`OR1K_FPCSR_ZF]  <= s2t_zer;//zero result
          fpcsr_o[`OR1K_FPCSR_IXF] <= s2t_ine;//with rounding, the result is changed from the real one
          fpcsr_o[`OR1K_FPCSR_IVF] <= (s1o_inv| s1o_snan );//invalid input
          fpcsr_o[`OR1K_FPCSR_INF] <= s2t_inf;//infinite output
          fpcsr_o[`OR1K_FPCSR_DZF] <= 1'b0;//divide by zero
        end
      end // posedge clock
endmodule
