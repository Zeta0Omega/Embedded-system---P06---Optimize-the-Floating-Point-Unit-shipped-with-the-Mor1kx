//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2018 18:35:22
// Design Name: 
// Module Name: pfpu32_i2f_fast
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

module pfpu32_i2f_fast(
       input             clk,
       input             rst,
       input             flush_i,  // flush pipe
       input             adv_i,    // advance pipe
       input             start_ii,  // start conversion
       input      [31:0] opa_ii,
       input             signa_ii,
       input             zeroa_ii,
       input      [1:0]  rmode_ii,
       
       //  arithmetic part's outputs
       output reg                  [31:0] i2f_fast_result_o,
       output reg                        i2f_fast_ready_o,
       //  common output
       output reg [`OR1K_FPCSR_WIDTH-1:0] fpcsr_o
    ); 
    
    reg start_i;
    reg [31:0] opa_i;
    reg signa_i;
    reg zeroa_i;
    reg [1:0] rmode_i;
    
    always@(posedge clk)
      begin
        if(adv_i)
          begin
            opa_i   <= opa_ii;
            signa_i <= signa_ii;
            rmode_i <= rmode_ii;
            zeroa_i <= zeroa_ii;
          end
      end
    
    always @(posedge clk `OR_ASYNC_RST)
      begin
        if (rst)
          start_i <= 1'b0;
        else if(flush_i)
          start_i <= 1'b0;
        else if(adv_i)
          begin
            start_i <= start_ii;
          end
      end // posedge clock
    
    //stage 1
    
    reg [4:0] s1t_exp_in;
    // shift goal:
    // 23 22                    0
    // |  |                     |
    // h  fffffffffffffffffffffff
    
    // compute initial exponent
    always @(opa_i[31:0]) begin
      casez(opa_i[30:0])  // synopsys full_case parallel_case, do not analyze the sign bit
        31'b1??????????????????????????????:  s1t_exp_in = 5'd30; // hidden '1' is in its plase
        31'b01?????????????????????????????:  s1t_exp_in = 5'd29;
        31'b001????????????????????????????:  s1t_exp_in = 5'd28;
        31'b0001???????????????????????????:  s1t_exp_in = 5'd27;
        31'b00001??????????????????????????:  s1t_exp_in = 5'd26;
        31'b000001?????????????????????????:  s1t_exp_in = 5'd25;
        31'b0000001????????????????????????:  s1t_exp_in = 5'd24;
        31'b00000001???????????????????????:  s1t_exp_in = 5'd23;
        31'b000000001??????????????????????:  s1t_exp_in = 5'd22;
        31'b0000000001?????????????????????:  s1t_exp_in = 5'd21;
        31'b00000000001????????????????????:  s1t_exp_in = 5'd20;
        31'b000000000001???????????????????:  s1t_exp_in = 5'd19;
        31'b0000000000001??????????????????:  s1t_exp_in = 5'd18;
        31'b00000000000001?????????????????:  s1t_exp_in = 5'd17;
        31'b000000000000001????????????????:  s1t_exp_in = 5'd16;
        31'b0000000000000001???????????????:  s1t_exp_in = 5'd15;
        31'b00000000000000001??????????????:  s1t_exp_in = 5'd14;
        31'b000000000000000001?????????????:  s1t_exp_in = 5'd13;
        31'b0000000000000000001????????????:  s1t_exp_in = 5'd12;
        31'b00000000000000000001???????????:  s1t_exp_in = 5'd11;
        31'b000000000000000000001??????????:  s1t_exp_in = 5'd10;
        31'b0000000000000000000001?????????:  s1t_exp_in = 5'd9;
        31'b00000000000000000000001????????:  s1t_exp_in = 5'd8;
        31'b000000000000000000000001???????:  s1t_exp_in = 5'd7;
        31'b0000000000000000000000001??????:  s1t_exp_in = 5'd6;
        31'b00000000000000000000000001?????:  s1t_exp_in = 5'd5;
        31'b000000000000000000000000001????:  s1t_exp_in = 5'd4;
        31'b0000000000000000000000000001???:  s1t_exp_in = 5'd3;
        31'b00000000000000000000000000001??:  s1t_exp_in = 5'd2;
        31'b000000000000000000000000000001?:  s1t_exp_in = 5'd1;
        31'b0000000000000000000000000000001:  s1t_exp_in = 5'd0;
        31'b0000000000000000000000000000000:  s1t_exp_in = 5'd0;
      endcase
    end   
    
    wire [7:0] s1t_exp8 = (~zeroa_i) ? 8'd127 + {3'b0,s1t_exp_in} : 8'd0;
    wire [4:0] s1t_shr = {1'b0,(s1t_exp_in > 23) ? (s1t_exp_in - 5'd23) : 5'd0};
    wire [4:0] s1t_shl = (s1t_exp_in < 23) ? (  (~zeroa_i) ? (5'd23 - s1t_exp_in) : 5'd0  ):
                                               5'd0;
    wire [34:0] s1t_fract35 = {opa_i, 3'b0};
    
    reg s2r_sticky;
    always @(s1t_fract35 or s1t_shr) begin
      case (s1t_shr)
        5'd0   : s2r_sticky = |s1t_fract35[ 1:0];
        5'd1   : s2r_sticky = |s1t_fract35[ 2:0];
        5'd2   : s2r_sticky = |s1t_fract35[ 3:0];
        5'd3   : s2r_sticky = |s1t_fract35[ 4:0];
        5'd4   : s2r_sticky = |s1t_fract35[ 5:0];
        5'd5   : s2r_sticky = |s1t_fract35[ 6:0];
        5'd6   : s2r_sticky = |s1t_fract35[ 7:0];
        5'd7   : s2r_sticky = |s1t_fract35[ 8:0];
        5'd8   : s2r_sticky = |s1t_fract35[ 9:0];
        5'd9   : s2r_sticky = |s1t_fract35[10:0];
        5'd10  : s2r_sticky = |s1t_fract35[11:0];
        5'd11  : s2r_sticky = |s1t_fract35[12:0];
        5'd12  : s2r_sticky = |s1t_fract35[13:0];
        5'd13  : s2r_sticky = |s1t_fract35[14:0];
        5'd14  : s2r_sticky = |s1t_fract35[15:0];
        5'd15  : s2r_sticky = |s1t_fract35[16:0];
        5'd16  : s2r_sticky = |s1t_fract35[17:0];
        5'd17  : s2r_sticky = |s1t_fract35[18:0];
        5'd18  : s2r_sticky = |s1t_fract35[19:0];
        5'd19  : s2r_sticky = |s1t_fract35[20:0];
        5'd20  : s2r_sticky = |s1t_fract35[21:0];
        5'd21  : s2r_sticky = |s1t_fract35[22:0];
        5'd22  : s2r_sticky = |s1t_fract35[23:0];
        5'd23  : s2r_sticky = |s1t_fract35[24:0];
        5'd24  : s2r_sticky = |s1t_fract35[25:0];
        5'd25  : s2r_sticky = |s1t_fract35[26:0];
        default: s2r_sticky = |s1t_fract35[27:0];
      endcase
    end // always 
    
    wire s1t_sticky = (|s1t_shr) ? s2r_sticky : 1'b0;//sticky for left shif is always 0
    wire s1t_orr = |s1t_shr;
    
    //shift the fractional part
    wire [34:0] s1t_fract35sh =
          (s1t_orr) ? (s1t_fract35 >> s1t_shr) :
                       (s1t_fract35 << s1t_shl);

    //register output of stage 1
    reg s1o_sign;
    reg [9:0] s1o_exp10;
    reg [34:0] s1o_fract35;
    reg s1o_rdy;
    reg s1o_st;
    reg [1:0] rmode_o;
    
    always @(posedge clk) begin
      if(adv_i) begin
       s1o_sign    <= signa_i;
       s1o_exp10   <= {2'b0,s1t_exp8};
       s1o_fract35 <= s1t_fract35sh;
       s1o_st      <= s1t_sticky;
       rmode_o     <= rmode_i;
      end // advance
    end // posedge clock
    
    always @(posedge clk `OR_ASYNC_RST) begin
      if (rst)
        s1o_rdy <= 1'b0;
      else if(flush_i)
        s1o_rdy <= 1'b0;
      else if(adv_i)
        begin
            s1o_rdy <= start_i;
        end
    end // posedge clock
    
    wire rm_nearest = (rmode_o==2'b00);
    wire rm_to_zero = (rmode_o==2'b01);
    wire rm_to_infp = (rmode_o==2'b10);
    wire rm_to_infm = (rmode_o==2'b11);
    
    wire [9:0] s2t_exp10 = s1o_exp10;
    wire s2t_sign = s1o_sign;//take the sign of the input
    
    wire [34:0] s2t_fract35sh = s1o_fract35;//copy the value       
    
    //compute bits that are useful for operations operations
    wire s2t_g    = s2t_fract35sh[3];
    wire s2t_r    = s2t_fract35sh[2];
    wire s2t_s    = s1o_st;
    wire s2t_lost = s2t_r | s2t_s;
    
   wire s2t_rnd_up = (rm_nearest & s2t_r & s2t_s) |
                      (rm_nearest & s2t_g & s2t_r & (~s2t_s)) |
                      (rm_to_infp & (~s2t_sign) & s2t_lost) |
                      (rm_to_infm &   s2t_sign  & s2t_lost);
                                 
    wire [31:0] s2t_fract32_rnd = s2t_rnd_up ? s2t_fract35sh[34:3] + 32'd1 : s2t_fract35sh[34:3] ;
    
    wire s2t_f32_shr = s2t_fract32_rnd[24];
    // update exponent and fraction
    wire [9:0]  s2t_f32_exp10   = s2t_exp10 + {9'd0,s2t_f32_shr};
    wire [23:0] s2t_f32_fract24 = s2t_f32_shr ? s2t_fract32_rnd[24:1] :
                                                s2t_fract32_rnd[23:0];

    wire s2t_zero=(s2t_f32_fract24==24'd0);//this is part of the critical path
    
    wire [31:0] s2t_result= {s1o_sign,s2t_f32_exp10[7:0],s2t_f32_fract24[22:0]};                      
                            
    always @(posedge clk `OR_ASYNC_RST) begin
      if (rst) begin
        i2f_fast_result_o      <= 32'd0;
        i2f_fast_ready_o <=  1'b0;
          // exeptions
        fpcsr_o         <= {`OR1K_FPCSR_WIDTH{1'b0}};
      end
      else if(flush_i) begin
        i2f_fast_result_o      <= 32'd0;
        i2f_fast_ready_o <=  1'b0;
        // exeptions
        fpcsr_o         <= {`OR1K_FPCSR_WIDTH{1'b0}};
      end
      else if(adv_i) begin
            // arithmetic results
        i2f_fast_result_o      <= s2t_result;
        i2f_fast_ready_o <= s1o_rdy;
            // exeptions
        fpcsr_o[`OR1K_FPCSR_OVF] <= 1'b0;//overflow, there cannot be an overflow: the max integer number can be represented in f.p.
        fpcsr_o[`OR1K_FPCSR_UNF] <= 1'b0;//underflow, no number different from zero is converted in zero
        fpcsr_o[`OR1K_FPCSR_SNF] <= 1'b0;//cannot be snan, since the input is an integer number
        fpcsr_o[`OR1K_FPCSR_QNF] <= 1'b0;//cannot be qnan, since the input is an integer number
        fpcsr_o[`OR1K_FPCSR_ZF]  <= s2t_zero;//check if the result is zero
        fpcsr_o[`OR1K_FPCSR_IXF] <= s2t_lost;//check if we loose something with shifts
        fpcsr_o[`OR1K_FPCSR_IVF] <= 1'b0;//it cannot be an invalid number, it is an integer
        fpcsr_o[`OR1K_FPCSR_INF] <= 1'b0;//the input cannot be an infinite since it is an integer number
        fpcsr_o[`OR1K_FPCSR_DZF] <=1'b0;//dbz, it is not a division
      end
    end // posedge clock


    
endmodule