`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2018 12:27:18
// Design Name: 
// Module Name: pfpu32_addsub_fast
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


module pfpu32_addsub_fast
(
   input             clk,
   input             rst,
   input             flush_i,  // flushe pipe
   input             adv_i,    // advance pipe
   input             start_i,  // start add/sub
   input [1:0]       rmode_i,
   // input 'a' related values
   input       [9:0] exp10a_i,
   // input 'b' related values
   input       [9:0] exp10b_i,
   
   input             snan_i,
   input             qnan_i,
   input             anan_sign_i,
   input             addsub_agtb_i,
   input             addsub_aeqb_i,
   
   //additional inputs from top
   input             inv_i,
   input             inf_i,
   input             signa_i,
   input             signb_i,
   input      [23:0] fract24nsh_i,
   input      [23:0] fract24fsh_i,
   input      [9:0]  exp_diff_i,
   
   // outputs
   output reg        add_fast_valid_o,       // ready
   output reg [31:0] add_fast_result_o,
   output reg [`OR1K_FPCSR_WIDTH-1:0] fpcsr_o
);

  localparam INF  = 31'b1111111100000000000000000000000;
  localparam QNAN = 31'b1111111110000000000000000000000;
  localparam SNAN = 31'b1111111101111111111111111111111;
  

  // register input from top
  //  input related
  reg s1o_inv, s1o_inf_i,
      s1o_snan_i, s1o_qnan_i, s1o_anan_i_sign;
  //  computation related
  reg        s1o_aeqb;
  reg        s1o_sign_nsh;
  reg        s1o_op_sub;
  reg  [9:0] s1o_exp10c;
  reg [23:0] s1o_fract24_nsh;
  reg [23:0] s1o_fract24_fsh;
  reg [9:0]  s1o_exp_diff;
  reg [1:0]  s1o_rmode;
  
  //  registering
  always @(posedge clk) begin
    if(adv_i) begin
        // input related
      s1o_inv         <= inv_i;
      s1o_inf_i       <= inf_i;
      s1o_snan_i      <= snan_i;
      s1o_qnan_i      <= qnan_i;
      s1o_anan_i_sign <= anan_sign_i;
        // computation related
      s1o_aeqb        <= addsub_aeqb_i;
      s1o_exp_diff    <= exp_diff_i;
      s1o_sign_nsh    <= addsub_agtb_i ? signa_i : signb_i;
      s1o_op_sub      <= signa_i ^ signb_i;
      s1o_exp10c      <= addsub_agtb_i ? exp10a_i : exp10b_i;
      s1o_fract24_nsh <= fract24nsh_i & {24{~inf_i}};
      s1o_fract24_fsh <= fract24fsh_i & {24{~inf_i}};
      s1o_rmode       <= rmode_i;
    end // advance
  end // posedge clock

  // ready is special case
  reg s1o_ready;
  always @(posedge clk `OR_ASYNC_RST) begin
    if (rst)
      s1o_ready  <= 0;
    else if(flush_i)
      s1o_ready  <= 0;
    else if(adv_i)
      s1o_ready <= start_i;
  end // posedge clock


  /* Stage 2: multiplex and shift */
  wire [4:0] s1t_shr = s1o_exp_diff[4:0] | {5{|s1o_exp_diff[9:5]}};
  wire [4:0] s2t_shr = s1t_shr & {5{~s1o_inf_i}};
  // shifter
  wire [25:0] s2t_fract26_fsh = {s1o_fract24_fsh,2'd0};
  wire [25:0] s2t_fract26_shr = s2t_fract26_fsh >> s2t_shr;
  
  // sticky
  reg s2t_sticky;
  always @(s2t_shr or s1o_fract24_fsh) begin
    case(s2t_shr)
      5'd0, 5'd1, 5'd2 : s2t_sticky = 1'b0; // two added zero bits
      5'd3 : s2t_sticky = s1o_fract24_fsh[0];
      5'd4 : s2t_sticky = |s1o_fract24_fsh[1:0];
      5'd5 : s2t_sticky = |s1o_fract24_fsh[2:0];
      5'd6 : s2t_sticky = |s1o_fract24_fsh[3:0];
      5'd7 : s2t_sticky = |s1o_fract24_fsh[4:0];
      5'd8 : s2t_sticky = |s1o_fract24_fsh[5:0];
      5'd9 : s2t_sticky = |s1o_fract24_fsh[6:0];
      5'd10: s2t_sticky = |s1o_fract24_fsh[7:0];
      5'd11: s2t_sticky = |s1o_fract24_fsh[8:0];
      5'd12: s2t_sticky = |s1o_fract24_fsh[9:0];
      5'd13: s2t_sticky = |s1o_fract24_fsh[10:0];
      5'd14: s2t_sticky = |s1o_fract24_fsh[11:0];
      5'd15: s2t_sticky = |s1o_fract24_fsh[12:0];
      5'd16: s2t_sticky = |s1o_fract24_fsh[13:0];
      5'd17: s2t_sticky = |s1o_fract24_fsh[14:0];
      5'd18: s2t_sticky = |s1o_fract24_fsh[15:0];
      5'd19: s2t_sticky = |s1o_fract24_fsh[16:0];
      5'd20: s2t_sticky = |s1o_fract24_fsh[17:0];
      5'd21: s2t_sticky = |s1o_fract24_fsh[18:0];
      5'd22: s2t_sticky = |s1o_fract24_fsh[19:0];
      5'd23: s2t_sticky = |s1o_fract24_fsh[20:0];
      5'd24: s2t_sticky = |s1o_fract24_fsh[21:0];
      5'd25: s2t_sticky = |s1o_fract24_fsh[22:0];
      default: s2t_sticky = |s1o_fract24_fsh[23:0];
    endcase
  end
  
    // add/sub of non-shifted and shifted operands
  wire [27:0] s2t_fract28_shr = {1'b0,s2t_fract26_shr,s2t_sticky};
  
  wire [27:0] s2t_fract28_add = {1'b0,s1o_fract24_nsh,3'd0} +
                                (s2t_fract28_shr ^ {28{s1o_op_sub}}) +
                                {27'd0,s1o_op_sub};
  wire [26:0] s2t_fract27 =  s2t_fract28_add[27:1];                          
                                                            

  // stage #2 outputs
  //  input related
  reg s2o_inv, s2o_inf_i,
      s2o_snan_i, s2o_qnan_i, s2o_anan_i_sign;
  //  computational related
  reg        s2o_signc;
  reg [9:0]  s2o_exp10c;
  reg [26:0] s2o_fract27;
  reg        s2o_sub_0;       // actual operation is substruction and the result is zero
  reg        s2o_sticky;      // rounding support
  reg [1:0]  s2o_rmode;

  
  //fix sticky
  wire stickyFinalC0 = s2t_fract27[0] | s2t_sticky;  
  //wire stickyFinalC1 = s2t_fract27[1] | s2t_fract27[0] | s2t_sticky;
  reg s2o_stickyFinalC0,s2o_stickyFinalC1;
  //  registering
  always @(posedge clk) begin
    if(adv_i) begin
        // input related
      s2o_inv         <= s1o_inv;
      s2o_inf_i       <= s1o_inf_i;
      s2o_snan_i      <= s1o_snan_i;
      s2o_qnan_i      <= s1o_qnan_i;
      s2o_anan_i_sign <= s1o_anan_i_sign;
        // computation related
      s2o_signc       <= s1o_sign_nsh;
      s2o_exp10c      <= s1o_exp10c;
      s2o_fract27     <= s2t_fract28_add[27:1];
      s2o_sub_0       <= s1o_aeqb & s1o_op_sub;
      s2o_sticky      <= s2t_sticky;
      s2o_rmode       <= s1o_rmode;
      
      //fix sticky
      s2o_stickyFinalC0 <= stickyFinalC0;
      //s2o_stickyFinalC1 <= stickyFinalC1;
    end // advance
  end // posedge clock

  // ready is special case
  reg s2o_ready;
  always @(posedge clk `OR_ASYNC_RST) begin
    if (rst)
      s2o_ready  <= 0;
    else if(flush_i)
      s2o_ready  <= 0;
    else if(adv_i)
      s2o_ready <= s1o_ready;
  end // posedge clock

