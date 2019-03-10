`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2018 20:11:59
// Design Name: 
// Module Name: pfpu32_top_i2f_fast
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


module pfpu32_top_fast
#(
  parameter OPTION_OPERAND_WIDTH = 32
)
(
  input clk,
  input rst,
  input flush_i,
  input padv_decode_i,
  input padv_execute_i,
  input [`OR1K_FPUOP_WIDTH-1:0]    op_fpu_i,
  input [`OR1K_FPCSR_RM_SIZE-1:0]  round_mode_i,
  input [OPTION_OPERAND_WIDTH-1:0] opa_i,
  input [OPTION_OPERAND_WIDTH-1:0] opb_i,
  output [OPTION_OPERAND_WIDTH-1:0] fpu_result_o,
  output fpu_arith_valid_o,
  output fpu_cmp_flag_o,
  output fpu_cmp_valid_o,
  output [`OR1K_FPCSR_WIDTH-1:0] fpcsr_o
  
);

reg [OPTION_OPERAND_WIDTH-1:0] rfa_i,rfb_i;

//multiplex on output
wire [OPTION_OPERAND_WIDTH-1:0] i2f_fast_result_o,rnd_result_o,addsub_fast_result_o,mul_fast_result_o,f2i_fast_result_o;//define partial outputs
wire i2f_fast_valid_o,rnd_valid_o,addsub_fast_valid_o,mul_fast_valid_o,f2i_fast_valid_o;//define partial valid bits
wire [`OR1K_FPCSR_WIDTH-1:0] fpcsr_i2f_o,fpcsr_addsub_o,fpcsr_mul_o,fpcsr_f2i_o,fpcsr_rnd_o;//define partial flag

// MSB (set by decode stage) indicates FPU instruction
// Get rid of top bit - is FPU op valid bit
wire   is_op_fpu = op_fpu_i[`OR1K_FPUOP_WIDTH-1];
wire [`OR1K_FPUOP_WIDTH-1:0] op_fpu = {1'b0,op_fpu_i[`OR1K_FPUOP_WIDTH-2:0]};
wire [2:0] op_arith_conv = op_fpu_i[2:0]; // alias
wire a_cmp = op_fpu_i[3]; // alias for compare bit of fpu's opcode

// advance FPU units
wire padv_fpu_units = padv_execute_i | (~(fpu_arith_valid_o| fpu_cmp_valid_o));