//   for possible left shift
//   [26] bit is right shift flag
   
  reg [4:0] s3t_nlz;
  always @(s2o_fract27) begin
    casez(s2o_fract27)
      27'b1??????????????????????????: s3t_nlz <=  0; // [26] bit: shift right
      27'b01?????????????????????????: s3t_nlz <=  0; // 1 is in place
      27'b001????????????????????????: s3t_nlz <=  1;
      27'b0001???????????????????????: s3t_nlz <=  2;
      27'b00001??????????????????????: s3t_nlz <=  3;
      27'b000001?????????????????????: s3t_nlz <=  4;
      27'b0000001????????????????????: s3t_nlz <=  5;
      27'b00000001???????????????????: s3t_nlz <=  6;
      27'b000000001??????????????????: s3t_nlz <=  7;
      27'b0000000001?????????????????: s3t_nlz <=  8;
      27'b00000000001????????????????: s3t_nlz <=  9;
      27'b000000000001???????????????: s3t_nlz <= 10;
      27'b0000000000001??????????????: s3t_nlz <= 11;
      27'b00000000000001?????????????: s3t_nlz <= 12;
      27'b000000000000001????????????: s3t_nlz <= 13;
      27'b0000000000000001???????????: s3t_nlz <= 14;
      27'b00000000000000001??????????: s3t_nlz <= 15;
      27'b000000000000000001?????????: s3t_nlz <= 16;
      27'b0000000000000000001????????: s3t_nlz <= 17;
      27'b00000000000000000001???????: s3t_nlz <= 18;
      27'b000000000000000000001??????: s3t_nlz <= 19;
      27'b0000000000000000000001?????: s3t_nlz <= 20;
      27'b00000000000000000000001????: s3t_nlz <= 21;
      27'b000000000000000000000001???: s3t_nlz <= 22;
      27'b0000000000000000000000001??: s3t_nlz <= 23;
      27'b00000000000000000000000001?: s3t_nlz <= 24;
      27'b000000000000000000000000001: s3t_nlz <= 25;
      27'b000000000000000000000000000: s3t_nlz <=  0; // zero result
    endcase
  end // always


  // left shift amount and corrected exponent
  wire [4:0] s3t_nlz_m1    = (s3t_nlz - 5'd1);
  wire [9:0] s3t_exp10c_m1 = s2o_exp10c - 10'd1;
  wire [9:0] s3t_exp10c_mz = s2o_exp10c - {5'd0,s3t_nlz};
  wire [4:0] s3t_shl;
  wire [9:0] s3t_exp10shl;
  assign {s3t_shl,s3t_exp10shl} =
      // shift isn't needed or impossible
    (~(|s3t_nlz) | (s2o_exp10c == 10'd1)) ?
                              {5'd0,s2o_exp10c} :
      // normalization is possible
    (s2o_exp10c >  s3t_nlz) ? {s3t_nlz,s3t_exp10c_mz} :
      // denormalized cases
    (s2o_exp10c == s3t_nlz) ? {s3t_nlz_m1,10'd1} :
                              {s3t_exp10c_m1[4:0],10'd1};
                              
     
  wire rm_to_infm3 = (s2o_rmode==2'b11);                          
  //added stuff
  // multiplexer for signums and flags
  wire s3t_add_sign = s2o_sub_0 ? rm_to_infm3 : s2o_signc;
  wire [34:0] s3t_fract35 =  {7'd0,s2o_fract27,s2o_sticky};
  // overflow bit for add/mul
  wire s3t_add_carry = s2o_fract27[26];
  
  // multiplexer for shift values
  wire [4:0] s3t_shr = {4'd0,s3t_add_carry};
  
   wire [9:0] s3t_expPlusCarry = s2o_exp10c + {9'd0,s2o_fract27[26]};
   
    
    // output of align stage 
        reg        s4o_sign;
        reg [34:0] s4o_fract35;
        reg        s4o_inv;
        reg        s4o_inf;
        reg        s4o_snan;
        reg        s4o_qnan;
        reg        s4o_anan_sign;
        reg        s4o_and_condition_4,s4o_and_condition_3;
        reg [4:0]  s4o_shr;
        reg [4:0]  s4o_shl;
        reg        s4o_carry;
        reg [9:0]  s4o_exp10shl, s4o_expPlusCarry;
        reg [1:0]  s4o_rmode;
        //reg        s4o_stickyFinalC0,s4o_stickyFinalC1;
        reg        s4o_sticky;
        
        
        
        
        //fix sticky
//        wire stickyFinalC0 = s3t_fract35[1] | s3t_fract35[0]; 
//        wire stickyFinalC1 = s3t_fract35[2] | s3t_fract35[1] | s3t_fract35[0];
        
        wire sticky = s3t_add_carry ? (s2o_stickyFinalC0 | s2o_fract27[1]) : s2o_stickyFinalC0;
        
        // registering
        always @(posedge clk) begin
          if(adv_i) begin
            s4o_sign    <= s3t_add_sign;
            s4o_fract35 <= s3t_fract35;
            // various flags:
            s4o_inv         <= s2o_inv;
            s4o_inf         <= s2o_inf_i;
            s4o_snan      <= s2o_snan_i;
            s4o_qnan      <= s2o_qnan_i;
            s4o_anan_sign <= s2o_anan_i_sign;
            
            s4o_and_condition_4     <= ~s2o_snan_i & ~s2o_qnan_i & ~s2o_inv & ~s2o_inf_i;
            
            s4o_and_condition_3 <= ~s2o_snan_i & ~s2o_qnan_i & ~s2o_inv;
            s4o_shr <= s3t_shr;
            s4o_shl <= s3t_shl;
            s4o_carry <= s3t_add_carry;

            s4o_exp10shl <= s3t_exp10shl;
            s4o_expPlusCarry <= s3t_expPlusCarry;
            
            //fix
//            s4o_stickyFinalC0 <= stickyFinalC0;
//            s4o_stickyFinalC1 <= stickyFinalC1;
            s4o_sticky <= sticky;
            s4o_rmode <= s2o_rmode;
          end // advance
        end // posedge clock
  
    // ready is special case
    reg s4o_ready;
    always @(posedge clk `OR_ASYNC_RST) begin
      if (rst)
        s4o_ready <= 1'b0;
      else if(flush_i)
        s4o_ready <= 1'b0;
      else if(adv_i)
        s4o_ready <= s2o_ready;
    end // posedge clock
  
    
    wire rm_nearest = (s4o_rmode==2'b00);
    wire rm_to_zero = (s4o_rmode==2'b01);
    wire rm_to_infp = (s4o_rmode==2'b10);
    wire rm_to_infm = (s4o_rmode==2'b11);
    
    wire [9:0] s5t_exp10 =
      (~(|s4o_shl)) ? s4o_expPlusCarry :
                      s4o_exp10shl; 
                      
    //wire [9:0] s5t_exp10PlusOne =  s5t_exp10 +  10'd1;
    wire [9:0] s5t_exp10PlusOne = 
      (~(|s4o_shl)) ? s4o_expPlusCarry + 10'd1 :
                      s4o_exp10shl + 10'd1;
    
    wire condition_notPlusOne = s5t_exp10[9] | s5t_exp10[8] | &(s5t_exp10[7:0]);
    wire condition_plusOne    = s5t_exp10PlusOne[9] | s5t_exp10PlusOne[8] | &(s5t_exp10PlusOne[7:0]);                           

   // align
     wire [34:0] s5t_fract35sh =
       (s4o_carry) ? (s4o_fract35 >> s4o_shr) :
                    (s4o_fract35 << s4o_shl);
    //fix
    //wire sticky = (s4o_carry & s4o_stickyFinalC1) | s4o_stickyFinalC0;
    wire [1:0] s5t_rs = {s5t_fract35sh[2],s4o_sticky};
    //wire [1:0] s5t_rs = {s5t_fract35sh[2],s4o_fract35[0]};
    wire [31:0] s5t_fract32 = s5t_fract35sh[34:3];
    
    wire s5t_g    = s5t_fract32[0];
    wire s5t_r    = s5t_rs[1];
    wire s5t_s    = s5t_rs[0];
    wire s5t_lost = s5t_r | s5t_s;
  
    wire s5t_rnd_up = (rm_nearest & s5t_r & s5t_s) |
                      (rm_nearest & s5t_g & s5t_r & (~s5t_s)) |
                      (rm_to_infp & (~s4o_sign) & s5t_lost) |
                      (rm_to_infm &   s4o_sign  & s5t_lost);
  
  
    // define value for rounding adder
    wire [31:0] s5t_rnd_v32 =
      s5t_rnd_up ? 32'd1 : 32'd0 ;
    // rounded fractional
    wire [31:0] s5t_fract32_rnd = s5t_fract32 + s5t_rnd_v32;
  
  
    // floating point output
    wire s5t_f32_shr = s5t_fract32_rnd[24];
    // update exponent and fraction
    wire [9:0]  s5t_f32_exp10   = s5t_f32_shr ? s5t_exp10PlusOne : s5t_exp10;//s5t_exp10 + {9'd0,s5t_f32_shr};
    wire exponent_condition     = s5t_f32_shr ? condition_plusOne : condition_notPlusOne;
    wire [23:0] s5t_f32_fract24 = s5t_f32_shr ? s5t_fract32_rnd[24:1] :
                                                s5t_fract32_rnd[23:0];
     // denormalized or zero
    wire s5t_f32_fract24_dn = ~s5t_f32_fract24[23];
  
  
     // Generate result and flags
    wire s5t_ine, s5t_ovf, s5t_inf, s5t_unf, s5t_zer;
    reg [31:0] s5t_opc;
  
    assign s5t_zer = s4o_and_condition_4 & ~exponent_condition & (s5t_f32_fract24_dn) ? ~(|s5t_f32_fract24) : 1'b0;
    assign s5t_unf = s4o_and_condition_4 & ~exponent_condition & (s5t_f32_fract24_dn) ? (s5t_lost & s5t_f32_fract24_dn) : 1'b0;
    assign s5t_inf = s4o_and_condition_3 & (exponent_condition | s4o_inf ) ? 1'b1 : 1'b0;//fix condizione causa errore nei flag
    assign s5t_ovf = s4o_and_condition_3 & (exponent_condition | s4o_inf ) ? (~s4o_inf) : 1'b0;//fix condizione causa errore nei flag
    assign s5t_ine = s4o_snan | s4o_qnan | s4o_inv ? 1'b0 :
                     (exponent_condition) | s4o_inf  ? (s5t_lost | ~s4o_inf) : s5t_lost;
    
      
    always@(*)
      begin
        if(s4o_snan | s4o_qnan)
            s5t_opc = {s4o_anan_sign,QNAN};
        else if(s4o_inv)
            s5t_opc = {s4o_sign,SNAN};
        else if((s5t_f32_exp10 > 10'd254) | s4o_inf)
            s5t_opc = {s4o_sign,INF};
        else if(s5t_f32_fract24_dn)
            s5t_opc = {s4o_sign,8'd0,s5t_f32_fract24[22:0]};
        else
            s5t_opc = {s4o_sign,s5t_f32_exp10[7:0],s5t_f32_fract24[22:0]};
      end
    // Output Register
    always @(posedge clk `OR_ASYNC_RST) begin
      if (rst) begin
          // arithmetic results
        add_fast_result_o      <= 32'd0;
        add_fast_valid_o <=  1'b0;
          // exeptions
        fpcsr_o         <= {`OR1K_FPCSR_WIDTH{1'b0}};
      end
      else if(flush_i) begin
          // arithmetic results
        add_fast_result_o      <= 32'd0;
        add_fast_valid_o <=  1'b0;
          // exeptions
        fpcsr_o         <= {`OR1K_FPCSR_WIDTH{1'b0}};
      end
      else if(adv_i) begin
          // arithmetic results
        add_fast_result_o      <= s5t_opc;
        add_fast_valid_o <= s4o_ready;
          // exeptions
        fpcsr_o[`OR1K_FPCSR_OVF] <= s5t_ovf;
        fpcsr_o[`OR1K_FPCSR_UNF] <= s5t_unf;
        fpcsr_o[`OR1K_FPCSR_SNF] <= s4o_inv;
        fpcsr_o[`OR1K_FPCSR_QNF] <= s4o_qnan;
        fpcsr_o[`OR1K_FPCSR_ZF]  <= s5t_zer;
        fpcsr_o[`OR1K_FPCSR_IXF] <= s5t_ine;
        fpcsr_o[`OR1K_FPCSR_IVF] <= (s4o_inv | s4o_snan);
        fpcsr_o[`OR1K_FPCSR_INF] <= s5t_inf;
        fpcsr_o[`OR1K_FPCSR_DZF] <= 1'b0;
      end
    end // posedge clock

endmodule // pfpu32_addsub