// start logic: registering top primary inputs
reg new_data;
always @(posedge clk `OR_ASYNC_RST) begin
  if (rst)
    begin
        new_data <= 1'b0;
        rfa_i <=32'b0;
        rfb_i <= 32'b0;
    end
  else if(flush_i)
    begin
        new_data <= 1'b0;
        rfa_i <=32'b0;
        rfb_i <= 32'b0;
    end
  else if(padv_decode_i)
    begin
      new_data <= 1'b1;
      rfa_i    <= opa_i;
      rfb_i    <= opb_i;
    end
  else if(padv_fpu_units)
    begin
      new_data <= 1'b0;
    end
end // posedge clock

wire new_fpu_data = new_data & is_op_fpu;


// analysis of input values
//   split input a
wire        in_signa  = rfa_i[31];
wire [7:0]  in_expa   = rfa_i[30:23];
wire [22:0] in_fracta = rfa_i[22:0];
//   detect infinity a
wire in_expa_ff = &in_expa;
wire in_infa    = in_expa_ff & (~(|in_fracta));
//   signaling NaN: exponent is 8hff, [22] is zero,
//                  rest of fract is non-zero
//   quiet NaN: exponent is 8hff, [22] is 1
wire in_snan_a = in_expa_ff & (~in_fracta[22]) & (|in_fracta[21:0]);
wire in_qnan_a = in_expa_ff &   in_fracta[22];
//   denormalized/zero of a
wire in_opa_0  = ~(|rfa_i[30:0]);
wire in_opa_dn = (~(|in_expa)) & (|in_fracta);


//   split input b
wire        in_signb  = rfb_i[31];
wire [7:0]  in_expb   = rfb_i[30:23];
wire [22:0] in_fractb = rfb_i[22:0];
//   detect infinity b
wire in_expb_ff = &in_expb;
wire in_infb    = in_expb_ff & (~(|in_fractb));
//   detect NaNs in b
wire in_snan_b = in_expb_ff & (~in_fractb[22]) & (|in_fractb[21:0]);
wire in_qnan_b = in_expb_ff &   in_fractb[22];
//   denormalized/zero of a
wire in_opb_0  = ~(|rfb_i[30:0]);
wire in_opb_dn = (~(|in_expb)) & (|in_fractb);

// detection of some exceptions
//   a nan input -> qnan output
wire in_snan = in_snan_a | in_snan_b;
wire in_qnan = in_qnan_a | in_qnan_b;
//   sign of output nan
wire in_anan_sign = (in_snan_a | in_qnan_a) ? in_signa :
                                              in_signb;

// restored exponents
wire [9:0] in_exp10a = {2'd0,in_expa[7:1],(in_expa[0] | in_opa_dn)};
wire [9:0] in_exp10b = {2'd0,in_expb[7:1],(in_expb[0] | in_opb_dn)};
// restored fractionals
wire [23:0] in_fract24a = {((~in_opa_dn) & (~in_opa_0)),in_fracta};
wire [23:0] in_fract24b = {((~in_opb_dn) & (~in_opb_0)),in_fractb};

//compute module of input a, useful for i2f
wire [31:0] in_module_a = (rfa_i ^ {32{in_signa}}) + {31'd0,in_signa};

// detection of some exceptions
wire in_inv = ((in_opa_0 & in_infb) | (in_opb_0 & in_infa));  // mul: 0 * inf -> invalid operation; snan output
//   inf input
wire in_inf = in_infa | in_infb;

// force intermediate results to zero
wire in_opc_0 = in_opa_0 | in_opb_0;


// count leading zeros
reg [4:0] in_nlza;
always @(in_fract24a) begin
    casez(in_fract24a) // synopsys full_case parallel_case
      24'b1???????????????????????: in_nlza =  0;
      24'b01??????????????????????: in_nlza =  1;
      24'b001?????????????????????: in_nlza =  2;
      24'b0001????????????????????: in_nlza =  3;
      24'b00001???????????????????: in_nlza =  4;
      24'b000001??????????????????: in_nlza =  5;
      24'b0000001?????????????????: in_nlza =  6;
      24'b00000001????????????????: in_nlza =  7;
      24'b000000001???????????????: in_nlza =  8;
      24'b0000000001??????????????: in_nlza =  9;
      24'b00000000001?????????????: in_nlza = 10;
      24'b000000000001????????????: in_nlza = 11;
      24'b0000000000001???????????: in_nlza = 12;
      24'b00000000000001??????????: in_nlza = 13;
      24'b000000000000001?????????: in_nlza = 14;
      24'b0000000000000001????????: in_nlza = 15;
      24'b00000000000000001???????: in_nlza = 16;
      24'b000000000000000001??????: in_nlza = 17;
      24'b0000000000000000001?????: in_nlza = 18;
      24'b00000000000000000001????: in_nlza = 19;
      24'b000000000000000000001???: in_nlza = 20;
      24'b0000000000000000000001??: in_nlza = 21;
      24'b00000000000000000000001?: in_nlza = 22;
      24'b000000000000000000000001: in_nlza = 23;
      24'b000000000000000000000000: in_nlza =  0; // zero result
    endcase
end // nlz for 'a'

// count leading zeros
reg [4:0] in_nlzb;
always @(in_fract24b) begin
    casez(in_fract24b) // synopsys full_case parallel_case
      24'b1???????????????????????: in_nlzb =  0;
      24'b01??????????????????????: in_nlzb =  1;
      24'b001?????????????????????: in_nlzb =  2;
      24'b0001????????????????????: in_nlzb =  3;
      24'b00001???????????????????: in_nlzb =  4;
      24'b000001??????????????????: in_nlzb =  5;
      24'b0000001?????????????????: in_nlzb =  6;
      24'b00000001????????????????: in_nlzb =  7;
      24'b000000001???????????????: in_nlzb =  8;
      24'b0000000001??????????????: in_nlzb =  9;
      24'b00000000001?????????????: in_nlzb = 10;
      24'b000000000001????????????: in_nlzb = 11;
      24'b0000000000001???????????: in_nlzb = 12;
      24'b00000000000001??????????: in_nlzb = 13;
      24'b000000000000001?????????: in_nlzb = 14;
      24'b0000000000000001????????: in_nlzb = 15;
      24'b00000000000000001???????: in_nlzb = 16;
      24'b000000000000000001??????: in_nlzb = 17;
      24'b0000000000000000001?????: in_nlzb = 18;
      24'b00000000000000000001????: in_nlzb = 19;
      24'b000000000000000000001???: in_nlzb = 20;
      24'b0000000000000000000001??: in_nlzb = 21;
      24'b00000000000000000000001?: in_nlzb = 22;
      24'b000000000000000000000001: in_nlzb = 23;
      24'b000000000000000000000000: in_nlzb =  0; // zero result
    endcase
end // nlz of 'b'

wire [23:0] in_fract24a_shl = in_fract24a << in_nlza;
wire [23:0] in_fract24b_shl = in_fract24b << in_nlzb;
wire [9:0]  in_exp10mux = (in_exp10a - {5'd0,in_nlza} + in_exp10b - {5'd0,in_nlzb} - 10'd127);


// comparator
//   inputs & outputs
wire op_cmp = a_cmp &
              new_fpu_data;
wire addsub_agtb_o, addsub_aeqb_o;
wire cmp_result, cmp_ready,
     cmp_inv, cmp_inf;
//   module istance
/*pfpu32_fcmp u_f32_cmp
(
  .fpu_op_is_comp_i(op_cmp),
  .cmp_type_i(op_fpu),
  // operand 'a' related inputs
  .signa_i(in_signa),
  .exp10a_i(in_exp10a),
  .fract24a_i(in_fract24a),
  .snana_i(in_snan_a),
  .qnana_i(in_qnan_a),
  .infa_i(in_infa),
  .zeroa_i(in_opa_0),
  // operand 'b' related inputs
  .signb_i(in_signb),
  .exp10b_i(in_exp10b),
  .fract24b_i(in_fract24b),
  .snanb_i(in_snan_b),
  .qnanb_i(in_qnan_b),
  .infb_i(in_infb),
  .zerob_i(in_opb_0),
  // support addsub
  .addsub_agtb_o(addsub_agtb_o),
  .addsub_aeqb_o(addsub_aeqb_o),
  // outputs
  .cmp_flag_o(cmp_result),
  .inv_o(cmp_inv),
  .inf_o(cmp_inf),
  .ready_o(cmp_ready)
);*/


// addition / substraction
//   inputs & outputs
wire the_sub   = (op_arith_conv == 3'd1);
wire op_add    = (~a_cmp) & ((op_arith_conv == 3'd0) | the_sub);
wire add_start = op_add & 
                 new_fpu_data;
                 
//add stuff
wire in_signbSub = in_signb ^ the_sub;

wire exp_gt = in_exp10a > in_exp10b;
wire exp_eq = in_exp10a == in_exp10b;
wire fract_gt = in_fract24a > in_fract24b;
wire fract_eq = in_fract24a == in_fract24b;

wire addsub_agtb = exp_gt | (exp_eq & fract_gt);
wire addsub_aeqb = exp_eq & fract_eq;
wire [23:0] in_fract24_nsh = addsub_agtb ? in_fract24a : in_fract24b;
wire [23:0] in_fract24_fsh = addsub_agtb ? in_fract24b : in_fract24a;
wire [9:0] in_exp_diff = addsub_agtb ? (in_exp10a - in_exp10b) :
                                          (in_exp10b - in_exp10a);

              
                 
wire        add_rdy_o;       // add/sub is ready
wire        add_sign_o;      // add/sub signum
wire        add_sub_0_o;     // flag that actual substruction is performed and result is zero
wire  [4:0] add_shl_o;       // do left shift in align stage
wire  [9:0] add_exp10shl_o;  // exponent for left shift align
wire  [9:0] add_exp10sh0_o;  // exponent for no shift in align
wire [27:0] add_fract28_o;   // fractional with appended {r,s} bits
wire        add_inv_o;       // add/sub invalid operation flag
wire        add_inf_o;       // add/sub infinity output reg
wire        add_snan_o;      // add/sub signaling NaN output reg
wire        add_qnan_o;      // add/sub quiet NaN output reg
wire        add_anan_sign_o; // add/sub signum for output nan
//   module istance
pfpu32_addsub_fast u_f32_addsub
(
  .clk           (clk),
  .rst           (rst),
  .flush_i       (flush_i),        // flush pipe
  .adv_i         (padv_fpu_units), // advance pipe
  .start_i       (add_start), 
  .rmode_i       (round_mode_i),
  // input 'a' related values
  .exp10a_i      (in_exp10a),
  // input 'b' related values
  .exp10b_i      (in_exp10b),
  // 'a'/'b' related
  .snan_i        (in_snan),
  .qnan_i        (in_qnan),
  .anan_sign_i   (in_anan_sign),
  
  .addsub_agtb_i (addsub_agtb),
  .addsub_aeqb_i (addsub_aeqb),
  .inv_i   (in_inv),
  .inf_i (in_inf),
  .signa_i (in_signa),
  .signb_i (in_signbSub),
  .fract24nsh_i (in_fract24_nsh),
  .fract24fsh_i (in_fract24_fsh),
  .exp_diff_i (in_exp_diff),
  
  // outputs
  .add_fast_valid_o       (addsub_fast_valid_o),       // add/sub is ready
  .add_fast_result_o      (addsub_fast_result_o),
  .fpcsr_o                (fpcsr_addsub_o)
  
  
);

// MUL/DIV combined pipeline
//   inputs & outputs
wire op_mul    = (~a_cmp) & (op_arith_conv == 3'd2);
wire op_div    = (~a_cmp) & (op_arith_conv == 3'd3);
wire mul_start = (op_mul) & new_fpu_data;

//   module istance
pfpu32_mul_fast u_f32_mul_fast
(
  .clk         (clk),
  .rst         (rst),
  .flush_i     (flush_i),        // flushe pipe
  .adv_i       (padv_fpu_units), // advance pipe
  .start_ii     (mul_start),
  .rmode_ii     (round_mode_i),
  //.is_div_i    (op_div),
  // input 'a' related values
  .signa_ii     (in_signa),
  .fract24ash_ii  (in_fract24a_shl),
  // input 'b' related values
  .signb_ii     (in_signb),
  .fract24bsh_ii  (in_fract24b_shl),
  // 'a'/'b' related
  .snan_ii      (in_snan),        
  .qnan_ii      (in_qnan),
  .anan_sign_ii (in_anan_sign),
  .opc0_ii      (in_opc_0),
  .inf_ii       (in_inf),
  .inv_ii       (in_inv),
  .exp10mux_ii  (in_exp10mux),
  // MUL outputs
  .mul_fast_result_o (mul_fast_result_o),     // i2f is ready
  .mul_fast_ready_o    (mul_fast_valid_o),    // i2f signum
  .fpcsr_o           (fpcsr_mul_o)
);

// convertor
//   i2f signals
wire op_i2f_cnv = (~a_cmp) & (op_arith_conv == 3'd4);
wire i2f_start  = op_i2f_cnv & 
                  new_fpu_data;
                  

                  
wire        i2f_rdy_o;       // i2f is ready
wire        i2f_sign_o;      // i2f signum
wire  [3:0] i2f_shr_o;
wire  [7:0] i2f_exp8shr_o;
wire  [4:0] i2f_shl_o;
wire  [7:0] i2f_exp8shl_o;
wire  [7:0] i2f_exp8sh0_o;
wire [31:0] i2f_fract32_o;
//   i2f module instance
pfpu32_i2f_fast u_i2f_fast_cnv
(
  .clk         (clk),
  .rst         (rst),
  .flush_i     (flush_i),        // flush pipe
  .adv_i       (padv_fpu_units), // advance pipe
  .start_ii     (i2f_start),      // start conversion
  .opa_ii       (in_module_a),
  .signa_ii     (in_signa),
  .zeroa_ii     (in_opa_0),
  .rmode_ii     (round_mode_i),
  .i2f_fast_result_o (i2f_fast_result_o),     // i2f is ready
  .i2f_fast_ready_o    (i2f_fast_valid_o),    // i2f signum
  .fpcsr_o           (fpcsr_i2f_o)
);
//   f2i signals
wire op_f2i_cnv = (~a_cmp) & (op_arith_conv == 3'd5);
wire f2i_start  = op_f2i_cnv & 
                  new_fpu_data;

wire        f2i_rdy_o;       // f2i is ready
wire        f2i_sign_o;      // f2i signum
wire [23:0] f2i_int24_o;     // f2i fractional
wire  [4:0] f2i_shr_o;       // f2i required shift right value
wire  [3:0] f2i_shl_o;       // f2i required shift left value   
wire        f2i_ovf_o;       // f2i overflow flag
wire        f2i_snan_o;      // f2i signaling NaN output reg
//    f2i module instance
pfpu32_f2i u_f2i_cnv
(
  .clk         (clk),
  .rst         (rst),
  .flush_i     (flush_i),        // flush pipe
  .adv_i       (padv_fpu_units), // advance pipe
  .start_ii     (f2i_start),      // start conversion
  .signa_ii     (in_signa),       // input 'a' related values
  .exp10a_ii    (in_exp10a),
  .fract24a_ii  (in_fract24a),
  .snan_ii      (in_snan),        // 'a'/'b' related
  .qnan_ii      (in_qnan),
  .rmode_ii     (round_mode_i),
  
  .f2i_fast_result_o (f2i_fast_result_o),     // i2f is ready
  .f2i_fast_ready_o  (f2i_fast_valid_o),    // i2f signum
  .fpcsr_o           (fpcsr_f2i_o)
);

// multiplexing and rounding
/*pfpu32_rnd u_f32_rnd
(
  // clocks, resets and other controls
  .clk             (clk),
  .rst             (rst),
  .flush_i         (flush_i),         // flush pipe
  .adv_i           (padv_fpu_units),  // advance pipe
  .rmode_i         (round_mode_i),    // rounding mode
  // from mul
  
   // from cmp
  .cmp_rdy_i       (cmp_ready),       // cmp is ready
  .cmp_res_i       (cmp_result),      // cmp result
  .cmp_inv_i       (cmp_inv),         // cmp invalid flag
  .cmp_inf_i       (cmp_inf),         // cmp infinity flag
  // outputs
  .fpu_result_o      (rnd_result_o),
  .fpu_arith_valid_o (rnd_valid_o),
  .fpu_cmp_flag_o    (fpu_cmp_flag_o),
  .fpu_cmp_valid_o   (fpu_cmp_valid_o),
  .fpcsr_o           (fpcsr_rnd_o)
);*/

assign fpu_arith_valid_o=op_i2f_cnv ? i2f_fast_valid_o : 
                                      op_add ? addsub_fast_valid_o : 
                                               op_mul ? mul_fast_valid_o :
                                                        op_f2i_cnv ? f2i_fast_valid_o :
                                                        rnd_valid_o;
                                      
assign fpu_result_o=op_i2f_cnv ? {OPTION_OPERAND_WIDTH{i2f_fast_valid_o}} & i2f_fast_result_o :
                                 op_add ? {OPTION_OPERAND_WIDTH{op_add}} & {OPTION_OPERAND_WIDTH{addsub_fast_valid_o}} & addsub_fast_result_o :
                                          op_mul ?  {OPTION_OPERAND_WIDTH{op_mul}} & {OPTION_OPERAND_WIDTH{mul_fast_valid_o}} & mul_fast_result_o :
                                                    op_f2i_cnv ?  {OPTION_OPERAND_WIDTH{op_f2i_cnv}} & {OPTION_OPERAND_WIDTH{f2i_fast_valid_o}} & f2i_fast_result_o :
                                                                  ({OPTION_OPERAND_WIDTH{~op_i2f_cnv}} & {OPTION_OPERAND_WIDTH{rnd_valid_o}} & rnd_result_o);
                                          
assign fpcsr_o=op_i2f_cnv ? ({`OR1K_FPCSR_WIDTH{i2f_fast_valid_o}} & fpcsr_i2f_o) : 
                            op_add ? ({`OR1K_FPCSR_WIDTH{addsub_fast_valid_o}} & fpcsr_addsub_o) : 
                                     op_mul ? ({`OR1K_FPCSR_WIDTH{mul_fast_valid_o}} & fpcsr_mul_o) :
                                              op_f2i_cnv ? ({`OR1K_FPCSR_WIDTH{f2i_fast_valid_o}} & fpcsr_f2i_o) :
                                                           ({`OR1K_FPCSR_WIDTH{rnd_valid_o}} & fpcsr_rnd_o);

endmodule
