// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
// Date        : Sat Feb  9 12:40:43 2019
// Host        : luca-N56JN running 64-bit Ubuntu 16.04.4 LTS
// Command     : write_verilog -mode funcsim -nolib -force -file
//               /home/luca/Scrivania/ES_Project/FPU_fast/FPU_fast.sim/sim_1/synth/func/xsim/tb_i2f_func_synth.v
// Design      : pfpu32_mul_fast
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tffv1156-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* INF = "31'b1111111100000000000000000000000" *) (* QNAN = "31'b1111111110000000000000000000000" *) (* SNAN = "31'b1111111101111111111111111111111" *) 
(* NotValidForBitStream *)
module pfpu32_mul_fast
   (clk,
    rst,
    flush_i,
    adv_i,
    start_i,
    rmode_i,
    signa_i,
    exp10a_i,
    fract24a_i,
    infa_i,
    zeroa_i,
    signb_i,
    exp10b_i,
    fract24b_i,
    infb_i,
    zerob_i,
    snan_i,
    qnan_i,
    anan_sign_i,
    mul_fast_result_o,
    mul_fast_ready_o,
    fpcsr_o);
  input clk;
  input rst;
  input flush_i;
  input adv_i;
  input start_i;
  input [1:0]rmode_i;
  input signa_i;
  input [9:0]exp10a_i;
  input [23:0]fract24a_i;
  input infa_i;
  input zeroa_i;
  input signb_i;
  input [9:0]exp10b_i;
  input [23:0]fract24b_i;
  input infb_i;
  input zerob_i;
  input snan_i;
  input qnan_i;
  input anan_sign_i;
  output [31:0]mul_fast_result_o;
  output mul_fast_ready_o;
  output [11:0]fpcsr_o;

  wire adv_i;
  wire adv_i_IBUF;
  wire anan_sign_i;
  wire anan_sign_i_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire cycleEF_n_1;
  wire [9:0]exp10a_i;
  wire [9:0]exp10a_i_IBUF;
  wire [9:0]exp10b_i;
  wire [9:0]exp10b_i_IBUF;
  wire flush_i;
  wire flush_i_IBUF;
  wire [11:0]fpcsr_o;
  wire [10:3]fpcsr_o_OBUF;
  wire [23:0]fract24a_i;
  wire [23:0]fract24a_i_IBUF;
  wire [23:0]fract24b_i;
  wire [23:0]fract24b_i_IBUF;
  wire infa_i;
  wire infa_i_IBUF;
  wire infb_i;
  wire infb_i_IBUF;
  wire mul_fast_ready_o;
  wire mul_fast_ready_o_OBUF;
  wire [31:0]mul_fast_result_o;
  wire [31:0]mul_fast_result_o_OBUF;
  wire qnan_i;
  wire qnan_i_IBUF;
  wire [1:0]rmode_i;
  wire [1:0]rmode_i_IBUF;
  wire rst;
  wire rst_IBUF;
  wire s0o_anan_i_sign;
  wire s0o_inf_i;
  wire s0o_inv;
  wire s0o_qnan_i;
  wire s0o_signc;
  wire s0o_signc_i_1_n_0;
  wire s0o_snan_i;
  wire s0t_inf_i;
  wire s0t_inv;
  wire s1o_anan_sign;
  wire s1o_carry;
  wire [9:0]s1o_exp10sh0;
  wire [8:0]s1o_exp10shr;
  wire [27:2]s1o_fract35;
  wire s1o_inf;
  wire s1o_inv;
  wire s1o_qnan;
  wire s1o_ready;
  wire [0:0]s1o_shr;
  wire [4:0]s1o_shr_t;
  wire s1o_sign;
  wire s1o_snan;
  wire s1o_sticky_l;
  wire s1o_sticky_r;
  wire signa_i;
  wire signa_i_IBUF;
  wire signb_i;
  wire signb_i_IBUF;
  wire snan_i;
  wire snan_i_IBUF;
  wire start_i;
  wire start_i_IBUF;
  wire zeroa_i;
  wire zeroa_i_IBUF;
  wire zerob_i;
  wire zerob_i_IBUF;

  IBUF adv_i_IBUF_inst
       (.I(adv_i),
        .O(adv_i_IBUF));
  IBUF anan_sign_i_IBUF_inst
       (.I(anan_sign_i),
        .O(anan_sign_i_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  pfpu32_mul_partD cycleD
       (.Q(s1o_fract35),
        .SR(cycleEF_n_1),
        .adv_i_IBUF(adv_i_IBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .exp10a_i_IBUF(exp10a_i_IBUF),
        .exp10b_i_IBUF(exp10b_i_IBUF),
        .flush_i_IBUF(flush_i_IBUF),
        .fract24a_i_IBUF(fract24a_i_IBUF),
        .fract24b_i_IBUF(fract24b_i_IBUF),
        .rst_IBUF(rst_IBUF),
        .s1o_carry(s1o_carry),
        .\s1o_exp10sh0_reg[9]_0 (s1o_exp10sh0),
        .\s1o_exp10shr_reg[8]_0 (s1o_exp10shr),
        .s1o_ready(s1o_ready),
        .s1o_shr(s1o_shr),
        .s1o_shr_t(s1o_shr_t),
        .s1o_sticky_l(s1o_sticky_l),
        .s1o_sticky_r(s1o_sticky_r),
        .start_i_IBUF(start_i_IBUF),
        .zeroa_i_IBUF(zeroa_i_IBUF),
        .zerob_i_IBUF(zerob_i_IBUF));
  pfpu32_mul_rnd cycleEF
       (.D(s1o_fract35),
        .Q(mul_fast_result_o_OBUF),
        .SR(cycleEF_n_1),
        .adv_i_IBUF(adv_i_IBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .flush_i_IBUF(flush_i_IBUF),
        .\fpcsr_o[10] (fpcsr_o_OBUF),
        .mul_fast_ready_o_OBUF(mul_fast_ready_o_OBUF),
        .rmode_i_IBUF(rmode_i_IBUF),
        .rst_IBUF(rst_IBUF),
        .s1o_anan_sign(s1o_anan_sign),
        .s1o_carry(s1o_carry),
        .\s1o_exp10sh0_reg[9]_0 (s1o_exp10sh0),
        .\s1o_exp10shr_reg[8]_0 (s1o_exp10shr),
        .s1o_inf(s1o_inf),
        .s1o_inv(s1o_inv),
        .s1o_qnan(s1o_qnan),
        .s1o_ready(s1o_ready),
        .s1o_shr(s1o_shr),
        .s1o_shr_t(s1o_shr_t),
        .s1o_sign(s1o_sign),
        .s1o_snan(s1o_snan),
        .s1o_sticky_l(s1o_sticky_l),
        .s1o_sticky_r(s1o_sticky_r));
  IBUF \exp10a_i_IBUF[0]_inst 
       (.I(exp10a_i[0]),
        .O(exp10a_i_IBUF[0]));
  IBUF \exp10a_i_IBUF[1]_inst 
       (.I(exp10a_i[1]),
        .O(exp10a_i_IBUF[1]));
  IBUF \exp10a_i_IBUF[2]_inst 
       (.I(exp10a_i[2]),
        .O(exp10a_i_IBUF[2]));
  IBUF \exp10a_i_IBUF[3]_inst 
       (.I(exp10a_i[3]),
        .O(exp10a_i_IBUF[3]));
  IBUF \exp10a_i_IBUF[4]_inst 
       (.I(exp10a_i[4]),
        .O(exp10a_i_IBUF[4]));
  IBUF \exp10a_i_IBUF[5]_inst 
       (.I(exp10a_i[5]),
        .O(exp10a_i_IBUF[5]));
  IBUF \exp10a_i_IBUF[6]_inst 
       (.I(exp10a_i[6]),
        .O(exp10a_i_IBUF[6]));
  IBUF \exp10a_i_IBUF[7]_inst 
       (.I(exp10a_i[7]),
        .O(exp10a_i_IBUF[7]));
  IBUF \exp10a_i_IBUF[8]_inst 
       (.I(exp10a_i[8]),
        .O(exp10a_i_IBUF[8]));
  IBUF \exp10a_i_IBUF[9]_inst 
       (.I(exp10a_i[9]),
        .O(exp10a_i_IBUF[9]));
  IBUF \exp10b_i_IBUF[0]_inst 
       (.I(exp10b_i[0]),
        .O(exp10b_i_IBUF[0]));
  IBUF \exp10b_i_IBUF[1]_inst 
       (.I(exp10b_i[1]),
        .O(exp10b_i_IBUF[1]));
  IBUF \exp10b_i_IBUF[2]_inst 
       (.I(exp10b_i[2]),
        .O(exp10b_i_IBUF[2]));
  IBUF \exp10b_i_IBUF[3]_inst 
       (.I(exp10b_i[3]),
        .O(exp10b_i_IBUF[3]));
  IBUF \exp10b_i_IBUF[4]_inst 
       (.I(exp10b_i[4]),
        .O(exp10b_i_IBUF[4]));
  IBUF \exp10b_i_IBUF[5]_inst 
       (.I(exp10b_i[5]),
        .O(exp10b_i_IBUF[5]));
  IBUF \exp10b_i_IBUF[6]_inst 
       (.I(exp10b_i[6]),
        .O(exp10b_i_IBUF[6]));
  IBUF \exp10b_i_IBUF[7]_inst 
       (.I(exp10b_i[7]),
        .O(exp10b_i_IBUF[7]));
  IBUF \exp10b_i_IBUF[8]_inst 
       (.I(exp10b_i[8]),
        .O(exp10b_i_IBUF[8]));
  IBUF \exp10b_i_IBUF[9]_inst 
       (.I(exp10b_i[9]),
        .O(exp10b_i_IBUF[9]));
  IBUF flush_i_IBUF_inst
       (.I(flush_i),
        .O(flush_i_IBUF));
  OBUF \fpcsr_o_OBUF[0]_inst 
       (.I(1'b0),
        .O(fpcsr_o[0]));
  OBUF \fpcsr_o_OBUF[10]_inst 
       (.I(fpcsr_o_OBUF[10]),
        .O(fpcsr_o[10]));
  OBUF \fpcsr_o_OBUF[11]_inst 
       (.I(1'b0),
        .O(fpcsr_o[11]));
  OBUF \fpcsr_o_OBUF[1]_inst 
       (.I(1'b0),
        .O(fpcsr_o[1]));
  OBUF \fpcsr_o_OBUF[2]_inst 
       (.I(1'b0),
        .O(fpcsr_o[2]));
  OBUF \fpcsr_o_OBUF[3]_inst 
       (.I(fpcsr_o_OBUF[3]),
        .O(fpcsr_o[3]));
  OBUF \fpcsr_o_OBUF[4]_inst 
       (.I(fpcsr_o_OBUF[4]),
        .O(fpcsr_o[4]));
  OBUF \fpcsr_o_OBUF[5]_inst 
       (.I(fpcsr_o_OBUF[5]),
        .O(fpcsr_o[5]));
  OBUF \fpcsr_o_OBUF[6]_inst 
       (.I(fpcsr_o_OBUF[6]),
        .O(fpcsr_o[6]));
  OBUF \fpcsr_o_OBUF[7]_inst 
       (.I(fpcsr_o_OBUF[7]),
        .O(fpcsr_o[7]));
  OBUF \fpcsr_o_OBUF[8]_inst 
       (.I(fpcsr_o_OBUF[8]),
        .O(fpcsr_o[8]));
  OBUF \fpcsr_o_OBUF[9]_inst 
       (.I(fpcsr_o_OBUF[9]),
        .O(fpcsr_o[9]));
  IBUF \fract24a_i_IBUF[0]_inst 
       (.I(fract24a_i[0]),
        .O(fract24a_i_IBUF[0]));
  IBUF \fract24a_i_IBUF[10]_inst 
       (.I(fract24a_i[10]),
        .O(fract24a_i_IBUF[10]));
  IBUF \fract24a_i_IBUF[11]_inst 
       (.I(fract24a_i[11]),
        .O(fract24a_i_IBUF[11]));
  IBUF \fract24a_i_IBUF[12]_inst 
       (.I(fract24a_i[12]),
        .O(fract24a_i_IBUF[12]));
  IBUF \fract24a_i_IBUF[13]_inst 
       (.I(fract24a_i[13]),
        .O(fract24a_i_IBUF[13]));
  IBUF \fract24a_i_IBUF[14]_inst 
       (.I(fract24a_i[14]),
        .O(fract24a_i_IBUF[14]));
  IBUF \fract24a_i_IBUF[15]_inst 
       (.I(fract24a_i[15]),
        .O(fract24a_i_IBUF[15]));
  IBUF \fract24a_i_IBUF[16]_inst 
       (.I(fract24a_i[16]),
        .O(fract24a_i_IBUF[16]));
  IBUF \fract24a_i_IBUF[17]_inst 
       (.I(fract24a_i[17]),
        .O(fract24a_i_IBUF[17]));
  IBUF \fract24a_i_IBUF[18]_inst 
       (.I(fract24a_i[18]),
        .O(fract24a_i_IBUF[18]));
  IBUF \fract24a_i_IBUF[19]_inst 
       (.I(fract24a_i[19]),
        .O(fract24a_i_IBUF[19]));
  IBUF \fract24a_i_IBUF[1]_inst 
       (.I(fract24a_i[1]),
        .O(fract24a_i_IBUF[1]));
  IBUF \fract24a_i_IBUF[20]_inst 
       (.I(fract24a_i[20]),
        .O(fract24a_i_IBUF[20]));
  IBUF \fract24a_i_IBUF[21]_inst 
       (.I(fract24a_i[21]),
        .O(fract24a_i_IBUF[21]));
  IBUF \fract24a_i_IBUF[22]_inst 
       (.I(fract24a_i[22]),
        .O(fract24a_i_IBUF[22]));
  IBUF \fract24a_i_IBUF[23]_inst 
       (.I(fract24a_i[23]),
        .O(fract24a_i_IBUF[23]));
  IBUF \fract24a_i_IBUF[2]_inst 
       (.I(fract24a_i[2]),
        .O(fract24a_i_IBUF[2]));
  IBUF \fract24a_i_IBUF[3]_inst 
       (.I(fract24a_i[3]),
        .O(fract24a_i_IBUF[3]));
  IBUF \fract24a_i_IBUF[4]_inst 
       (.I(fract24a_i[4]),
        .O(fract24a_i_IBUF[4]));
  IBUF \fract24a_i_IBUF[5]_inst 
       (.I(fract24a_i[5]),
        .O(fract24a_i_IBUF[5]));
  IBUF \fract24a_i_IBUF[6]_inst 
       (.I(fract24a_i[6]),
        .O(fract24a_i_IBUF[6]));
  IBUF \fract24a_i_IBUF[7]_inst 
       (.I(fract24a_i[7]),
        .O(fract24a_i_IBUF[7]));
  IBUF \fract24a_i_IBUF[8]_inst 
       (.I(fract24a_i[8]),
        .O(fract24a_i_IBUF[8]));
  IBUF \fract24a_i_IBUF[9]_inst 
       (.I(fract24a_i[9]),
        .O(fract24a_i_IBUF[9]));
  IBUF \fract24b_i_IBUF[0]_inst 
       (.I(fract24b_i[0]),
        .O(fract24b_i_IBUF[0]));
  IBUF \fract24b_i_IBUF[10]_inst 
       (.I(fract24b_i[10]),
        .O(fract24b_i_IBUF[10]));
  IBUF \fract24b_i_IBUF[11]_inst 
       (.I(fract24b_i[11]),
        .O(fract24b_i_IBUF[11]));
  IBUF \fract24b_i_IBUF[12]_inst 
       (.I(fract24b_i[12]),
        .O(fract24b_i_IBUF[12]));
  IBUF \fract24b_i_IBUF[13]_inst 
       (.I(fract24b_i[13]),
        .O(fract24b_i_IBUF[13]));
  IBUF \fract24b_i_IBUF[14]_inst 
       (.I(fract24b_i[14]),
        .O(fract24b_i_IBUF[14]));
  IBUF \fract24b_i_IBUF[15]_inst 
       (.I(fract24b_i[15]),
        .O(fract24b_i_IBUF[15]));
  IBUF \fract24b_i_IBUF[16]_inst 
       (.I(fract24b_i[16]),
        .O(fract24b_i_IBUF[16]));
  IBUF \fract24b_i_IBUF[17]_inst 
       (.I(fract24b_i[17]),
        .O(fract24b_i_IBUF[17]));
  IBUF \fract24b_i_IBUF[18]_inst 
       (.I(fract24b_i[18]),
        .O(fract24b_i_IBUF[18]));
  IBUF \fract24b_i_IBUF[19]_inst 
       (.I(fract24b_i[19]),
        .O(fract24b_i_IBUF[19]));
  IBUF \fract24b_i_IBUF[1]_inst 
       (.I(fract24b_i[1]),
        .O(fract24b_i_IBUF[1]));
  IBUF \fract24b_i_IBUF[20]_inst 
       (.I(fract24b_i[20]),
        .O(fract24b_i_IBUF[20]));
  IBUF \fract24b_i_IBUF[21]_inst 
       (.I(fract24b_i[21]),
        .O(fract24b_i_IBUF[21]));
  IBUF \fract24b_i_IBUF[22]_inst 
       (.I(fract24b_i[22]),
        .O(fract24b_i_IBUF[22]));
  IBUF \fract24b_i_IBUF[23]_inst 
       (.I(fract24b_i[23]),
        .O(fract24b_i_IBUF[23]));
  IBUF \fract24b_i_IBUF[2]_inst 
       (.I(fract24b_i[2]),
        .O(fract24b_i_IBUF[2]));
  IBUF \fract24b_i_IBUF[3]_inst 
       (.I(fract24b_i[3]),
        .O(fract24b_i_IBUF[3]));
  IBUF \fract24b_i_IBUF[4]_inst 
       (.I(fract24b_i[4]),
        .O(fract24b_i_IBUF[4]));
  IBUF \fract24b_i_IBUF[5]_inst 
       (.I(fract24b_i[5]),
        .O(fract24b_i_IBUF[5]));
  IBUF \fract24b_i_IBUF[6]_inst 
       (.I(fract24b_i[6]),
        .O(fract24b_i_IBUF[6]));
  IBUF \fract24b_i_IBUF[7]_inst 
       (.I(fract24b_i[7]),
        .O(fract24b_i_IBUF[7]));
  IBUF \fract24b_i_IBUF[8]_inst 
       (.I(fract24b_i[8]),
        .O(fract24b_i_IBUF[8]));
  IBUF \fract24b_i_IBUF[9]_inst 
       (.I(fract24b_i[9]),
        .O(fract24b_i_IBUF[9]));
  IBUF infa_i_IBUF_inst
       (.I(infa_i),
        .O(infa_i_IBUF));
  IBUF infb_i_IBUF_inst
       (.I(infb_i),
        .O(infb_i_IBUF));
  OBUF mul_fast_ready_o_OBUF_inst
       (.I(mul_fast_ready_o_OBUF),
        .O(mul_fast_ready_o));
  OBUF \mul_fast_result_o_OBUF[0]_inst 
       (.I(mul_fast_result_o_OBUF[0]),
        .O(mul_fast_result_o[0]));
  OBUF \mul_fast_result_o_OBUF[10]_inst 
       (.I(mul_fast_result_o_OBUF[10]),
        .O(mul_fast_result_o[10]));
  OBUF \mul_fast_result_o_OBUF[11]_inst 
       (.I(mul_fast_result_o_OBUF[11]),
        .O(mul_fast_result_o[11]));
  OBUF \mul_fast_result_o_OBUF[12]_inst 
       (.I(mul_fast_result_o_OBUF[12]),
        .O(mul_fast_result_o[12]));
  OBUF \mul_fast_result_o_OBUF[13]_inst 
       (.I(mul_fast_result_o_OBUF[13]),
        .O(mul_fast_result_o[13]));
  OBUF \mul_fast_result_o_OBUF[14]_inst 
       (.I(mul_fast_result_o_OBUF[14]),
        .O(mul_fast_result_o[14]));
  OBUF \mul_fast_result_o_OBUF[15]_inst 
       (.I(mul_fast_result_o_OBUF[15]),
        .O(mul_fast_result_o[15]));
  OBUF \mul_fast_result_o_OBUF[16]_inst 
       (.I(mul_fast_result_o_OBUF[16]),
        .O(mul_fast_result_o[16]));
  OBUF \mul_fast_result_o_OBUF[17]_inst 
       (.I(mul_fast_result_o_OBUF[17]),
        .O(mul_fast_result_o[17]));
  OBUF \mul_fast_result_o_OBUF[18]_inst 
       (.I(mul_fast_result_o_OBUF[18]),
        .O(mul_fast_result_o[18]));
  OBUF \mul_fast_result_o_OBUF[19]_inst 
       (.I(mul_fast_result_o_OBUF[19]),
        .O(mul_fast_result_o[19]));
  OBUF \mul_fast_result_o_OBUF[1]_inst 
       (.I(mul_fast_result_o_OBUF[1]),
        .O(mul_fast_result_o[1]));
  OBUF \mul_fast_result_o_OBUF[20]_inst 
       (.I(mul_fast_result_o_OBUF[20]),
        .O(mul_fast_result_o[20]));
  OBUF \mul_fast_result_o_OBUF[21]_inst 
       (.I(mul_fast_result_o_OBUF[21]),
        .O(mul_fast_result_o[21]));
  OBUF \mul_fast_result_o_OBUF[22]_inst 
       (.I(mul_fast_result_o_OBUF[22]),
        .O(mul_fast_result_o[22]));
  OBUF \mul_fast_result_o_OBUF[23]_inst 
       (.I(mul_fast_result_o_OBUF[23]),
        .O(mul_fast_result_o[23]));
  OBUF \mul_fast_result_o_OBUF[24]_inst 
       (.I(mul_fast_result_o_OBUF[24]),
        .O(mul_fast_result_o[24]));
  OBUF \mul_fast_result_o_OBUF[25]_inst 
       (.I(mul_fast_result_o_OBUF[25]),
        .O(mul_fast_result_o[25]));
  OBUF \mul_fast_result_o_OBUF[26]_inst 
       (.I(mul_fast_result_o_OBUF[26]),
        .O(mul_fast_result_o[26]));
  OBUF \mul_fast_result_o_OBUF[27]_inst 
       (.I(mul_fast_result_o_OBUF[27]),
        .O(mul_fast_result_o[27]));
  OBUF \mul_fast_result_o_OBUF[28]_inst 
       (.I(mul_fast_result_o_OBUF[28]),
        .O(mul_fast_result_o[28]));
  OBUF \mul_fast_result_o_OBUF[29]_inst 
       (.I(mul_fast_result_o_OBUF[29]),
        .O(mul_fast_result_o[29]));
  OBUF \mul_fast_result_o_OBUF[2]_inst 
       (.I(mul_fast_result_o_OBUF[2]),
        .O(mul_fast_result_o[2]));
  OBUF \mul_fast_result_o_OBUF[30]_inst 
       (.I(mul_fast_result_o_OBUF[30]),
        .O(mul_fast_result_o[30]));
  OBUF \mul_fast_result_o_OBUF[31]_inst 
       (.I(mul_fast_result_o_OBUF[31]),
        .O(mul_fast_result_o[31]));
  OBUF \mul_fast_result_o_OBUF[3]_inst 
       (.I(mul_fast_result_o_OBUF[3]),
        .O(mul_fast_result_o[3]));
  OBUF \mul_fast_result_o_OBUF[4]_inst 
       (.I(mul_fast_result_o_OBUF[4]),
        .O(mul_fast_result_o[4]));
  OBUF \mul_fast_result_o_OBUF[5]_inst 
       (.I(mul_fast_result_o_OBUF[5]),
        .O(mul_fast_result_o[5]));
  OBUF \mul_fast_result_o_OBUF[6]_inst 
       (.I(mul_fast_result_o_OBUF[6]),
        .O(mul_fast_result_o[6]));
  OBUF \mul_fast_result_o_OBUF[7]_inst 
       (.I(mul_fast_result_o_OBUF[7]),
        .O(mul_fast_result_o[7]));
  OBUF \mul_fast_result_o_OBUF[8]_inst 
       (.I(mul_fast_result_o_OBUF[8]),
        .O(mul_fast_result_o[8]));
  OBUF \mul_fast_result_o_OBUF[9]_inst 
       (.I(mul_fast_result_o_OBUF[9]),
        .O(mul_fast_result_o[9]));
  IBUF qnan_i_IBUF_inst
       (.I(qnan_i),
        .O(qnan_i_IBUF));
  IBUF \rmode_i_IBUF[0]_inst 
       (.I(rmode_i[0]),
        .O(rmode_i_IBUF[0]));
  IBUF \rmode_i_IBUF[1]_inst 
       (.I(rmode_i[1]),
        .O(rmode_i_IBUF[1]));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    s0o_anan_i_sign_reg
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(anan_sign_i_IBUF),
        .Q(s0o_anan_i_sign),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT2 #(
    .INIT(4'hE)) 
    s0o_inf_i_i_1
       (.I0(infa_i_IBUF),
        .I1(infb_i_IBUF),
        .O(s0t_inf_i));
  FDRE #(
    .INIT(1'b0)) 
    s0o_inf_i_reg
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(s0t_inf_i),
        .Q(s0o_inf_i),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    s0o_inv_i_1
       (.I0(infb_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(infa_i_IBUF),
        .I3(zerob_i_IBUF),
        .O(s0t_inv));
  FDRE #(
    .INIT(1'b0)) 
    s0o_inv_reg
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(s0t_inv),
        .Q(s0o_inv),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    s0o_qnan_i_reg
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(qnan_i_IBUF),
        .Q(s0o_qnan_i),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    s0o_signc_i_1
       (.I0(signb_i_IBUF),
        .I1(signa_i_IBUF),
        .O(s0o_signc_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s0o_signc_reg
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(s0o_signc_i_1_n_0),
        .Q(s0o_signc),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    s0o_snan_i_reg
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(snan_i_IBUF),
        .Q(s0o_snan_i),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    s1o_anan_sign_reg
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(s0o_anan_i_sign),
        .Q(s1o_anan_sign),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    s1o_inf_reg
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(s0o_inf_i),
        .Q(s1o_inf),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    s1o_inv_reg
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(s0o_inv),
        .Q(s1o_inv),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    s1o_qnan_reg
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(s0o_qnan_i),
        .Q(s1o_qnan),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    s1o_sign_reg
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(s0o_signc),
        .Q(s1o_sign),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    s1o_snan_reg
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(s0o_snan_i),
        .Q(s1o_snan),
        .R(1'b0));
  IBUF signa_i_IBUF_inst
       (.I(signa_i),
        .O(signa_i_IBUF));
  IBUF signb_i_IBUF_inst
       (.I(signb_i),
        .O(signb_i_IBUF));
  IBUF snan_i_IBUF_inst
       (.I(snan_i),
        .O(snan_i_IBUF));
  IBUF start_i_IBUF_inst
       (.I(start_i),
        .O(start_i_IBUF));
  IBUF zeroa_i_IBUF_inst
       (.I(zeroa_i),
        .O(zeroa_i_IBUF));
  IBUF zerob_i_IBUF_inst
       (.I(zerob_i),
        .O(zerob_i_IBUF));
endmodule

module pfpu32_mul_partD
   (s1o_carry,
    s1o_shr,
    s1o_shr_t,
    s1o_sticky_r,
    s1o_sticky_l,
    s1o_ready,
    Q,
    \s1o_exp10sh0_reg[9]_0 ,
    \s1o_exp10shr_reg[8]_0 ,
    SR,
    adv_i_IBUF,
    start_i_IBUF,
    clk_IBUF_BUFG,
    zeroa_i_IBUF,
    zerob_i_IBUF,
    exp10b_i_IBUF,
    exp10a_i_IBUF,
    fract24a_i_IBUF,
    fract24b_i_IBUF,
    rst_IBUF,
    flush_i_IBUF);
  output s1o_carry;
  output [0:0]s1o_shr;
  output [4:0]s1o_shr_t;
  output s1o_sticky_r;
  output s1o_sticky_l;
  output s1o_ready;
  output [25:0]Q;
  output [9:0]\s1o_exp10sh0_reg[9]_0 ;
  output [8:0]\s1o_exp10shr_reg[8]_0 ;
  input [0:0]SR;
  input adv_i_IBUF;
  input start_i_IBUF;
  input clk_IBUF_BUFG;
  input zeroa_i_IBUF;
  input zerob_i_IBUF;
  input [9:0]exp10b_i_IBUF;
  input [9:0]exp10a_i_IBUF;
  input [23:0]fract24a_i_IBUF;
  input [23:0]fract24b_i_IBUF;
  input rst_IBUF;
  input flush_i_IBUF;

  wire [25:0]Q;
  wire [0:0]SR;
  wire adv_i_IBUF;
  wire clk_IBUF_BUFG;
  wire [9:0]exp10a_i_IBUF;
  wire [9:0]exp10b_i_IBUF;
  wire flush_i_IBUF;
  wire [23:0]fract24a_i_IBUF;
  wire [23:0]fract24b_i_IBUF;
  wire fract48__0_carry__0_i_1_n_0;
  wire fract48__0_carry__0_i_2_n_0;
  wire fract48__0_carry__0_i_3_n_0;
  wire fract48__0_carry__0_i_4_n_0;
  wire fract48__0_carry__0_i_5_n_0;
  wire fract48__0_carry__0_i_6_n_0;
  wire fract48__0_carry__0_i_7_n_0;
  wire fract48__0_carry__0_i_8_n_0;
  wire fract48__0_carry__0_n_0;
  wire fract48__0_carry__0_n_1;
  wire fract48__0_carry__0_n_2;
  wire fract48__0_carry__0_n_3;
  wire fract48__0_carry__0_n_4;
  wire fract48__0_carry__0_n_5;
  wire fract48__0_carry__0_n_6;
  wire fract48__0_carry__0_n_7;
  wire fract48__0_carry__10_n_1;
  wire fract48__0_carry__10_n_2;
  wire fract48__0_carry__10_n_3;
  wire fract48__0_carry__10_n_4;
  wire fract48__0_carry__1_i_1_n_0;
  wire fract48__0_carry__1_i_2_n_0;
  wire fract48__0_carry__1_i_3_n_0;
  wire fract48__0_carry__1_i_4_n_0;
  wire fract48__0_carry__1_i_5_n_0;
  wire fract48__0_carry__1_i_6_n_0;
  wire fract48__0_carry__1_i_7_n_0;
  wire fract48__0_carry__1_i_8_n_0;
  wire fract48__0_carry__1_n_0;
  wire fract48__0_carry__1_n_1;
  wire fract48__0_carry__1_n_2;
  wire fract48__0_carry__1_n_3;
  wire fract48__0_carry__1_n_4;
  wire fract48__0_carry__1_n_5;
  wire fract48__0_carry__1_n_6;
  wire fract48__0_carry__1_n_7;
  wire fract48__0_carry__2_i_1_n_0;
  wire fract48__0_carry__2_i_2_n_0;
  wire fract48__0_carry__2_i_3_n_0;
  wire fract48__0_carry__2_i_4_n_0;
  wire fract48__0_carry__2_i_5_n_0;
  wire fract48__0_carry__2_i_6_n_0;
  wire fract48__0_carry__2_i_7_n_0;
  wire fract48__0_carry__2_i_8_n_0;
  wire fract48__0_carry__2_n_0;
  wire fract48__0_carry__2_n_1;
  wire fract48__0_carry__2_n_2;
  wire fract48__0_carry__2_n_3;
  wire fract48__0_carry__2_n_4;
  wire fract48__0_carry__2_n_5;
  wire fract48__0_carry__2_n_6;
  wire fract48__0_carry__2_n_7;
  wire fract48__0_carry__3_i_1_n_0;
  wire fract48__0_carry__3_i_2_n_0;
  wire fract48__0_carry__3_i_3_n_0;
  wire fract48__0_carry__3_i_4_n_0;
  wire fract48__0_carry__3_i_5_n_0;
  wire fract48__0_carry__3_i_6_n_0;
  wire fract48__0_carry__3_i_7_n_0;
  wire fract48__0_carry__3_i_8_n_0;
  wire fract48__0_carry__3_n_0;
  wire fract48__0_carry__3_n_1;
  wire fract48__0_carry__3_n_2;
  wire fract48__0_carry__3_n_3;
  wire fract48__0_carry__3_n_4;
  wire fract48__0_carry__3_n_5;
  wire fract48__0_carry__3_n_6;
  wire fract48__0_carry__3_n_7;
  wire fract48__0_carry__4_i_1_n_0;
  wire fract48__0_carry__4_i_2_n_0;
  wire fract48__0_carry__4_i_3_n_0;
  wire fract48__0_carry__4_i_4_n_0;
  wire fract48__0_carry__4_i_5_n_0;
  wire fract48__0_carry__4_i_6_n_0;
  wire fract48__0_carry__4_i_7_n_0;
  wire fract48__0_carry__4_i_8_n_0;
  wire fract48__0_carry__4_n_0;
  wire fract48__0_carry__4_n_1;
  wire fract48__0_carry__4_n_2;
  wire fract48__0_carry__4_n_3;
  wire fract48__0_carry__4_n_7;
  wire fract48__0_carry__5_i_1_n_0;
  wire fract48__0_carry__5_i_2_n_0;
  wire fract48__0_carry__5_i_3_n_0;
  wire fract48__0_carry__5_i_4_n_0;
  wire fract48__0_carry__5_i_5_n_0;
  wire fract48__0_carry__5_i_6_n_0;
  wire fract48__0_carry__5_i_7_n_0;
  wire fract48__0_carry__5_i_8_n_0;
  wire fract48__0_carry__5_n_0;
  wire fract48__0_carry__5_n_1;
  wire fract48__0_carry__5_n_2;
  wire fract48__0_carry__5_n_3;
  wire fract48__0_carry__6_i_1_n_0;
  wire fract48__0_carry__6_i_2_n_0;
  wire fract48__0_carry__6_i_3_n_0;
  wire fract48__0_carry__6_i_4_n_0;
  wire fract48__0_carry__6_i_5_n_0;
  wire fract48__0_carry__6_i_6_n_0;
  wire fract48__0_carry__6_i_7_n_0;
  wire fract48__0_carry__6_i_8_n_0;
  wire fract48__0_carry__6_n_0;
  wire fract48__0_carry__6_n_1;
  wire fract48__0_carry__6_n_2;
  wire fract48__0_carry__6_n_3;
  wire fract48__0_carry__7_i_1_n_0;
  wire fract48__0_carry__7_n_0;
  wire fract48__0_carry__7_n_1;
  wire fract48__0_carry__7_n_2;
  wire fract48__0_carry__7_n_3;
  wire fract48__0_carry__8_n_0;
  wire fract48__0_carry__8_n_1;
  wire fract48__0_carry__8_n_2;
  wire fract48__0_carry__8_n_3;
  wire fract48__0_carry__9_n_0;
  wire fract48__0_carry__9_n_1;
  wire fract48__0_carry__9_n_2;
  wire fract48__0_carry__9_n_3;
  wire fract48__0_carry_i_1_n_0;
  wire fract48__0_carry_i_2_n_0;
  wire fract48__0_carry_i_3_n_0;
  wire fract48__0_carry_i_4_n_0;
  wire fract48__0_carry_i_5_n_0;
  wire fract48__0_carry_i_6_n_0;
  wire fract48__0_carry_i_7_n_0;
  wire fract48__0_carry_n_0;
  wire fract48__0_carry_n_1;
  wire fract48__0_carry_n_2;
  wire fract48__0_carry_n_3;
  wire fract48__0_carry_n_4;
  wire fract48__0_carry_n_5;
  wire fract48__0_carry_n_6;
  wire fract48__0_carry_n_7;
  wire [15:0]p_0_in2_in;
  wire [47:16]p_1_in3_in;
  wire rst_IBUF;
  wire [9:0]s0o_exp10sh0;
  wire \s0o_exp10sh0[3]_i_10_n_0 ;
  wire \s0o_exp10sh0[3]_i_11_n_0 ;
  wire \s0o_exp10sh0[3]_i_12_n_0 ;
  wire \s0o_exp10sh0[3]_i_2_n_0 ;
  wire \s0o_exp10sh0[3]_i_3_n_0 ;
  wire \s0o_exp10sh0[3]_i_4_n_0 ;
  wire \s0o_exp10sh0[3]_i_5_n_0 ;
  wire \s0o_exp10sh0[3]_i_6_n_0 ;
  wire \s0o_exp10sh0[3]_i_7_n_0 ;
  wire \s0o_exp10sh0[3]_i_8_n_0 ;
  wire \s0o_exp10sh0[3]_i_9_n_0 ;
  wire \s0o_exp10sh0[7]_i_10_n_0 ;
  wire \s0o_exp10sh0[7]_i_11_n_0 ;
  wire \s0o_exp10sh0[7]_i_12_n_0 ;
  wire \s0o_exp10sh0[7]_i_13_n_0 ;
  wire \s0o_exp10sh0[7]_i_14_n_0 ;
  wire \s0o_exp10sh0[7]_i_15_n_0 ;
  wire \s0o_exp10sh0[7]_i_16_n_0 ;
  wire \s0o_exp10sh0[7]_i_2_n_0 ;
  wire \s0o_exp10sh0[7]_i_3_n_0 ;
  wire \s0o_exp10sh0[7]_i_4_n_0 ;
  wire \s0o_exp10sh0[7]_i_5_n_0 ;
  wire \s0o_exp10sh0[7]_i_6_n_0 ;
  wire \s0o_exp10sh0[7]_i_7_n_0 ;
  wire \s0o_exp10sh0[7]_i_8_n_0 ;
  wire \s0o_exp10sh0[7]_i_9_n_0 ;
  wire \s0o_exp10sh0[9]_i_1_n_0 ;
  wire \s0o_exp10sh0[9]_i_3_n_0 ;
  wire \s0o_exp10sh0[9]_i_4_n_0 ;
  wire \s0o_exp10sh0[9]_i_5_n_0 ;
  wire \s0o_exp10sh0_reg[3]_i_1_n_0 ;
  wire \s0o_exp10sh0_reg[3]_i_1_n_1 ;
  wire \s0o_exp10sh0_reg[3]_i_1_n_2 ;
  wire \s0o_exp10sh0_reg[3]_i_1_n_3 ;
  wire \s0o_exp10sh0_reg[7]_i_1_n_0 ;
  wire \s0o_exp10sh0_reg[7]_i_1_n_1 ;
  wire \s0o_exp10sh0_reg[7]_i_1_n_2 ;
  wire \s0o_exp10sh0_reg[7]_i_1_n_3 ;
  wire \s0o_exp10sh0_reg[9]_i_2_n_3 ;
  wire [8:0]s0o_exp10shr;
  wire \s0o_exp10shr[0]_i_1_n_0 ;
  wire \s0o_exp10shr[1]_i_1_n_0 ;
  wire \s0o_exp10shr[2]_i_1_n_0 ;
  wire \s0o_exp10shr[3]_i_1_n_0 ;
  wire \s0o_exp10shr[4]_i_1_n_0 ;
  wire \s0o_exp10shr[5]_i_1_n_0 ;
  wire \s0o_exp10shr[6]_i_1_n_0 ;
  wire \s0o_exp10shr[7]_i_1_n_0 ;
  wire \s0o_exp10shr[8]_i_1_n_0 ;
  wire s0o_fract32_ahbl_reg_i_100_n_0;
  wire s0o_fract32_ahbl_reg_i_101_n_0;
  wire s0o_fract32_ahbl_reg_i_102_n_0;
  wire s0o_fract32_ahbl_reg_i_103_n_0;
  wire s0o_fract32_ahbl_reg_i_104_n_0;
  wire s0o_fract32_ahbl_reg_i_105_n_0;
  wire s0o_fract32_ahbl_reg_i_106_n_0;
  wire s0o_fract32_ahbl_reg_i_107_n_0;
  wire s0o_fract32_ahbl_reg_i_108_n_0;
  wire s0o_fract32_ahbl_reg_i_109_n_0;
  wire s0o_fract32_ahbl_reg_i_110_n_0;
  wire s0o_fract32_ahbl_reg_i_111_n_0;
  wire s0o_fract32_ahbl_reg_i_112_n_0;
  wire s0o_fract32_ahbl_reg_i_113_n_0;
  wire s0o_fract32_ahbl_reg_i_114_n_0;
  wire s0o_fract32_ahbl_reg_i_115_n_0;
  wire s0o_fract32_ahbl_reg_i_116_n_0;
  wire s0o_fract32_ahbl_reg_i_117_n_0;
  wire s0o_fract32_ahbl_reg_i_118_n_0;
  wire s0o_fract32_ahbl_reg_i_119_n_0;
  wire s0o_fract32_ahbl_reg_i_120_n_0;
  wire s0o_fract32_ahbl_reg_i_121_n_0;
  wire s0o_fract32_ahbl_reg_i_122_n_0;
  wire s0o_fract32_ahbl_reg_i_123_n_0;
  wire s0o_fract32_ahbl_reg_i_124_n_0;
  wire s0o_fract32_ahbl_reg_i_125_n_0;
  wire s0o_fract32_ahbl_reg_i_126_n_0;
  wire s0o_fract32_ahbl_reg_i_127_n_0;
  wire s0o_fract32_ahbl_reg_i_128_n_0;
  wire s0o_fract32_ahbl_reg_i_129_n_0;
  wire s0o_fract32_ahbl_reg_i_130_n_0;
  wire s0o_fract32_ahbl_reg_i_131_n_0;
  wire s0o_fract32_ahbl_reg_i_132_n_0;
  wire s0o_fract32_ahbl_reg_i_133_n_0;
  wire s0o_fract32_ahbl_reg_i_134_n_0;
  wire s0o_fract32_ahbl_reg_i_135_n_0;
  wire s0o_fract32_ahbl_reg_i_136_n_0;
  wire s0o_fract32_ahbl_reg_i_137_n_0;
  wire s0o_fract32_ahbl_reg_i_138_n_0;
  wire s0o_fract32_ahbl_reg_i_139_n_0;
  wire s0o_fract32_ahbl_reg_i_140_n_0;
  wire s0o_fract32_ahbl_reg_i_141_n_0;
  wire s0o_fract32_ahbl_reg_i_142_n_0;
  wire s0o_fract32_ahbl_reg_i_143_n_0;
  wire s0o_fract32_ahbl_reg_i_144_n_0;
  wire s0o_fract32_ahbl_reg_i_1_n_0;
  wire s0o_fract32_ahbl_reg_i_25_n_0;
  wire s0o_fract32_ahbl_reg_i_27_n_0;
  wire s0o_fract32_ahbl_reg_i_28_n_0;
  wire s0o_fract32_ahbl_reg_i_29_n_0;
  wire s0o_fract32_ahbl_reg_i_2_n_0;
  wire s0o_fract32_ahbl_reg_i_30_n_0;
  wire s0o_fract32_ahbl_reg_i_31_n_0;
  wire s0o_fract32_ahbl_reg_i_32_n_0;
  wire s0o_fract32_ahbl_reg_i_33_n_0;
  wire s0o_fract32_ahbl_reg_i_34_n_0;
  wire s0o_fract32_ahbl_reg_i_36_n_0;
  wire s0o_fract32_ahbl_reg_i_37_n_0;
  wire s0o_fract32_ahbl_reg_i_38_n_0;
  wire s0o_fract32_ahbl_reg_i_39_n_0;
  wire s0o_fract32_ahbl_reg_i_3_n_0;
  wire s0o_fract32_ahbl_reg_i_40_n_0;
  wire s0o_fract32_ahbl_reg_i_41_n_0;
  wire s0o_fract32_ahbl_reg_i_42_n_0;
  wire s0o_fract32_ahbl_reg_i_43_n_0;
  wire s0o_fract32_ahbl_reg_i_44_n_0;
  wire s0o_fract32_ahbl_reg_i_45_n_0;
  wire s0o_fract32_ahbl_reg_i_46_n_0;
  wire s0o_fract32_ahbl_reg_i_47_n_0;
  wire s0o_fract32_ahbl_reg_i_48_n_0;
  wire s0o_fract32_ahbl_reg_i_49_n_0;
  wire s0o_fract32_ahbl_reg_i_4_n_0;
  wire s0o_fract32_ahbl_reg_i_50_n_0;
  wire s0o_fract32_ahbl_reg_i_51_n_0;
  wire s0o_fract32_ahbl_reg_i_52_n_0;
  wire s0o_fract32_ahbl_reg_i_53_n_0;
  wire s0o_fract32_ahbl_reg_i_55_n_0;
  wire s0o_fract32_ahbl_reg_i_57_n_0;
  wire s0o_fract32_ahbl_reg_i_58_n_0;
  wire s0o_fract32_ahbl_reg_i_59_n_0;
  wire s0o_fract32_ahbl_reg_i_5_n_0;
  wire s0o_fract32_ahbl_reg_i_60_n_0;
  wire s0o_fract32_ahbl_reg_i_61_n_0;
  wire s0o_fract32_ahbl_reg_i_62_n_0;
  wire s0o_fract32_ahbl_reg_i_63_n_0;
  wire s0o_fract32_ahbl_reg_i_64_n_0;
  wire s0o_fract32_ahbl_reg_i_65_n_0;
  wire s0o_fract32_ahbl_reg_i_66_n_0;
  wire s0o_fract32_ahbl_reg_i_67_n_0;
  wire s0o_fract32_ahbl_reg_i_68_n_0;
  wire s0o_fract32_ahbl_reg_i_6_n_0;
  wire s0o_fract32_ahbl_reg_i_70_n_0;
  wire s0o_fract32_ahbl_reg_i_71_n_0;
  wire s0o_fract32_ahbl_reg_i_72_n_0;
  wire s0o_fract32_ahbl_reg_i_74_n_0;
  wire s0o_fract32_ahbl_reg_i_75_n_0;
  wire s0o_fract32_ahbl_reg_i_77_n_0;
  wire s0o_fract32_ahbl_reg_i_79_n_0;
  wire s0o_fract32_ahbl_reg_i_7_n_0;
  wire s0o_fract32_ahbl_reg_i_80_n_0;
  wire s0o_fract32_ahbl_reg_i_81_n_0;
  wire s0o_fract32_ahbl_reg_i_82_n_0;
  wire s0o_fract32_ahbl_reg_i_83_n_0;
  wire s0o_fract32_ahbl_reg_i_84_n_0;
  wire s0o_fract32_ahbl_reg_i_85_n_0;
  wire s0o_fract32_ahbl_reg_i_86_n_0;
  wire s0o_fract32_ahbl_reg_i_87_n_0;
  wire s0o_fract32_ahbl_reg_i_88_n_0;
  wire s0o_fract32_ahbl_reg_i_89_n_0;
  wire s0o_fract32_ahbl_reg_i_8_n_0;
  wire s0o_fract32_ahbl_reg_i_90_n_0;
  wire s0o_fract32_ahbl_reg_i_91_n_0;
  wire s0o_fract32_ahbl_reg_i_92_n_0;
  wire s0o_fract32_ahbl_reg_i_93_n_0;
  wire s0o_fract32_ahbl_reg_i_94_n_0;
  wire s0o_fract32_ahbl_reg_i_95_n_0;
  wire s0o_fract32_ahbl_reg_i_96_n_0;
  wire s0o_fract32_ahbl_reg_i_97_n_0;
  wire s0o_fract32_ahbl_reg_i_98_n_0;
  wire s0o_fract32_ahbl_reg_i_99_n_0;
  wire s0o_fract32_ahbl_reg_n_100;
  wire s0o_fract32_ahbl_reg_n_101;
  wire s0o_fract32_ahbl_reg_n_102;
  wire s0o_fract32_ahbl_reg_n_103;
  wire s0o_fract32_ahbl_reg_n_104;
  wire s0o_fract32_ahbl_reg_n_105;
  wire s0o_fract32_ahbl_reg_n_74;
  wire s0o_fract32_ahbl_reg_n_75;
  wire s0o_fract32_ahbl_reg_n_76;
  wire s0o_fract32_ahbl_reg_n_77;
  wire s0o_fract32_ahbl_reg_n_78;
  wire s0o_fract32_ahbl_reg_n_79;
  wire s0o_fract32_ahbl_reg_n_80;
  wire s0o_fract32_ahbl_reg_n_81;
  wire s0o_fract32_ahbl_reg_n_82;
  wire s0o_fract32_ahbl_reg_n_83;
  wire s0o_fract32_ahbl_reg_n_84;
  wire s0o_fract32_ahbl_reg_n_85;
  wire s0o_fract32_ahbl_reg_n_86;
  wire s0o_fract32_ahbl_reg_n_87;
  wire s0o_fract32_ahbl_reg_n_88;
  wire s0o_fract32_ahbl_reg_n_89;
  wire s0o_fract32_ahbl_reg_n_90;
  wire s0o_fract32_ahbl_reg_n_91;
  wire s0o_fract32_ahbl_reg_n_92;
  wire s0o_fract32_ahbl_reg_n_93;
  wire s0o_fract32_ahbl_reg_n_94;
  wire s0o_fract32_ahbl_reg_n_95;
  wire s0o_fract32_ahbl_reg_n_96;
  wire s0o_fract32_ahbl_reg_n_97;
  wire s0o_fract32_ahbl_reg_n_98;
  wire s0o_fract32_ahbl_reg_n_99;
  wire s0o_fract32_albh_reg_i_17_n_0;
  wire s0o_fract32_albh_reg_i_18_n_0;
  wire s0o_fract32_albh_reg_i_19_n_0;
  wire s0o_fract32_albh_reg_i_20_n_0;
  wire s0o_fract32_albh_reg_i_21_n_0;
  wire s0o_fract32_albh_reg_i_22_n_0;
  wire s0o_fract32_albh_reg_i_23_n_0;
  wire s0o_fract32_albh_reg_i_24_n_0;
  wire s0o_fract32_albh_reg_i_25_n_0;
  wire s0o_fract32_albh_reg_i_26_n_0;
  wire s0o_fract32_albh_reg_i_27_n_0;
  wire s0o_fract32_albh_reg_i_28_n_0;
  wire s0o_fract32_albh_reg_i_29_n_0;
  wire s0o_fract32_albh_reg_i_30_n_0;
  wire s0o_fract32_albh_reg_i_31_n_0;
  wire s0o_fract32_albh_reg_i_32_n_0;
  wire s0o_fract32_albh_reg_i_33_n_0;
  wire s0o_fract32_albh_reg_i_34_n_0;
  wire s0o_fract32_albh_reg_i_35_n_0;
  wire s0o_fract32_albh_reg_i_36_n_0;
  wire s0o_fract32_albh_reg_i_37_n_0;
  wire s0o_fract32_albh_reg_i_38_n_0;
  wire s0o_fract32_albh_reg_i_39_n_0;
  wire s0o_fract32_albh_reg_i_40_n_0;
  wire s0o_fract32_albh_reg_i_41_n_0;
  wire s0o_fract32_albh_reg_i_42_n_0;
  wire s0o_fract32_albh_reg_i_43_n_0;
  wire s0o_fract32_albh_reg_i_44_n_0;
  wire s0o_fract32_albh_reg_i_45_n_0;
  wire s0o_fract32_albh_reg_i_46_n_0;
  wire s0o_fract32_albh_reg_i_47_n_0;
  wire s0o_fract32_albh_reg_i_48_n_0;
  wire s0o_fract32_albh_reg_i_49_n_0;
  wire s0o_fract32_albh_reg_i_50_n_0;
  wire s0o_fract32_albh_reg_i_51_n_0;
  wire s0o_fract32_albh_reg_i_52_n_0;
  wire s0o_fract32_albh_reg_i_53_n_0;
  wire s0o_fract32_albh_reg_i_54_n_0;
  wire s0o_fract32_albh_reg_i_55_n_0;
  wire s0o_fract32_albh_reg_i_56_n_0;
  wire s0o_fract32_albh_reg_i_57_n_0;
  wire s0o_fract32_albh_reg_i_58_n_0;
  wire s0o_fract32_albh_reg_i_59_n_0;
  wire s0o_fract32_albh_reg_i_60_n_0;
  wire s0o_fract32_albh_reg_i_61_n_0;
  wire s0o_fract32_albh_reg_i_62_n_0;
  wire s0o_fract32_albh_reg_i_63_n_0;
  wire s0o_fract32_albh_reg_i_64_n_0;
  wire s0o_fract32_albh_reg_i_65_n_0;
  wire s0o_fract32_albh_reg_i_66_n_0;
  wire s0o_fract32_albh_reg_i_67_n_0;
  wire s0o_fract32_albh_reg_i_69_n_0;
  wire s0o_fract32_albh_reg_i_70_n_0;
  wire s0o_fract32_albh_reg_i_71_n_0;
  wire s0o_fract32_albh_reg_i_73_n_0;
  wire s0o_fract32_albh_reg_i_74_n_0;
  wire s0o_fract32_albh_reg_i_75_n_0;
  wire s0o_fract32_albh_reg_i_76_n_0;
  wire s0o_fract32_albh_reg_i_77_n_0;
  wire s0o_fract32_albh_reg_i_78_n_0;
  wire s0o_fract32_albh_reg_n_100;
  wire s0o_fract32_albh_reg_n_101;
  wire s0o_fract32_albh_reg_n_102;
  wire s0o_fract32_albh_reg_n_103;
  wire s0o_fract32_albh_reg_n_104;
  wire s0o_fract32_albh_reg_n_105;
  wire s0o_fract32_albh_reg_n_74;
  wire s0o_fract32_albh_reg_n_75;
  wire s0o_fract32_albh_reg_n_76;
  wire s0o_fract32_albh_reg_n_77;
  wire s0o_fract32_albh_reg_n_78;
  wire s0o_fract32_albh_reg_n_79;
  wire s0o_fract32_albh_reg_n_80;
  wire s0o_fract32_albh_reg_n_81;
  wire s0o_fract32_albh_reg_n_82;
  wire s0o_fract32_albh_reg_n_83;
  wire s0o_fract32_albh_reg_n_84;
  wire s0o_fract32_albh_reg_n_85;
  wire s0o_fract32_albh_reg_n_86;
  wire s0o_fract32_albh_reg_n_87;
  wire s0o_fract32_albh_reg_n_88;
  wire s0o_fract32_albh_reg_n_89;
  wire s0o_fract32_albh_reg_n_90;
  wire s0o_fract32_albh_reg_n_91;
  wire s0o_fract32_albh_reg_n_92;
  wire s0o_fract32_albh_reg_n_93;
  wire s0o_fract32_albh_reg_n_94;
  wire s0o_fract32_albh_reg_n_95;
  wire s0o_fract32_albh_reg_n_96;
  wire s0o_fract32_albh_reg_n_97;
  wire s0o_fract32_albh_reg_n_98;
  wire s0o_fract32_albh_reg_n_99;
  wire s0o_fract32_albl_reg_n_100;
  wire s0o_fract32_albl_reg_n_101;
  wire s0o_fract32_albl_reg_n_102;
  wire s0o_fract32_albl_reg_n_103;
  wire s0o_fract32_albl_reg_n_104;
  wire s0o_fract32_albl_reg_n_105;
  wire s0o_fract32_albl_reg_n_90;
  wire s0o_fract32_albl_reg_n_91;
  wire s0o_fract32_albl_reg_n_92;
  wire s0o_fract32_albl_reg_n_93;
  wire s0o_fract32_albl_reg_n_94;
  wire s0o_fract32_albl_reg_n_95;
  wire s0o_fract32_albl_reg_n_96;
  wire s0o_fract32_albl_reg_n_97;
  wire s0o_fract32_albl_reg_n_98;
  wire s0o_fract32_albl_reg_n_99;
  wire s0o_ready;
  wire [4:0]s0o_shrx;
  wire \s0o_shrx[0]_i_1_n_0 ;
  wire \s0o_shrx[0]_i_3_n_0 ;
  wire \s0o_shrx[0]_i_4_n_0 ;
  wire \s0o_shrx[1]_i_1_n_0 ;
  wire \s0o_shrx[2]_i_1_n_0 ;
  wire \s0o_shrx[3]_i_1_n_0 ;
  wire \s0o_shrx[4]_i_1_n_0 ;
  wire \s0o_shrx[4]_i_2_n_0 ;
  wire \s0o_shrx[4]_i_3_n_0 ;
  wire \s0o_shrx[4]_i_4_n_0 ;
  wire \s0o_shrx[4]_i_5_n_0 ;
  wire \s0o_shrx[4]_i_6_n_0 ;
  wire \s0o_shrx[4]_i_7_n_0 ;
  wire \s0o_shrx[4]_i_8_n_0 ;
  wire s0t_exp10c_00;
  wire [9:0]s0t_exp10mux;
  wire [15:0]s0t_mul16_ah;
  wire [15:0]s0t_mul16_bh;
  wire [4:0]s0t_nlza;
  wire [4:0]s0t_nlzb;
  wire s1o_carry;
  wire s1o_carry_i_1_n_0;
  wire [9:0]\s1o_exp10sh0_reg[9]_0 ;
  wire [8:0]\s1o_exp10shr_reg[8]_0 ;
  wire s1o_ready;
  wire s1o_ready_i_1__0_n_0;
  wire [0:0]s1o_shr;
  wire \s1o_shr[0]_i_2_n_0 ;
  wire [4:0]s1o_shr_t;
  wire s1o_sticky_l;
  wire s1o_sticky_l_i_1_n_0;
  wire s1o_sticky_l_i_2_n_0;
  wire s1o_sticky_l_i_3_n_0;
  wire s1o_sticky_l_i_4_n_0;
  wire s1o_sticky_l_i_5_n_0;
  wire s1o_sticky_r;
  wire s1o_sticky_r_i_10_n_0;
  wire s1o_sticky_r_i_11_n_0;
  wire s1o_sticky_r_i_12_n_0;
  wire s1o_sticky_r_i_13_n_0;
  wire s1o_sticky_r_i_14_n_0;
  wire s1o_sticky_r_i_15_n_0;
  wire s1o_sticky_r_i_16_n_0;
  wire s1o_sticky_r_i_17_n_0;
  wire s1o_sticky_r_i_18_n_0;
  wire s1o_sticky_r_i_19_n_0;
  wire s1o_sticky_r_i_20_n_0;
  wire s1o_sticky_r_i_21_n_0;
  wire s1o_sticky_r_i_22_n_0;
  wire s1o_sticky_r_i_23_n_0;
  wire s1o_sticky_r_i_24_n_0;
  wire s1o_sticky_r_i_25_n_0;
  wire s1o_sticky_r_i_26_n_0;
  wire s1o_sticky_r_i_27_n_0;
  wire s1o_sticky_r_i_28_n_0;
  wire s1o_sticky_r_i_29_n_0;
  wire s1o_sticky_r_i_2_n_0;
  wire s1o_sticky_r_i_30_n_0;
  wire s1o_sticky_r_i_3_n_0;
  wire s1o_sticky_r_i_4_n_0;
  wire s1o_sticky_r_i_5_n_0;
  wire s1o_sticky_r_i_6_n_0;
  wire s1o_sticky_r_i_7_n_0;
  wire s1o_sticky_r_i_8_n_0;
  wire s1o_sticky_r_i_9_n_0;
  wire s1r_sticky;
  wire [26:2]s1t_fract35;
  wire [1:1]s1t_fract35__0;
  wire [0:0]s1t_shr;
  wire [4:0]s1t_shr_t;
  wire start_i_IBUF;
  wire zeroa_i_IBUF;
  wire zerob_i_IBUF;
  wire [3:3]NLW_fract48__0_carry__10_CO_UNCONNECTED;
  wire [3:1]\NLW_s0o_exp10sh0_reg[9]_i_2_CO_UNCONNECTED ;
  wire [3:2]\NLW_s0o_exp10sh0_reg[9]_i_2_O_UNCONNECTED ;
  wire NLW_s0o_fract32_ahbh_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_s0o_fract32_ahbh_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_s0o_fract32_ahbh_reg_OVERFLOW_UNCONNECTED;
  wire NLW_s0o_fract32_ahbh_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_s0o_fract32_ahbh_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_s0o_fract32_ahbh_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_s0o_fract32_ahbh_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_s0o_fract32_ahbh_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_s0o_fract32_ahbh_reg_CARRYOUT_UNCONNECTED;
  wire [47:32]NLW_s0o_fract32_ahbh_reg_P_UNCONNECTED;
  wire [47:0]NLW_s0o_fract32_ahbh_reg_PCOUT_UNCONNECTED;
  wire NLW_s0o_fract32_ahbl_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_s0o_fract32_ahbl_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_s0o_fract32_ahbl_reg_OVERFLOW_UNCONNECTED;
  wire NLW_s0o_fract32_ahbl_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_s0o_fract32_ahbl_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_s0o_fract32_ahbl_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_s0o_fract32_ahbl_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_s0o_fract32_ahbl_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_s0o_fract32_ahbl_reg_CARRYOUT_UNCONNECTED;
  wire [47:32]NLW_s0o_fract32_ahbl_reg_P_UNCONNECTED;
  wire [47:0]NLW_s0o_fract32_ahbl_reg_PCOUT_UNCONNECTED;
  wire NLW_s0o_fract32_albh_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_s0o_fract32_albh_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_s0o_fract32_albh_reg_OVERFLOW_UNCONNECTED;
  wire NLW_s0o_fract32_albh_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_s0o_fract32_albh_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_s0o_fract32_albh_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_s0o_fract32_albh_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_s0o_fract32_albh_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_s0o_fract32_albh_reg_CARRYOUT_UNCONNECTED;
  wire [47:32]NLW_s0o_fract32_albh_reg_P_UNCONNECTED;
  wire [47:0]NLW_s0o_fract32_albh_reg_PCOUT_UNCONNECTED;
  wire NLW_s0o_fract32_albl_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_s0o_fract32_albl_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_s0o_fract32_albl_reg_OVERFLOW_UNCONNECTED;
  wire NLW_s0o_fract32_albl_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_s0o_fract32_albl_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_s0o_fract32_albl_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_s0o_fract32_albl_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_s0o_fract32_albl_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_s0o_fract32_albl_reg_CARRYOUT_UNCONNECTED;
  wire [47:32]NLW_s0o_fract32_albl_reg_P_UNCONNECTED;
  wire [47:0]NLW_s0o_fract32_albl_reg_PCOUT_UNCONNECTED;

  CARRY4 fract48__0_carry
       (.CI(1'b0),
        .CO({fract48__0_carry_n_0,fract48__0_carry_n_1,fract48__0_carry_n_2,fract48__0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({fract48__0_carry_i_1_n_0,fract48__0_carry_i_2_n_0,fract48__0_carry_i_3_n_0,1'b0}),
        .O({fract48__0_carry_n_4,fract48__0_carry_n_5,fract48__0_carry_n_6,fract48__0_carry_n_7}),
        .S({fract48__0_carry_i_4_n_0,fract48__0_carry_i_5_n_0,fract48__0_carry_i_6_n_0,fract48__0_carry_i_7_n_0}));
  CARRY4 fract48__0_carry__0
       (.CI(fract48__0_carry_n_0),
        .CO({fract48__0_carry__0_n_0,fract48__0_carry__0_n_1,fract48__0_carry__0_n_2,fract48__0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({fract48__0_carry__0_i_1_n_0,fract48__0_carry__0_i_2_n_0,fract48__0_carry__0_i_3_n_0,fract48__0_carry__0_i_4_n_0}),
        .O({fract48__0_carry__0_n_4,fract48__0_carry__0_n_5,fract48__0_carry__0_n_6,fract48__0_carry__0_n_7}),
        .S({fract48__0_carry__0_i_5_n_0,fract48__0_carry__0_i_6_n_0,fract48__0_carry__0_i_7_n_0,fract48__0_carry__0_i_8_n_0}));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__0_i_1
       (.I0(p_0_in2_in[6]),
        .I1(s0o_fract32_ahbl_reg_n_99),
        .I2(s0o_fract32_albh_reg_n_99),
        .O(fract48__0_carry__0_i_1_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__0_i_2
       (.I0(p_0_in2_in[5]),
        .I1(s0o_fract32_ahbl_reg_n_100),
        .I2(s0o_fract32_albh_reg_n_100),
        .O(fract48__0_carry__0_i_2_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__0_i_3
       (.I0(p_0_in2_in[4]),
        .I1(s0o_fract32_ahbl_reg_n_101),
        .I2(s0o_fract32_albh_reg_n_101),
        .O(fract48__0_carry__0_i_3_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__0_i_4
       (.I0(p_0_in2_in[3]),
        .I1(s0o_fract32_ahbl_reg_n_102),
        .I2(s0o_fract32_albh_reg_n_102),
        .O(fract48__0_carry__0_i_4_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__0_i_5
       (.I0(s0o_fract32_albh_reg_n_99),
        .I1(s0o_fract32_ahbl_reg_n_99),
        .I2(p_0_in2_in[6]),
        .I3(s0o_fract32_albh_reg_n_98),
        .I4(s0o_fract32_ahbl_reg_n_98),
        .I5(p_0_in2_in[7]),
        .O(fract48__0_carry__0_i_5_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__0_i_6
       (.I0(s0o_fract32_albh_reg_n_100),
        .I1(s0o_fract32_ahbl_reg_n_100),
        .I2(p_0_in2_in[5]),
        .I3(s0o_fract32_albh_reg_n_99),
        .I4(s0o_fract32_ahbl_reg_n_99),
        .I5(p_0_in2_in[6]),
        .O(fract48__0_carry__0_i_6_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__0_i_7
       (.I0(s0o_fract32_albh_reg_n_101),
        .I1(s0o_fract32_ahbl_reg_n_101),
        .I2(p_0_in2_in[4]),
        .I3(s0o_fract32_albh_reg_n_100),
        .I4(s0o_fract32_ahbl_reg_n_100),
        .I5(p_0_in2_in[5]),
        .O(fract48__0_carry__0_i_7_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__0_i_8
       (.I0(s0o_fract32_albh_reg_n_102),
        .I1(s0o_fract32_ahbl_reg_n_102),
        .I2(p_0_in2_in[3]),
        .I3(s0o_fract32_albh_reg_n_101),
        .I4(s0o_fract32_ahbl_reg_n_101),
        .I5(p_0_in2_in[4]),
        .O(fract48__0_carry__0_i_8_n_0));
  CARRY4 fract48__0_carry__1
       (.CI(fract48__0_carry__0_n_0),
        .CO({fract48__0_carry__1_n_0,fract48__0_carry__1_n_1,fract48__0_carry__1_n_2,fract48__0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({fract48__0_carry__1_i_1_n_0,fract48__0_carry__1_i_2_n_0,fract48__0_carry__1_i_3_n_0,fract48__0_carry__1_i_4_n_0}),
        .O({fract48__0_carry__1_n_4,fract48__0_carry__1_n_5,fract48__0_carry__1_n_6,fract48__0_carry__1_n_7}),
        .S({fract48__0_carry__1_i_5_n_0,fract48__0_carry__1_i_6_n_0,fract48__0_carry__1_i_7_n_0,fract48__0_carry__1_i_8_n_0}));
  CARRY4 fract48__0_carry__10
       (.CI(fract48__0_carry__9_n_0),
        .CO({NLW_fract48__0_carry__10_CO_UNCONNECTED[3],fract48__0_carry__10_n_1,fract48__0_carry__10_n_2,fract48__0_carry__10_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({fract48__0_carry__10_n_4,s1t_fract35[26:24]}),
        .S(p_1_in3_in[47:44]));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__1_i_1
       (.I0(p_0_in2_in[10]),
        .I1(s0o_fract32_ahbl_reg_n_95),
        .I2(s0o_fract32_albh_reg_n_95),
        .O(fract48__0_carry__1_i_1_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__1_i_2
       (.I0(p_0_in2_in[9]),
        .I1(s0o_fract32_ahbl_reg_n_96),
        .I2(s0o_fract32_albh_reg_n_96),
        .O(fract48__0_carry__1_i_2_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__1_i_3
       (.I0(p_0_in2_in[8]),
        .I1(s0o_fract32_ahbl_reg_n_97),
        .I2(s0o_fract32_albh_reg_n_97),
        .O(fract48__0_carry__1_i_3_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__1_i_4
       (.I0(p_0_in2_in[7]),
        .I1(s0o_fract32_ahbl_reg_n_98),
        .I2(s0o_fract32_albh_reg_n_98),
        .O(fract48__0_carry__1_i_4_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__1_i_5
       (.I0(s0o_fract32_albh_reg_n_95),
        .I1(s0o_fract32_ahbl_reg_n_95),
        .I2(p_0_in2_in[10]),
        .I3(s0o_fract32_albh_reg_n_94),
        .I4(s0o_fract32_ahbl_reg_n_94),
        .I5(p_0_in2_in[11]),
        .O(fract48__0_carry__1_i_5_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__1_i_6
       (.I0(s0o_fract32_albh_reg_n_96),
        .I1(s0o_fract32_ahbl_reg_n_96),
        .I2(p_0_in2_in[9]),
        .I3(s0o_fract32_albh_reg_n_95),
        .I4(s0o_fract32_ahbl_reg_n_95),
        .I5(p_0_in2_in[10]),
        .O(fract48__0_carry__1_i_6_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__1_i_7
       (.I0(s0o_fract32_albh_reg_n_97),
        .I1(s0o_fract32_ahbl_reg_n_97),
        .I2(p_0_in2_in[8]),
        .I3(s0o_fract32_albh_reg_n_96),
        .I4(s0o_fract32_ahbl_reg_n_96),
        .I5(p_0_in2_in[9]),
        .O(fract48__0_carry__1_i_7_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__1_i_8
       (.I0(s0o_fract32_albh_reg_n_98),
        .I1(s0o_fract32_ahbl_reg_n_98),
        .I2(p_0_in2_in[7]),
        .I3(s0o_fract32_albh_reg_n_97),
        .I4(s0o_fract32_ahbl_reg_n_97),
        .I5(p_0_in2_in[8]),
        .O(fract48__0_carry__1_i_8_n_0));
  CARRY4 fract48__0_carry__2
       (.CI(fract48__0_carry__1_n_0),
        .CO({fract48__0_carry__2_n_0,fract48__0_carry__2_n_1,fract48__0_carry__2_n_2,fract48__0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({fract48__0_carry__2_i_1_n_0,fract48__0_carry__2_i_2_n_0,fract48__0_carry__2_i_3_n_0,fract48__0_carry__2_i_4_n_0}),
        .O({fract48__0_carry__2_n_4,fract48__0_carry__2_n_5,fract48__0_carry__2_n_6,fract48__0_carry__2_n_7}),
        .S({fract48__0_carry__2_i_5_n_0,fract48__0_carry__2_i_6_n_0,fract48__0_carry__2_i_7_n_0,fract48__0_carry__2_i_8_n_0}));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__2_i_1
       (.I0(p_0_in2_in[14]),
        .I1(s0o_fract32_ahbl_reg_n_91),
        .I2(s0o_fract32_albh_reg_n_91),
        .O(fract48__0_carry__2_i_1_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__2_i_2
       (.I0(p_0_in2_in[13]),
        .I1(s0o_fract32_ahbl_reg_n_92),
        .I2(s0o_fract32_albh_reg_n_92),
        .O(fract48__0_carry__2_i_2_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__2_i_3
       (.I0(p_0_in2_in[12]),
        .I1(s0o_fract32_ahbl_reg_n_93),
        .I2(s0o_fract32_albh_reg_n_93),
        .O(fract48__0_carry__2_i_3_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__2_i_4
       (.I0(p_0_in2_in[11]),
        .I1(s0o_fract32_ahbl_reg_n_94),
        .I2(s0o_fract32_albh_reg_n_94),
        .O(fract48__0_carry__2_i_4_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__2_i_5
       (.I0(s0o_fract32_albh_reg_n_91),
        .I1(s0o_fract32_ahbl_reg_n_91),
        .I2(p_0_in2_in[14]),
        .I3(s0o_fract32_albh_reg_n_90),
        .I4(s0o_fract32_ahbl_reg_n_90),
        .I5(p_0_in2_in[15]),
        .O(fract48__0_carry__2_i_5_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__2_i_6
       (.I0(s0o_fract32_albh_reg_n_92),
        .I1(s0o_fract32_ahbl_reg_n_92),
        .I2(p_0_in2_in[13]),
        .I3(s0o_fract32_albh_reg_n_91),
        .I4(s0o_fract32_ahbl_reg_n_91),
        .I5(p_0_in2_in[14]),
        .O(fract48__0_carry__2_i_6_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__2_i_7
       (.I0(s0o_fract32_albh_reg_n_93),
        .I1(s0o_fract32_ahbl_reg_n_93),
        .I2(p_0_in2_in[12]),
        .I3(s0o_fract32_albh_reg_n_92),
        .I4(s0o_fract32_ahbl_reg_n_92),
        .I5(p_0_in2_in[13]),
        .O(fract48__0_carry__2_i_7_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__2_i_8
       (.I0(s0o_fract32_albh_reg_n_94),
        .I1(s0o_fract32_ahbl_reg_n_94),
        .I2(p_0_in2_in[11]),
        .I3(s0o_fract32_albh_reg_n_93),
        .I4(s0o_fract32_ahbl_reg_n_93),
        .I5(p_0_in2_in[12]),
        .O(fract48__0_carry__2_i_8_n_0));
  CARRY4 fract48__0_carry__3
       (.CI(fract48__0_carry__2_n_0),
        .CO({fract48__0_carry__3_n_0,fract48__0_carry__3_n_1,fract48__0_carry__3_n_2,fract48__0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({fract48__0_carry__3_i_1_n_0,fract48__0_carry__3_i_2_n_0,fract48__0_carry__3_i_3_n_0,fract48__0_carry__3_i_4_n_0}),
        .O({fract48__0_carry__3_n_4,fract48__0_carry__3_n_5,fract48__0_carry__3_n_6,fract48__0_carry__3_n_7}),
        .S({fract48__0_carry__3_i_5_n_0,fract48__0_carry__3_i_6_n_0,fract48__0_carry__3_i_7_n_0,fract48__0_carry__3_i_8_n_0}));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__3_i_1
       (.I0(p_1_in3_in[18]),
        .I1(s0o_fract32_ahbl_reg_n_87),
        .I2(s0o_fract32_albh_reg_n_87),
        .O(fract48__0_carry__3_i_1_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__3_i_2
       (.I0(p_1_in3_in[17]),
        .I1(s0o_fract32_ahbl_reg_n_88),
        .I2(s0o_fract32_albh_reg_n_88),
        .O(fract48__0_carry__3_i_2_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__3_i_3
       (.I0(p_1_in3_in[16]),
        .I1(s0o_fract32_ahbl_reg_n_89),
        .I2(s0o_fract32_albh_reg_n_89),
        .O(fract48__0_carry__3_i_3_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__3_i_4
       (.I0(p_0_in2_in[15]),
        .I1(s0o_fract32_ahbl_reg_n_90),
        .I2(s0o_fract32_albh_reg_n_90),
        .O(fract48__0_carry__3_i_4_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__3_i_5
       (.I0(s0o_fract32_albh_reg_n_87),
        .I1(s0o_fract32_ahbl_reg_n_87),
        .I2(p_1_in3_in[18]),
        .I3(s0o_fract32_albh_reg_n_86),
        .I4(s0o_fract32_ahbl_reg_n_86),
        .I5(p_1_in3_in[19]),
        .O(fract48__0_carry__3_i_5_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__3_i_6
       (.I0(s0o_fract32_albh_reg_n_88),
        .I1(s0o_fract32_ahbl_reg_n_88),
        .I2(p_1_in3_in[17]),
        .I3(s0o_fract32_albh_reg_n_87),
        .I4(s0o_fract32_ahbl_reg_n_87),
        .I5(p_1_in3_in[18]),
        .O(fract48__0_carry__3_i_6_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__3_i_7
       (.I0(s0o_fract32_albh_reg_n_89),
        .I1(s0o_fract32_ahbl_reg_n_89),
        .I2(p_1_in3_in[16]),
        .I3(s0o_fract32_albh_reg_n_88),
        .I4(s0o_fract32_ahbl_reg_n_88),
        .I5(p_1_in3_in[17]),
        .O(fract48__0_carry__3_i_7_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__3_i_8
       (.I0(s0o_fract32_albh_reg_n_90),
        .I1(s0o_fract32_ahbl_reg_n_90),
        .I2(p_0_in2_in[15]),
        .I3(s0o_fract32_albh_reg_n_89),
        .I4(s0o_fract32_ahbl_reg_n_89),
        .I5(p_1_in3_in[16]),
        .O(fract48__0_carry__3_i_8_n_0));
  CARRY4 fract48__0_carry__4
       (.CI(fract48__0_carry__3_n_0),
        .CO({fract48__0_carry__4_n_0,fract48__0_carry__4_n_1,fract48__0_carry__4_n_2,fract48__0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({fract48__0_carry__4_i_1_n_0,fract48__0_carry__4_i_2_n_0,fract48__0_carry__4_i_3_n_0,fract48__0_carry__4_i_4_n_0}),
        .O({s1t_fract35[3:2],s1t_fract35__0,fract48__0_carry__4_n_7}),
        .S({fract48__0_carry__4_i_5_n_0,fract48__0_carry__4_i_6_n_0,fract48__0_carry__4_i_7_n_0,fract48__0_carry__4_i_8_n_0}));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__4_i_1
       (.I0(p_1_in3_in[22]),
        .I1(s0o_fract32_ahbl_reg_n_83),
        .I2(s0o_fract32_albh_reg_n_83),
        .O(fract48__0_carry__4_i_1_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__4_i_2
       (.I0(p_1_in3_in[21]),
        .I1(s0o_fract32_ahbl_reg_n_84),
        .I2(s0o_fract32_albh_reg_n_84),
        .O(fract48__0_carry__4_i_2_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__4_i_3
       (.I0(p_1_in3_in[20]),
        .I1(s0o_fract32_ahbl_reg_n_85),
        .I2(s0o_fract32_albh_reg_n_85),
        .O(fract48__0_carry__4_i_3_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__4_i_4
       (.I0(p_1_in3_in[19]),
        .I1(s0o_fract32_ahbl_reg_n_86),
        .I2(s0o_fract32_albh_reg_n_86),
        .O(fract48__0_carry__4_i_4_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__4_i_5
       (.I0(s0o_fract32_albh_reg_n_83),
        .I1(s0o_fract32_ahbl_reg_n_83),
        .I2(p_1_in3_in[22]),
        .I3(s0o_fract32_albh_reg_n_82),
        .I4(s0o_fract32_ahbl_reg_n_82),
        .I5(p_1_in3_in[23]),
        .O(fract48__0_carry__4_i_5_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__4_i_6
       (.I0(s0o_fract32_albh_reg_n_84),
        .I1(s0o_fract32_ahbl_reg_n_84),
        .I2(p_1_in3_in[21]),
        .I3(s0o_fract32_albh_reg_n_83),
        .I4(s0o_fract32_ahbl_reg_n_83),
        .I5(p_1_in3_in[22]),
        .O(fract48__0_carry__4_i_6_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__4_i_7
       (.I0(s0o_fract32_albh_reg_n_85),
        .I1(s0o_fract32_ahbl_reg_n_85),
        .I2(p_1_in3_in[20]),
        .I3(s0o_fract32_albh_reg_n_84),
        .I4(s0o_fract32_ahbl_reg_n_84),
        .I5(p_1_in3_in[21]),
        .O(fract48__0_carry__4_i_7_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__4_i_8
       (.I0(s0o_fract32_albh_reg_n_86),
        .I1(s0o_fract32_ahbl_reg_n_86),
        .I2(p_1_in3_in[19]),
        .I3(s0o_fract32_albh_reg_n_85),
        .I4(s0o_fract32_ahbl_reg_n_85),
        .I5(p_1_in3_in[20]),
        .O(fract48__0_carry__4_i_8_n_0));
  CARRY4 fract48__0_carry__5
       (.CI(fract48__0_carry__4_n_0),
        .CO({fract48__0_carry__5_n_0,fract48__0_carry__5_n_1,fract48__0_carry__5_n_2,fract48__0_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({fract48__0_carry__5_i_1_n_0,fract48__0_carry__5_i_2_n_0,fract48__0_carry__5_i_3_n_0,fract48__0_carry__5_i_4_n_0}),
        .O(s1t_fract35[7:4]),
        .S({fract48__0_carry__5_i_5_n_0,fract48__0_carry__5_i_6_n_0,fract48__0_carry__5_i_7_n_0,fract48__0_carry__5_i_8_n_0}));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__5_i_1
       (.I0(p_1_in3_in[26]),
        .I1(s0o_fract32_ahbl_reg_n_79),
        .I2(s0o_fract32_albh_reg_n_79),
        .O(fract48__0_carry__5_i_1_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__5_i_2
       (.I0(p_1_in3_in[25]),
        .I1(s0o_fract32_ahbl_reg_n_80),
        .I2(s0o_fract32_albh_reg_n_80),
        .O(fract48__0_carry__5_i_2_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__5_i_3
       (.I0(p_1_in3_in[24]),
        .I1(s0o_fract32_ahbl_reg_n_81),
        .I2(s0o_fract32_albh_reg_n_81),
        .O(fract48__0_carry__5_i_3_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__5_i_4
       (.I0(p_1_in3_in[23]),
        .I1(s0o_fract32_ahbl_reg_n_82),
        .I2(s0o_fract32_albh_reg_n_82),
        .O(fract48__0_carry__5_i_4_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__5_i_5
       (.I0(s0o_fract32_albh_reg_n_79),
        .I1(s0o_fract32_ahbl_reg_n_79),
        .I2(p_1_in3_in[26]),
        .I3(s0o_fract32_albh_reg_n_78),
        .I4(s0o_fract32_ahbl_reg_n_78),
        .I5(p_1_in3_in[27]),
        .O(fract48__0_carry__5_i_5_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__5_i_6
       (.I0(s0o_fract32_albh_reg_n_80),
        .I1(s0o_fract32_ahbl_reg_n_80),
        .I2(p_1_in3_in[25]),
        .I3(s0o_fract32_albh_reg_n_79),
        .I4(s0o_fract32_ahbl_reg_n_79),
        .I5(p_1_in3_in[26]),
        .O(fract48__0_carry__5_i_6_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__5_i_7
       (.I0(s0o_fract32_albh_reg_n_81),
        .I1(s0o_fract32_ahbl_reg_n_81),
        .I2(p_1_in3_in[24]),
        .I3(s0o_fract32_albh_reg_n_80),
        .I4(s0o_fract32_ahbl_reg_n_80),
        .I5(p_1_in3_in[25]),
        .O(fract48__0_carry__5_i_7_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__5_i_8
       (.I0(s0o_fract32_albh_reg_n_82),
        .I1(s0o_fract32_ahbl_reg_n_82),
        .I2(p_1_in3_in[23]),
        .I3(s0o_fract32_albh_reg_n_81),
        .I4(s0o_fract32_ahbl_reg_n_81),
        .I5(p_1_in3_in[24]),
        .O(fract48__0_carry__5_i_8_n_0));
  CARRY4 fract48__0_carry__6
       (.CI(fract48__0_carry__5_n_0),
        .CO({fract48__0_carry__6_n_0,fract48__0_carry__6_n_1,fract48__0_carry__6_n_2,fract48__0_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({fract48__0_carry__6_i_1_n_0,fract48__0_carry__6_i_2_n_0,fract48__0_carry__6_i_3_n_0,fract48__0_carry__6_i_4_n_0}),
        .O(s1t_fract35[11:8]),
        .S({fract48__0_carry__6_i_5_n_0,fract48__0_carry__6_i_6_n_0,fract48__0_carry__6_i_7_n_0,fract48__0_carry__6_i_8_n_0}));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__6_i_1
       (.I0(p_1_in3_in[30]),
        .I1(s0o_fract32_ahbl_reg_n_75),
        .I2(s0o_fract32_albh_reg_n_75),
        .O(fract48__0_carry__6_i_1_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__6_i_2
       (.I0(p_1_in3_in[29]),
        .I1(s0o_fract32_ahbl_reg_n_76),
        .I2(s0o_fract32_albh_reg_n_76),
        .O(fract48__0_carry__6_i_2_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__6_i_3
       (.I0(p_1_in3_in[28]),
        .I1(s0o_fract32_ahbl_reg_n_77),
        .I2(s0o_fract32_albh_reg_n_77),
        .O(fract48__0_carry__6_i_3_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry__6_i_4
       (.I0(p_1_in3_in[27]),
        .I1(s0o_fract32_ahbl_reg_n_78),
        .I2(s0o_fract32_albh_reg_n_78),
        .O(fract48__0_carry__6_i_4_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__6_i_5
       (.I0(s0o_fract32_albh_reg_n_75),
        .I1(s0o_fract32_ahbl_reg_n_75),
        .I2(p_1_in3_in[30]),
        .I3(s0o_fract32_albh_reg_n_74),
        .I4(s0o_fract32_ahbl_reg_n_74),
        .I5(p_1_in3_in[31]),
        .O(fract48__0_carry__6_i_5_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__6_i_6
       (.I0(s0o_fract32_albh_reg_n_76),
        .I1(s0o_fract32_ahbl_reg_n_76),
        .I2(p_1_in3_in[29]),
        .I3(s0o_fract32_albh_reg_n_75),
        .I4(s0o_fract32_ahbl_reg_n_75),
        .I5(p_1_in3_in[30]),
        .O(fract48__0_carry__6_i_6_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__6_i_7
       (.I0(s0o_fract32_albh_reg_n_77),
        .I1(s0o_fract32_ahbl_reg_n_77),
        .I2(p_1_in3_in[28]),
        .I3(s0o_fract32_albh_reg_n_76),
        .I4(s0o_fract32_ahbl_reg_n_76),
        .I5(p_1_in3_in[29]),
        .O(fract48__0_carry__6_i_7_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry__6_i_8
       (.I0(s0o_fract32_albh_reg_n_78),
        .I1(s0o_fract32_ahbl_reg_n_78),
        .I2(p_1_in3_in[27]),
        .I3(s0o_fract32_albh_reg_n_77),
        .I4(s0o_fract32_ahbl_reg_n_77),
        .I5(p_1_in3_in[28]),
        .O(fract48__0_carry__6_i_8_n_0));
  CARRY4 fract48__0_carry__7
       (.CI(fract48__0_carry__6_n_0),
        .CO({fract48__0_carry__7_n_0,fract48__0_carry__7_n_1,fract48__0_carry__7_n_2,fract48__0_carry__7_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,p_1_in3_in[32]}),
        .O(s1t_fract35[15:12]),
        .S({p_1_in3_in[35:33],fract48__0_carry__7_i_1_n_0}));
  LUT4 #(
    .INIT(16'h17E8)) 
    fract48__0_carry__7_i_1
       (.I0(s0o_fract32_albh_reg_n_74),
        .I1(s0o_fract32_ahbl_reg_n_74),
        .I2(p_1_in3_in[31]),
        .I3(p_1_in3_in[32]),
        .O(fract48__0_carry__7_i_1_n_0));
  CARRY4 fract48__0_carry__8
       (.CI(fract48__0_carry__7_n_0),
        .CO({fract48__0_carry__8_n_0,fract48__0_carry__8_n_1,fract48__0_carry__8_n_2,fract48__0_carry__8_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(s1t_fract35[19:16]),
        .S(p_1_in3_in[39:36]));
  CARRY4 fract48__0_carry__9
       (.CI(fract48__0_carry__8_n_0),
        .CO({fract48__0_carry__9_n_0,fract48__0_carry__9_n_1,fract48__0_carry__9_n_2,fract48__0_carry__9_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(s1t_fract35[23:20]),
        .S(p_1_in3_in[43:40]));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry_i_1
       (.I0(p_0_in2_in[2]),
        .I1(s0o_fract32_ahbl_reg_n_103),
        .I2(s0o_fract32_albh_reg_n_103),
        .O(fract48__0_carry_i_1_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry_i_2
       (.I0(p_0_in2_in[1]),
        .I1(s0o_fract32_ahbl_reg_n_104),
        .I2(s0o_fract32_albh_reg_n_104),
        .O(fract48__0_carry_i_2_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    fract48__0_carry_i_3
       (.I0(s0o_fract32_ahbl_reg_n_105),
        .I1(s0o_fract32_albh_reg_n_105),
        .I2(p_0_in2_in[0]),
        .O(fract48__0_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry_i_4
       (.I0(s0o_fract32_albh_reg_n_103),
        .I1(s0o_fract32_ahbl_reg_n_103),
        .I2(p_0_in2_in[2]),
        .I3(s0o_fract32_albh_reg_n_102),
        .I4(s0o_fract32_ahbl_reg_n_102),
        .I5(p_0_in2_in[3]),
        .O(fract48__0_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry_i_5
       (.I0(s0o_fract32_albh_reg_n_104),
        .I1(s0o_fract32_ahbl_reg_n_104),
        .I2(p_0_in2_in[1]),
        .I3(s0o_fract32_albh_reg_n_103),
        .I4(s0o_fract32_ahbl_reg_n_103),
        .I5(p_0_in2_in[2]),
        .O(fract48__0_carry_i_5_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    fract48__0_carry_i_6
       (.I0(p_0_in2_in[0]),
        .I1(s0o_fract32_albh_reg_n_105),
        .I2(s0o_fract32_ahbl_reg_n_105),
        .I3(s0o_fract32_albh_reg_n_104),
        .I4(s0o_fract32_ahbl_reg_n_104),
        .I5(p_0_in2_in[1]),
        .O(fract48__0_carry_i_6_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    fract48__0_carry_i_7
       (.I0(p_0_in2_in[0]),
        .I1(s0o_fract32_ahbl_reg_n_105),
        .I2(s0o_fract32_albh_reg_n_105),
        .O(fract48__0_carry_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'h4DB2B24D)) 
    \s0o_exp10sh0[3]_i_10 
       (.I0(s0t_nlzb[2]),
        .I1(exp10b_i_IBUF[2]),
        .I2(s0t_nlza[2]),
        .I3(exp10a_i_IBUF[3]),
        .I4(\s0o_exp10sh0[7]_i_15_n_0 ),
        .O(\s0o_exp10sh0[3]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \s0o_exp10sh0[3]_i_11 
       (.I0(s0t_nlzb[2]),
        .I1(s0t_nlza[2]),
        .I2(exp10b_i_IBUF[2]),
        .O(\s0o_exp10sh0[3]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \s0o_exp10sh0[3]_i_12 
       (.I0(exp10a_i_IBUF[0]),
        .I1(s0t_nlzb[0]),
        .O(\s0o_exp10sh0[3]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \s0o_exp10sh0[3]_i_2 
       (.I0(\s0o_exp10sh0[7]_i_13_n_0 ),
        .I1(exp10b_i_IBUF[3]),
        .I2(s0t_nlza[3]),
        .I3(s0t_nlzb[3]),
        .I4(exp10a_i_IBUF[3]),
        .I5(\s0o_exp10sh0[7]_i_12_n_0 ),
        .O(\s0o_exp10sh0[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hD22D2DD22DD2D22D)) 
    \s0o_exp10sh0[3]_i_3 
       (.I0(s0t_nlza[1]),
        .I1(exp10b_i_IBUF[1]),
        .I2(exp10a_i_IBUF[2]),
        .I3(s0t_nlzb[2]),
        .I4(s0t_nlza[2]),
        .I5(exp10b_i_IBUF[2]),
        .O(\s0o_exp10sh0[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h9669966969969669)) 
    \s0o_exp10sh0[3]_i_4 
       (.I0(s0t_nlza[1]),
        .I1(exp10b_i_IBUF[1]),
        .I2(exp10a_i_IBUF[1]),
        .I3(s0t_nlzb[1]),
        .I4(exp10a_i_IBUF[0]),
        .I5(s0t_nlzb[0]),
        .O(\s0o_exp10sh0[3]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \s0o_exp10sh0[3]_i_5 
       (.I0(s0t_nlza[0]),
        .I1(exp10b_i_IBUF[0]),
        .O(\s0o_exp10sh0[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h9999969996996666)) 
    \s0o_exp10sh0[3]_i_6 
       (.I0(\s0o_exp10sh0[3]_i_10_n_0 ),
        .I1(\s0o_exp10sh0[7]_i_13_n_0 ),
        .I2(exp10b_i_IBUF[1]),
        .I3(s0t_nlza[1]),
        .I4(\s0o_exp10sh0[3]_i_11_n_0 ),
        .I5(exp10a_i_IBUF[2]),
        .O(\s0o_exp10sh0[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h65A65965596565A6)) 
    \s0o_exp10sh0[3]_i_7 
       (.I0(\s0o_exp10sh0[3]_i_3_n_0 ),
        .I1(exp10a_i_IBUF[1]),
        .I2(s0t_nlzb[1]),
        .I3(\s0o_exp10sh0[3]_i_12_n_0 ),
        .I4(s0t_nlza[1]),
        .I5(exp10b_i_IBUF[1]),
        .O(\s0o_exp10sh0[3]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h59)) 
    \s0o_exp10sh0[3]_i_8 
       (.I0(\s0o_exp10sh0[3]_i_4_n_0 ),
        .I1(s0t_nlza[0]),
        .I2(exp10b_i_IBUF[0]),
        .O(\s0o_exp10sh0[3]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h9669)) 
    \s0o_exp10sh0[3]_i_9 
       (.I0(s0t_nlza[0]),
        .I1(exp10b_i_IBUF[0]),
        .I2(s0t_nlzb[0]),
        .I3(exp10a_i_IBUF[0]),
        .O(\s0o_exp10sh0[3]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'h8E88EE8E)) 
    \s0o_exp10sh0[7]_i_10 
       (.I0(exp10a_i_IBUF[4]),
        .I1(\s0o_exp10sh0[7]_i_16_n_0 ),
        .I2(s0t_nlzb[3]),
        .I3(exp10b_i_IBUF[3]),
        .I4(s0t_nlza[3]),
        .O(\s0o_exp10sh0[7]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'h4DB2B24D)) 
    \s0o_exp10sh0[7]_i_11 
       (.I0(s0t_nlzb[3]),
        .I1(exp10b_i_IBUF[3]),
        .I2(s0t_nlza[3]),
        .I3(exp10a_i_IBUF[4]),
        .I4(\s0o_exp10sh0[7]_i_16_n_0 ),
        .O(\s0o_exp10sh0[7]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h4D)) 
    \s0o_exp10sh0[7]_i_12 
       (.I0(s0t_nlza[2]),
        .I1(exp10b_i_IBUF[2]),
        .I2(s0t_nlzb[2]),
        .O(\s0o_exp10sh0[7]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000600000)) 
    \s0o_exp10sh0[7]_i_13 
       (.I0(exp10b_i_IBUF[1]),
        .I1(s0t_nlza[1]),
        .I2(exp10a_i_IBUF[0]),
        .I3(s0t_nlzb[0]),
        .I4(exp10a_i_IBUF[1]),
        .I5(s0t_nlzb[1]),
        .O(\s0o_exp10sh0[7]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'h4D)) 
    \s0o_exp10sh0[7]_i_14 
       (.I0(s0t_nlza[4]),
        .I1(exp10b_i_IBUF[4]),
        .I2(s0t_nlzb[4]),
        .O(\s0o_exp10sh0[7]_i_14_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \s0o_exp10sh0[7]_i_15 
       (.I0(s0t_nlzb[3]),
        .I1(s0t_nlza[3]),
        .I2(exp10b_i_IBUF[3]),
        .O(\s0o_exp10sh0[7]_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \s0o_exp10sh0[7]_i_16 
       (.I0(s0t_nlzb[4]),
        .I1(s0t_nlza[4]),
        .I2(exp10b_i_IBUF[4]),
        .O(\s0o_exp10sh0[7]_i_16_n_0 ));
  LUT4 #(
    .INIT(16'h8008)) 
    \s0o_exp10sh0[7]_i_2 
       (.I0(exp10a_i_IBUF[5]),
        .I1(exp10b_i_IBUF[5]),
        .I2(exp10b_i_IBUF[6]),
        .I3(exp10a_i_IBUF[6]),
        .O(\s0o_exp10sh0[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6F66FF6F06006606)) 
    \s0o_exp10sh0[7]_i_3 
       (.I0(exp10b_i_IBUF[5]),
        .I1(exp10a_i_IBUF[5]),
        .I2(s0t_nlzb[4]),
        .I3(exp10b_i_IBUF[4]),
        .I4(s0t_nlza[4]),
        .I5(\s0o_exp10sh0[7]_i_10_n_0 ),
        .O(\s0o_exp10sh0[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hA88A8AA880080880)) 
    \s0o_exp10sh0[7]_i_4 
       (.I0(\s0o_exp10sh0[7]_i_11_n_0 ),
        .I1(\s0o_exp10sh0[7]_i_12_n_0 ),
        .I2(s0t_nlzb[3]),
        .I3(s0t_nlza[3]),
        .I4(exp10b_i_IBUF[3]),
        .I5(exp10a_i_IBUF[3]),
        .O(\s0o_exp10sh0[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h9669699600000000)) 
    \s0o_exp10sh0[7]_i_5 
       (.I0(exp10b_i_IBUF[3]),
        .I1(s0t_nlza[3]),
        .I2(s0t_nlzb[3]),
        .I3(exp10a_i_IBUF[3]),
        .I4(\s0o_exp10sh0[7]_i_12_n_0 ),
        .I5(\s0o_exp10sh0[7]_i_13_n_0 ),
        .O(\s0o_exp10sh0[7]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h69696996)) 
    \s0o_exp10sh0[7]_i_6 
       (.I0(\s0o_exp10sh0[7]_i_2_n_0 ),
        .I1(exp10a_i_IBUF[7]),
        .I2(exp10b_i_IBUF[7]),
        .I3(exp10a_i_IBUF[6]),
        .I4(exp10b_i_IBUF[6]),
        .O(\s0o_exp10sh0[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h81177EE87EE88117)) 
    \s0o_exp10sh0[7]_i_7 
       (.I0(\s0o_exp10sh0[7]_i_10_n_0 ),
        .I1(\s0o_exp10sh0[7]_i_14_n_0 ),
        .I2(exp10b_i_IBUF[5]),
        .I3(exp10a_i_IBUF[5]),
        .I4(exp10a_i_IBUF[6]),
        .I5(exp10b_i_IBUF[6]),
        .O(\s0o_exp10sh0[7]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h96696996)) 
    \s0o_exp10sh0[7]_i_8 
       (.I0(\s0o_exp10sh0[7]_i_4_n_0 ),
        .I1(\s0o_exp10sh0[7]_i_14_n_0 ),
        .I2(exp10b_i_IBUF[5]),
        .I3(exp10a_i_IBUF[5]),
        .I4(\s0o_exp10sh0[7]_i_10_n_0 ),
        .O(\s0o_exp10sh0[7]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h99969666)) 
    \s0o_exp10sh0[7]_i_9 
       (.I0(\s0o_exp10sh0[7]_i_5_n_0 ),
        .I1(\s0o_exp10sh0[7]_i_11_n_0 ),
        .I2(exp10a_i_IBUF[3]),
        .I3(\s0o_exp10sh0[7]_i_15_n_0 ),
        .I4(\s0o_exp10sh0[7]_i_12_n_0 ),
        .O(\s0o_exp10sh0[7]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \s0o_exp10sh0[9]_i_1 
       (.I0(zerob_i_IBUF),
        .I1(zeroa_i_IBUF),
        .O(\s0o_exp10sh0[9]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEEE8)) 
    \s0o_exp10sh0[9]_i_3 
       (.I0(exp10b_i_IBUF[7]),
        .I1(exp10a_i_IBUF[7]),
        .I2(exp10b_i_IBUF[6]),
        .I3(exp10a_i_IBUF[6]),
        .O(\s0o_exp10sh0[9]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h1EE1)) 
    \s0o_exp10sh0[9]_i_4 
       (.I0(exp10b_i_IBUF[8]),
        .I1(exp10a_i_IBUF[8]),
        .I2(exp10b_i_IBUF[9]),
        .I3(exp10a_i_IBUF[9]),
        .O(\s0o_exp10sh0[9]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h011FFEE0FEE0011F)) 
    \s0o_exp10sh0[9]_i_5 
       (.I0(exp10a_i_IBUF[6]),
        .I1(exp10b_i_IBUF[6]),
        .I2(exp10a_i_IBUF[7]),
        .I3(exp10b_i_IBUF[7]),
        .I4(exp10b_i_IBUF[8]),
        .I5(exp10a_i_IBUF[8]),
        .O(\s0o_exp10sh0[9]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s0o_exp10sh0_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0t_exp10mux[0]),
        .Q(s0o_exp10sh0[0]),
        .R(\s0o_exp10sh0[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s0o_exp10sh0_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0t_exp10mux[1]),
        .Q(s0o_exp10sh0[1]),
        .R(\s0o_exp10sh0[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s0o_exp10sh0_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0t_exp10mux[2]),
        .Q(s0o_exp10sh0[2]),
        .R(\s0o_exp10sh0[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s0o_exp10sh0_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0t_exp10mux[3]),
        .Q(s0o_exp10sh0[3]),
        .R(\s0o_exp10sh0[9]_i_1_n_0 ));
  CARRY4 \s0o_exp10sh0_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\s0o_exp10sh0_reg[3]_i_1_n_0 ,\s0o_exp10sh0_reg[3]_i_1_n_1 ,\s0o_exp10sh0_reg[3]_i_1_n_2 ,\s0o_exp10sh0_reg[3]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\s0o_exp10sh0[3]_i_2_n_0 ,\s0o_exp10sh0[3]_i_3_n_0 ,\s0o_exp10sh0[3]_i_4_n_0 ,\s0o_exp10sh0[3]_i_5_n_0 }),
        .O(s0t_exp10mux[3:0]),
        .S({\s0o_exp10sh0[3]_i_6_n_0 ,\s0o_exp10sh0[3]_i_7_n_0 ,\s0o_exp10sh0[3]_i_8_n_0 ,\s0o_exp10sh0[3]_i_9_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \s0o_exp10sh0_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0t_exp10mux[4]),
        .Q(s0o_exp10sh0[4]),
        .R(\s0o_exp10sh0[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s0o_exp10sh0_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0t_exp10mux[5]),
        .Q(s0o_exp10sh0[5]),
        .R(\s0o_exp10sh0[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s0o_exp10sh0_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0t_exp10mux[6]),
        .Q(s0o_exp10sh0[6]),
        .R(\s0o_exp10sh0[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s0o_exp10sh0_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0t_exp10mux[7]),
        .Q(s0o_exp10sh0[7]),
        .R(\s0o_exp10sh0[9]_i_1_n_0 ));
  CARRY4 \s0o_exp10sh0_reg[7]_i_1 
       (.CI(\s0o_exp10sh0_reg[3]_i_1_n_0 ),
        .CO({\s0o_exp10sh0_reg[7]_i_1_n_0 ,\s0o_exp10sh0_reg[7]_i_1_n_1 ,\s0o_exp10sh0_reg[7]_i_1_n_2 ,\s0o_exp10sh0_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\s0o_exp10sh0[7]_i_2_n_0 ,\s0o_exp10sh0[7]_i_3_n_0 ,\s0o_exp10sh0[7]_i_4_n_0 ,\s0o_exp10sh0[7]_i_5_n_0 }),
        .O(s0t_exp10mux[7:4]),
        .S({\s0o_exp10sh0[7]_i_6_n_0 ,\s0o_exp10sh0[7]_i_7_n_0 ,\s0o_exp10sh0[7]_i_8_n_0 ,\s0o_exp10sh0[7]_i_9_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \s0o_exp10sh0_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0t_exp10mux[8]),
        .Q(s0o_exp10sh0[8]),
        .R(\s0o_exp10sh0[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s0o_exp10sh0_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0t_exp10mux[9]),
        .Q(s0o_exp10sh0[9]),
        .R(\s0o_exp10sh0[9]_i_1_n_0 ));
  CARRY4 \s0o_exp10sh0_reg[9]_i_2 
       (.CI(\s0o_exp10sh0_reg[7]_i_1_n_0 ),
        .CO({\NLW_s0o_exp10sh0_reg[9]_i_2_CO_UNCONNECTED [3:1],\s0o_exp10sh0_reg[9]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\s0o_exp10sh0[9]_i_3_n_0 }),
        .O({\NLW_s0o_exp10sh0_reg[9]_i_2_O_UNCONNECTED [3:2],s0t_exp10mux[9:8]}),
        .S({1'b0,1'b0,\s0o_exp10sh0[9]_i_4_n_0 ,\s0o_exp10sh0[9]_i_5_n_0 }));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \s0o_exp10shr[0]_i_1 
       (.I0(s0t_exp10mux[9]),
        .I1(s0t_exp10c_00),
        .I2(s0t_exp10mux[0]),
        .O(\s0o_exp10shr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \s0o_exp10shr[1]_i_1 
       (.I0(s0t_exp10mux[1]),
        .I1(s0t_exp10mux[9]),
        .O(\s0o_exp10shr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \s0o_exp10shr[2]_i_1 
       (.I0(s0t_exp10mux[2]),
        .I1(s0t_exp10mux[9]),
        .O(\s0o_exp10shr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \s0o_exp10shr[3]_i_1 
       (.I0(s0t_exp10mux[3]),
        .I1(s0t_exp10mux[9]),
        .O(\s0o_exp10shr[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \s0o_exp10shr[4]_i_1 
       (.I0(s0t_exp10mux[4]),
        .I1(s0t_exp10mux[9]),
        .O(\s0o_exp10shr[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \s0o_exp10shr[5]_i_1 
       (.I0(s0t_exp10mux[5]),
        .I1(s0t_exp10mux[9]),
        .O(\s0o_exp10shr[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \s0o_exp10shr[6]_i_1 
       (.I0(s0t_exp10mux[6]),
        .I1(s0t_exp10mux[9]),
        .O(\s0o_exp10shr[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \s0o_exp10shr[7]_i_1 
       (.I0(s0t_exp10mux[7]),
        .I1(s0t_exp10mux[9]),
        .O(\s0o_exp10shr[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \s0o_exp10shr[8]_i_1 
       (.I0(s0t_exp10mux[8]),
        .I1(s0t_exp10mux[9]),
        .O(\s0o_exp10shr[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s0o_exp10shr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s0o_exp10shr[0]_i_1_n_0 ),
        .Q(s0o_exp10shr[0]),
        .R(\s0o_exp10sh0[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s0o_exp10shr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s0o_exp10shr[1]_i_1_n_0 ),
        .Q(s0o_exp10shr[1]),
        .R(\s0o_exp10sh0[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s0o_exp10shr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s0o_exp10shr[2]_i_1_n_0 ),
        .Q(s0o_exp10shr[2]),
        .R(\s0o_exp10sh0[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s0o_exp10shr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s0o_exp10shr[3]_i_1_n_0 ),
        .Q(s0o_exp10shr[3]),
        .R(\s0o_exp10sh0[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s0o_exp10shr_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s0o_exp10shr[4]_i_1_n_0 ),
        .Q(s0o_exp10shr[4]),
        .R(\s0o_exp10sh0[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s0o_exp10shr_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s0o_exp10shr[5]_i_1_n_0 ),
        .Q(s0o_exp10shr[5]),
        .R(\s0o_exp10sh0[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s0o_exp10shr_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s0o_exp10shr[6]_i_1_n_0 ),
        .Q(s0o_exp10shr[6]),
        .R(\s0o_exp10sh0[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s0o_exp10shr_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s0o_exp10shr[7]_i_1_n_0 ),
        .Q(s0o_exp10shr[7]),
        .R(\s0o_exp10sh0[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s0o_exp10shr_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s0o_exp10shr[8]_i_1_n_0 ),
        .Q(s0o_exp10shr[8]),
        .R(\s0o_exp10sh0[9]_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-12 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(0),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    s0o_fract32_ahbh_reg
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s0t_mul16_ah}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_s0o_fract32_ahbh_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,s0t_mul16_bh}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_s0o_fract32_ahbh_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_s0o_fract32_ahbh_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_s0o_fract32_ahbh_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_s0o_fract32_ahbh_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_s0o_fract32_ahbh_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_s0o_fract32_ahbh_reg_P_UNCONNECTED[47:32],p_1_in3_in}),
        .PATTERNBDETECT(NLW_s0o_fract32_ahbh_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_s0o_fract32_ahbh_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_s0o_fract32_ahbh_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_s0o_fract32_ahbh_reg_UNDERFLOW_UNCONNECTED));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-12 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(0),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    s0o_fract32_ahbl_reg
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s0t_mul16_ah}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_s0o_fract32_ahbl_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,s0o_fract32_ahbl_reg_i_1_n_0,s0o_fract32_ahbl_reg_i_2_n_0,s0o_fract32_ahbl_reg_i_3_n_0,s0o_fract32_ahbl_reg_i_4_n_0,s0o_fract32_ahbl_reg_i_5_n_0,s0o_fract32_ahbl_reg_i_6_n_0,s0o_fract32_ahbl_reg_i_7_n_0,s0o_fract32_ahbl_reg_i_8_n_0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_s0o_fract32_ahbl_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_s0o_fract32_ahbl_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_s0o_fract32_ahbl_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_s0o_fract32_ahbl_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_s0o_fract32_ahbl_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_s0o_fract32_ahbl_reg_P_UNCONNECTED[47:32],s0o_fract32_ahbl_reg_n_74,s0o_fract32_ahbl_reg_n_75,s0o_fract32_ahbl_reg_n_76,s0o_fract32_ahbl_reg_n_77,s0o_fract32_ahbl_reg_n_78,s0o_fract32_ahbl_reg_n_79,s0o_fract32_ahbl_reg_n_80,s0o_fract32_ahbl_reg_n_81,s0o_fract32_ahbl_reg_n_82,s0o_fract32_ahbl_reg_n_83,s0o_fract32_ahbl_reg_n_84,s0o_fract32_ahbl_reg_n_85,s0o_fract32_ahbl_reg_n_86,s0o_fract32_ahbl_reg_n_87,s0o_fract32_ahbl_reg_n_88,s0o_fract32_ahbl_reg_n_89,s0o_fract32_ahbl_reg_n_90,s0o_fract32_ahbl_reg_n_91,s0o_fract32_ahbl_reg_n_92,s0o_fract32_ahbl_reg_n_93,s0o_fract32_ahbl_reg_n_94,s0o_fract32_ahbl_reg_n_95,s0o_fract32_ahbl_reg_n_96,s0o_fract32_ahbl_reg_n_97,s0o_fract32_ahbl_reg_n_98,s0o_fract32_ahbl_reg_n_99,s0o_fract32_ahbl_reg_n_100,s0o_fract32_ahbl_reg_n_101,s0o_fract32_ahbl_reg_n_102,s0o_fract32_ahbl_reg_n_103,s0o_fract32_ahbl_reg_n_104,s0o_fract32_ahbl_reg_n_105}),
        .PATTERNBDETECT(NLW_s0o_fract32_ahbl_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_s0o_fract32_ahbl_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_s0o_fract32_ahbl_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_s0o_fract32_ahbl_reg_UNDERFLOW_UNCONNECTED));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_ahbl_reg_i_1
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_25_n_0),
        .I4(s0t_nlzb[0]),
        .I5(s0o_fract32_ahbl_reg_i_27_n_0),
        .O(s0o_fract32_ahbl_reg_i_1_n_0));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_ahbl_reg_i_10
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_37_n_0),
        .I4(s0t_nlza[0]),
        .I5(s0o_fract32_ahbl_reg_i_34_n_0),
        .O(s0t_mul16_ah[14]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'h04)) 
    s0o_fract32_ahbl_reg_i_100
       (.I0(s0t_nlza[4]),
        .I1(fract24a_i_IBUF[3]),
        .I2(s0t_nlza[3]),
        .O(s0o_fract32_ahbl_reg_i_100_n_0));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'h04)) 
    s0o_fract32_ahbl_reg_i_101
       (.I0(s0t_nlza[4]),
        .I1(fract24a_i_IBUF[2]),
        .I2(s0t_nlza[3]),
        .O(s0o_fract32_ahbl_reg_i_101_n_0));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'h04)) 
    s0o_fract32_ahbl_reg_i_102
       (.I0(s0t_nlza[4]),
        .I1(fract24a_i_IBUF[1]),
        .I2(s0t_nlza[3]),
        .O(s0o_fract32_ahbl_reg_i_102_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    s0o_fract32_ahbl_reg_i_103
       (.I0(fract24b_i_IBUF[20]),
        .I1(fract24b_i_IBUF[21]),
        .O(s0o_fract32_ahbl_reg_i_103_n_0));
  LUT6 #(
    .INIT(64'hFFFFFEFEFFFFFE00)) 
    s0o_fract32_ahbl_reg_i_104
       (.I0(s0o_fract32_ahbl_reg_i_122_n_0),
        .I1(fract24b_i_IBUF[0]),
        .I2(fract24b_i_IBUF[17]),
        .I3(s0o_fract32_ahbl_reg_i_123_n_0),
        .I4(fract24b_i_IBUF[16]),
        .I5(s0o_fract32_ahbl_reg_i_124_n_0),
        .O(s0o_fract32_ahbl_reg_i_104_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFB0000)) 
    s0o_fract32_ahbl_reg_i_105
       (.I0(s0o_fract32_ahbl_reg_i_110_n_0),
        .I1(s0o_fract32_ahbl_reg_i_113_n_0),
        .I2(fract24b_i_IBUF[1]),
        .I3(fract24b_i_IBUF[0]),
        .I4(s0o_fract32_ahbl_reg_i_125_n_0),
        .I5(s0o_fract32_ahbl_reg_i_126_n_0),
        .O(s0o_fract32_ahbl_reg_i_105_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'hE)) 
    s0o_fract32_ahbl_reg_i_106
       (.I0(fract24b_i_IBUF[19]),
        .I1(fract24b_i_IBUF[21]),
        .O(s0o_fract32_ahbl_reg_i_106_n_0));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h1)) 
    s0o_fract32_ahbl_reg_i_107
       (.I0(fract24b_i_IBUF[9]),
        .I1(fract24b_i_IBUF[11]),
        .O(s0o_fract32_ahbl_reg_i_107_n_0));
  LUT6 #(
    .INIT(64'hEEFEEEFEFFFFEEFE)) 
    s0o_fract32_ahbl_reg_i_108
       (.I0(fract24b_i_IBUF[6]),
        .I1(fract24b_i_IBUF[2]),
        .I2(fract24b_i_IBUF[4]),
        .I3(fract24b_i_IBUF[5]),
        .I4(fract24b_i_IBUF[0]),
        .I5(fract24b_i_IBUF[1]),
        .O(s0o_fract32_ahbl_reg_i_108_n_0));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h45)) 
    s0o_fract32_ahbl_reg_i_109
       (.I0(fract24b_i_IBUF[6]),
        .I1(fract24b_i_IBUF[5]),
        .I2(fract24b_i_IBUF[4]),
        .O(s0o_fract32_ahbl_reg_i_109_n_0));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_ahbl_reg_i_11
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_38_n_0),
        .I4(s0t_nlza[0]),
        .I5(s0o_fract32_ahbl_reg_i_37_n_0),
        .O(s0t_mul16_ah[13]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    s0o_fract32_ahbl_reg_i_110
       (.I0(fract24b_i_IBUF[10]),
        .I1(fract24b_i_IBUF[11]),
        .I2(fract24b_i_IBUF[9]),
        .I3(fract24b_i_IBUF[8]),
        .O(s0o_fract32_ahbl_reg_i_110_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00000002)) 
    s0o_fract32_ahbl_reg_i_111
       (.I0(s0o_fract32_ahbl_reg_i_127_n_0),
        .I1(fract24b_i_IBUF[17]),
        .I2(fract24b_i_IBUF[16]),
        .I3(fract24b_i_IBUF[19]),
        .I4(fract24b_i_IBUF[18]),
        .O(s0o_fract32_ahbl_reg_i_111_n_0));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    s0o_fract32_ahbl_reg_i_112
       (.I0(fract24b_i_IBUF[7]),
        .I1(fract24b_i_IBUF[6]),
        .I2(fract24b_i_IBUF[4]),
        .I3(fract24b_i_IBUF[5]),
        .O(s0o_fract32_ahbl_reg_i_112_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    s0o_fract32_ahbl_reg_i_113
       (.I0(fract24b_i_IBUF[2]),
        .I1(fract24b_i_IBUF[3]),
        .O(s0o_fract32_ahbl_reg_i_113_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    s0o_fract32_ahbl_reg_i_114
       (.I0(fract24b_i_IBUF[13]),
        .I1(fract24b_i_IBUF[12]),
        .I2(fract24b_i_IBUF[15]),
        .I3(fract24b_i_IBUF[14]),
        .I4(s0o_fract32_ahbl_reg_i_110_n_0),
        .O(s0o_fract32_ahbl_reg_i_114_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    s0o_fract32_ahbl_reg_i_115
       (.I0(fract24a_i_IBUF[20]),
        .I1(fract24a_i_IBUF[21]),
        .O(s0o_fract32_ahbl_reg_i_115_n_0));
  LUT6 #(
    .INIT(64'hFFFFFEFEFFFFFE00)) 
    s0o_fract32_ahbl_reg_i_116
       (.I0(s0o_fract32_ahbl_reg_i_128_n_0),
        .I1(fract24a_i_IBUF[0]),
        .I2(fract24a_i_IBUF[17]),
        .I3(s0o_fract32_ahbl_reg_i_129_n_0),
        .I4(fract24a_i_IBUF[16]),
        .I5(s0o_fract32_ahbl_reg_i_130_n_0),
        .O(s0o_fract32_ahbl_reg_i_116_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFB0000)) 
    s0o_fract32_ahbl_reg_i_117
       (.I0(s0o_fract32_albh_reg_i_73_n_0),
        .I1(s0o_fract32_albh_reg_i_76_n_0),
        .I2(fract24a_i_IBUF[1]),
        .I3(fract24a_i_IBUF[0]),
        .I4(s0o_fract32_ahbl_reg_i_131_n_0),
        .I5(s0o_fract32_ahbl_reg_i_132_n_0),
        .O(s0o_fract32_ahbl_reg_i_117_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'hE)) 
    s0o_fract32_ahbl_reg_i_118
       (.I0(fract24a_i_IBUF[19]),
        .I1(fract24a_i_IBUF[21]),
        .O(s0o_fract32_ahbl_reg_i_118_n_0));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h1)) 
    s0o_fract32_ahbl_reg_i_119
       (.I0(fract24a_i_IBUF[9]),
        .I1(fract24a_i_IBUF[11]),
        .O(s0o_fract32_ahbl_reg_i_119_n_0));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_ahbl_reg_i_12
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_39_n_0),
        .I4(s0t_nlza[0]),
        .I5(s0o_fract32_ahbl_reg_i_38_n_0),
        .O(s0t_mul16_ah[12]));
  LUT6 #(
    .INIT(64'hEEFEEEFEFFFFEEFE)) 
    s0o_fract32_ahbl_reg_i_120
       (.I0(fract24a_i_IBUF[6]),
        .I1(fract24a_i_IBUF[2]),
        .I2(fract24a_i_IBUF[4]),
        .I3(fract24a_i_IBUF[5]),
        .I4(fract24a_i_IBUF[0]),
        .I5(fract24a_i_IBUF[1]),
        .O(s0o_fract32_ahbl_reg_i_120_n_0));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'h45)) 
    s0o_fract32_ahbl_reg_i_121
       (.I0(fract24a_i_IBUF[6]),
        .I1(fract24a_i_IBUF[5]),
        .I2(fract24a_i_IBUF[4]),
        .O(s0o_fract32_ahbl_reg_i_121_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFD)) 
    s0o_fract32_ahbl_reg_i_122
       (.I0(s0o_fract32_ahbl_reg_i_133_n_0),
        .I1(s0o_fract32_ahbl_reg_i_134_n_0),
        .I2(fract24b_i_IBUF[1]),
        .I3(s0o_fract32_ahbl_reg_i_103_n_0),
        .I4(fract24b_i_IBUF[5]),
        .I5(fract24b_i_IBUF[4]),
        .O(s0o_fract32_ahbl_reg_i_122_n_0));
  LUT6 #(
    .INIT(64'hFCFD000000000000)) 
    s0o_fract32_ahbl_reg_i_123
       (.I0(fract24b_i_IBUF[7]),
        .I1(fract24b_i_IBUF[9]),
        .I2(fract24b_i_IBUF[8]),
        .I3(fract24b_i_IBUF[6]),
        .I4(s0o_fract32_ahbl_reg_i_135_n_0),
        .I5(s0o_fract32_ahbl_reg_i_136_n_0),
        .O(s0o_fract32_ahbl_reg_i_123_n_0));
  LUT6 #(
    .INIT(64'hFEFEFFFFFEFEFFFE)) 
    s0o_fract32_ahbl_reg_i_124
       (.I0(fract24b_i_IBUF[20]),
        .I1(fract24b_i_IBUF[21]),
        .I2(fract24b_i_IBUF[17]),
        .I3(fract24b_i_IBUF[13]),
        .I4(s0o_fract32_ahbl_reg_i_137_n_0),
        .I5(fract24b_i_IBUF[12]),
        .O(s0o_fract32_ahbl_reg_i_124_n_0));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    s0o_fract32_ahbl_reg_i_125
       (.I0(s0o_fract32_ahbl_reg_i_138_n_0),
        .I1(fract24b_i_IBUF[9]),
        .I2(fract24b_i_IBUF[10]),
        .I3(s0o_fract32_ahbl_reg_i_112_n_0),
        .I4(fract24b_i_IBUF[8]),
        .I5(fract24b_i_IBUF[11]),
        .O(s0o_fract32_ahbl_reg_i_125_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    s0o_fract32_ahbl_reg_i_126
       (.I0(fract24b_i_IBUF[19]),
        .I1(fract24b_i_IBUF[18]),
        .I2(fract24b_i_IBUF[16]),
        .I3(fract24b_i_IBUF[17]),
        .O(s0o_fract32_ahbl_reg_i_126_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    s0o_fract32_ahbl_reg_i_127
       (.I0(fract24b_i_IBUF[23]),
        .I1(fract24b_i_IBUF[22]),
        .I2(fract24b_i_IBUF[20]),
        .I3(fract24b_i_IBUF[21]),
        .O(s0o_fract32_ahbl_reg_i_127_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFD)) 
    s0o_fract32_ahbl_reg_i_128
       (.I0(s0o_fract32_ahbl_reg_i_139_n_0),
        .I1(s0o_fract32_ahbl_reg_i_140_n_0),
        .I2(fract24a_i_IBUF[1]),
        .I3(s0o_fract32_ahbl_reg_i_115_n_0),
        .I4(fract24a_i_IBUF[5]),
        .I5(fract24a_i_IBUF[4]),
        .O(s0o_fract32_ahbl_reg_i_128_n_0));
  LUT6 #(
    .INIT(64'hFCFD000000000000)) 
    s0o_fract32_ahbl_reg_i_129
       (.I0(fract24a_i_IBUF[7]),
        .I1(fract24a_i_IBUF[9]),
        .I2(fract24a_i_IBUF[8]),
        .I3(fract24a_i_IBUF[6]),
        .I4(s0o_fract32_ahbl_reg_i_141_n_0),
        .I5(s0o_fract32_ahbl_reg_i_142_n_0),
        .O(s0o_fract32_ahbl_reg_i_129_n_0));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_ahbl_reg_i_13
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_40_n_0),
        .I4(s0t_nlza[0]),
        .I5(s0o_fract32_ahbl_reg_i_39_n_0),
        .O(s0t_mul16_ah[11]));
  LUT6 #(
    .INIT(64'hFEFEFFFFFEFEFFFE)) 
    s0o_fract32_ahbl_reg_i_130
       (.I0(fract24a_i_IBUF[20]),
        .I1(fract24a_i_IBUF[21]),
        .I2(fract24a_i_IBUF[17]),
        .I3(fract24a_i_IBUF[13]),
        .I4(s0o_fract32_ahbl_reg_i_143_n_0),
        .I5(fract24a_i_IBUF[12]),
        .O(s0o_fract32_ahbl_reg_i_130_n_0));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    s0o_fract32_ahbl_reg_i_131
       (.I0(s0o_fract32_ahbl_reg_i_144_n_0),
        .I1(fract24a_i_IBUF[9]),
        .I2(fract24a_i_IBUF[10]),
        .I3(s0o_fract32_albh_reg_i_75_n_0),
        .I4(fract24a_i_IBUF[8]),
        .I5(fract24a_i_IBUF[11]),
        .O(s0o_fract32_ahbl_reg_i_131_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    s0o_fract32_ahbl_reg_i_132
       (.I0(fract24a_i_IBUF[19]),
        .I1(fract24a_i_IBUF[18]),
        .I2(fract24a_i_IBUF[16]),
        .I3(fract24a_i_IBUF[17]),
        .O(s0o_fract32_ahbl_reg_i_132_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    s0o_fract32_ahbl_reg_i_133
       (.I0(fract24b_i_IBUF[8]),
        .I1(fract24b_i_IBUF[9]),
        .O(s0o_fract32_ahbl_reg_i_133_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    s0o_fract32_ahbl_reg_i_134
       (.I0(fract24b_i_IBUF[13]),
        .I1(fract24b_i_IBUF[12]),
        .O(s0o_fract32_ahbl_reg_i_134_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEEEF)) 
    s0o_fract32_ahbl_reg_i_135
       (.I0(fract24b_i_IBUF[9]),
        .I1(fract24b_i_IBUF[8]),
        .I2(fract24b_i_IBUF[3]),
        .I3(fract24b_i_IBUF[2]),
        .I4(fract24b_i_IBUF[4]),
        .I5(fract24b_i_IBUF[5]),
        .O(s0o_fract32_ahbl_reg_i_135_n_0));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    s0o_fract32_ahbl_reg_i_136
       (.I0(fract24b_i_IBUF[11]),
        .I1(fract24b_i_IBUF[10]),
        .I2(fract24b_i_IBUF[15]),
        .I3(fract24b_i_IBUF[14]),
        .O(s0o_fract32_ahbl_reg_i_136_n_0));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'hE)) 
    s0o_fract32_ahbl_reg_i_137
       (.I0(fract24b_i_IBUF[14]),
        .I1(fract24b_i_IBUF[15]),
        .O(s0o_fract32_ahbl_reg_i_137_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    s0o_fract32_ahbl_reg_i_138
       (.I0(fract24b_i_IBUF[15]),
        .I1(fract24b_i_IBUF[14]),
        .I2(fract24b_i_IBUF[12]),
        .I3(fract24b_i_IBUF[13]),
        .O(s0o_fract32_ahbl_reg_i_138_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    s0o_fract32_ahbl_reg_i_139
       (.I0(fract24a_i_IBUF[8]),
        .I1(fract24a_i_IBUF[9]),
        .O(s0o_fract32_ahbl_reg_i_139_n_0));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_ahbl_reg_i_14
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_41_n_0),
        .I4(s0t_nlza[0]),
        .I5(s0o_fract32_ahbl_reg_i_40_n_0),
        .O(s0t_mul16_ah[10]));
  LUT2 #(
    .INIT(4'hE)) 
    s0o_fract32_ahbl_reg_i_140
       (.I0(fract24a_i_IBUF[13]),
        .I1(fract24a_i_IBUF[12]),
        .O(s0o_fract32_ahbl_reg_i_140_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEEEF)) 
    s0o_fract32_ahbl_reg_i_141
       (.I0(fract24a_i_IBUF[9]),
        .I1(fract24a_i_IBUF[8]),
        .I2(fract24a_i_IBUF[3]),
        .I3(fract24a_i_IBUF[2]),
        .I4(fract24a_i_IBUF[4]),
        .I5(fract24a_i_IBUF[5]),
        .O(s0o_fract32_ahbl_reg_i_141_n_0));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    s0o_fract32_ahbl_reg_i_142
       (.I0(fract24a_i_IBUF[11]),
        .I1(fract24a_i_IBUF[10]),
        .I2(fract24a_i_IBUF[15]),
        .I3(fract24a_i_IBUF[14]),
        .O(s0o_fract32_ahbl_reg_i_142_n_0));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'hE)) 
    s0o_fract32_ahbl_reg_i_143
       (.I0(fract24a_i_IBUF[14]),
        .I1(fract24a_i_IBUF[15]),
        .O(s0o_fract32_ahbl_reg_i_143_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    s0o_fract32_ahbl_reg_i_144
       (.I0(fract24a_i_IBUF[15]),
        .I1(fract24a_i_IBUF[14]),
        .I2(fract24a_i_IBUF[12]),
        .I3(fract24a_i_IBUF[13]),
        .O(s0o_fract32_ahbl_reg_i_144_n_0));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_ahbl_reg_i_15
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_42_n_0),
        .I4(s0t_nlza[0]),
        .I5(s0o_fract32_ahbl_reg_i_41_n_0),
        .O(s0t_mul16_ah[9]));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_ahbl_reg_i_16
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_43_n_0),
        .I4(s0t_nlza[0]),
        .I5(s0o_fract32_ahbl_reg_i_42_n_0),
        .O(s0t_mul16_ah[8]));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_ahbl_reg_i_17
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_44_n_0),
        .I4(s0t_nlza[0]),
        .I5(s0o_fract32_ahbl_reg_i_43_n_0),
        .O(s0t_mul16_ah[7]));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_ahbl_reg_i_18
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_45_n_0),
        .I4(s0t_nlza[0]),
        .I5(s0o_fract32_ahbl_reg_i_44_n_0),
        .O(s0t_mul16_ah[6]));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_ahbl_reg_i_19
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_46_n_0),
        .I4(s0t_nlza[0]),
        .I5(s0o_fract32_ahbl_reg_i_45_n_0),
        .O(s0t_mul16_ah[5]));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_ahbl_reg_i_2
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_28_n_0),
        .I4(s0t_nlzb[0]),
        .I5(s0o_fract32_ahbl_reg_i_25_n_0),
        .O(s0o_fract32_ahbl_reg_i_2_n_0));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_ahbl_reg_i_20
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_47_n_0),
        .I4(s0t_nlza[0]),
        .I5(s0o_fract32_ahbl_reg_i_46_n_0),
        .O(s0t_mul16_ah[4]));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_ahbl_reg_i_21
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_48_n_0),
        .I4(s0t_nlza[0]),
        .I5(s0o_fract32_ahbl_reg_i_47_n_0),
        .O(s0t_mul16_ah[3]));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_ahbl_reg_i_22
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_49_n_0),
        .I4(s0t_nlza[0]),
        .I5(s0o_fract32_ahbl_reg_i_48_n_0),
        .O(s0t_mul16_ah[2]));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_ahbl_reg_i_23
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_50_n_0),
        .I4(s0t_nlza[0]),
        .I5(s0o_fract32_ahbl_reg_i_49_n_0),
        .O(s0t_mul16_ah[1]));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_ahbl_reg_i_24
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_51_n_0),
        .I4(s0t_nlza[0]),
        .I5(s0o_fract32_ahbl_reg_i_50_n_0),
        .O(s0t_mul16_ah[0]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_ahbl_reg_i_25
       (.I0(s0o_fract32_ahbl_reg_i_52_n_0),
        .I1(s0o_fract32_ahbl_reg_i_53_n_0),
        .I2(s0t_nlzb[1]),
        .I3(s0o_fract32_ahbl_reg_i_55_n_0),
        .I4(s0t_nlzb[2]),
        .I5(s0o_fract32_ahbl_reg_i_57_n_0),
        .O(s0o_fract32_ahbl_reg_i_25_n_0));
  LUT6 #(
    .INIT(64'h5555555544444440)) 
    s0o_fract32_ahbl_reg_i_26
       (.I0(fract24b_i_IBUF[23]),
        .I1(s0o_fract32_ahbl_reg_i_58_n_0),
        .I2(fract24b_i_IBUF[14]),
        .I3(s0o_fract32_ahbl_reg_i_59_n_0),
        .I4(s0o_fract32_ahbl_reg_i_60_n_0),
        .I5(s0o_fract32_ahbl_reg_i_61_n_0),
        .O(s0t_nlzb[0]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_ahbl_reg_i_27
       (.I0(s0o_fract32_ahbl_reg_i_62_n_0),
        .I1(s0o_fract32_ahbl_reg_i_63_n_0),
        .I2(s0t_nlzb[1]),
        .I3(s0o_fract32_ahbl_reg_i_64_n_0),
        .I4(s0t_nlzb[2]),
        .I5(s0o_fract32_ahbl_reg_i_65_n_0),
        .O(s0o_fract32_ahbl_reg_i_27_n_0));
  LUT6 #(
    .INIT(64'h0000000030BB3088)) 
    s0o_fract32_ahbl_reg_i_28
       (.I0(s0o_fract32_ahbl_reg_i_66_n_0),
        .I1(s0t_nlzb[1]),
        .I2(s0o_fract32_ahbl_reg_i_67_n_0),
        .I3(s0t_nlzb[2]),
        .I4(s0o_fract32_ahbl_reg_i_68_n_0),
        .I5(s0t_nlzb[3]),
        .O(s0o_fract32_ahbl_reg_i_28_n_0));
  LUT6 #(
    .INIT(64'h0000000030BB3088)) 
    s0o_fract32_ahbl_reg_i_29
       (.I0(s0o_fract32_ahbl_reg_i_70_n_0),
        .I1(s0t_nlzb[1]),
        .I2(s0o_fract32_ahbl_reg_i_71_n_0),
        .I3(s0t_nlzb[2]),
        .I4(s0o_fract32_ahbl_reg_i_72_n_0),
        .I5(s0t_nlzb[3]),
        .O(s0o_fract32_ahbl_reg_i_29_n_0));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_ahbl_reg_i_3
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_29_n_0),
        .I4(s0t_nlzb[0]),
        .I5(s0o_fract32_ahbl_reg_i_28_n_0),
        .O(s0o_fract32_ahbl_reg_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000000000000B08)) 
    s0o_fract32_ahbl_reg_i_30
       (.I0(fract24b_i_IBUF[1]),
        .I1(s0t_nlzb[1]),
        .I2(s0t_nlzb[3]),
        .I3(fract24b_i_IBUF[3]),
        .I4(s0t_nlzb[4]),
        .I5(s0t_nlzb[2]),
        .O(s0o_fract32_ahbl_reg_i_30_n_0));
  LUT6 #(
    .INIT(64'h0000000000000B08)) 
    s0o_fract32_ahbl_reg_i_31
       (.I0(fract24b_i_IBUF[0]),
        .I1(s0t_nlzb[1]),
        .I2(s0t_nlzb[3]),
        .I3(fract24b_i_IBUF[2]),
        .I4(s0t_nlzb[4]),
        .I5(s0t_nlzb[2]),
        .O(s0o_fract32_ahbl_reg_i_31_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    s0o_fract32_ahbl_reg_i_32
       (.I0(s0t_nlzb[2]),
        .I1(s0t_nlzb[4]),
        .I2(fract24b_i_IBUF[1]),
        .I3(s0t_nlzb[3]),
        .I4(s0t_nlzb[1]),
        .O(s0o_fract32_ahbl_reg_i_32_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    s0o_fract32_ahbl_reg_i_33
       (.I0(s0t_nlzb[2]),
        .I1(s0t_nlzb[4]),
        .I2(fract24b_i_IBUF[0]),
        .I3(s0t_nlzb[3]),
        .I4(s0t_nlzb[1]),
        .O(s0o_fract32_ahbl_reg_i_33_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_ahbl_reg_i_34
       (.I0(s0o_fract32_ahbl_reg_i_74_n_0),
        .I1(s0o_fract32_ahbl_reg_i_75_n_0),
        .I2(s0t_nlza[1]),
        .I3(s0o_fract32_ahbl_reg_i_77_n_0),
        .I4(s0t_nlza[2]),
        .I5(s0o_fract32_ahbl_reg_i_79_n_0),
        .O(s0o_fract32_ahbl_reg_i_34_n_0));
  LUT6 #(
    .INIT(64'h5555555544444440)) 
    s0o_fract32_ahbl_reg_i_35
       (.I0(fract24a_i_IBUF[23]),
        .I1(s0o_fract32_ahbl_reg_i_80_n_0),
        .I2(fract24a_i_IBUF[14]),
        .I3(s0o_fract32_ahbl_reg_i_81_n_0),
        .I4(s0o_fract32_ahbl_reg_i_82_n_0),
        .I5(s0o_fract32_ahbl_reg_i_83_n_0),
        .O(s0t_nlza[0]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_ahbl_reg_i_36
       (.I0(s0o_fract32_ahbl_reg_i_84_n_0),
        .I1(s0o_fract32_ahbl_reg_i_85_n_0),
        .I2(s0t_nlza[1]),
        .I3(s0o_fract32_ahbl_reg_i_86_n_0),
        .I4(s0t_nlza[2]),
        .I5(s0o_fract32_ahbl_reg_i_87_n_0),
        .O(s0o_fract32_ahbl_reg_i_36_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_ahbl_reg_i_37
       (.I0(s0o_fract32_ahbl_reg_i_88_n_0),
        .I1(s0o_fract32_ahbl_reg_i_86_n_0),
        .I2(s0t_nlza[1]),
        .I3(s0o_fract32_ahbl_reg_i_84_n_0),
        .I4(s0t_nlza[2]),
        .I5(s0o_fract32_ahbl_reg_i_85_n_0),
        .O(s0o_fract32_ahbl_reg_i_37_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_ahbl_reg_i_38
       (.I0(s0o_fract32_ahbl_reg_i_89_n_0),
        .I1(s0o_fract32_ahbl_reg_i_77_n_0),
        .I2(s0t_nlza[1]),
        .I3(s0o_fract32_ahbl_reg_i_74_n_0),
        .I4(s0t_nlza[2]),
        .I5(s0o_fract32_ahbl_reg_i_75_n_0),
        .O(s0o_fract32_ahbl_reg_i_38_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_ahbl_reg_i_39
       (.I0(s0o_fract32_ahbl_reg_i_90_n_0),
        .I1(s0o_fract32_ahbl_reg_i_84_n_0),
        .I2(s0t_nlza[1]),
        .I3(s0o_fract32_ahbl_reg_i_88_n_0),
        .I4(s0t_nlza[2]),
        .I5(s0o_fract32_ahbl_reg_i_86_n_0),
        .O(s0o_fract32_ahbl_reg_i_39_n_0));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_ahbl_reg_i_4
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_30_n_0),
        .I4(s0t_nlzb[0]),
        .I5(s0o_fract32_ahbl_reg_i_29_n_0),
        .O(s0o_fract32_ahbl_reg_i_4_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_ahbl_reg_i_40
       (.I0(s0o_fract32_ahbl_reg_i_91_n_0),
        .I1(s0o_fract32_ahbl_reg_i_74_n_0),
        .I2(s0t_nlza[1]),
        .I3(s0o_fract32_ahbl_reg_i_89_n_0),
        .I4(s0t_nlza[2]),
        .I5(s0o_fract32_ahbl_reg_i_77_n_0),
        .O(s0o_fract32_ahbl_reg_i_40_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_ahbl_reg_i_41
       (.I0(s0o_fract32_ahbl_reg_i_92_n_0),
        .I1(s0o_fract32_ahbl_reg_i_88_n_0),
        .I2(s0t_nlza[1]),
        .I3(s0o_fract32_ahbl_reg_i_90_n_0),
        .I4(s0t_nlza[2]),
        .I5(s0o_fract32_ahbl_reg_i_84_n_0),
        .O(s0o_fract32_ahbl_reg_i_41_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_ahbl_reg_i_42
       (.I0(s0o_fract32_ahbl_reg_i_93_n_0),
        .I1(s0o_fract32_ahbl_reg_i_89_n_0),
        .I2(s0t_nlza[1]),
        .I3(s0o_fract32_ahbl_reg_i_91_n_0),
        .I4(s0t_nlza[2]),
        .I5(s0o_fract32_ahbl_reg_i_74_n_0),
        .O(s0o_fract32_ahbl_reg_i_42_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_ahbl_reg_i_43
       (.I0(s0o_fract32_ahbl_reg_i_94_n_0),
        .I1(s0o_fract32_ahbl_reg_i_90_n_0),
        .I2(s0t_nlza[1]),
        .I3(s0o_fract32_ahbl_reg_i_92_n_0),
        .I4(s0t_nlza[2]),
        .I5(s0o_fract32_ahbl_reg_i_88_n_0),
        .O(s0o_fract32_ahbl_reg_i_43_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_ahbl_reg_i_44
       (.I0(s0o_fract32_ahbl_reg_i_95_n_0),
        .I1(s0o_fract32_ahbl_reg_i_91_n_0),
        .I2(s0t_nlza[1]),
        .I3(s0o_fract32_ahbl_reg_i_93_n_0),
        .I4(s0t_nlza[2]),
        .I5(s0o_fract32_ahbl_reg_i_89_n_0),
        .O(s0o_fract32_ahbl_reg_i_44_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_ahbl_reg_i_45
       (.I0(s0o_fract32_ahbl_reg_i_96_n_0),
        .I1(s0o_fract32_ahbl_reg_i_92_n_0),
        .I2(s0t_nlza[1]),
        .I3(s0o_fract32_ahbl_reg_i_94_n_0),
        .I4(s0t_nlza[2]),
        .I5(s0o_fract32_ahbl_reg_i_90_n_0),
        .O(s0o_fract32_ahbl_reg_i_45_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_ahbl_reg_i_46
       (.I0(s0o_fract32_ahbl_reg_i_97_n_0),
        .I1(s0o_fract32_ahbl_reg_i_93_n_0),
        .I2(s0t_nlza[1]),
        .I3(s0o_fract32_ahbl_reg_i_95_n_0),
        .I4(s0t_nlza[2]),
        .I5(s0o_fract32_ahbl_reg_i_91_n_0),
        .O(s0o_fract32_ahbl_reg_i_46_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_ahbl_reg_i_47
       (.I0(s0o_fract32_ahbl_reg_i_98_n_0),
        .I1(s0o_fract32_ahbl_reg_i_94_n_0),
        .I2(s0t_nlza[1]),
        .I3(s0o_fract32_ahbl_reg_i_96_n_0),
        .I4(s0t_nlza[2]),
        .I5(s0o_fract32_ahbl_reg_i_92_n_0),
        .O(s0o_fract32_ahbl_reg_i_47_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_ahbl_reg_i_48
       (.I0(s0o_fract32_ahbl_reg_i_99_n_0),
        .I1(s0o_fract32_ahbl_reg_i_95_n_0),
        .I2(s0t_nlza[1]),
        .I3(s0o_fract32_ahbl_reg_i_97_n_0),
        .I4(s0t_nlza[2]),
        .I5(s0o_fract32_ahbl_reg_i_93_n_0),
        .O(s0o_fract32_ahbl_reg_i_48_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_ahbl_reg_i_49
       (.I0(s0o_fract32_ahbl_reg_i_100_n_0),
        .I1(s0o_fract32_ahbl_reg_i_96_n_0),
        .I2(s0t_nlza[1]),
        .I3(s0o_fract32_ahbl_reg_i_98_n_0),
        .I4(s0t_nlza[2]),
        .I5(s0o_fract32_ahbl_reg_i_94_n_0),
        .O(s0o_fract32_ahbl_reg_i_49_n_0));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_ahbl_reg_i_5
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_31_n_0),
        .I4(s0t_nlzb[0]),
        .I5(s0o_fract32_ahbl_reg_i_30_n_0),
        .O(s0o_fract32_ahbl_reg_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_ahbl_reg_i_50
       (.I0(s0o_fract32_ahbl_reg_i_101_n_0),
        .I1(s0o_fract32_ahbl_reg_i_97_n_0),
        .I2(s0t_nlza[1]),
        .I3(s0o_fract32_ahbl_reg_i_99_n_0),
        .I4(s0t_nlza[2]),
        .I5(s0o_fract32_ahbl_reg_i_95_n_0),
        .O(s0o_fract32_ahbl_reg_i_50_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_ahbl_reg_i_51
       (.I0(s0o_fract32_ahbl_reg_i_102_n_0),
        .I1(s0o_fract32_ahbl_reg_i_98_n_0),
        .I2(s0t_nlza[1]),
        .I3(s0o_fract32_ahbl_reg_i_100_n_0),
        .I4(s0t_nlza[2]),
        .I5(s0o_fract32_ahbl_reg_i_96_n_0),
        .O(s0o_fract32_ahbl_reg_i_51_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h04)) 
    s0o_fract32_ahbl_reg_i_52
       (.I0(s0t_nlzb[4]),
        .I1(fract24b_i_IBUF[0]),
        .I2(s0t_nlzb[3]),
        .O(s0o_fract32_ahbl_reg_i_52_n_0));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'h04)) 
    s0o_fract32_ahbl_reg_i_53
       (.I0(s0t_nlzb[4]),
        .I1(fract24b_i_IBUF[4]),
        .I2(s0t_nlzb[3]),
        .O(s0o_fract32_ahbl_reg_i_53_n_0));
  LUT6 #(
    .INIT(64'h000000CD00000000)) 
    s0o_fract32_ahbl_reg_i_54
       (.I0(fract24b_i_IBUF[19]),
        .I1(s0o_fract32_ahbl_reg_i_103_n_0),
        .I2(fract24b_i_IBUF[18]),
        .I3(fract24b_i_IBUF[22]),
        .I4(fract24b_i_IBUF[23]),
        .I5(s0o_fract32_ahbl_reg_i_104_n_0),
        .O(s0t_nlzb[1]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'h04)) 
    s0o_fract32_ahbl_reg_i_55
       (.I0(s0t_nlzb[4]),
        .I1(fract24b_i_IBUF[2]),
        .I2(s0t_nlzb[3]),
        .O(s0o_fract32_ahbl_reg_i_55_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h00010000)) 
    s0o_fract32_ahbl_reg_i_56
       (.I0(fract24b_i_IBUF[21]),
        .I1(fract24b_i_IBUF[20]),
        .I2(fract24b_i_IBUF[22]),
        .I3(fract24b_i_IBUF[23]),
        .I4(s0o_fract32_ahbl_reg_i_105_n_0),
        .O(s0t_nlzb[2]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'h04)) 
    s0o_fract32_ahbl_reg_i_57
       (.I0(s0t_nlzb[4]),
        .I1(fract24b_i_IBUF[6]),
        .I2(s0t_nlzb[3]),
        .O(s0o_fract32_ahbl_reg_i_57_n_0));
  LUT6 #(
    .INIT(64'h000000000F000F0B)) 
    s0o_fract32_ahbl_reg_i_58
       (.I0(fract24b_i_IBUF[14]),
        .I1(fract24b_i_IBUF[13]),
        .I2(fract24b_i_IBUF[17]),
        .I3(fract24b_i_IBUF[16]),
        .I4(fract24b_i_IBUF[15]),
        .I5(s0o_fract32_ahbl_reg_i_106_n_0),
        .O(s0o_fract32_ahbl_reg_i_58_n_0));
  LUT6 #(
    .INIT(64'hEEFFEEFFEEEEEEFE)) 
    s0o_fract32_ahbl_reg_i_59
       (.I0(fract24b_i_IBUF[12]),
        .I1(fract24b_i_IBUF[16]),
        .I2(fract24b_i_IBUF[8]),
        .I3(fract24b_i_IBUF[11]),
        .I4(fract24b_i_IBUF[9]),
        .I5(fract24b_i_IBUF[10]),
        .O(s0o_fract32_ahbl_reg_i_59_n_0));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_ahbl_reg_i_6
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_32_n_0),
        .I4(s0t_nlzb[0]),
        .I5(s0o_fract32_ahbl_reg_i_31_n_0),
        .O(s0o_fract32_ahbl_reg_i_6_n_0));
  LUT6 #(
    .INIT(64'h000004000C000C00)) 
    s0o_fract32_ahbl_reg_i_60
       (.I0(fract24b_i_IBUF[5]),
        .I1(s0o_fract32_ahbl_reg_i_107_n_0),
        .I2(fract24b_i_IBUF[7]),
        .I3(s0o_fract32_ahbl_reg_i_108_n_0),
        .I4(fract24b_i_IBUF[3]),
        .I5(s0o_fract32_ahbl_reg_i_109_n_0),
        .O(s0o_fract32_ahbl_reg_i_60_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'hAFAFAAAE)) 
    s0o_fract32_ahbl_reg_i_61
       (.I0(fract24b_i_IBUF[22]),
        .I1(fract24b_i_IBUF[18]),
        .I2(fract24b_i_IBUF[21]),
        .I3(fract24b_i_IBUF[19]),
        .I4(fract24b_i_IBUF[20]),
        .O(s0o_fract32_ahbl_reg_i_61_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h04)) 
    s0o_fract32_ahbl_reg_i_62
       (.I0(s0t_nlzb[4]),
        .I1(fract24b_i_IBUF[1]),
        .I2(s0t_nlzb[3]),
        .O(s0o_fract32_ahbl_reg_i_62_n_0));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'h04)) 
    s0o_fract32_ahbl_reg_i_63
       (.I0(s0t_nlzb[4]),
        .I1(fract24b_i_IBUF[5]),
        .I2(s0t_nlzb[3]),
        .O(s0o_fract32_ahbl_reg_i_63_n_0));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'h04)) 
    s0o_fract32_ahbl_reg_i_64
       (.I0(s0t_nlzb[4]),
        .I1(fract24b_i_IBUF[3]),
        .I2(s0t_nlzb[3]),
        .O(s0o_fract32_ahbl_reg_i_64_n_0));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'h04)) 
    s0o_fract32_ahbl_reg_i_65
       (.I0(s0t_nlzb[4]),
        .I1(fract24b_i_IBUF[7]),
        .I2(s0t_nlzb[3]),
        .O(s0o_fract32_ahbl_reg_i_65_n_0));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT2 #(
    .INIT(4'h2)) 
    s0o_fract32_ahbl_reg_i_66
       (.I0(fract24b_i_IBUF[3]),
        .I1(s0t_nlzb[4]),
        .O(s0o_fract32_ahbl_reg_i_66_n_0));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'h2)) 
    s0o_fract32_ahbl_reg_i_67
       (.I0(fract24b_i_IBUF[1]),
        .I1(s0t_nlzb[4]),
        .O(s0o_fract32_ahbl_reg_i_67_n_0));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h2)) 
    s0o_fract32_ahbl_reg_i_68
       (.I0(fract24b_i_IBUF[5]),
        .I1(s0t_nlzb[4]),
        .O(s0o_fract32_ahbl_reg_i_68_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    s0o_fract32_ahbl_reg_i_69
       (.I0(fract24b_i_IBUF[15]),
        .I1(fract24b_i_IBUF[14]),
        .I2(fract24b_i_IBUF[12]),
        .I3(fract24b_i_IBUF[13]),
        .I4(s0o_fract32_ahbl_reg_i_110_n_0),
        .I5(s0o_fract32_ahbl_reg_i_111_n_0),
        .O(s0t_nlzb[3]));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_ahbl_reg_i_7
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_33_n_0),
        .I4(s0t_nlzb[0]),
        .I5(s0o_fract32_ahbl_reg_i_32_n_0),
        .O(s0o_fract32_ahbl_reg_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h2)) 
    s0o_fract32_ahbl_reg_i_70
       (.I0(fract24b_i_IBUF[2]),
        .I1(s0t_nlzb[4]),
        .O(s0o_fract32_ahbl_reg_i_70_n_0));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'h2)) 
    s0o_fract32_ahbl_reg_i_71
       (.I0(fract24b_i_IBUF[0]),
        .I1(s0t_nlzb[4]),
        .O(s0o_fract32_ahbl_reg_i_71_n_0));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'h2)) 
    s0o_fract32_ahbl_reg_i_72
       (.I0(fract24b_i_IBUF[4]),
        .I1(s0t_nlzb[4]),
        .O(s0o_fract32_ahbl_reg_i_72_n_0));
  LUT6 #(
    .INIT(64'h0000FDFF00000000)) 
    s0o_fract32_ahbl_reg_i_73
       (.I0(s0o_fract32_ahbl_reg_i_112_n_0),
        .I1(fract24b_i_IBUF[0]),
        .I2(fract24b_i_IBUF[1]),
        .I3(s0o_fract32_ahbl_reg_i_113_n_0),
        .I4(s0o_fract32_ahbl_reg_i_114_n_0),
        .I5(s0o_fract32_ahbl_reg_i_111_n_0),
        .O(s0t_nlzb[4]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    s0o_fract32_ahbl_reg_i_74
       (.I0(fract24a_i_IBUF[8]),
        .I1(s0t_nlza[3]),
        .I2(fract24a_i_IBUF[0]),
        .I3(s0t_nlza[4]),
        .I4(fract24a_i_IBUF[16]),
        .O(s0o_fract32_ahbl_reg_i_74_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    s0o_fract32_ahbl_reg_i_75
       (.I0(fract24a_i_IBUF[12]),
        .I1(s0t_nlza[3]),
        .I2(fract24a_i_IBUF[4]),
        .I3(s0t_nlza[4]),
        .I4(fract24a_i_IBUF[20]),
        .O(s0o_fract32_ahbl_reg_i_75_n_0));
  LUT6 #(
    .INIT(64'h000000CD00000000)) 
    s0o_fract32_ahbl_reg_i_76
       (.I0(fract24a_i_IBUF[19]),
        .I1(s0o_fract32_ahbl_reg_i_115_n_0),
        .I2(fract24a_i_IBUF[18]),
        .I3(fract24a_i_IBUF[22]),
        .I4(fract24a_i_IBUF[23]),
        .I5(s0o_fract32_ahbl_reg_i_116_n_0),
        .O(s0t_nlza[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    s0o_fract32_ahbl_reg_i_77
       (.I0(fract24a_i_IBUF[10]),
        .I1(s0t_nlza[3]),
        .I2(fract24a_i_IBUF[2]),
        .I3(s0t_nlza[4]),
        .I4(fract24a_i_IBUF[18]),
        .O(s0o_fract32_ahbl_reg_i_77_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h00010000)) 
    s0o_fract32_ahbl_reg_i_78
       (.I0(fract24a_i_IBUF[21]),
        .I1(fract24a_i_IBUF[20]),
        .I2(fract24a_i_IBUF[22]),
        .I3(fract24a_i_IBUF[23]),
        .I4(s0o_fract32_ahbl_reg_i_117_n_0),
        .O(s0t_nlza[2]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    s0o_fract32_ahbl_reg_i_79
       (.I0(fract24a_i_IBUF[14]),
        .I1(s0t_nlza[3]),
        .I2(fract24a_i_IBUF[6]),
        .I3(s0t_nlza[4]),
        .I4(fract24a_i_IBUF[22]),
        .O(s0o_fract32_ahbl_reg_i_79_n_0));
  LUT5 #(
    .INIT(32'h00000200)) 
    s0o_fract32_ahbl_reg_i_8
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_33_n_0),
        .I4(s0t_nlzb[0]),
        .O(s0o_fract32_ahbl_reg_i_8_n_0));
  LUT6 #(
    .INIT(64'h000000000F000F0B)) 
    s0o_fract32_ahbl_reg_i_80
       (.I0(fract24a_i_IBUF[14]),
        .I1(fract24a_i_IBUF[13]),
        .I2(fract24a_i_IBUF[17]),
        .I3(fract24a_i_IBUF[16]),
        .I4(fract24a_i_IBUF[15]),
        .I5(s0o_fract32_ahbl_reg_i_118_n_0),
        .O(s0o_fract32_ahbl_reg_i_80_n_0));
  LUT6 #(
    .INIT(64'hEEFFEEFFEEEEEEFE)) 
    s0o_fract32_ahbl_reg_i_81
       (.I0(fract24a_i_IBUF[12]),
        .I1(fract24a_i_IBUF[16]),
        .I2(fract24a_i_IBUF[8]),
        .I3(fract24a_i_IBUF[11]),
        .I4(fract24a_i_IBUF[9]),
        .I5(fract24a_i_IBUF[10]),
        .O(s0o_fract32_ahbl_reg_i_81_n_0));
  LUT6 #(
    .INIT(64'h000004000C000C00)) 
    s0o_fract32_ahbl_reg_i_82
       (.I0(fract24a_i_IBUF[5]),
        .I1(s0o_fract32_ahbl_reg_i_119_n_0),
        .I2(fract24a_i_IBUF[7]),
        .I3(s0o_fract32_ahbl_reg_i_120_n_0),
        .I4(fract24a_i_IBUF[3]),
        .I5(s0o_fract32_ahbl_reg_i_121_n_0),
        .O(s0o_fract32_ahbl_reg_i_82_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'hAFAFAAAE)) 
    s0o_fract32_ahbl_reg_i_83
       (.I0(fract24a_i_IBUF[22]),
        .I1(fract24a_i_IBUF[18]),
        .I2(fract24a_i_IBUF[21]),
        .I3(fract24a_i_IBUF[19]),
        .I4(fract24a_i_IBUF[20]),
        .O(s0o_fract32_ahbl_reg_i_83_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    s0o_fract32_ahbl_reg_i_84
       (.I0(fract24a_i_IBUF[9]),
        .I1(s0t_nlza[3]),
        .I2(fract24a_i_IBUF[1]),
        .I3(s0t_nlza[4]),
        .I4(fract24a_i_IBUF[17]),
        .O(s0o_fract32_ahbl_reg_i_84_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    s0o_fract32_ahbl_reg_i_85
       (.I0(fract24a_i_IBUF[13]),
        .I1(s0t_nlza[3]),
        .I2(fract24a_i_IBUF[5]),
        .I3(s0t_nlza[4]),
        .I4(fract24a_i_IBUF[21]),
        .O(s0o_fract32_ahbl_reg_i_85_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    s0o_fract32_ahbl_reg_i_86
       (.I0(fract24a_i_IBUF[11]),
        .I1(s0t_nlza[3]),
        .I2(fract24a_i_IBUF[3]),
        .I3(s0t_nlza[4]),
        .I4(fract24a_i_IBUF[19]),
        .O(s0o_fract32_ahbl_reg_i_86_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    s0o_fract32_ahbl_reg_i_87
       (.I0(fract24a_i_IBUF[15]),
        .I1(s0t_nlza[3]),
        .I2(fract24a_i_IBUF[7]),
        .I3(s0t_nlza[4]),
        .I4(fract24a_i_IBUF[23]),
        .O(s0o_fract32_ahbl_reg_i_87_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    s0o_fract32_ahbl_reg_i_88
       (.I0(fract24a_i_IBUF[7]),
        .I1(s0t_nlza[3]),
        .I2(fract24a_i_IBUF[15]),
        .I3(s0t_nlza[4]),
        .O(s0o_fract32_ahbl_reg_i_88_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    s0o_fract32_ahbl_reg_i_89
       (.I0(fract24a_i_IBUF[6]),
        .I1(s0t_nlza[3]),
        .I2(fract24a_i_IBUF[14]),
        .I3(s0t_nlza[4]),
        .O(s0o_fract32_ahbl_reg_i_89_n_0));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_ahbl_reg_i_9
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_34_n_0),
        .I4(s0t_nlza[0]),
        .I5(s0o_fract32_ahbl_reg_i_36_n_0),
        .O(s0t_mul16_ah[15]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    s0o_fract32_ahbl_reg_i_90
       (.I0(fract24a_i_IBUF[5]),
        .I1(s0t_nlza[3]),
        .I2(fract24a_i_IBUF[13]),
        .I3(s0t_nlza[4]),
        .O(s0o_fract32_ahbl_reg_i_90_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    s0o_fract32_ahbl_reg_i_91
       (.I0(fract24a_i_IBUF[4]),
        .I1(s0t_nlza[3]),
        .I2(fract24a_i_IBUF[12]),
        .I3(s0t_nlza[4]),
        .O(s0o_fract32_ahbl_reg_i_91_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    s0o_fract32_ahbl_reg_i_92
       (.I0(fract24a_i_IBUF[3]),
        .I1(s0t_nlza[3]),
        .I2(fract24a_i_IBUF[11]),
        .I3(s0t_nlza[4]),
        .O(s0o_fract32_ahbl_reg_i_92_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    s0o_fract32_ahbl_reg_i_93
       (.I0(fract24a_i_IBUF[2]),
        .I1(s0t_nlza[3]),
        .I2(fract24a_i_IBUF[10]),
        .I3(s0t_nlza[4]),
        .O(s0o_fract32_ahbl_reg_i_93_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    s0o_fract32_ahbl_reg_i_94
       (.I0(fract24a_i_IBUF[1]),
        .I1(s0t_nlza[3]),
        .I2(fract24a_i_IBUF[9]),
        .I3(s0t_nlza[4]),
        .O(s0o_fract32_ahbl_reg_i_94_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    s0o_fract32_ahbl_reg_i_95
       (.I0(fract24a_i_IBUF[0]),
        .I1(s0t_nlza[3]),
        .I2(fract24a_i_IBUF[8]),
        .I3(s0t_nlza[4]),
        .O(s0o_fract32_ahbl_reg_i_95_n_0));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'h04)) 
    s0o_fract32_ahbl_reg_i_96
       (.I0(s0t_nlza[4]),
        .I1(fract24a_i_IBUF[7]),
        .I2(s0t_nlza[3]),
        .O(s0o_fract32_ahbl_reg_i_96_n_0));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'h04)) 
    s0o_fract32_ahbl_reg_i_97
       (.I0(s0t_nlza[4]),
        .I1(fract24a_i_IBUF[6]),
        .I2(s0t_nlza[3]),
        .O(s0o_fract32_ahbl_reg_i_97_n_0));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'h04)) 
    s0o_fract32_ahbl_reg_i_98
       (.I0(s0t_nlza[4]),
        .I1(fract24a_i_IBUF[5]),
        .I2(s0t_nlza[3]),
        .O(s0o_fract32_ahbl_reg_i_98_n_0));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'h04)) 
    s0o_fract32_ahbl_reg_i_99
       (.I0(s0t_nlza[4]),
        .I1(fract24a_i_IBUF[4]),
        .I2(s0t_nlza[3]),
        .O(s0o_fract32_ahbl_reg_i_99_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-12 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(0),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    s0o_fract32_albh_reg
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s0o_fract32_albh_reg_i_17_n_0,s0o_fract32_albh_reg_i_18_n_0,s0o_fract32_albh_reg_i_19_n_0,s0o_fract32_albh_reg_i_20_n_0,s0o_fract32_albh_reg_i_21_n_0,s0o_fract32_albh_reg_i_22_n_0,s0o_fract32_albh_reg_i_23_n_0,s0o_fract32_albh_reg_i_24_n_0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_s0o_fract32_albh_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,s0t_mul16_bh}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_s0o_fract32_albh_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_s0o_fract32_albh_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_s0o_fract32_albh_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_s0o_fract32_albh_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_s0o_fract32_albh_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_s0o_fract32_albh_reg_P_UNCONNECTED[47:32],s0o_fract32_albh_reg_n_74,s0o_fract32_albh_reg_n_75,s0o_fract32_albh_reg_n_76,s0o_fract32_albh_reg_n_77,s0o_fract32_albh_reg_n_78,s0o_fract32_albh_reg_n_79,s0o_fract32_albh_reg_n_80,s0o_fract32_albh_reg_n_81,s0o_fract32_albh_reg_n_82,s0o_fract32_albh_reg_n_83,s0o_fract32_albh_reg_n_84,s0o_fract32_albh_reg_n_85,s0o_fract32_albh_reg_n_86,s0o_fract32_albh_reg_n_87,s0o_fract32_albh_reg_n_88,s0o_fract32_albh_reg_n_89,s0o_fract32_albh_reg_n_90,s0o_fract32_albh_reg_n_91,s0o_fract32_albh_reg_n_92,s0o_fract32_albh_reg_n_93,s0o_fract32_albh_reg_n_94,s0o_fract32_albh_reg_n_95,s0o_fract32_albh_reg_n_96,s0o_fract32_albh_reg_n_97,s0o_fract32_albh_reg_n_98,s0o_fract32_albh_reg_n_99,s0o_fract32_albh_reg_n_100,s0o_fract32_albh_reg_n_101,s0o_fract32_albh_reg_n_102,s0o_fract32_albh_reg_n_103,s0o_fract32_albh_reg_n_104,s0o_fract32_albh_reg_n_105}),
        .PATTERNBDETECT(NLW_s0o_fract32_albh_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_s0o_fract32_albh_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_s0o_fract32_albh_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_s0o_fract32_albh_reg_UNDERFLOW_UNCONNECTED));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_albh_reg_i_1
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_albh_reg_i_25_n_0),
        .I4(s0t_nlzb[0]),
        .I5(s0o_fract32_albh_reg_i_26_n_0),
        .O(s0t_mul16_bh[15]));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_albh_reg_i_10
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_albh_reg_i_35_n_0),
        .I4(s0t_nlzb[0]),
        .I5(s0o_fract32_albh_reg_i_34_n_0),
        .O(s0t_mul16_bh[6]));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_albh_reg_i_11
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_albh_reg_i_36_n_0),
        .I4(s0t_nlzb[0]),
        .I5(s0o_fract32_albh_reg_i_35_n_0),
        .O(s0t_mul16_bh[5]));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_albh_reg_i_12
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_albh_reg_i_37_n_0),
        .I4(s0t_nlzb[0]),
        .I5(s0o_fract32_albh_reg_i_36_n_0),
        .O(s0t_mul16_bh[4]));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_albh_reg_i_13
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_albh_reg_i_38_n_0),
        .I4(s0t_nlzb[0]),
        .I5(s0o_fract32_albh_reg_i_37_n_0),
        .O(s0t_mul16_bh[3]));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_albh_reg_i_14
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_albh_reg_i_39_n_0),
        .I4(s0t_nlzb[0]),
        .I5(s0o_fract32_albh_reg_i_38_n_0),
        .O(s0t_mul16_bh[2]));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_albh_reg_i_15
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_albh_reg_i_40_n_0),
        .I4(s0t_nlzb[0]),
        .I5(s0o_fract32_albh_reg_i_39_n_0),
        .O(s0t_mul16_bh[1]));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_albh_reg_i_16
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_ahbl_reg_i_27_n_0),
        .I4(s0t_nlzb[0]),
        .I5(s0o_fract32_albh_reg_i_40_n_0),
        .O(s0t_mul16_bh[0]));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_albh_reg_i_17
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_albh_reg_i_41_n_0),
        .I4(s0t_nlza[0]),
        .I5(s0o_fract32_ahbl_reg_i_51_n_0),
        .O(s0o_fract32_albh_reg_i_17_n_0));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_albh_reg_i_18
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_albh_reg_i_42_n_0),
        .I4(s0t_nlza[0]),
        .I5(s0o_fract32_albh_reg_i_41_n_0),
        .O(s0o_fract32_albh_reg_i_18_n_0));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_albh_reg_i_19
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_albh_reg_i_43_n_0),
        .I4(s0t_nlza[0]),
        .I5(s0o_fract32_albh_reg_i_42_n_0),
        .O(s0o_fract32_albh_reg_i_19_n_0));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_albh_reg_i_2
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_albh_reg_i_27_n_0),
        .I4(s0t_nlzb[0]),
        .I5(s0o_fract32_albh_reg_i_25_n_0),
        .O(s0t_mul16_bh[14]));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_albh_reg_i_20
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_albh_reg_i_44_n_0),
        .I4(s0t_nlza[0]),
        .I5(s0o_fract32_albh_reg_i_43_n_0),
        .O(s0o_fract32_albh_reg_i_20_n_0));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_albh_reg_i_21
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_albh_reg_i_45_n_0),
        .I4(s0t_nlza[0]),
        .I5(s0o_fract32_albh_reg_i_44_n_0),
        .O(s0o_fract32_albh_reg_i_21_n_0));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_albh_reg_i_22
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_albh_reg_i_46_n_0),
        .I4(s0t_nlza[0]),
        .I5(s0o_fract32_albh_reg_i_45_n_0),
        .O(s0o_fract32_albh_reg_i_22_n_0));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_albh_reg_i_23
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_albh_reg_i_47_n_0),
        .I4(s0t_nlza[0]),
        .I5(s0o_fract32_albh_reg_i_46_n_0),
        .O(s0o_fract32_albh_reg_i_23_n_0));
  LUT5 #(
    .INIT(32'h00000200)) 
    s0o_fract32_albh_reg_i_24
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_albh_reg_i_47_n_0),
        .I4(s0t_nlza[0]),
        .O(s0o_fract32_albh_reg_i_24_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_albh_reg_i_25
       (.I0(s0o_fract32_albh_reg_i_48_n_0),
        .I1(s0o_fract32_albh_reg_i_49_n_0),
        .I2(s0t_nlzb[1]),
        .I3(s0o_fract32_albh_reg_i_50_n_0),
        .I4(s0t_nlzb[2]),
        .I5(s0o_fract32_albh_reg_i_51_n_0),
        .O(s0o_fract32_albh_reg_i_25_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_albh_reg_i_26
       (.I0(s0o_fract32_albh_reg_i_52_n_0),
        .I1(s0o_fract32_albh_reg_i_53_n_0),
        .I2(s0t_nlzb[1]),
        .I3(s0o_fract32_albh_reg_i_54_n_0),
        .I4(s0t_nlzb[2]),
        .I5(s0o_fract32_albh_reg_i_55_n_0),
        .O(s0o_fract32_albh_reg_i_26_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_albh_reg_i_27
       (.I0(s0o_fract32_albh_reg_i_56_n_0),
        .I1(s0o_fract32_albh_reg_i_54_n_0),
        .I2(s0t_nlzb[1]),
        .I3(s0o_fract32_albh_reg_i_52_n_0),
        .I4(s0t_nlzb[2]),
        .I5(s0o_fract32_albh_reg_i_53_n_0),
        .O(s0o_fract32_albh_reg_i_27_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_albh_reg_i_28
       (.I0(s0o_fract32_albh_reg_i_57_n_0),
        .I1(s0o_fract32_albh_reg_i_50_n_0),
        .I2(s0t_nlzb[1]),
        .I3(s0o_fract32_albh_reg_i_48_n_0),
        .I4(s0t_nlzb[2]),
        .I5(s0o_fract32_albh_reg_i_49_n_0),
        .O(s0o_fract32_albh_reg_i_28_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_albh_reg_i_29
       (.I0(s0o_fract32_albh_reg_i_58_n_0),
        .I1(s0o_fract32_albh_reg_i_52_n_0),
        .I2(s0t_nlzb[1]),
        .I3(s0o_fract32_albh_reg_i_56_n_0),
        .I4(s0t_nlzb[2]),
        .I5(s0o_fract32_albh_reg_i_54_n_0),
        .O(s0o_fract32_albh_reg_i_29_n_0));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_albh_reg_i_3
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_albh_reg_i_28_n_0),
        .I4(s0t_nlzb[0]),
        .I5(s0o_fract32_albh_reg_i_27_n_0),
        .O(s0t_mul16_bh[13]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_albh_reg_i_30
       (.I0(s0o_fract32_albh_reg_i_59_n_0),
        .I1(s0o_fract32_albh_reg_i_48_n_0),
        .I2(s0t_nlzb[1]),
        .I3(s0o_fract32_albh_reg_i_57_n_0),
        .I4(s0t_nlzb[2]),
        .I5(s0o_fract32_albh_reg_i_50_n_0),
        .O(s0o_fract32_albh_reg_i_30_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_albh_reg_i_31
       (.I0(s0o_fract32_albh_reg_i_60_n_0),
        .I1(s0o_fract32_albh_reg_i_56_n_0),
        .I2(s0t_nlzb[1]),
        .I3(s0o_fract32_albh_reg_i_58_n_0),
        .I4(s0t_nlzb[2]),
        .I5(s0o_fract32_albh_reg_i_52_n_0),
        .O(s0o_fract32_albh_reg_i_31_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_albh_reg_i_32
       (.I0(s0o_fract32_albh_reg_i_61_n_0),
        .I1(s0o_fract32_albh_reg_i_57_n_0),
        .I2(s0t_nlzb[1]),
        .I3(s0o_fract32_albh_reg_i_59_n_0),
        .I4(s0t_nlzb[2]),
        .I5(s0o_fract32_albh_reg_i_48_n_0),
        .O(s0o_fract32_albh_reg_i_32_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_albh_reg_i_33
       (.I0(s0o_fract32_albh_reg_i_62_n_0),
        .I1(s0o_fract32_albh_reg_i_58_n_0),
        .I2(s0t_nlzb[1]),
        .I3(s0o_fract32_albh_reg_i_60_n_0),
        .I4(s0t_nlzb[2]),
        .I5(s0o_fract32_albh_reg_i_56_n_0),
        .O(s0o_fract32_albh_reg_i_33_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_albh_reg_i_34
       (.I0(s0o_fract32_albh_reg_i_63_n_0),
        .I1(s0o_fract32_albh_reg_i_59_n_0),
        .I2(s0t_nlzb[1]),
        .I3(s0o_fract32_albh_reg_i_61_n_0),
        .I4(s0t_nlzb[2]),
        .I5(s0o_fract32_albh_reg_i_57_n_0),
        .O(s0o_fract32_albh_reg_i_34_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_albh_reg_i_35
       (.I0(s0o_fract32_ahbl_reg_i_65_n_0),
        .I1(s0o_fract32_albh_reg_i_60_n_0),
        .I2(s0t_nlzb[1]),
        .I3(s0o_fract32_albh_reg_i_62_n_0),
        .I4(s0t_nlzb[2]),
        .I5(s0o_fract32_albh_reg_i_58_n_0),
        .O(s0o_fract32_albh_reg_i_35_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_albh_reg_i_36
       (.I0(s0o_fract32_ahbl_reg_i_57_n_0),
        .I1(s0o_fract32_albh_reg_i_61_n_0),
        .I2(s0t_nlzb[1]),
        .I3(s0o_fract32_albh_reg_i_63_n_0),
        .I4(s0t_nlzb[2]),
        .I5(s0o_fract32_albh_reg_i_59_n_0),
        .O(s0o_fract32_albh_reg_i_36_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_albh_reg_i_37
       (.I0(s0o_fract32_ahbl_reg_i_63_n_0),
        .I1(s0o_fract32_albh_reg_i_62_n_0),
        .I2(s0t_nlzb[1]),
        .I3(s0o_fract32_ahbl_reg_i_65_n_0),
        .I4(s0t_nlzb[2]),
        .I5(s0o_fract32_albh_reg_i_60_n_0),
        .O(s0o_fract32_albh_reg_i_37_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_albh_reg_i_38
       (.I0(s0o_fract32_ahbl_reg_i_53_n_0),
        .I1(s0o_fract32_albh_reg_i_63_n_0),
        .I2(s0t_nlzb[1]),
        .I3(s0o_fract32_ahbl_reg_i_57_n_0),
        .I4(s0t_nlzb[2]),
        .I5(s0o_fract32_albh_reg_i_61_n_0),
        .O(s0o_fract32_albh_reg_i_38_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_albh_reg_i_39
       (.I0(s0o_fract32_ahbl_reg_i_64_n_0),
        .I1(s0o_fract32_ahbl_reg_i_65_n_0),
        .I2(s0t_nlzb[1]),
        .I3(s0o_fract32_ahbl_reg_i_63_n_0),
        .I4(s0t_nlzb[2]),
        .I5(s0o_fract32_albh_reg_i_62_n_0),
        .O(s0o_fract32_albh_reg_i_39_n_0));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_albh_reg_i_4
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_albh_reg_i_29_n_0),
        .I4(s0t_nlzb[0]),
        .I5(s0o_fract32_albh_reg_i_28_n_0),
        .O(s0t_mul16_bh[12]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_albh_reg_i_40
       (.I0(s0o_fract32_ahbl_reg_i_55_n_0),
        .I1(s0o_fract32_ahbl_reg_i_57_n_0),
        .I2(s0t_nlzb[1]),
        .I3(s0o_fract32_ahbl_reg_i_53_n_0),
        .I4(s0t_nlzb[2]),
        .I5(s0o_fract32_albh_reg_i_63_n_0),
        .O(s0o_fract32_albh_reg_i_40_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    s0o_fract32_albh_reg_i_41
       (.I0(s0o_fract32_albh_reg_i_64_n_0),
        .I1(s0o_fract32_ahbl_reg_i_99_n_0),
        .I2(s0t_nlza[1]),
        .I3(s0o_fract32_ahbl_reg_i_101_n_0),
        .I4(s0t_nlza[2]),
        .I5(s0o_fract32_ahbl_reg_i_97_n_0),
        .O(s0o_fract32_albh_reg_i_41_n_0));
  LUT6 #(
    .INIT(64'h0000000030BB3088)) 
    s0o_fract32_albh_reg_i_42
       (.I0(s0o_fract32_albh_reg_i_65_n_0),
        .I1(s0t_nlza[1]),
        .I2(s0o_fract32_albh_reg_i_66_n_0),
        .I3(s0t_nlza[2]),
        .I4(s0o_fract32_albh_reg_i_67_n_0),
        .I5(s0t_nlza[3]),
        .O(s0o_fract32_albh_reg_i_42_n_0));
  LUT6 #(
    .INIT(64'h0000000030BB3088)) 
    s0o_fract32_albh_reg_i_43
       (.I0(s0o_fract32_albh_reg_i_69_n_0),
        .I1(s0t_nlza[1]),
        .I2(s0o_fract32_albh_reg_i_70_n_0),
        .I3(s0t_nlza[2]),
        .I4(s0o_fract32_albh_reg_i_71_n_0),
        .I5(s0t_nlza[3]),
        .O(s0o_fract32_albh_reg_i_43_n_0));
  LUT6 #(
    .INIT(64'h0000000000000B08)) 
    s0o_fract32_albh_reg_i_44
       (.I0(fract24a_i_IBUF[1]),
        .I1(s0t_nlza[1]),
        .I2(s0t_nlza[3]),
        .I3(fract24a_i_IBUF[3]),
        .I4(s0t_nlza[4]),
        .I5(s0t_nlza[2]),
        .O(s0o_fract32_albh_reg_i_44_n_0));
  LUT6 #(
    .INIT(64'h0000000000000B08)) 
    s0o_fract32_albh_reg_i_45
       (.I0(fract24a_i_IBUF[0]),
        .I1(s0t_nlza[1]),
        .I2(s0t_nlza[3]),
        .I3(fract24a_i_IBUF[2]),
        .I4(s0t_nlza[4]),
        .I5(s0t_nlza[2]),
        .O(s0o_fract32_albh_reg_i_45_n_0));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    s0o_fract32_albh_reg_i_46
       (.I0(s0t_nlza[2]),
        .I1(s0t_nlza[4]),
        .I2(fract24a_i_IBUF[1]),
        .I3(s0t_nlza[3]),
        .I4(s0t_nlza[1]),
        .O(s0o_fract32_albh_reg_i_46_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    s0o_fract32_albh_reg_i_47
       (.I0(s0t_nlza[2]),
        .I1(s0t_nlza[4]),
        .I2(fract24a_i_IBUF[0]),
        .I3(s0t_nlza[3]),
        .I4(s0t_nlza[1]),
        .O(s0o_fract32_albh_reg_i_47_n_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    s0o_fract32_albh_reg_i_48
       (.I0(fract24b_i_IBUF[8]),
        .I1(s0t_nlzb[3]),
        .I2(fract24b_i_IBUF[0]),
        .I3(s0t_nlzb[4]),
        .I4(fract24b_i_IBUF[16]),
        .O(s0o_fract32_albh_reg_i_48_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    s0o_fract32_albh_reg_i_49
       (.I0(fract24b_i_IBUF[12]),
        .I1(s0t_nlzb[3]),
        .I2(fract24b_i_IBUF[4]),
        .I3(s0t_nlzb[4]),
        .I4(fract24b_i_IBUF[20]),
        .O(s0o_fract32_albh_reg_i_49_n_0));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_albh_reg_i_5
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_albh_reg_i_30_n_0),
        .I4(s0t_nlzb[0]),
        .I5(s0o_fract32_albh_reg_i_29_n_0),
        .O(s0t_mul16_bh[11]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    s0o_fract32_albh_reg_i_50
       (.I0(fract24b_i_IBUF[10]),
        .I1(s0t_nlzb[3]),
        .I2(fract24b_i_IBUF[2]),
        .I3(s0t_nlzb[4]),
        .I4(fract24b_i_IBUF[18]),
        .O(s0o_fract32_albh_reg_i_50_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    s0o_fract32_albh_reg_i_51
       (.I0(fract24b_i_IBUF[14]),
        .I1(s0t_nlzb[3]),
        .I2(fract24b_i_IBUF[6]),
        .I3(s0t_nlzb[4]),
        .I4(fract24b_i_IBUF[22]),
        .O(s0o_fract32_albh_reg_i_51_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    s0o_fract32_albh_reg_i_52
       (.I0(fract24b_i_IBUF[9]),
        .I1(s0t_nlzb[3]),
        .I2(fract24b_i_IBUF[1]),
        .I3(s0t_nlzb[4]),
        .I4(fract24b_i_IBUF[17]),
        .O(s0o_fract32_albh_reg_i_52_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    s0o_fract32_albh_reg_i_53
       (.I0(fract24b_i_IBUF[13]),
        .I1(s0t_nlzb[3]),
        .I2(fract24b_i_IBUF[5]),
        .I3(s0t_nlzb[4]),
        .I4(fract24b_i_IBUF[21]),
        .O(s0o_fract32_albh_reg_i_53_n_0));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    s0o_fract32_albh_reg_i_54
       (.I0(fract24b_i_IBUF[11]),
        .I1(s0t_nlzb[3]),
        .I2(fract24b_i_IBUF[3]),
        .I3(s0t_nlzb[4]),
        .I4(fract24b_i_IBUF[19]),
        .O(s0o_fract32_albh_reg_i_54_n_0));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    s0o_fract32_albh_reg_i_55
       (.I0(fract24b_i_IBUF[15]),
        .I1(s0t_nlzb[3]),
        .I2(fract24b_i_IBUF[7]),
        .I3(s0t_nlzb[4]),
        .I4(fract24b_i_IBUF[23]),
        .O(s0o_fract32_albh_reg_i_55_n_0));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    s0o_fract32_albh_reg_i_56
       (.I0(fract24b_i_IBUF[7]),
        .I1(s0t_nlzb[3]),
        .I2(fract24b_i_IBUF[15]),
        .I3(s0t_nlzb[4]),
        .O(s0o_fract32_albh_reg_i_56_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    s0o_fract32_albh_reg_i_57
       (.I0(fract24b_i_IBUF[6]),
        .I1(s0t_nlzb[3]),
        .I2(fract24b_i_IBUF[14]),
        .I3(s0t_nlzb[4]),
        .O(s0o_fract32_albh_reg_i_57_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    s0o_fract32_albh_reg_i_58
       (.I0(fract24b_i_IBUF[5]),
        .I1(s0t_nlzb[3]),
        .I2(fract24b_i_IBUF[13]),
        .I3(s0t_nlzb[4]),
        .O(s0o_fract32_albh_reg_i_58_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    s0o_fract32_albh_reg_i_59
       (.I0(fract24b_i_IBUF[4]),
        .I1(s0t_nlzb[3]),
        .I2(fract24b_i_IBUF[12]),
        .I3(s0t_nlzb[4]),
        .O(s0o_fract32_albh_reg_i_59_n_0));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_albh_reg_i_6
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_albh_reg_i_31_n_0),
        .I4(s0t_nlzb[0]),
        .I5(s0o_fract32_albh_reg_i_30_n_0),
        .O(s0t_mul16_bh[10]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    s0o_fract32_albh_reg_i_60
       (.I0(fract24b_i_IBUF[3]),
        .I1(s0t_nlzb[3]),
        .I2(fract24b_i_IBUF[11]),
        .I3(s0t_nlzb[4]),
        .O(s0o_fract32_albh_reg_i_60_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    s0o_fract32_albh_reg_i_61
       (.I0(fract24b_i_IBUF[2]),
        .I1(s0t_nlzb[3]),
        .I2(fract24b_i_IBUF[10]),
        .I3(s0t_nlzb[4]),
        .O(s0o_fract32_albh_reg_i_61_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    s0o_fract32_albh_reg_i_62
       (.I0(fract24b_i_IBUF[1]),
        .I1(s0t_nlzb[3]),
        .I2(fract24b_i_IBUF[9]),
        .I3(s0t_nlzb[4]),
        .O(s0o_fract32_albh_reg_i_62_n_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    s0o_fract32_albh_reg_i_63
       (.I0(fract24b_i_IBUF[0]),
        .I1(s0t_nlzb[3]),
        .I2(fract24b_i_IBUF[8]),
        .I3(s0t_nlzb[4]),
        .O(s0o_fract32_albh_reg_i_63_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h04)) 
    s0o_fract32_albh_reg_i_64
       (.I0(s0t_nlza[4]),
        .I1(fract24a_i_IBUF[0]),
        .I2(s0t_nlza[3]),
        .O(s0o_fract32_albh_reg_i_64_n_0));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT2 #(
    .INIT(4'h2)) 
    s0o_fract32_albh_reg_i_65
       (.I0(fract24a_i_IBUF[3]),
        .I1(s0t_nlza[4]),
        .O(s0o_fract32_albh_reg_i_65_n_0));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT2 #(
    .INIT(4'h2)) 
    s0o_fract32_albh_reg_i_66
       (.I0(fract24a_i_IBUF[1]),
        .I1(s0t_nlza[4]),
        .O(s0o_fract32_albh_reg_i_66_n_0));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT2 #(
    .INIT(4'h2)) 
    s0o_fract32_albh_reg_i_67
       (.I0(fract24a_i_IBUF[5]),
        .I1(s0t_nlza[4]),
        .O(s0o_fract32_albh_reg_i_67_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    s0o_fract32_albh_reg_i_68
       (.I0(fract24a_i_IBUF[15]),
        .I1(fract24a_i_IBUF[14]),
        .I2(fract24a_i_IBUF[12]),
        .I3(fract24a_i_IBUF[13]),
        .I4(s0o_fract32_albh_reg_i_73_n_0),
        .I5(s0o_fract32_albh_reg_i_74_n_0),
        .O(s0t_nlza[3]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'h2)) 
    s0o_fract32_albh_reg_i_69
       (.I0(fract24a_i_IBUF[2]),
        .I1(s0t_nlza[4]),
        .O(s0o_fract32_albh_reg_i_69_n_0));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_albh_reg_i_7
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_albh_reg_i_32_n_0),
        .I4(s0t_nlzb[0]),
        .I5(s0o_fract32_albh_reg_i_31_n_0),
        .O(s0t_mul16_bh[9]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT2 #(
    .INIT(4'h2)) 
    s0o_fract32_albh_reg_i_70
       (.I0(fract24a_i_IBUF[0]),
        .I1(s0t_nlza[4]),
        .O(s0o_fract32_albh_reg_i_70_n_0));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT2 #(
    .INIT(4'h2)) 
    s0o_fract32_albh_reg_i_71
       (.I0(fract24a_i_IBUF[4]),
        .I1(s0t_nlza[4]),
        .O(s0o_fract32_albh_reg_i_71_n_0));
  LUT6 #(
    .INIT(64'h0000FDFF00000000)) 
    s0o_fract32_albh_reg_i_72
       (.I0(s0o_fract32_albh_reg_i_75_n_0),
        .I1(fract24a_i_IBUF[0]),
        .I2(fract24a_i_IBUF[1]),
        .I3(s0o_fract32_albh_reg_i_76_n_0),
        .I4(s0o_fract32_albh_reg_i_77_n_0),
        .I5(s0o_fract32_albh_reg_i_74_n_0),
        .O(s0t_nlza[4]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    s0o_fract32_albh_reg_i_73
       (.I0(fract24a_i_IBUF[10]),
        .I1(fract24a_i_IBUF[11]),
        .I2(fract24a_i_IBUF[9]),
        .I3(fract24a_i_IBUF[8]),
        .O(s0o_fract32_albh_reg_i_73_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h00000002)) 
    s0o_fract32_albh_reg_i_74
       (.I0(s0o_fract32_albh_reg_i_78_n_0),
        .I1(fract24a_i_IBUF[17]),
        .I2(fract24a_i_IBUF[16]),
        .I3(fract24a_i_IBUF[19]),
        .I4(fract24a_i_IBUF[18]),
        .O(s0o_fract32_albh_reg_i_74_n_0));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    s0o_fract32_albh_reg_i_75
       (.I0(fract24a_i_IBUF[7]),
        .I1(fract24a_i_IBUF[6]),
        .I2(fract24a_i_IBUF[4]),
        .I3(fract24a_i_IBUF[5]),
        .O(s0o_fract32_albh_reg_i_75_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    s0o_fract32_albh_reg_i_76
       (.I0(fract24a_i_IBUF[2]),
        .I1(fract24a_i_IBUF[3]),
        .O(s0o_fract32_albh_reg_i_76_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    s0o_fract32_albh_reg_i_77
       (.I0(fract24a_i_IBUF[13]),
        .I1(fract24a_i_IBUF[12]),
        .I2(fract24a_i_IBUF[15]),
        .I3(fract24a_i_IBUF[14]),
        .I4(s0o_fract32_albh_reg_i_73_n_0),
        .O(s0o_fract32_albh_reg_i_77_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    s0o_fract32_albh_reg_i_78
       (.I0(fract24a_i_IBUF[23]),
        .I1(fract24a_i_IBUF[22]),
        .I2(fract24a_i_IBUF[20]),
        .I3(fract24a_i_IBUF[21]),
        .O(s0o_fract32_albh_reg_i_78_n_0));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_albh_reg_i_8
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_albh_reg_i_33_n_0),
        .I4(s0t_nlzb[0]),
        .I5(s0o_fract32_albh_reg_i_32_n_0),
        .O(s0t_mul16_bh[8]));
  LUT6 #(
    .INIT(64'h0200020202000000)) 
    s0o_fract32_albh_reg_i_9
       (.I0(start_i_IBUF),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0o_fract32_albh_reg_i_34_n_0),
        .I4(s0t_nlzb[0]),
        .I5(s0o_fract32_albh_reg_i_33_n_0),
        .O(s0t_mul16_bh[7]));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-12 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(0),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    s0o_fract32_albl_reg
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s0o_fract32_albh_reg_i_17_n_0,s0o_fract32_albh_reg_i_18_n_0,s0o_fract32_albh_reg_i_19_n_0,s0o_fract32_albh_reg_i_20_n_0,s0o_fract32_albh_reg_i_21_n_0,s0o_fract32_albh_reg_i_22_n_0,s0o_fract32_albh_reg_i_23_n_0,s0o_fract32_albh_reg_i_24_n_0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_s0o_fract32_albl_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,s0o_fract32_ahbl_reg_i_1_n_0,s0o_fract32_ahbl_reg_i_2_n_0,s0o_fract32_ahbl_reg_i_3_n_0,s0o_fract32_ahbl_reg_i_4_n_0,s0o_fract32_ahbl_reg_i_5_n_0,s0o_fract32_ahbl_reg_i_6_n_0,s0o_fract32_ahbl_reg_i_7_n_0,s0o_fract32_ahbl_reg_i_8_n_0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_s0o_fract32_albl_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_s0o_fract32_albl_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_s0o_fract32_albl_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_s0o_fract32_albl_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_s0o_fract32_albl_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_s0o_fract32_albl_reg_P_UNCONNECTED[47:32],p_0_in2_in,s0o_fract32_albl_reg_n_90,s0o_fract32_albl_reg_n_91,s0o_fract32_albl_reg_n_92,s0o_fract32_albl_reg_n_93,s0o_fract32_albl_reg_n_94,s0o_fract32_albl_reg_n_95,s0o_fract32_albl_reg_n_96,s0o_fract32_albl_reg_n_97,s0o_fract32_albl_reg_n_98,s0o_fract32_albl_reg_n_99,s0o_fract32_albl_reg_n_100,s0o_fract32_albl_reg_n_101,s0o_fract32_albl_reg_n_102,s0o_fract32_albl_reg_n_103,s0o_fract32_albl_reg_n_104,s0o_fract32_albl_reg_n_105}),
        .PATTERNBDETECT(NLW_s0o_fract32_albl_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_s0o_fract32_albl_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_s0o_fract32_albl_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_s0o_fract32_albl_reg_UNDERFLOW_UNCONNECTED));
  FDRE #(
    .INIT(1'b0)) 
    s0o_ready_reg
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(start_i_IBUF),
        .Q(s0o_ready),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'h00010301)) 
    \s0o_shrx[0]_i_1 
       (.I0(s0t_exp10c_00),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0t_exp10mux[9]),
        .I4(s0t_exp10mux[0]),
        .O(\s0o_shrx[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF0302)) 
    \s0o_shrx[0]_i_2 
       (.I0(s0t_exp10mux[1]),
        .I1(zerob_i_IBUF),
        .I2(zeroa_i_IBUF),
        .I3(s0t_exp10mux[0]),
        .I4(\s0o_shrx[0]_i_3_n_0 ),
        .I5(\s0o_shrx[0]_i_4_n_0 ),
        .O(s0t_exp10c_00));
  LUT6 #(
    .INIT(64'h000000FF000000FE)) 
    \s0o_shrx[0]_i_3 
       (.I0(s0t_exp10mux[7]),
        .I1(s0t_exp10mux[6]),
        .I2(s0t_exp10mux[9]),
        .I3(zerob_i_IBUF),
        .I4(zeroa_i_IBUF),
        .I5(s0t_exp10mux[8]),
        .O(\s0o_shrx[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h000000FF000000FE)) 
    \s0o_shrx[0]_i_4 
       (.I0(s0t_exp10mux[3]),
        .I1(s0t_exp10mux[2]),
        .I2(s0t_exp10mux[5]),
        .I3(zerob_i_IBUF),
        .I4(zeroa_i_IBUF),
        .I5(s0t_exp10mux[4]),
        .O(\s0o_shrx[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \s0o_shrx[1]_i_1 
       (.I0(s0t_exp10mux[1]),
        .I1(zerob_i_IBUF),
        .I2(zeroa_i_IBUF),
        .I3(s0t_exp10mux[9]),
        .O(\s0o_shrx[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h01020000)) 
    \s0o_shrx[2]_i_1 
       (.I0(s0t_exp10mux[1]),
        .I1(zeroa_i_IBUF),
        .I2(zerob_i_IBUF),
        .I3(s0t_exp10mux[2]),
        .I4(s0t_exp10mux[9]),
        .O(\s0o_shrx[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0001000E00000000)) 
    \s0o_shrx[3]_i_1 
       (.I0(s0t_exp10mux[1]),
        .I1(s0t_exp10mux[2]),
        .I2(zeroa_i_IBUF),
        .I3(zerob_i_IBUF),
        .I4(s0t_exp10mux[3]),
        .I5(s0t_exp10mux[9]),
        .O(\s0o_shrx[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFC080C0C0)) 
    \s0o_shrx[4]_i_1 
       (.I0(\s0o_shrx[4]_i_3_n_0 ),
        .I1(s0t_exp10mux[9]),
        .I2(\s0o_shrx[4]_i_4_n_0 ),
        .I3(\s0o_shrx[4]_i_5_n_0 ),
        .I4(s0t_exp10mux[8]),
        .I5(\s0o_shrx[4]_i_6_n_0 ),
        .O(\s0o_shrx[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0100FE0000000000)) 
    \s0o_shrx[4]_i_2 
       (.I0(s0t_exp10mux[3]),
        .I1(s0t_exp10mux[2]),
        .I2(s0t_exp10mux[1]),
        .I3(\s0o_shrx[4]_i_4_n_0 ),
        .I4(s0t_exp10mux[4]),
        .I5(s0t_exp10mux[9]),
        .O(\s0o_shrx[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00010000FFFE0000)) 
    \s0o_shrx[4]_i_3 
       (.I0(s0t_exp10mux[4]),
        .I1(s0t_exp10mux[1]),
        .I2(s0t_exp10mux[2]),
        .I3(s0t_exp10mux[3]),
        .I4(\s0o_shrx[4]_i_4_n_0 ),
        .I5(s0t_exp10mux[5]),
        .O(\s0o_shrx[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \s0o_shrx[4]_i_4 
       (.I0(zeroa_i_IBUF),
        .I1(zerob_i_IBUF),
        .O(\s0o_shrx[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hCCCCCC00CCCCCC04)) 
    \s0o_shrx[4]_i_5 
       (.I0(s0t_exp10mux[6]),
        .I1(\s0o_shrx[4]_i_7_n_0 ),
        .I2(s0t_exp10mux[5]),
        .I3(zeroa_i_IBUF),
        .I4(zerob_i_IBUF),
        .I5(s0t_exp10mux[7]),
        .O(\s0o_shrx[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h000A00020008000A)) 
    \s0o_shrx[4]_i_6 
       (.I0(s0t_exp10mux[9]),
        .I1(s0t_exp10mux[7]),
        .I2(zerob_i_IBUF),
        .I3(zeroa_i_IBUF),
        .I4(\s0o_shrx[4]_i_8_n_0 ),
        .I5(s0t_exp10mux[6]),
        .O(\s0o_shrx[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF00FFFFFF01)) 
    \s0o_shrx[4]_i_7 
       (.I0(s0t_exp10mux[3]),
        .I1(s0t_exp10mux[2]),
        .I2(s0t_exp10mux[1]),
        .I3(zeroa_i_IBUF),
        .I4(zerob_i_IBUF),
        .I5(s0t_exp10mux[4]),
        .O(\s0o_shrx[4]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0000FFFF0001FFFF)) 
    \s0o_shrx[4]_i_8 
       (.I0(s0t_exp10mux[4]),
        .I1(s0t_exp10mux[1]),
        .I2(s0t_exp10mux[2]),
        .I3(s0t_exp10mux[3]),
        .I4(\s0o_shrx[4]_i_4_n_0 ),
        .I5(s0t_exp10mux[5]),
        .O(\s0o_shrx[4]_i_8_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \s0o_shrx_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s0o_shrx[0]_i_1_n_0 ),
        .Q(s0o_shrx[0]),
        .S(\s0o_shrx[4]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \s0o_shrx_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s0o_shrx[1]_i_1_n_0 ),
        .Q(s0o_shrx[1]),
        .S(\s0o_shrx[4]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \s0o_shrx_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s0o_shrx[2]_i_1_n_0 ),
        .Q(s0o_shrx[2]),
        .S(\s0o_shrx[4]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \s0o_shrx_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s0o_shrx[3]_i_1_n_0 ),
        .Q(s0o_shrx[3]),
        .S(\s0o_shrx[4]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \s0o_shrx_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s0o_shrx[4]_i_2_n_0 ),
        .Q(s0o_shrx[4]),
        .S(\s0o_shrx[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'h8)) 
    s1o_carry_i_1
       (.I0(s0o_ready),
        .I1(fract48__0_carry__10_n_4),
        .O(s1o_carry_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s1o_carry_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1o_carry_i_1_n_0),
        .Q(s1o_carry),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10sh0_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0o_exp10sh0[0]),
        .Q(\s1o_exp10sh0_reg[9]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10sh0_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0o_exp10sh0[1]),
        .Q(\s1o_exp10sh0_reg[9]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10sh0_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0o_exp10sh0[2]),
        .Q(\s1o_exp10sh0_reg[9]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10sh0_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0o_exp10sh0[3]),
        .Q(\s1o_exp10sh0_reg[9]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10sh0_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0o_exp10sh0[4]),
        .Q(\s1o_exp10sh0_reg[9]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10sh0_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0o_exp10sh0[5]),
        .Q(\s1o_exp10sh0_reg[9]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10sh0_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0o_exp10sh0[6]),
        .Q(\s1o_exp10sh0_reg[9]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10sh0_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0o_exp10sh0[7]),
        .Q(\s1o_exp10sh0_reg[9]_0 [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10sh0_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0o_exp10sh0[8]),
        .Q(\s1o_exp10sh0_reg[9]_0 [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10sh0_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0o_exp10sh0[9]),
        .Q(\s1o_exp10sh0_reg[9]_0 [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10shr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0o_exp10shr[0]),
        .Q(\s1o_exp10shr_reg[8]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10shr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0o_exp10shr[1]),
        .Q(\s1o_exp10shr_reg[8]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10shr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0o_exp10shr[2]),
        .Q(\s1o_exp10shr_reg[8]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10shr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0o_exp10shr[3]),
        .Q(\s1o_exp10shr_reg[8]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10shr_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0o_exp10shr[4]),
        .Q(\s1o_exp10shr_reg[8]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10shr_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0o_exp10shr[5]),
        .Q(\s1o_exp10shr_reg[8]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10shr_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0o_exp10shr[6]),
        .Q(\s1o_exp10shr_reg[8]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10shr_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0o_exp10shr[7]),
        .Q(\s1o_exp10shr_reg[8]_0 [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10shr_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s0o_exp10shr[8]),
        .Q(\s1o_exp10shr_reg[8]_0 [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[10]),
        .Q(Q[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[11]),
        .Q(Q[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[12]),
        .Q(Q[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[13]),
        .Q(Q[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[14]),
        .Q(Q[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[15]),
        .Q(Q[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[16]),
        .Q(Q[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[17]),
        .Q(Q[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[18]),
        .Q(Q[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[19]),
        .Q(Q[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[20]),
        .Q(Q[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[21]),
        .Q(Q[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[22]),
        .Q(Q[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[23]),
        .Q(Q[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[24]),
        .Q(Q[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[25]),
        .Q(Q[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[26]),
        .Q(Q[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(fract48__0_carry__10_n_4),
        .Q(Q[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[2]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[3]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[4]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[5]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[6]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[7]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[8]),
        .Q(Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_fract35[9]),
        .Q(Q[7]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h000000E2)) 
    s1o_ready_i_1__0
       (.I0(s1o_ready),
        .I1(adv_i_IBUF),
        .I2(s0o_ready),
        .I3(rst_IBUF),
        .I4(flush_i_IBUF),
        .O(s1o_ready_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s1o_ready_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1o_ready_i_1__0_n_0),
        .Q(s1o_ready),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAA00AB00AA00AA00)) 
    \s1o_shr[0]_i_1 
       (.I0(s0o_shrx[0]),
        .I1(\s1o_shr[0]_i_2_n_0 ),
        .I2(s0o_shrx[3]),
        .I3(s0o_ready),
        .I4(s0o_shrx[4]),
        .I5(fract48__0_carry__10_n_4),
        .O(s1t_shr));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \s1o_shr[0]_i_2 
       (.I0(s0o_shrx[1]),
        .I1(s0o_shrx[2]),
        .O(\s1o_shr[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_shr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_shr),
        .Q(s1o_shr),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s1o_shr_t[0]_i_1 
       (.I0(s0o_shrx[0]),
        .I1(s0o_ready),
        .O(s1t_shr_t[0]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s1o_shr_t[1]_i_1 
       (.I0(s0o_shrx[1]),
        .I1(s0o_ready),
        .O(s1t_shr_t[1]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s1o_shr_t[2]_i_1 
       (.I0(s0o_shrx[2]),
        .I1(s0o_ready),
        .O(s1t_shr_t[2]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s1o_shr_t[3]_i_1 
       (.I0(s0o_shrx[3]),
        .I1(s0o_ready),
        .O(s1t_shr_t[3]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s1o_shr_t[4]_i_1 
       (.I0(s0o_shrx[4]),
        .I1(s0o_ready),
        .O(s1t_shr_t[4]));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_shr_t_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_shr_t[0]),
        .Q(s1o_shr_t[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_shr_t_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_shr_t[1]),
        .Q(s1o_shr_t[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_shr_t_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_shr_t[2]),
        .Q(s1o_shr_t[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_shr_t_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_shr_t[3]),
        .Q(s1o_shr_t[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_shr_t_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1t_shr_t[4]),
        .Q(s1o_shr_t[4]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    s1o_sticky_l_i_1
       (.I0(s1o_sticky_l_i_2_n_0),
        .I1(s1o_sticky_l_i_3_n_0),
        .I2(s1o_sticky_l_i_4_n_0),
        .I3(s1o_sticky_l_i_5_n_0),
        .O(s1o_sticky_l_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    s1o_sticky_l_i_2
       (.I0(fract48__0_carry__0_n_4),
        .I1(fract48__0_carry__1_n_7),
        .I2(fract48__0_carry__0_n_6),
        .I3(fract48__0_carry__0_n_5),
        .I4(fract48__0_carry__0_n_7),
        .I5(fract48__0_carry_n_4),
        .O(s1o_sticky_l_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    s1o_sticky_l_i_3
       (.I0(fract48__0_carry__2_n_6),
        .I1(s1t_fract35__0),
        .I2(fract48__0_carry__1_n_4),
        .I3(fract48__0_carry__2_n_7),
        .I4(fract48__0_carry__1_n_5),
        .I5(fract48__0_carry__1_n_6),
        .O(s1o_sticky_l_i_3_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    s1o_sticky_l_i_4
       (.I0(fract48__0_carry__2_n_4),
        .I1(fract48__0_carry__2_n_5),
        .I2(fract48__0_carry__3_n_6),
        .I3(fract48__0_carry__3_n_7),
        .O(s1o_sticky_l_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    s1o_sticky_l_i_5
       (.I0(fract48__0_carry_n_6),
        .I1(fract48__0_carry_n_5),
        .I2(fract48__0_carry__4_n_7),
        .I3(fract48__0_carry_n_7),
        .I4(fract48__0_carry__3_n_4),
        .I5(fract48__0_carry__3_n_5),
        .O(s1o_sticky_l_i_5_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s1o_sticky_l_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1o_sticky_l_i_1_n_0),
        .Q(s1o_sticky_l),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    s1o_sticky_r_i_1
       (.I0(s1o_sticky_r_i_2_n_0),
        .I1(s1o_sticky_r_i_3_n_0),
        .I2(s1o_sticky_r_i_4_n_0),
        .I3(s1o_sticky_r_i_5_n_0),
        .I4(s1o_sticky_r_i_6_n_0),
        .I5(s1o_sticky_r_i_7_n_0),
        .O(s1r_sticky));
  LUT6 #(
    .INIT(64'hFFFF8080FF808080)) 
    s1o_sticky_r_i_10
       (.I0(s1t_fract35[3]),
        .I1(s0o_ready),
        .I2(\s1o_shr[0]_i_2_n_0 ),
        .I3(s1t_fract35[25]),
        .I4(s1o_sticky_r_i_21_n_0),
        .I5(s1o_sticky_r_i_22_n_0),
        .O(s1o_sticky_r_i_10_n_0));
  LUT6 #(
    .INIT(64'hFFF8000088880000)) 
    s1o_sticky_r_i_11
       (.I0(s1t_fract35[18]),
        .I1(s0o_shrx[3]),
        .I2(s1t_fract35[20]),
        .I3(s1t_fract35[21]),
        .I4(s1t_shr_t[4]),
        .I5(s0o_shrx[2]),
        .O(s1o_sticky_r_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hC8)) 
    s1o_sticky_r_i_12
       (.I0(s0o_shrx[3]),
        .I1(s0o_ready),
        .I2(s0o_shrx[4]),
        .O(s1o_sticky_r_i_12_n_0));
  LUT6 #(
    .INIT(64'hFEEEEEEEEEEEEEEE)) 
    s1o_sticky_r_i_13
       (.I0(s1o_sticky_r_i_23_n_0),
        .I1(s1o_sticky_r_i_24_n_0),
        .I2(s1t_fract35[8]),
        .I3(s1t_shr_t[2]),
        .I4(s0o_shrx[1]),
        .I5(s0o_shrx[0]),
        .O(s1o_sticky_r_i_13_n_0));
  LUT6 #(
    .INIT(64'hFFAAE0A0EEAAE0A0)) 
    s1o_sticky_r_i_14
       (.I0(s1t_shr_t[4]),
        .I1(s0o_shrx[1]),
        .I2(s1t_fract35[15]),
        .I3(s1o_sticky_r_i_19_n_0),
        .I4(s1t_fract35[14]),
        .I5(s0o_shrx[0]),
        .O(s1o_sticky_r_i_14_n_0));
  LUT6 #(
    .INIT(64'hFF80808000000000)) 
    s1o_sticky_r_i_15
       (.I0(\s1o_shr[0]_i_2_n_0 ),
        .I1(s0o_shrx[3]),
        .I2(s1t_fract35[11]),
        .I3(s1o_sticky_r_i_20_n_0),
        .I4(s1o_sticky_r_i_25_n_0),
        .I5(s0o_ready),
        .O(s1o_sticky_r_i_15_n_0));
  LUT6 #(
    .INIT(64'hFF880000F8880000)) 
    s1o_sticky_r_i_16
       (.I0(s1t_fract35[20]),
        .I1(s1o_sticky_r_i_25_n_0),
        .I2(\s1o_shr[0]_i_2_n_0 ),
        .I3(s1t_fract35[19]),
        .I4(s1t_shr_t[4]),
        .I5(s0o_shrx[3]),
        .O(s1o_sticky_r_i_16_n_0));
  LUT6 #(
    .INIT(64'hFFFFF00088880000)) 
    s1o_sticky_r_i_17
       (.I0(s1t_fract35[18]),
        .I1(s1o_sticky_r_i_26_n_0),
        .I2(s1o_sticky_r_i_25_n_0),
        .I3(s1o_sticky_r_i_19_n_0),
        .I4(s1t_shr_t[4]),
        .I5(s1t_fract35[16]),
        .O(s1o_sticky_r_i_17_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    s1o_sticky_r_i_18
       (.I0(s1o_sticky_r_i_27_n_0),
        .I1(fract48__0_carry__3_n_7),
        .I2(fract48__0_carry__2_n_4),
        .I3(fract48__0_carry__2_n_5),
        .I4(s1o_sticky_r_i_28_n_0),
        .I5(s1o_sticky_r_i_29_n_0),
        .O(s1o_sticky_r_i_18_n_0));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'h80)) 
    s1o_sticky_r_i_19
       (.I0(s0o_ready),
        .I1(s0o_shrx[2]),
        .I2(s0o_shrx[3]),
        .O(s1o_sticky_r_i_19_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFEFFFE)) 
    s1o_sticky_r_i_2
       (.I0(s1o_sticky_r_i_8_n_0),
        .I1(s1o_sticky_r_i_9_n_0),
        .I2(s1o_sticky_r_i_10_n_0),
        .I3(s1o_sticky_r_i_11_n_0),
        .I4(s1t_fract35[17]),
        .I5(s1t_shr_t[4]),
        .O(s1o_sticky_r_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    s1o_sticky_r_i_20
       (.I0(s1t_fract35[12]),
        .I1(s0o_shrx[3]),
        .I2(s1t_fract35[4]),
        .O(s1o_sticky_r_i_20_n_0));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'h80)) 
    s1o_sticky_r_i_21
       (.I0(s0o_ready),
        .I1(s0o_shrx[4]),
        .I2(s0o_shrx[3]),
        .O(s1o_sticky_r_i_21_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    s1o_sticky_r_i_22
       (.I0(s1t_fract35[20]),
        .I1(s1t_fract35[21]),
        .O(s1o_sticky_r_i_22_n_0));
  LUT6 #(
    .INIT(64'hFFAAE0A0EEAAE0A0)) 
    s1o_sticky_r_i_23
       (.I0(s1o_sticky_r_i_12_n_0),
        .I1(s0o_shrx[1]),
        .I2(s1t_fract35[7]),
        .I3(s1t_shr_t[2]),
        .I4(s1t_fract35[6]),
        .I5(s0o_shrx[0]),
        .O(s1o_sticky_r_i_23_n_0));
  LUT6 #(
    .INIT(64'h8080808080808000)) 
    s1o_sticky_r_i_24
       (.I0(s1t_fract35[10]),
        .I1(s0o_shrx[3]),
        .I2(s0o_ready),
        .I3(s0o_shrx[0]),
        .I4(s0o_shrx[1]),
        .I5(s0o_shrx[2]),
        .O(s1o_sticky_r_i_24_n_0));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'h8)) 
    s1o_sticky_r_i_25
       (.I0(s0o_shrx[0]),
        .I1(s0o_shrx[1]),
        .O(s1o_sticky_r_i_25_n_0));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    s1o_sticky_r_i_26
       (.I0(s0o_shrx[2]),
        .I1(s0o_shrx[1]),
        .I2(s0o_shrx[0]),
        .O(s1o_sticky_r_i_26_n_0));
  LUT6 #(
    .INIT(64'hFFFFF00088880000)) 
    s1o_sticky_r_i_27
       (.I0(s1t_fract35[26]),
        .I1(s1o_sticky_r_i_26_n_0),
        .I2(s1o_sticky_r_i_25_n_0),
        .I3(s1o_sticky_r_i_30_n_0),
        .I4(s1o_sticky_r_i_21_n_0),
        .I5(s1t_fract35[24]),
        .O(s1o_sticky_r_i_27_n_0));
  LUT6 #(
    .INIT(64'hFFFCA000A000A000)) 
    s1o_sticky_r_i_28
       (.I0(s1o_sticky_r_i_21_n_0),
        .I1(s0o_shrx[0]),
        .I2(\s1o_shr[0]_i_2_n_0 ),
        .I3(fract48__0_carry__10_n_4),
        .I4(s0o_ready),
        .I5(s1t_fract35[2]),
        .O(s1o_sticky_r_i_28_n_0));
  LUT6 #(
    .INIT(64'hFFAAE0A0EEAAE0A0)) 
    s1o_sticky_r_i_29
       (.I0(s1o_sticky_r_i_21_n_0),
        .I1(s0o_shrx[1]),
        .I2(s1t_fract35[23]),
        .I3(s1o_sticky_r_i_30_n_0),
        .I4(s1t_fract35[22]),
        .I5(s0o_shrx[0]),
        .O(s1o_sticky_r_i_29_n_0));
  LUT6 #(
    .INIT(64'hFFFEFF00FFFE0000)) 
    s1o_sticky_r_i_3
       (.I0(s1t_fract35[4]),
        .I1(s1t_fract35[8]),
        .I2(s1t_fract35[9]),
        .I3(s1t_fract35[5]),
        .I4(s1o_sticky_r_i_12_n_0),
        .I5(s1t_shr_t[2]),
        .O(s1o_sticky_r_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'h80)) 
    s1o_sticky_r_i_30
       (.I0(s0o_ready),
        .I1(s0o_shrx[4]),
        .I2(s0o_shrx[2]),
        .O(s1o_sticky_r_i_30_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    s1o_sticky_r_i_4
       (.I0(fract48__0_carry__2_n_7),
        .I1(fract48__0_carry__2_n_6),
        .I2(fract48__0_carry__1_n_5),
        .I3(fract48__0_carry__1_n_4),
        .I4(fract48__0_carry__1_n_6),
        .I5(fract48__0_carry__1_n_7),
        .O(s1o_sticky_r_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    s1o_sticky_r_i_5
       (.I0(fract48__0_carry_n_7),
        .I1(fract48__0_carry_n_6),
        .I2(fract48__0_carry__3_n_4),
        .I3(fract48__0_carry__4_n_7),
        .I4(fract48__0_carry__3_n_5),
        .I5(fract48__0_carry__3_n_6),
        .O(s1o_sticky_r_i_5_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    s1o_sticky_r_i_6
       (.I0(fract48__0_carry__0_n_5),
        .I1(fract48__0_carry__0_n_4),
        .I2(fract48__0_carry__0_n_7),
        .I3(fract48__0_carry__0_n_6),
        .I4(fract48__0_carry_n_4),
        .I5(fract48__0_carry_n_5),
        .O(s1o_sticky_r_i_6_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    s1o_sticky_r_i_7
       (.I0(s1o_sticky_r_i_13_n_0),
        .I1(s1o_sticky_r_i_14_n_0),
        .I2(s1o_sticky_r_i_15_n_0),
        .I3(s1o_sticky_r_i_16_n_0),
        .I4(s1o_sticky_r_i_17_n_0),
        .I5(s1o_sticky_r_i_18_n_0),
        .O(s1o_sticky_r_i_7_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFEEF000F000)) 
    s1o_sticky_r_i_8
       (.I0(s1t_fract35[10]),
        .I1(s1t_fract35[12]),
        .I2(s1o_sticky_r_i_19_n_0),
        .I3(s1t_fract35[13]),
        .I4(s1t_fract35[11]),
        .I5(s1t_shr_t[4]),
        .O(s1o_sticky_r_i_8_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFA8FFA8FFA8)) 
    s1o_sticky_r_i_9
       (.I0(s1o_sticky_r_i_12_n_0),
        .I1(s1t_fract35[3]),
        .I2(s1t_fract35[2]),
        .I3(s1t_fract35__0),
        .I4(s1o_sticky_r_i_20_n_0),
        .I5(s1t_shr_t[2]),
        .O(s1o_sticky_r_i_9_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s1o_sticky_r_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1r_sticky),
        .Q(s1o_sticky_r),
        .R(1'b0));
endmodule

module pfpu32_mul_rnd
   (mul_fast_ready_o_OBUF,
    SR,
    Q,
    \fpcsr_o[10] ,
    s1o_qnan,
    clk_IBUF_BUFG,
    s1o_snan,
    s1o_shr,
    s1o_carry,
    s1o_shr_t,
    s1o_sign,
    s1o_sticky_l,
    s1o_sticky_r,
    s1o_inv,
    s1o_inf,
    s1o_anan_sign,
    adv_i_IBUF,
    s1o_ready,
    rst_IBUF,
    flush_i_IBUF,
    D,
    \s1o_exp10sh0_reg[9]_0 ,
    \s1o_exp10shr_reg[8]_0 ,
    rmode_i_IBUF);
  output mul_fast_ready_o_OBUF;
  output [0:0]SR;
  output [31:0]Q;
  output [7:0]\fpcsr_o[10] ;
  input s1o_qnan;
  input clk_IBUF_BUFG;
  input s1o_snan;
  input [0:0]s1o_shr;
  input s1o_carry;
  input [4:0]s1o_shr_t;
  input s1o_sign;
  input s1o_sticky_l;
  input s1o_sticky_r;
  input s1o_inv;
  input s1o_inf;
  input s1o_anan_sign;
  input adv_i_IBUF;
  input s1o_ready;
  input rst_IBUF;
  input flush_i_IBUF;
  input [25:0]D;
  input [9:0]\s1o_exp10sh0_reg[9]_0 ;
  input [8:0]\s1o_exp10shr_reg[8]_0 ;
  input [1:0]rmode_i_IBUF;

  wire [25:0]D;
  wire [31:0]Q;
  wire [0:0]SR;
  wire adv_i_IBUF;
  wire clk_IBUF_BUFG;
  wire flush_i_IBUF;
  wire fpcsr_o2;
  wire [7:0]\fpcsr_o[10] ;
  wire \fpcsr_o[10]_i_1_n_0 ;
  wire \fpcsr_o[10]_i_2_n_0 ;
  wire \fpcsr_o[10]_i_3_n_0 ;
  wire \fpcsr_o[10]_i_4_n_0 ;
  wire \fpcsr_o[10]_i_5_n_0 ;
  wire \fpcsr_o[10]_i_6_n_0 ;
  wire \fpcsr_o[3]_i_1_n_0 ;
  wire \fpcsr_o[7]_i_10_n_0 ;
  wire \fpcsr_o[7]_i_16_n_0 ;
  wire \fpcsr_o[7]_i_17_n_0 ;
  wire \fpcsr_o[7]_i_18_n_0 ;
  wire \fpcsr_o[7]_i_19_n_0 ;
  wire \fpcsr_o[7]_i_1_n_0 ;
  wire \fpcsr_o[7]_i_20_n_0 ;
  wire \fpcsr_o[7]_i_21_n_0 ;
  wire \fpcsr_o[7]_i_22_n_0 ;
  wire \fpcsr_o[7]_i_23_n_0 ;
  wire \fpcsr_o[7]_i_24_n_0 ;
  wire \fpcsr_o[7]_i_25_n_0 ;
  wire \fpcsr_o[7]_i_5_n_0 ;
  wire \fpcsr_o[7]_i_6_n_0 ;
  wire \fpcsr_o[7]_i_7_n_0 ;
  wire \fpcsr_o[7]_i_8_n_0 ;
  wire \fpcsr_o[7]_i_9_n_0 ;
  wire \fpcsr_o[8]_i_10_n_0 ;
  wire \fpcsr_o[8]_i_11_n_0 ;
  wire \fpcsr_o[8]_i_12_n_0 ;
  wire \fpcsr_o[8]_i_13_n_0 ;
  wire \fpcsr_o[8]_i_14_n_0 ;
  wire \fpcsr_o[8]_i_15_n_0 ;
  wire \fpcsr_o[8]_i_1_n_0 ;
  wire \fpcsr_o[8]_i_3_n_0 ;
  wire \fpcsr_o[8]_i_4_n_0 ;
  wire \fpcsr_o[8]_i_5_n_0 ;
  wire \fpcsr_o[8]_i_6_n_0 ;
  wire \fpcsr_o[8]_i_7_n_0 ;
  wire \fpcsr_o[8]_i_8_n_0 ;
  wire \fpcsr_o[8]_i_9_n_0 ;
  wire \fpcsr_o_reg[7]_i_4_n_0 ;
  wire \fpcsr_o_reg[7]_i_4_n_1 ;
  wire \fpcsr_o_reg[7]_i_4_n_2 ;
  wire \fpcsr_o_reg[7]_i_4_n_3 ;
  wire \fpcsr_o_reg[7]_i_4_n_4 ;
  wire \fpcsr_o_reg[7]_i_4_n_5 ;
  wire \fpcsr_o_reg[7]_i_4_n_6 ;
  wire \fpcsr_o_reg[7]_i_4_n_7 ;
  wire mul_fast_ready_o_OBUF;
  wire \mul_fast_result_o[0]_i_1_n_0 ;
  wire \mul_fast_result_o[0]_i_2_n_0 ;
  wire \mul_fast_result_o[10]_i_1_n_0 ;
  wire \mul_fast_result_o[10]_i_2_n_0 ;
  wire \mul_fast_result_o[11]_i_10_n_0 ;
  wire \mul_fast_result_o[11]_i_11_n_0 ;
  wire \mul_fast_result_o[11]_i_12_n_0 ;
  wire \mul_fast_result_o[11]_i_13_n_0 ;
  wire \mul_fast_result_o[11]_i_14_n_0 ;
  wire \mul_fast_result_o[11]_i_15_n_0 ;
  wire \mul_fast_result_o[11]_i_1_n_0 ;
  wire \mul_fast_result_o[11]_i_2_n_0 ;
  wire \mul_fast_result_o[11]_i_8_n_0 ;
  wire \mul_fast_result_o[11]_i_9_n_0 ;
  wire \mul_fast_result_o[12]_i_1_n_0 ;
  wire \mul_fast_result_o[12]_i_2_n_0 ;
  wire \mul_fast_result_o[13]_i_1_n_0 ;
  wire \mul_fast_result_o[13]_i_2_n_0 ;
  wire \mul_fast_result_o[14]_i_1_n_0 ;
  wire \mul_fast_result_o[14]_i_2_n_0 ;
  wire \mul_fast_result_o[15]_i_10_n_0 ;
  wire \mul_fast_result_o[15]_i_11_n_0 ;
  wire \mul_fast_result_o[15]_i_12_n_0 ;
  wire \mul_fast_result_o[15]_i_1_n_0 ;
  wire \mul_fast_result_o[15]_i_2_n_0 ;
  wire \mul_fast_result_o[15]_i_8_n_0 ;
  wire \mul_fast_result_o[15]_i_9_n_0 ;
  wire \mul_fast_result_o[16]_i_1_n_0 ;
  wire \mul_fast_result_o[16]_i_2_n_0 ;
  wire \mul_fast_result_o[17]_i_1_n_0 ;
  wire \mul_fast_result_o[17]_i_2_n_0 ;
  wire \mul_fast_result_o[18]_i_1_n_0 ;
  wire \mul_fast_result_o[18]_i_2_n_0 ;
  wire \mul_fast_result_o[19]_i_10_n_0 ;
  wire \mul_fast_result_o[19]_i_11_n_0 ;
  wire \mul_fast_result_o[19]_i_12_n_0 ;
  wire \mul_fast_result_o[19]_i_13_n_0 ;
  wire \mul_fast_result_o[19]_i_1_n_0 ;
  wire \mul_fast_result_o[19]_i_2_n_0 ;
  wire \mul_fast_result_o[19]_i_8_n_0 ;
  wire \mul_fast_result_o[19]_i_9_n_0 ;
  wire \mul_fast_result_o[1]_i_1_n_0 ;
  wire \mul_fast_result_o[1]_i_2_n_0 ;
  wire \mul_fast_result_o[20]_i_1_n_0 ;
  wire \mul_fast_result_o[20]_i_2_n_0 ;
  wire \mul_fast_result_o[21]_i_1_n_0 ;
  wire \mul_fast_result_o[21]_i_2_n_0 ;
  wire \mul_fast_result_o[21]_i_3_n_0 ;
  wire \mul_fast_result_o[21]_i_4_n_0 ;
  wire \mul_fast_result_o[22]_i_1_n_0 ;
  wire \mul_fast_result_o[22]_i_2_n_0 ;
  wire \mul_fast_result_o[22]_i_3_n_0 ;
  wire \mul_fast_result_o[23]_i_1_n_0 ;
  wire \mul_fast_result_o[23]_i_2_n_0 ;
  wire \mul_fast_result_o[24]_i_1_n_0 ;
  wire \mul_fast_result_o[24]_i_2_n_0 ;
  wire \mul_fast_result_o[25]_i_1_n_0 ;
  wire \mul_fast_result_o[25]_i_2_n_0 ;
  wire \mul_fast_result_o[25]_i_3_n_0 ;
  wire \mul_fast_result_o[25]_i_4_n_0 ;
  wire \mul_fast_result_o[25]_i_5_n_0 ;
  wire \mul_fast_result_o[25]_i_6_n_0 ;
  wire \mul_fast_result_o[26]_i_1_n_0 ;
  wire \mul_fast_result_o[26]_i_2_n_0 ;
  wire \mul_fast_result_o[26]_i_3_n_0 ;
  wire \mul_fast_result_o[26]_i_4_n_0 ;
  wire \mul_fast_result_o[26]_i_5_n_0 ;
  wire \mul_fast_result_o[27]_i_1_n_0 ;
  wire \mul_fast_result_o[27]_i_2_n_0 ;
  wire \mul_fast_result_o[27]_i_3_n_0 ;
  wire \mul_fast_result_o[27]_i_4_n_0 ;
  wire \mul_fast_result_o[28]_i_1_n_0 ;
  wire \mul_fast_result_o[28]_i_2_n_0 ;
  wire \mul_fast_result_o[29]_i_1_n_0 ;
  wire \mul_fast_result_o[29]_i_2_n_0 ;
  wire \mul_fast_result_o[2]_i_1_n_0 ;
  wire \mul_fast_result_o[2]_i_2_n_0 ;
  wire \mul_fast_result_o[30]_i_10_n_0 ;
  wire \mul_fast_result_o[30]_i_11_n_0 ;
  wire \mul_fast_result_o[30]_i_12_n_0 ;
  wire \mul_fast_result_o[30]_i_13_n_0 ;
  wire \mul_fast_result_o[30]_i_14_n_0 ;
  wire \mul_fast_result_o[30]_i_15_n_0 ;
  wire \mul_fast_result_o[30]_i_1_n_0 ;
  wire \mul_fast_result_o[30]_i_2_n_0 ;
  wire \mul_fast_result_o[30]_i_3_n_0 ;
  wire \mul_fast_result_o[30]_i_4_n_0 ;
  wire \mul_fast_result_o[30]_i_5_n_0 ;
  wire \mul_fast_result_o[30]_i_6_n_0 ;
  wire \mul_fast_result_o[30]_i_7_n_0 ;
  wire \mul_fast_result_o[30]_i_8_n_0 ;
  wire \mul_fast_result_o[30]_i_9_n_0 ;
  wire \mul_fast_result_o[31]_i_1_n_0 ;
  wire \mul_fast_result_o[3]_i_10_n_0 ;
  wire \mul_fast_result_o[3]_i_11_n_0 ;
  wire \mul_fast_result_o[3]_i_12_n_0 ;
  wire \mul_fast_result_o[3]_i_1_n_0 ;
  wire \mul_fast_result_o[3]_i_2_n_0 ;
  wire \mul_fast_result_o[3]_i_4_n_0 ;
  wire \mul_fast_result_o[3]_i_8_n_0 ;
  wire \mul_fast_result_o[3]_i_9_n_0 ;
  wire \mul_fast_result_o[4]_i_1_n_0 ;
  wire \mul_fast_result_o[4]_i_2_n_0 ;
  wire \mul_fast_result_o[5]_i_1_n_0 ;
  wire \mul_fast_result_o[5]_i_2_n_0 ;
  wire \mul_fast_result_o[6]_i_1_n_0 ;
  wire \mul_fast_result_o[6]_i_2_n_0 ;
  wire \mul_fast_result_o[7]_i_10_n_0 ;
  wire \mul_fast_result_o[7]_i_11_n_0 ;
  wire \mul_fast_result_o[7]_i_12_n_0 ;
  wire \mul_fast_result_o[7]_i_1_n_0 ;
  wire \mul_fast_result_o[7]_i_2_n_0 ;
  wire \mul_fast_result_o[7]_i_8_n_0 ;
  wire \mul_fast_result_o[7]_i_9_n_0 ;
  wire \mul_fast_result_o[8]_i_1_n_0 ;
  wire \mul_fast_result_o[8]_i_2_n_0 ;
  wire \mul_fast_result_o[9]_i_1_n_0 ;
  wire \mul_fast_result_o[9]_i_2_n_0 ;
  wire \mul_fast_result_o_reg[11]_i_3_n_0 ;
  wire \mul_fast_result_o_reg[11]_i_3_n_1 ;
  wire \mul_fast_result_o_reg[11]_i_3_n_2 ;
  wire \mul_fast_result_o_reg[11]_i_3_n_3 ;
  wire \mul_fast_result_o_reg[11]_i_3_n_4 ;
  wire \mul_fast_result_o_reg[11]_i_3_n_5 ;
  wire \mul_fast_result_o_reg[11]_i_3_n_6 ;
  wire \mul_fast_result_o_reg[11]_i_3_n_7 ;
  wire \mul_fast_result_o_reg[15]_i_3_n_0 ;
  wire \mul_fast_result_o_reg[15]_i_3_n_1 ;
  wire \mul_fast_result_o_reg[15]_i_3_n_2 ;
  wire \mul_fast_result_o_reg[15]_i_3_n_3 ;
  wire \mul_fast_result_o_reg[15]_i_3_n_4 ;
  wire \mul_fast_result_o_reg[15]_i_3_n_5 ;
  wire \mul_fast_result_o_reg[15]_i_3_n_6 ;
  wire \mul_fast_result_o_reg[15]_i_3_n_7 ;
  wire \mul_fast_result_o_reg[19]_i_3_n_0 ;
  wire \mul_fast_result_o_reg[19]_i_3_n_1 ;
  wire \mul_fast_result_o_reg[19]_i_3_n_2 ;
  wire \mul_fast_result_o_reg[19]_i_3_n_3 ;
  wire \mul_fast_result_o_reg[19]_i_3_n_4 ;
  wire \mul_fast_result_o_reg[19]_i_3_n_5 ;
  wire \mul_fast_result_o_reg[19]_i_3_n_6 ;
  wire \mul_fast_result_o_reg[19]_i_3_n_7 ;
  wire \mul_fast_result_o_reg[3]_i_3_n_0 ;
  wire \mul_fast_result_o_reg[3]_i_3_n_1 ;
  wire \mul_fast_result_o_reg[3]_i_3_n_2 ;
  wire \mul_fast_result_o_reg[3]_i_3_n_3 ;
  wire \mul_fast_result_o_reg[3]_i_3_n_4 ;
  wire \mul_fast_result_o_reg[3]_i_3_n_5 ;
  wire \mul_fast_result_o_reg[3]_i_3_n_6 ;
  wire \mul_fast_result_o_reg[3]_i_3_n_7 ;
  wire \mul_fast_result_o_reg[7]_i_3_n_0 ;
  wire \mul_fast_result_o_reg[7]_i_3_n_1 ;
  wire \mul_fast_result_o_reg[7]_i_3_n_2 ;
  wire \mul_fast_result_o_reg[7]_i_3_n_3 ;
  wire \mul_fast_result_o_reg[7]_i_3_n_4 ;
  wire \mul_fast_result_o_reg[7]_i_3_n_5 ;
  wire \mul_fast_result_o_reg[7]_i_3_n_6 ;
  wire \mul_fast_result_o_reg[7]_i_3_n_7 ;
  wire p_0_in;
  wire [6:1]p_1_out;
  wire [1:0]rmode_i_IBUF;
  wire rst_IBUF;
  wire s1o_anan_sign;
  wire s1o_anan_sign_10;
  wire s1o_carry;
  wire s1o_carry_3;
  wire [9:0]s1o_exp10sh0;
  wire [9:0]\s1o_exp10sh0_reg[9]_0 ;
  wire [8:0]s1o_exp10shr;
  wire [8:0]\s1o_exp10shr_reg[8]_0 ;
  wire [27:2]s1o_fract35;
  wire s1o_inf;
  wire s1o_inf_9;
  wire s1o_inv;
  wire s1o_inv_8;
  wire s1o_qnan;
  wire s1o_qnan_0;
  wire s1o_ready;
  wire s1o_ready_11;
  wire s1o_ready_i_1_n_0;
  wire [0:0]s1o_shr;
  wire [0:0]s1o_shr_2;
  wire [4:0]s1o_shr_t;
  wire [4:0]s1o_shr_t_4;
  wire s1o_sign;
  wire s1o_sign_5;
  wire s1o_snan;
  wire s1o_snan_1;
  wire s1o_sticky_l;
  wire s1o_sticky_l_6;
  wire s1o_sticky_r;
  wire s1o_sticky_r_7;
  wire [24:1]s2t_g;
  wire [3:0]\NLW_fpcsr_o_reg[7]_i_3_CO_UNCONNECTED ;
  wire [3:1]\NLW_fpcsr_o_reg[7]_i_3_O_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hFFFFFDEF00000000)) 
    \fpcsr_o[10]_i_1 
       (.I0(\fpcsr_o[10]_i_2_n_0 ),
        .I1(\fpcsr_o[10]_i_3_n_0 ),
        .I2(\fpcsr_o[10]_i_4_n_0 ),
        .I3(\fpcsr_o[10]_i_5_n_0 ),
        .I4(s1o_inf_9),
        .I5(\mul_fast_result_o[30]_i_4_n_0 ),
        .O(\fpcsr_o[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h47FF74CC)) 
    \fpcsr_o[10]_i_2 
       (.I0(s1o_exp10shr[8]),
        .I1(\mul_fast_result_o[26]_i_5_n_0 ),
        .I2(s1o_exp10sh0[8]),
        .I3(s1o_ready_11),
        .I4(\fpcsr_o[10]_i_6_n_0 ),
        .O(\fpcsr_o[10]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT5 #(
    .INIT(32'h82000000)) 
    \fpcsr_o[10]_i_3 
       (.I0(\mul_fast_result_o[30]_i_7_n_0 ),
        .I1(\mul_fast_result_o[30]_i_9_n_0 ),
        .I2(\mul_fast_result_o[30]_i_8_n_0 ),
        .I3(\mul_fast_result_o[30]_i_10_n_0 ),
        .I4(\mul_fast_result_o[30]_i_11_n_0 ),
        .O(\fpcsr_o[10]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \fpcsr_o[10]_i_4 
       (.I0(\mul_fast_result_o[30]_i_7_n_0 ),
        .I1(\mul_fast_result_o[30]_i_8_n_0 ),
        .I2(\mul_fast_result_o[30]_i_9_n_0 ),
        .I3(\mul_fast_result_o[30]_i_10_n_0 ),
        .O(\fpcsr_o[10]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hAFEFFFBF)) 
    \fpcsr_o[10]_i_5 
       (.I0(\mul_fast_result_o[26]_i_5_n_0 ),
        .I1(s1o_exp10sh0[8]),
        .I2(s1o_ready_11),
        .I3(\fpcsr_o[10]_i_6_n_0 ),
        .I4(s1o_exp10sh0[9]),
        .O(\fpcsr_o[10]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF7FFFFFFFFFFF)) 
    \fpcsr_o[10]_i_6 
       (.I0(s1o_exp10sh0[7]),
        .I1(s1o_exp10sh0[5]),
        .I2(s1o_ready_11),
        .I3(s1o_exp10sh0[4]),
        .I4(\mul_fast_result_o[30]_i_13_n_0 ),
        .I5(s1o_exp10sh0[6]),
        .O(\fpcsr_o[10]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAAABFFFFAAAAAAAA)) 
    \fpcsr_o[3]_i_1 
       (.I0(SR),
        .I1(\mul_fast_result_o[30]_i_6_n_0 ),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(s1o_inf_9),
        .I4(\mul_fast_result_o[30]_i_4_n_0 ),
        .I5(adv_i_IBUF),
        .O(\fpcsr_o[3]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \fpcsr_o[3]_i_2 
       (.I0(s1o_inf_9),
        .O(fpcsr_o2));
  LUT3 #(
    .INIT(8'h02)) 
    \fpcsr_o[4]_i_1 
       (.I0(\fpcsr_o[8]_i_3_n_0 ),
        .I1(\fpcsr_o_reg[7]_i_4_n_4 ),
        .I2(p_0_in),
        .O(p_1_out[1]));
  LUT5 #(
    .INIT(32'hFFFEEEEE)) 
    \fpcsr_o[7]_i_1 
       (.I0(rst_IBUF),
        .I1(flush_i_IBUF),
        .I2(p_0_in),
        .I3(\fpcsr_o_reg[7]_i_4_n_4 ),
        .I4(adv_i_IBUF),
        .O(\fpcsr_o[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFBBFCB8)) 
    \fpcsr_o[7]_i_10 
       (.I0(\mul_fast_result_o_reg[7]_i_3_n_6 ),
        .I1(p_0_in),
        .I2(\mul_fast_result_o_reg[7]_i_3_n_7 ),
        .I3(\mul_fast_result_o_reg[15]_i_3_n_5 ),
        .I4(\mul_fast_result_o_reg[15]_i_3_n_6 ),
        .I5(\fpcsr_o[7]_i_20_n_0 ),
        .O(\fpcsr_o[7]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    \fpcsr_o[7]_i_11 
       (.I0(s1o_shr_t_4[3]),
        .I1(s1o_fract35[27]),
        .I2(s1o_shr_t_4[4]),
        .I3(s1o_shr_t_4[2]),
        .I4(s1o_shr_t_4[1]),
        .I5(s1o_shr_2),
        .O(s2t_g[24]));
  LUT6 #(
    .INIT(64'h000000000B000800)) 
    \fpcsr_o[7]_i_12 
       (.I0(s1o_fract35[27]),
        .I1(s1o_shr_2),
        .I2(s1o_shr_t_4[3]),
        .I3(\fpcsr_o[7]_i_21_n_0 ),
        .I4(s1o_fract35[26]),
        .I5(s1o_shr_t_4[4]),
        .O(s2t_g[23]));
  LUT6 #(
    .INIT(64'h0001FFFF00010000)) 
    \fpcsr_o[7]_i_13 
       (.I0(s1o_shr_t_4[3]),
        .I1(s1o_shr_t_4[2]),
        .I2(s1o_shr_t_4[1]),
        .I3(\fpcsr_o[7]_i_22_n_0 ),
        .I4(s1o_shr_2),
        .I5(\fpcsr_o[7]_i_23_n_0 ),
        .O(s2t_g[22]));
  LUT3 #(
    .INIT(8'hB8)) 
    \fpcsr_o[7]_i_14 
       (.I0(\fpcsr_o[7]_i_23_n_0 ),
        .I1(s1o_shr_2),
        .I2(\fpcsr_o[7]_i_24_n_0 ),
        .O(s2t_g[21]));
  LUT3 #(
    .INIT(8'hB8)) 
    \fpcsr_o[7]_i_15 
       (.I0(\fpcsr_o[7]_i_24_n_0 ),
        .I1(s1o_shr_2),
        .I2(\fpcsr_o[7]_i_25_n_0 ),
        .O(s2t_g[20]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT5 #(
    .INIT(32'hFFFACCFA)) 
    \fpcsr_o[7]_i_16 
       (.I0(\fpcsr_o_reg[7]_i_4_n_7 ),
        .I1(\fpcsr_o_reg[7]_i_4_n_6 ),
        .I2(\mul_fast_result_o_reg[19]_i_3_n_6 ),
        .I3(p_0_in),
        .I4(\mul_fast_result_o_reg[19]_i_3_n_5 ),
        .O(\fpcsr_o[7]_i_16_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT5 #(
    .INIT(32'hFFFACCFA)) 
    \fpcsr_o[7]_i_17 
       (.I0(\mul_fast_result_o_reg[11]_i_3_n_7 ),
        .I1(\mul_fast_result_o_reg[11]_i_3_n_6 ),
        .I2(\mul_fast_result_o_reg[19]_i_3_n_4 ),
        .I3(p_0_in),
        .I4(\fpcsr_o_reg[7]_i_4_n_7 ),
        .O(\fpcsr_o[7]_i_17_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT5 #(
    .INIT(32'hFFFACCFA)) 
    \fpcsr_o[7]_i_18 
       (.I0(\mul_fast_result_o_reg[7]_i_3_n_6 ),
        .I1(\mul_fast_result_o_reg[7]_i_3_n_5 ),
        .I2(\mul_fast_result_o_reg[3]_i_3_n_5 ),
        .I3(p_0_in),
        .I4(\mul_fast_result_o_reg[3]_i_3_n_4 ),
        .O(\fpcsr_o[7]_i_18_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT5 #(
    .INIT(32'hFFFACCFA)) 
    \fpcsr_o[7]_i_19 
       (.I0(\mul_fast_result_o_reg[11]_i_3_n_6 ),
        .I1(\mul_fast_result_o_reg[11]_i_3_n_5 ),
        .I2(\fpcsr_o_reg[7]_i_4_n_5 ),
        .I3(p_0_in),
        .I4(\fpcsr_o_reg[7]_i_4_n_4 ),
        .O(\fpcsr_o[7]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    \fpcsr_o[7]_i_2 
       (.I0(\fpcsr_o[7]_i_5_n_0 ),
        .I1(\fpcsr_o[7]_i_6_n_0 ),
        .I2(\fpcsr_o[7]_i_7_n_0 ),
        .I3(\fpcsr_o[7]_i_8_n_0 ),
        .I4(\fpcsr_o[7]_i_9_n_0 ),
        .I5(\fpcsr_o[7]_i_10_n_0 ),
        .O(p_1_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT5 #(
    .INIT(32'hFFFACCFA)) 
    \fpcsr_o[7]_i_20 
       (.I0(\mul_fast_result_o_reg[15]_i_3_n_4 ),
        .I1(\mul_fast_result_o_reg[19]_i_3_n_7 ),
        .I2(\mul_fast_result_o_reg[3]_i_3_n_4 ),
        .I3(p_0_in),
        .I4(\mul_fast_result_o_reg[7]_i_3_n_7 ),
        .O(\fpcsr_o[7]_i_20_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \fpcsr_o[7]_i_21 
       (.I0(s1o_shr_t_4[2]),
        .I1(s1o_shr_t_4[1]),
        .O(\fpcsr_o[7]_i_21_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \fpcsr_o[7]_i_22 
       (.I0(s1o_shr_t_4[4]),
        .I1(s1o_fract35[26]),
        .O(\fpcsr_o[7]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000B08)) 
    \fpcsr_o[7]_i_23 
       (.I0(s1o_fract35[27]),
        .I1(s1o_shr_t_4[1]),
        .I2(s1o_shr_t_4[2]),
        .I3(s1o_fract35[25]),
        .I4(s1o_shr_t_4[4]),
        .I5(s1o_shr_t_4[3]),
        .O(\fpcsr_o[7]_i_23_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000B08)) 
    \fpcsr_o[7]_i_24 
       (.I0(s1o_fract35[26]),
        .I1(s1o_shr_t_4[1]),
        .I2(s1o_shr_t_4[2]),
        .I3(s1o_fract35[24]),
        .I4(s1o_shr_t_4[4]),
        .I5(s1o_shr_t_4[3]),
        .O(\fpcsr_o[7]_i_24_n_0 ));
  LUT6 #(
    .INIT(64'h0004FFFF00040000)) 
    \fpcsr_o[7]_i_25 
       (.I0(s1o_shr_t_4[2]),
        .I1(s1o_fract35[25]),
        .I2(s1o_shr_t_4[4]),
        .I3(s1o_shr_t_4[3]),
        .I4(s1o_shr_t_4[1]),
        .I5(\mul_fast_result_o[19]_i_9_n_0 ),
        .O(\fpcsr_o[7]_i_25_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \fpcsr_o[7]_i_5 
       (.I0(p_0_in),
        .I1(\mul_fast_result_o_reg[3]_i_3_n_6 ),
        .I2(\mul_fast_result_o_reg[3]_i_3_n_7 ),
        .I3(\fpcsr_o_reg[7]_i_4_n_4 ),
        .I4(\fpcsr_o[7]_i_16_n_0 ),
        .O(\fpcsr_o[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000440347)) 
    \fpcsr_o[7]_i_6 
       (.I0(\mul_fast_result_o_reg[15]_i_3_n_7 ),
        .I1(p_0_in),
        .I2(\mul_fast_result_o_reg[11]_i_3_n_4 ),
        .I3(\mul_fast_result_o_reg[15]_i_3_n_4 ),
        .I4(\mul_fast_result_o_reg[15]_i_3_n_5 ),
        .I5(\fpcsr_o[7]_i_17_n_0 ),
        .O(\fpcsr_o[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFCFFFFFFFCFAFA)) 
    \fpcsr_o[7]_i_7 
       (.I0(\mul_fast_result_o_reg[7]_i_3_n_4 ),
        .I1(\mul_fast_result_o_reg[11]_i_3_n_7 ),
        .I2(\mul_fast_result_o[16]_i_2_n_0 ),
        .I3(\mul_fast_result_o_reg[19]_i_3_n_4 ),
        .I4(p_0_in),
        .I5(\mul_fast_result_o_reg[19]_i_3_n_5 ),
        .O(\fpcsr_o[7]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFBBFCB8)) 
    \fpcsr_o[7]_i_8 
       (.I0(\mul_fast_result_o_reg[11]_i_3_n_4 ),
        .I1(p_0_in),
        .I2(\mul_fast_result_o_reg[11]_i_3_n_5 ),
        .I3(\mul_fast_result_o_reg[15]_i_3_n_6 ),
        .I4(\mul_fast_result_o_reg[15]_i_3_n_7 ),
        .I5(\fpcsr_o[7]_i_18_n_0 ),
        .O(\fpcsr_o[7]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFBBFCB8)) 
    \fpcsr_o[7]_i_9 
       (.I0(\fpcsr_o_reg[7]_i_4_n_5 ),
        .I1(p_0_in),
        .I2(\fpcsr_o_reg[7]_i_4_n_6 ),
        .I3(\mul_fast_result_o_reg[7]_i_3_n_4 ),
        .I4(\mul_fast_result_o_reg[7]_i_3_n_5 ),
        .I5(\fpcsr_o[7]_i_19_n_0 ),
        .O(\fpcsr_o[7]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEEEEEEEEE)) 
    \fpcsr_o[8]_i_1 
       (.I0(rst_IBUF),
        .I1(flush_i_IBUF),
        .I2(s1o_qnan_0),
        .I3(s1o_inv_8),
        .I4(s1o_snan_1),
        .I5(adv_i_IBUF),
        .O(\fpcsr_o[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \fpcsr_o[8]_i_10 
       (.I0(s1o_fract35[15]),
        .I1(s1o_shr_t_4[3]),
        .I2(s1o_fract35[23]),
        .I3(s1o_shr_t_4[4]),
        .I4(s1o_fract35[7]),
        .O(\fpcsr_o[8]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \fpcsr_o[8]_i_11 
       (.I0(s1o_fract35[27]),
        .I1(s1o_fract35[11]),
        .I2(s1o_shr_t_4[3]),
        .I3(s1o_fract35[19]),
        .I4(s1o_shr_t_4[4]),
        .I5(s1o_fract35[3]),
        .O(\fpcsr_o[8]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \fpcsr_o[8]_i_12 
       (.I0(s1o_fract35[16]),
        .I1(s1o_shr_t_4[3]),
        .I2(s1o_fract35[24]),
        .I3(s1o_shr_t_4[4]),
        .I4(s1o_fract35[8]),
        .O(\fpcsr_o[8]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \fpcsr_o[8]_i_13 
       (.I0(s1o_fract35[12]),
        .I1(s1o_shr_t_4[3]),
        .I2(s1o_fract35[20]),
        .I3(s1o_shr_t_4[4]),
        .I4(s1o_fract35[4]),
        .O(\fpcsr_o[8]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \fpcsr_o[8]_i_14 
       (.I0(s1o_fract35[14]),
        .I1(s1o_shr_t_4[3]),
        .I2(s1o_fract35[22]),
        .I3(s1o_shr_t_4[4]),
        .I4(s1o_fract35[6]),
        .O(\fpcsr_o[8]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \fpcsr_o[8]_i_15 
       (.I0(s1o_fract35[26]),
        .I1(s1o_fract35[10]),
        .I2(s1o_shr_t_4[3]),
        .I3(s1o_fract35[18]),
        .I4(s1o_shr_t_4[4]),
        .I5(s1o_fract35[2]),
        .O(\fpcsr_o[8]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBBABBBBABBBB)) 
    \fpcsr_o[8]_i_2 
       (.I0(\fpcsr_o[8]_i_3_n_0 ),
        .I1(s1o_inf_9),
        .I2(\fpcsr_o[10]_i_2_n_0 ),
        .I3(\fpcsr_o[10]_i_3_n_0 ),
        .I4(\fpcsr_o[10]_i_4_n_0 ),
        .I5(\fpcsr_o[10]_i_5_n_0 ),
        .O(p_1_out[5]));
  LUT6 #(
    .INIT(64'hEEEEEFEEEEEEEAEE)) 
    \fpcsr_o[8]_i_3 
       (.I0(\fpcsr_o[8]_i_4_n_0 ),
        .I1(s1o_sticky_r_7),
        .I2(s1o_shr_2),
        .I3(\fpcsr_o[8]_i_5_n_0 ),
        .I4(s1o_shr_t_4[4]),
        .I5(s1o_sticky_l_6),
        .O(\fpcsr_o[8]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \fpcsr_o[8]_i_4 
       (.I0(\fpcsr_o[8]_i_6_n_0 ),
        .I1(s1o_shr_2),
        .I2(\fpcsr_o[8]_i_7_n_0 ),
        .O(\fpcsr_o[8]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \fpcsr_o[8]_i_5 
       (.I0(s1o_shr_t_4[1]),
        .I1(s1o_shr_t_4[2]),
        .I2(s1o_shr_t_4[3]),
        .O(\fpcsr_o[8]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hB8FFB833B8CCB800)) 
    \fpcsr_o[8]_i_6 
       (.I0(\fpcsr_o[8]_i_8_n_0 ),
        .I1(s1o_shr_t_4[2]),
        .I2(\fpcsr_o[8]_i_9_n_0 ),
        .I3(s1o_shr_t_4[1]),
        .I4(\fpcsr_o[8]_i_10_n_0 ),
        .I5(\fpcsr_o[8]_i_11_n_0 ),
        .O(\fpcsr_o[8]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hB8FFB833B8CCB800)) 
    \fpcsr_o[8]_i_7 
       (.I0(\fpcsr_o[8]_i_12_n_0 ),
        .I1(s1o_shr_t_4[2]),
        .I2(\fpcsr_o[8]_i_13_n_0 ),
        .I3(s1o_shr_t_4[1]),
        .I4(\fpcsr_o[8]_i_14_n_0 ),
        .I5(\fpcsr_o[8]_i_15_n_0 ),
        .O(\fpcsr_o[8]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \fpcsr_o[8]_i_8 
       (.I0(s1o_fract35[17]),
        .I1(s1o_shr_t_4[3]),
        .I2(s1o_fract35[25]),
        .I3(s1o_shr_t_4[4]),
        .I4(s1o_fract35[9]),
        .O(\fpcsr_o[8]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \fpcsr_o[8]_i_9 
       (.I0(s1o_fract35[13]),
        .I1(s1o_shr_t_4[3]),
        .I2(s1o_fract35[21]),
        .I3(s1o_shr_t_4[4]),
        .I4(s1o_fract35[5]),
        .O(\fpcsr_o[8]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \fpcsr_o[9]_i_1 
       (.I0(s1o_snan_1),
        .I1(s1o_inv_8),
        .O(p_1_out[6]));
  FDRE #(
    .INIT(1'b0)) 
    \fpcsr_o_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\fpcsr_o[10]_i_1_n_0 ),
        .Q(\fpcsr_o[10] [7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \fpcsr_o_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(fpcsr_o2),
        .Q(\fpcsr_o[10] [0]),
        .R(\fpcsr_o[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fpcsr_o_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(p_1_out[1]),
        .Q(\fpcsr_o[10] [1]),
        .R(\fpcsr_o[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fpcsr_o_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(s1o_inv_8),
        .Q(\fpcsr_o[10] [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \fpcsr_o_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(s1o_qnan_0),
        .Q(\fpcsr_o[10] [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \fpcsr_o_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(p_1_out[4]),
        .Q(\fpcsr_o[10] [4]),
        .R(\fpcsr_o[7]_i_1_n_0 ));
  CARRY4 \fpcsr_o_reg[7]_i_3 
       (.CI(\fpcsr_o_reg[7]_i_4_n_0 ),
        .CO(\NLW_fpcsr_o_reg[7]_i_3_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_fpcsr_o_reg[7]_i_3_O_UNCONNECTED [3:1],p_0_in}),
        .S({1'b0,1'b0,1'b0,s2t_g[24]}));
  CARRY4 \fpcsr_o_reg[7]_i_4 
       (.CI(\mul_fast_result_o_reg[19]_i_3_n_0 ),
        .CO({\fpcsr_o_reg[7]_i_4_n_0 ,\fpcsr_o_reg[7]_i_4_n_1 ,\fpcsr_o_reg[7]_i_4_n_2 ,\fpcsr_o_reg[7]_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\fpcsr_o_reg[7]_i_4_n_4 ,\fpcsr_o_reg[7]_i_4_n_5 ,\fpcsr_o_reg[7]_i_4_n_6 ,\fpcsr_o_reg[7]_i_4_n_7 }),
        .S(s2t_g[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \fpcsr_o_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(p_1_out[5]),
        .Q(\fpcsr_o[10] [5]),
        .R(\fpcsr_o[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fpcsr_o_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(p_1_out[6]),
        .Q(\fpcsr_o[10] [6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    mul_fast_ready_o_reg
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(s1o_ready_11),
        .Q(mul_fast_ready_o_OBUF),
        .R(SR));
  LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
    \mul_fast_result_o[0]_i_1 
       (.I0(\mul_fast_result_o[21]_i_3_n_0 ),
        .I1(\mul_fast_result_o[30]_i_6_n_0 ),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(s1o_inf_9),
        .I4(\mul_fast_result_o[30]_i_4_n_0 ),
        .I5(\mul_fast_result_o[0]_i_2_n_0 ),
        .O(\mul_fast_result_o[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[0]_i_2 
       (.I0(\mul_fast_result_o_reg[3]_i_3_n_6 ),
        .I1(p_0_in),
        .I2(\mul_fast_result_o_reg[3]_i_3_n_7 ),
        .O(\mul_fast_result_o[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
    \mul_fast_result_o[10]_i_1 
       (.I0(\mul_fast_result_o[21]_i_3_n_0 ),
        .I1(\mul_fast_result_o[30]_i_6_n_0 ),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(s1o_inf_9),
        .I4(\mul_fast_result_o[30]_i_4_n_0 ),
        .I5(\mul_fast_result_o[10]_i_2_n_0 ),
        .O(\mul_fast_result_o[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[10]_i_2 
       (.I0(\mul_fast_result_o_reg[11]_i_3_n_4 ),
        .I1(p_0_in),
        .I2(\mul_fast_result_o_reg[11]_i_3_n_5 ),
        .O(\mul_fast_result_o[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
    \mul_fast_result_o[11]_i_1 
       (.I0(\mul_fast_result_o[21]_i_3_n_0 ),
        .I1(\mul_fast_result_o[30]_i_6_n_0 ),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(s1o_inf_9),
        .I4(\mul_fast_result_o[30]_i_4_n_0 ),
        .I5(\mul_fast_result_o[11]_i_2_n_0 ),
        .O(\mul_fast_result_o[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00B8FFFF00B80000)) 
    \mul_fast_result_o[11]_i_10 
       (.I0(s1o_fract35[24]),
        .I1(s1o_shr_t_4[3]),
        .I2(s1o_fract35[16]),
        .I3(s1o_shr_t_4[4]),
        .I4(s1o_shr_t_4[2]),
        .I5(\mul_fast_result_o[11]_i_14_n_0 ),
        .O(\mul_fast_result_o[11]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h00B8FFFF00B80000)) 
    \mul_fast_result_o[11]_i_11 
       (.I0(s1o_fract35[23]),
        .I1(s1o_shr_t_4[3]),
        .I2(s1o_fract35[15]),
        .I3(s1o_shr_t_4[4]),
        .I4(s1o_shr_t_4[2]),
        .I5(\mul_fast_result_o[11]_i_15_n_0 ),
        .O(\mul_fast_result_o[11]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT4 #(
    .INIT(16'hCFDD)) 
    \mul_fast_result_o[11]_i_12 
       (.I0(s1o_fract35[18]),
        .I1(s1o_shr_t_4[4]),
        .I2(s1o_fract35[26]),
        .I3(s1o_shr_t_4[3]),
        .O(\mul_fast_result_o[11]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \mul_fast_result_o[11]_i_13 
       (.I0(s1o_fract35[21]),
        .I1(s1o_shr_t_4[3]),
        .I2(s1o_fract35[13]),
        .I3(s1o_shr_t_4[4]),
        .O(\mul_fast_result_o[11]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \mul_fast_result_o[11]_i_14 
       (.I0(s1o_fract35[20]),
        .I1(s1o_shr_t_4[3]),
        .I2(s1o_fract35[12]),
        .I3(s1o_shr_t_4[4]),
        .O(\mul_fast_result_o[11]_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \mul_fast_result_o[11]_i_15 
       (.I0(s1o_fract35[19]),
        .I1(s1o_shr_t_4[3]),
        .I2(s1o_fract35[27]),
        .I3(s1o_shr_t_4[4]),
        .I4(s1o_fract35[11]),
        .O(\mul_fast_result_o[11]_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[11]_i_2 
       (.I0(\mul_fast_result_o_reg[15]_i_3_n_7 ),
        .I1(p_0_in),
        .I2(\mul_fast_result_o_reg[11]_i_3_n_4 ),
        .O(\mul_fast_result_o[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h4747474700CC33FF)) 
    \mul_fast_result_o[11]_i_4 
       (.I0(\mul_fast_result_o[15]_i_9_n_0 ),
        .I1(s1o_shr_t_4[1]),
        .I2(\mul_fast_result_o[15]_i_11_n_0 ),
        .I3(\mul_fast_result_o[15]_i_10_n_0 ),
        .I4(\mul_fast_result_o[11]_i_8_n_0 ),
        .I5(s1o_shr_2),
        .O(s2t_g[11]));
  LUT6 #(
    .INIT(64'h00F00FFF3A3A3A3A)) 
    \mul_fast_result_o[11]_i_5 
       (.I0(\mul_fast_result_o[11]_i_9_n_0 ),
        .I1(\mul_fast_result_o[15]_i_11_n_0 ),
        .I2(s1o_shr_t_4[1]),
        .I3(\mul_fast_result_o[15]_i_10_n_0 ),
        .I4(\mul_fast_result_o[11]_i_8_n_0 ),
        .I5(s1o_shr_2),
        .O(s2t_g[10]));
  LUT6 #(
    .INIT(64'h3A3A3A3A0F00FFF0)) 
    \mul_fast_result_o[11]_i_6 
       (.I0(\mul_fast_result_o[11]_i_9_n_0 ),
        .I1(\mul_fast_result_o[15]_i_11_n_0 ),
        .I2(s1o_shr_t_4[1]),
        .I3(\mul_fast_result_o[11]_i_10_n_0 ),
        .I4(\mul_fast_result_o[11]_i_8_n_0 ),
        .I5(s1o_shr_2),
        .O(s2t_g[9]));
  LUT6 #(
    .INIT(64'h3300FFCCB8B8B8B8)) 
    \mul_fast_result_o[11]_i_7 
       (.I0(\mul_fast_result_o[11]_i_9_n_0 ),
        .I1(s1o_shr_t_4[1]),
        .I2(\mul_fast_result_o[11]_i_11_n_0 ),
        .I3(\mul_fast_result_o[11]_i_10_n_0 ),
        .I4(\mul_fast_result_o[11]_i_8_n_0 ),
        .I5(s1o_shr_2),
        .O(s2t_g[8]));
  LUT6 #(
    .INIT(64'hFFFF0000FF47FF47)) 
    \mul_fast_result_o[11]_i_8 
       (.I0(s1o_fract35[22]),
        .I1(s1o_shr_t_4[3]),
        .I2(s1o_fract35[14]),
        .I3(s1o_shr_t_4[4]),
        .I4(\mul_fast_result_o[11]_i_12_n_0 ),
        .I5(s1o_shr_t_4[2]),
        .O(\mul_fast_result_o[11]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h00B8FFFF00B80000)) 
    \mul_fast_result_o[11]_i_9 
       (.I0(s1o_fract35[25]),
        .I1(s1o_shr_t_4[3]),
        .I2(s1o_fract35[17]),
        .I3(s1o_shr_t_4[4]),
        .I4(s1o_shr_t_4[2]),
        .I5(\mul_fast_result_o[11]_i_13_n_0 ),
        .O(\mul_fast_result_o[11]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
    \mul_fast_result_o[12]_i_1 
       (.I0(\mul_fast_result_o[21]_i_3_n_0 ),
        .I1(\mul_fast_result_o[30]_i_6_n_0 ),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(s1o_inf_9),
        .I4(\mul_fast_result_o[30]_i_4_n_0 ),
        .I5(\mul_fast_result_o[12]_i_2_n_0 ),
        .O(\mul_fast_result_o[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[12]_i_2 
       (.I0(\mul_fast_result_o_reg[15]_i_3_n_6 ),
        .I1(p_0_in),
        .I2(\mul_fast_result_o_reg[15]_i_3_n_7 ),
        .O(\mul_fast_result_o[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
    \mul_fast_result_o[13]_i_1 
       (.I0(\mul_fast_result_o[21]_i_3_n_0 ),
        .I1(\mul_fast_result_o[30]_i_6_n_0 ),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(s1o_inf_9),
        .I4(\mul_fast_result_o[30]_i_4_n_0 ),
        .I5(\mul_fast_result_o[13]_i_2_n_0 ),
        .O(\mul_fast_result_o[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[13]_i_2 
       (.I0(\mul_fast_result_o_reg[15]_i_3_n_5 ),
        .I1(p_0_in),
        .I2(\mul_fast_result_o_reg[15]_i_3_n_6 ),
        .O(\mul_fast_result_o[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
    \mul_fast_result_o[14]_i_1 
       (.I0(\mul_fast_result_o[21]_i_3_n_0 ),
        .I1(\mul_fast_result_o[30]_i_6_n_0 ),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(s1o_inf_9),
        .I4(\mul_fast_result_o[30]_i_4_n_0 ),
        .I5(\mul_fast_result_o[14]_i_2_n_0 ),
        .O(\mul_fast_result_o[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[14]_i_2 
       (.I0(\mul_fast_result_o_reg[15]_i_3_n_4 ),
        .I1(p_0_in),
        .I2(\mul_fast_result_o_reg[15]_i_3_n_5 ),
        .O(\mul_fast_result_o[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
    \mul_fast_result_o[15]_i_1 
       (.I0(\mul_fast_result_o[21]_i_3_n_0 ),
        .I1(\mul_fast_result_o[30]_i_6_n_0 ),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(s1o_inf_9),
        .I4(\mul_fast_result_o[30]_i_4_n_0 ),
        .I5(\mul_fast_result_o[15]_i_2_n_0 ),
        .O(\mul_fast_result_o[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFF0FFFFFF53FF53)) 
    \mul_fast_result_o[15]_i_10 
       (.I0(s1o_fract35[24]),
        .I1(s1o_fract35[16]),
        .I2(s1o_shr_t_4[3]),
        .I3(s1o_shr_t_4[4]),
        .I4(s1o_fract35[20]),
        .I5(s1o_shr_t_4[2]),
        .O(\mul_fast_result_o[15]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0000FF47FF47)) 
    \mul_fast_result_o[15]_i_11 
       (.I0(s1o_fract35[23]),
        .I1(s1o_shr_t_4[3]),
        .I2(s1o_fract35[15]),
        .I3(s1o_shr_t_4[4]),
        .I4(\mul_fast_result_o[15]_i_12_n_0 ),
        .I5(s1o_shr_t_4[2]),
        .O(\mul_fast_result_o[15]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT4 #(
    .INIT(16'hCFDD)) 
    \mul_fast_result_o[15]_i_12 
       (.I0(s1o_fract35[19]),
        .I1(s1o_shr_t_4[4]),
        .I2(s1o_fract35[27]),
        .I3(s1o_shr_t_4[3]),
        .O(\mul_fast_result_o[15]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[15]_i_2 
       (.I0(\mul_fast_result_o_reg[19]_i_3_n_7 ),
        .I1(p_0_in),
        .I2(\mul_fast_result_o_reg[15]_i_3_n_4 ),
        .O(\mul_fast_result_o[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0F000FFF55335533)) 
    \mul_fast_result_o[15]_i_4 
       (.I0(\mul_fast_result_o[19]_i_12_n_0 ),
        .I1(\mul_fast_result_o[15]_i_8_n_0 ),
        .I2(\mul_fast_result_o[19]_i_10_n_0 ),
        .I3(s1o_shr_t_4[1]),
        .I4(\mul_fast_result_o[19]_i_13_n_0 ),
        .I5(s1o_shr_2),
        .O(s2t_g[15]));
  LUT6 #(
    .INIT(64'h0F000FFF55335533)) 
    \mul_fast_result_o[15]_i_5 
       (.I0(\mul_fast_result_o[19]_i_13_n_0 ),
        .I1(\mul_fast_result_o[15]_i_9_n_0 ),
        .I2(\mul_fast_result_o[19]_i_12_n_0 ),
        .I3(s1o_shr_t_4[1]),
        .I4(\mul_fast_result_o[15]_i_8_n_0 ),
        .I5(s1o_shr_2),
        .O(s2t_g[14]));
  LUT6 #(
    .INIT(64'h0F000FFF55335533)) 
    \mul_fast_result_o[15]_i_6 
       (.I0(\mul_fast_result_o[15]_i_8_n_0 ),
        .I1(\mul_fast_result_o[15]_i_10_n_0 ),
        .I2(\mul_fast_result_o[19]_i_13_n_0 ),
        .I3(s1o_shr_t_4[1]),
        .I4(\mul_fast_result_o[15]_i_9_n_0 ),
        .I5(s1o_shr_2),
        .O(s2t_g[13]));
  LUT6 #(
    .INIT(64'h00CC33FF47474747)) 
    \mul_fast_result_o[15]_i_7 
       (.I0(\mul_fast_result_o[15]_i_9_n_0 ),
        .I1(s1o_shr_t_4[1]),
        .I2(\mul_fast_result_o[15]_i_11_n_0 ),
        .I3(\mul_fast_result_o[15]_i_8_n_0 ),
        .I4(\mul_fast_result_o[15]_i_10_n_0 ),
        .I5(s1o_shr_2),
        .O(s2t_g[12]));
  LUT6 #(
    .INIT(64'hFFCCFFFFFF47FF47)) 
    \mul_fast_result_o[15]_i_8 
       (.I0(s1o_fract35[22]),
        .I1(s1o_shr_t_4[2]),
        .I2(s1o_fract35[18]),
        .I3(s1o_shr_t_4[4]),
        .I4(s1o_fract35[26]),
        .I5(s1o_shr_t_4[3]),
        .O(\mul_fast_result_o[15]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFF0FFFFFF53FF53)) 
    \mul_fast_result_o[15]_i_9 
       (.I0(s1o_fract35[25]),
        .I1(s1o_fract35[17]),
        .I2(s1o_shr_t_4[3]),
        .I3(s1o_shr_t_4[4]),
        .I4(s1o_fract35[21]),
        .I5(s1o_shr_t_4[2]),
        .O(\mul_fast_result_o[15]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
    \mul_fast_result_o[16]_i_1 
       (.I0(\mul_fast_result_o[21]_i_3_n_0 ),
        .I1(\mul_fast_result_o[30]_i_6_n_0 ),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(s1o_inf_9),
        .I4(\mul_fast_result_o[30]_i_4_n_0 ),
        .I5(\mul_fast_result_o[16]_i_2_n_0 ),
        .O(\mul_fast_result_o[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[16]_i_2 
       (.I0(\mul_fast_result_o_reg[19]_i_3_n_6 ),
        .I1(p_0_in),
        .I2(\mul_fast_result_o_reg[19]_i_3_n_7 ),
        .O(\mul_fast_result_o[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
    \mul_fast_result_o[17]_i_1 
       (.I0(\mul_fast_result_o[21]_i_3_n_0 ),
        .I1(\mul_fast_result_o[30]_i_6_n_0 ),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(s1o_inf_9),
        .I4(\mul_fast_result_o[30]_i_4_n_0 ),
        .I5(\mul_fast_result_o[17]_i_2_n_0 ),
        .O(\mul_fast_result_o[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[17]_i_2 
       (.I0(\mul_fast_result_o_reg[19]_i_3_n_5 ),
        .I1(p_0_in),
        .I2(\mul_fast_result_o_reg[19]_i_3_n_6 ),
        .O(\mul_fast_result_o[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
    \mul_fast_result_o[18]_i_1 
       (.I0(\mul_fast_result_o[21]_i_3_n_0 ),
        .I1(\mul_fast_result_o[30]_i_6_n_0 ),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(s1o_inf_9),
        .I4(\mul_fast_result_o[30]_i_4_n_0 ),
        .I5(\mul_fast_result_o[18]_i_2_n_0 ),
        .O(\mul_fast_result_o[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[18]_i_2 
       (.I0(\mul_fast_result_o_reg[19]_i_3_n_4 ),
        .I1(p_0_in),
        .I2(\mul_fast_result_o_reg[19]_i_3_n_5 ),
        .O(\mul_fast_result_o[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
    \mul_fast_result_o[19]_i_1 
       (.I0(\mul_fast_result_o[21]_i_3_n_0 ),
        .I1(\mul_fast_result_o[30]_i_6_n_0 ),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(s1o_inf_9),
        .I4(\mul_fast_result_o[30]_i_4_n_0 ),
        .I5(\mul_fast_result_o[19]_i_2_n_0 ),
        .O(\mul_fast_result_o[19]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFF4FFF7)) 
    \mul_fast_result_o[19]_i_10 
       (.I0(s1o_fract35[25]),
        .I1(s1o_shr_t_4[2]),
        .I2(s1o_shr_t_4[3]),
        .I3(s1o_shr_t_4[4]),
        .I4(s1o_fract35[21]),
        .O(\mul_fast_result_o[19]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT5 #(
    .INIT(32'hFFF4FFF7)) 
    \mul_fast_result_o[19]_i_11 
       (.I0(s1o_fract35[26]),
        .I1(s1o_shr_t_4[2]),
        .I2(s1o_shr_t_4[3]),
        .I3(s1o_shr_t_4[4]),
        .I4(s1o_fract35[22]),
        .O(\mul_fast_result_o[19]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hFFF4FFF7)) 
    \mul_fast_result_o[19]_i_12 
       (.I0(s1o_fract35[24]),
        .I1(s1o_shr_t_4[2]),
        .I2(s1o_shr_t_4[3]),
        .I3(s1o_shr_t_4[4]),
        .I4(s1o_fract35[20]),
        .O(\mul_fast_result_o[19]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hFFF3FFF3FF05FFF5)) 
    \mul_fast_result_o[19]_i_13 
       (.I0(s1o_fract35[19]),
        .I1(s1o_fract35[27]),
        .I2(s1o_shr_t_4[2]),
        .I3(s1o_shr_t_4[4]),
        .I4(s1o_fract35[23]),
        .I5(s1o_shr_t_4[3]),
        .O(\mul_fast_result_o[19]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[19]_i_2 
       (.I0(\fpcsr_o_reg[7]_i_4_n_7 ),
        .I1(p_0_in),
        .I2(\mul_fast_result_o_reg[19]_i_3_n_4 ),
        .O(\mul_fast_result_o[19]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[19]_i_4 
       (.I0(\fpcsr_o[7]_i_25_n_0 ),
        .I1(s1o_shr_2),
        .I2(\mul_fast_result_o[19]_i_8_n_0 ),
        .O(s2t_g[19]));
  LUT5 #(
    .INIT(32'hFF00A3A3)) 
    \mul_fast_result_o[19]_i_5 
       (.I0(\mul_fast_result_o[19]_i_9_n_0 ),
        .I1(\mul_fast_result_o[19]_i_10_n_0 ),
        .I2(s1o_shr_t_4[1]),
        .I3(\mul_fast_result_o[19]_i_8_n_0 ),
        .I4(s1o_shr_2),
        .O(s2t_g[18]));
  LUT6 #(
    .INIT(64'hF505F5050303F3F3)) 
    \mul_fast_result_o[19]_i_6 
       (.I0(\mul_fast_result_o[19]_i_11_n_0 ),
        .I1(\mul_fast_result_o[19]_i_12_n_0 ),
        .I2(s1o_shr_2),
        .I3(\mul_fast_result_o[19]_i_9_n_0 ),
        .I4(\mul_fast_result_o[19]_i_10_n_0 ),
        .I5(s1o_shr_t_4[1]),
        .O(s2t_g[17]));
  LUT6 #(
    .INIT(64'h0F000FFF55335533)) 
    \mul_fast_result_o[19]_i_7 
       (.I0(\mul_fast_result_o[19]_i_10_n_0 ),
        .I1(\mul_fast_result_o[19]_i_13_n_0 ),
        .I2(\mul_fast_result_o[19]_i_11_n_0 ),
        .I3(s1o_shr_t_4[1]),
        .I4(\mul_fast_result_o[19]_i_12_n_0 ),
        .I5(s1o_shr_2),
        .O(s2t_g[16]));
  LUT6 #(
    .INIT(64'h0000003055555555)) 
    \mul_fast_result_o[19]_i_8 
       (.I0(\mul_fast_result_o[19]_i_11_n_0 ),
        .I1(s1o_shr_t_4[2]),
        .I2(s1o_fract35[24]),
        .I3(s1o_shr_t_4[4]),
        .I4(s1o_shr_t_4[3]),
        .I5(s1o_shr_t_4[1]),
        .O(\mul_fast_result_o[19]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h00000B08)) 
    \mul_fast_result_o[19]_i_9 
       (.I0(s1o_fract35[27]),
        .I1(s1o_shr_t_4[2]),
        .I2(s1o_shr_t_4[4]),
        .I3(s1o_fract35[23]),
        .I4(s1o_shr_t_4[3]),
        .O(\mul_fast_result_o[19]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
    \mul_fast_result_o[1]_i_1 
       (.I0(\mul_fast_result_o[21]_i_3_n_0 ),
        .I1(\mul_fast_result_o[30]_i_6_n_0 ),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(s1o_inf_9),
        .I4(\mul_fast_result_o[30]_i_4_n_0 ),
        .I5(\mul_fast_result_o[1]_i_2_n_0 ),
        .O(\mul_fast_result_o[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[1]_i_2 
       (.I0(\mul_fast_result_o_reg[3]_i_3_n_5 ),
        .I1(p_0_in),
        .I2(\mul_fast_result_o_reg[3]_i_3_n_6 ),
        .O(\mul_fast_result_o[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
    \mul_fast_result_o[20]_i_1 
       (.I0(\mul_fast_result_o[21]_i_3_n_0 ),
        .I1(\mul_fast_result_o[30]_i_6_n_0 ),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(s1o_inf_9),
        .I4(\mul_fast_result_o[30]_i_4_n_0 ),
        .I5(\mul_fast_result_o[20]_i_2_n_0 ),
        .O(\mul_fast_result_o[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[20]_i_2 
       (.I0(\fpcsr_o_reg[7]_i_4_n_6 ),
        .I1(p_0_in),
        .I2(\fpcsr_o_reg[7]_i_4_n_7 ),
        .O(\mul_fast_result_o[20]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFEEEEE)) 
    \mul_fast_result_o[21]_i_1 
       (.I0(rst_IBUF),
        .I1(flush_i_IBUF),
        .I2(s1o_qnan_0),
        .I3(s1o_snan_1),
        .I4(adv_i_IBUF),
        .O(\mul_fast_result_o[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
    \mul_fast_result_o[21]_i_2 
       (.I0(\mul_fast_result_o[21]_i_3_n_0 ),
        .I1(\mul_fast_result_o[30]_i_6_n_0 ),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(s1o_inf_9),
        .I4(\mul_fast_result_o[30]_i_4_n_0 ),
        .I5(\mul_fast_result_o[21]_i_4_n_0 ),
        .O(\mul_fast_result_o[21]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \mul_fast_result_o[21]_i_3 
       (.I0(s1o_inv_8),
        .I1(s1o_snan_1),
        .I2(s1o_qnan_0),
        .O(\mul_fast_result_o[21]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[21]_i_4 
       (.I0(\fpcsr_o_reg[7]_i_4_n_5 ),
        .I1(p_0_in),
        .I2(\fpcsr_o_reg[7]_i_4_n_6 ),
        .O(\mul_fast_result_o[21]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h5555555D55555555)) 
    \mul_fast_result_o[22]_i_1 
       (.I0(\mul_fast_result_o[22]_i_2_n_0 ),
        .I1(\mul_fast_result_o[22]_i_3_n_0 ),
        .I2(\mul_fast_result_o[30]_i_6_n_0 ),
        .I3(\mul_fast_result_o[30]_i_5_n_0 ),
        .I4(s1o_inf_9),
        .I5(\mul_fast_result_o[30]_i_4_n_0 ),
        .O(\mul_fast_result_o[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \mul_fast_result_o[22]_i_2 
       (.I0(s1o_qnan_0),
        .I1(s1o_snan_1),
        .O(\mul_fast_result_o[22]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[22]_i_3 
       (.I0(\fpcsr_o_reg[7]_i_4_n_4 ),
        .I1(p_0_in),
        .I2(\fpcsr_o_reg[7]_i_4_n_5 ),
        .O(\mul_fast_result_o[22]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFDFFFDFFFDFFFF)) 
    \mul_fast_result_o[23]_i_1 
       (.I0(\mul_fast_result_o[30]_i_4_n_0 ),
        .I1(s1o_inf_9),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(\mul_fast_result_o[30]_i_6_n_0 ),
        .I4(\mul_fast_result_o[30]_i_2_n_0 ),
        .I5(\mul_fast_result_o[23]_i_2_n_0 ),
        .O(\mul_fast_result_o[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA5A56A9555556A95)) 
    \mul_fast_result_o[23]_i_2 
       (.I0(p_0_in),
        .I1(s1o_exp10sh0[0]),
        .I2(s1o_ready_11),
        .I3(s1o_carry_3),
        .I4(\mul_fast_result_o[26]_i_5_n_0 ),
        .I5(s1o_exp10shr[0]),
        .O(\mul_fast_result_o[23]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFD)) 
    \mul_fast_result_o[24]_i_1 
       (.I0(\mul_fast_result_o[30]_i_4_n_0 ),
        .I1(s1o_inf_9),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(\mul_fast_result_o[30]_i_6_n_0 ),
        .I4(\mul_fast_result_o[24]_i_2_n_0 ),
        .O(\mul_fast_result_o[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT4 #(
    .INIT(16'h6650)) 
    \mul_fast_result_o[24]_i_2 
       (.I0(\mul_fast_result_o[25]_i_5_n_0 ),
        .I1(\mul_fast_result_o[25]_i_4_n_0 ),
        .I2(\fpcsr_o_reg[7]_i_4_n_4 ),
        .I3(p_0_in),
        .O(\mul_fast_result_o[24]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFD)) 
    \mul_fast_result_o[25]_i_1 
       (.I0(\mul_fast_result_o[30]_i_4_n_0 ),
        .I1(s1o_inf_9),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(\mul_fast_result_o[30]_i_6_n_0 ),
        .I4(\mul_fast_result_o[25]_i_2_n_0 ),
        .O(\mul_fast_result_o[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT5 #(
    .INIT(32'h56565500)) 
    \mul_fast_result_o[25]_i_2 
       (.I0(\mul_fast_result_o[25]_i_3_n_0 ),
        .I1(\mul_fast_result_o[25]_i_4_n_0 ),
        .I2(\mul_fast_result_o[25]_i_5_n_0 ),
        .I3(\fpcsr_o_reg[7]_i_4_n_4 ),
        .I4(p_0_in),
        .O(\mul_fast_result_o[25]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h4774FCFC)) 
    \mul_fast_result_o[25]_i_3 
       (.I0(s1o_exp10shr[2]),
        .I1(\mul_fast_result_o[26]_i_5_n_0 ),
        .I2(\mul_fast_result_o[25]_i_6_n_0 ),
        .I3(s1o_exp10sh0[2]),
        .I4(s1o_ready_11),
        .O(\mul_fast_result_o[25]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h74CF47CF)) 
    \mul_fast_result_o[25]_i_4 
       (.I0(s1o_exp10shr[0]),
        .I1(\mul_fast_result_o[26]_i_5_n_0 ),
        .I2(s1o_carry_3),
        .I3(s1o_ready_11),
        .I4(s1o_exp10sh0[0]),
        .O(\mul_fast_result_o[25]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h74444777FFFFFFFF)) 
    \mul_fast_result_o[25]_i_5 
       (.I0(s1o_exp10shr[1]),
        .I1(\mul_fast_result_o[26]_i_5_n_0 ),
        .I2(s1o_carry_3),
        .I3(s1o_exp10sh0[0]),
        .I4(s1o_exp10sh0[1]),
        .I5(s1o_ready_11),
        .O(\mul_fast_result_o[25]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \mul_fast_result_o[25]_i_6 
       (.I0(s1o_carry_3),
        .I1(s1o_exp10sh0[0]),
        .I2(s1o_ready_11),
        .I3(s1o_exp10sh0[1]),
        .O(\mul_fast_result_o[25]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFDFFFDFFFDFFFF)) 
    \mul_fast_result_o[26]_i_1 
       (.I0(\mul_fast_result_o[30]_i_4_n_0 ),
        .I1(s1o_inf_9),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(\mul_fast_result_o[30]_i_6_n_0 ),
        .I4(\mul_fast_result_o[30]_i_2_n_0 ),
        .I5(\mul_fast_result_o[26]_i_2_n_0 ),
        .O(\mul_fast_result_o[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9999956A5555956A)) 
    \mul_fast_result_o[26]_i_2 
       (.I0(\mul_fast_result_o[26]_i_3_n_0 ),
        .I1(s1o_ready_11),
        .I2(s1o_exp10sh0[3]),
        .I3(\mul_fast_result_o[26]_i_4_n_0 ),
        .I4(\mul_fast_result_o[26]_i_5_n_0 ),
        .I5(s1o_exp10shr[3]),
        .O(\mul_fast_result_o[26]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \mul_fast_result_o[26]_i_3 
       (.I0(\mul_fast_result_o[25]_i_5_n_0 ),
        .I1(\mul_fast_result_o[25]_i_4_n_0 ),
        .I2(p_0_in),
        .I3(\mul_fast_result_o[25]_i_3_n_0 ),
        .O(\mul_fast_result_o[26]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \mul_fast_result_o[26]_i_4 
       (.I0(s1o_exp10sh0[1]),
        .I1(s1o_exp10sh0[0]),
        .I2(s1o_carry_3),
        .I3(s1o_exp10sh0[2]),
        .I4(s1o_ready_11),
        .O(\mul_fast_result_o[26]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \mul_fast_result_o[26]_i_5 
       (.I0(s1o_shr_t_4[3]),
        .I1(s1o_shr_t_4[4]),
        .I2(s1o_shr_t_4[1]),
        .I3(s1o_shr_t_4[0]),
        .I4(s1o_shr_t_4[2]),
        .O(\mul_fast_result_o[26]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFD)) 
    \mul_fast_result_o[27]_i_1 
       (.I0(\mul_fast_result_o[30]_i_4_n_0 ),
        .I1(s1o_inf_9),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(\mul_fast_result_o[30]_i_6_n_0 ),
        .I4(\mul_fast_result_o[27]_i_2_n_0 ),
        .O(\mul_fast_result_o[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT4 #(
    .INIT(16'h9990)) 
    \mul_fast_result_o[27]_i_2 
       (.I0(\mul_fast_result_o[27]_i_3_n_0 ),
        .I1(\mul_fast_result_o[27]_i_4_n_0 ),
        .I2(\fpcsr_o_reg[7]_i_4_n_4 ),
        .I3(p_0_in),
        .O(\mul_fast_result_o[27]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h5578FF78FFFFFFFF)) 
    \mul_fast_result_o[27]_i_3 
       (.I0(s1o_ready_11),
        .I1(s1o_exp10sh0[3]),
        .I2(\mul_fast_result_o[26]_i_4_n_0 ),
        .I3(\mul_fast_result_o[26]_i_5_n_0 ),
        .I4(s1o_exp10shr[3]),
        .I5(\mul_fast_result_o[26]_i_3_n_0 ),
        .O(\mul_fast_result_o[27]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hF0009595)) 
    \mul_fast_result_o[27]_i_4 
       (.I0(\mul_fast_result_o[30]_i_13_n_0 ),
        .I1(s1o_exp10sh0[4]),
        .I2(s1o_ready_11),
        .I3(s1o_exp10shr[4]),
        .I4(\mul_fast_result_o[26]_i_5_n_0 ),
        .O(\mul_fast_result_o[27]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFDFFFDFFFDFFFF)) 
    \mul_fast_result_o[28]_i_1 
       (.I0(\mul_fast_result_o[30]_i_4_n_0 ),
        .I1(s1o_inf_9),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(\mul_fast_result_o[30]_i_6_n_0 ),
        .I4(\mul_fast_result_o[30]_i_2_n_0 ),
        .I5(\mul_fast_result_o[28]_i_2_n_0 ),
        .O(\mul_fast_result_o[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \mul_fast_result_o[28]_i_2 
       (.I0(\mul_fast_result_o[30]_i_9_n_0 ),
        .I1(\mul_fast_result_o[30]_i_8_n_0 ),
        .O(\mul_fast_result_o[28]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFD)) 
    \mul_fast_result_o[29]_i_1 
       (.I0(\mul_fast_result_o[30]_i_4_n_0 ),
        .I1(s1o_inf_9),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(\mul_fast_result_o[30]_i_6_n_0 ),
        .I4(\mul_fast_result_o[29]_i_2_n_0 ),
        .O(\mul_fast_result_o[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT5 #(
    .INIT(32'hB4B4B400)) 
    \mul_fast_result_o[29]_i_2 
       (.I0(\mul_fast_result_o[30]_i_8_n_0 ),
        .I1(\mul_fast_result_o[30]_i_9_n_0 ),
        .I2(\mul_fast_result_o[30]_i_10_n_0 ),
        .I3(\fpcsr_o_reg[7]_i_4_n_4 ),
        .I4(p_0_in),
        .O(\mul_fast_result_o[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
    \mul_fast_result_o[2]_i_1 
       (.I0(\mul_fast_result_o[21]_i_3_n_0 ),
        .I1(\mul_fast_result_o[30]_i_6_n_0 ),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(s1o_inf_9),
        .I4(\mul_fast_result_o[30]_i_4_n_0 ),
        .I5(\mul_fast_result_o[2]_i_2_n_0 ),
        .O(\mul_fast_result_o[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[2]_i_2 
       (.I0(\mul_fast_result_o_reg[3]_i_3_n_4 ),
        .I1(p_0_in),
        .I2(\mul_fast_result_o_reg[3]_i_3_n_5 ),
        .O(\mul_fast_result_o[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFF4F)) 
    \mul_fast_result_o[30]_i_1 
       (.I0(\mul_fast_result_o[30]_i_2_n_0 ),
        .I1(\mul_fast_result_o[30]_i_3_n_0 ),
        .I2(\mul_fast_result_o[30]_i_4_n_0 ),
        .I3(s1o_inf_9),
        .I4(\mul_fast_result_o[30]_i_5_n_0 ),
        .I5(\mul_fast_result_o[30]_i_6_n_0 ),
        .O(\mul_fast_result_o[30]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8B33B800)) 
    \mul_fast_result_o[30]_i_10 
       (.I0(s1o_exp10shr[6]),
        .I1(\mul_fast_result_o[26]_i_5_n_0 ),
        .I2(s1o_exp10sh0[6]),
        .I3(s1o_ready_11),
        .I4(\mul_fast_result_o[30]_i_15_n_0 ),
        .O(\mul_fast_result_o[30]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0000000004000004)) 
    \mul_fast_result_o[30]_i_11 
       (.I0(\mul_fast_result_o[30]_i_14_n_0 ),
        .I1(\mul_fast_result_o[27]_i_4_n_0 ),
        .I2(\mul_fast_result_o[25]_i_3_n_0 ),
        .I3(p_0_in),
        .I4(\mul_fast_result_o[25]_i_4_n_0 ),
        .I5(\mul_fast_result_o[25]_i_5_n_0 ),
        .O(\mul_fast_result_o[30]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT5 #(
    .INIT(32'h20000000)) 
    \mul_fast_result_o[30]_i_12 
       (.I0(s1o_exp10sh0[6]),
        .I1(\mul_fast_result_o[30]_i_13_n_0 ),
        .I2(s1o_exp10sh0[4]),
        .I3(s1o_ready_11),
        .I4(s1o_exp10sh0[5]),
        .O(\mul_fast_result_o[30]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \mul_fast_result_o[30]_i_13 
       (.I0(s1o_ready_11),
        .I1(s1o_exp10sh0[2]),
        .I2(s1o_carry_3),
        .I3(s1o_exp10sh0[0]),
        .I4(s1o_exp10sh0[1]),
        .I5(s1o_exp10sh0[3]),
        .O(\mul_fast_result_o[30]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'h4774FCFC)) 
    \mul_fast_result_o[30]_i_14 
       (.I0(s1o_exp10shr[3]),
        .I1(\mul_fast_result_o[26]_i_5_n_0 ),
        .I2(\mul_fast_result_o[26]_i_4_n_0 ),
        .I3(s1o_exp10sh0[3]),
        .I4(s1o_ready_11),
        .O(\mul_fast_result_o[30]_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \mul_fast_result_o[30]_i_15 
       (.I0(s1o_exp10sh0[5]),
        .I1(s1o_ready_11),
        .I2(s1o_exp10sh0[4]),
        .I3(\mul_fast_result_o[30]_i_13_n_0 ),
        .O(\mul_fast_result_o[30]_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \mul_fast_result_o[30]_i_2 
       (.I0(p_0_in),
        .I1(\fpcsr_o_reg[7]_i_4_n_4 ),
        .O(\mul_fast_result_o[30]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h9AAA)) 
    \mul_fast_result_o[30]_i_3 
       (.I0(\mul_fast_result_o[30]_i_7_n_0 ),
        .I1(\mul_fast_result_o[30]_i_8_n_0 ),
        .I2(\mul_fast_result_o[30]_i_9_n_0 ),
        .I3(\mul_fast_result_o[30]_i_10_n_0 ),
        .O(\mul_fast_result_o[30]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \mul_fast_result_o[30]_i_4 
       (.I0(s1o_qnan_0),
        .I1(s1o_inv_8),
        .I2(s1o_snan_1),
        .O(\mul_fast_result_o[30]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hD50555D555555555)) 
    \mul_fast_result_o[30]_i_5 
       (.I0(\fpcsr_o[10]_i_5_n_0 ),
        .I1(\mul_fast_result_o[30]_i_11_n_0 ),
        .I2(\mul_fast_result_o[30]_i_10_n_0 ),
        .I3(\mul_fast_result_o[30]_i_8_n_0 ),
        .I4(\mul_fast_result_o[30]_i_9_n_0 ),
        .I5(\mul_fast_result_o[30]_i_7_n_0 ),
        .O(\mul_fast_result_o[30]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h2000FFFF20000000)) 
    \mul_fast_result_o[30]_i_6 
       (.I0(\mul_fast_result_o[30]_i_7_n_0 ),
        .I1(\mul_fast_result_o[30]_i_8_n_0 ),
        .I2(\mul_fast_result_o[30]_i_9_n_0 ),
        .I3(\mul_fast_result_o[30]_i_10_n_0 ),
        .I4(\fpcsr_o[10]_i_2_n_0 ),
        .I5(\fpcsr_o[10]_i_5_n_0 ),
        .O(\mul_fast_result_o[30]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h8B33B800)) 
    \mul_fast_result_o[30]_i_7 
       (.I0(s1o_exp10shr[7]),
        .I1(\mul_fast_result_o[26]_i_5_n_0 ),
        .I2(s1o_exp10sh0[7]),
        .I3(s1o_ready_11),
        .I4(\mul_fast_result_o[30]_i_12_n_0 ),
        .O(\mul_fast_result_o[30]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h44747747FFFFFFFF)) 
    \mul_fast_result_o[30]_i_8 
       (.I0(s1o_exp10shr[5]),
        .I1(\mul_fast_result_o[26]_i_5_n_0 ),
        .I2(s1o_exp10sh0[4]),
        .I3(\mul_fast_result_o[30]_i_13_n_0 ),
        .I4(s1o_exp10sh0[5]),
        .I5(s1o_ready_11),
        .O(\mul_fast_result_o[30]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000100000)) 
    \mul_fast_result_o[30]_i_9 
       (.I0(\mul_fast_result_o[25]_i_5_n_0 ),
        .I1(\mul_fast_result_o[25]_i_4_n_0 ),
        .I2(p_0_in),
        .I3(\mul_fast_result_o[25]_i_3_n_0 ),
        .I4(\mul_fast_result_o[27]_i_4_n_0 ),
        .I5(\mul_fast_result_o[30]_i_14_n_0 ),
        .O(\mul_fast_result_o[30]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT4 #(
    .INIT(16'hFE02)) 
    \mul_fast_result_o[31]_i_1 
       (.I0(s1o_sign_5),
        .I1(s1o_qnan_0),
        .I2(s1o_snan_1),
        .I3(s1o_anan_sign_10),
        .O(\mul_fast_result_o[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
    \mul_fast_result_o[3]_i_1 
       (.I0(\mul_fast_result_o[21]_i_3_n_0 ),
        .I1(\mul_fast_result_o[30]_i_6_n_0 ),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(s1o_inf_9),
        .I4(\mul_fast_result_o[30]_i_4_n_0 ),
        .I5(\mul_fast_result_o[3]_i_2_n_0 ),
        .O(\mul_fast_result_o[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[3]_i_10 
       (.I0(\fpcsr_o[8]_i_12_n_0 ),
        .I1(s1o_shr_t_4[2]),
        .I2(\fpcsr_o[8]_i_13_n_0 ),
        .O(\mul_fast_result_o[3]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[3]_i_11 
       (.I0(\fpcsr_o[8]_i_8_n_0 ),
        .I1(s1o_shr_t_4[2]),
        .I2(\fpcsr_o[8]_i_9_n_0 ),
        .O(\mul_fast_result_o[3]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hFFEF0020)) 
    \mul_fast_result_o[3]_i_12 
       (.I0(s1o_sticky_l_6),
        .I1(s1o_shr_t_4[4]),
        .I2(\fpcsr_o[8]_i_5_n_0 ),
        .I3(s1o_shr_2),
        .I4(s1o_sticky_r_7),
        .O(\mul_fast_result_o[3]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[3]_i_2 
       (.I0(\mul_fast_result_o_reg[7]_i_3_n_7 ),
        .I1(p_0_in),
        .I2(\mul_fast_result_o_reg[3]_i_3_n_4 ),
        .O(\mul_fast_result_o[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \mul_fast_result_o[3]_i_4 
       (.I0(\mul_fast_result_o[3]_i_9_n_0 ),
        .I1(s1o_shr_t_4[1]),
        .I2(\mul_fast_result_o[3]_i_10_n_0 ),
        .I3(s1o_shr_2),
        .I4(\fpcsr_o[8]_i_6_n_0 ),
        .O(\mul_fast_result_o[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8FF33CC00)) 
    \mul_fast_result_o[3]_i_5 
       (.I0(\mul_fast_result_o[7]_i_9_n_0 ),
        .I1(s1o_shr_t_4[1]),
        .I2(\mul_fast_result_o[7]_i_11_n_0 ),
        .I3(\mul_fast_result_o[7]_i_10_n_0 ),
        .I4(\mul_fast_result_o[3]_i_9_n_0 ),
        .I5(s1o_shr_2),
        .O(s2t_g[3]));
  LUT6 #(
    .INIT(64'hFF33CC00B8B8B8B8)) 
    \mul_fast_result_o[3]_i_6 
       (.I0(\mul_fast_result_o[7]_i_11_n_0 ),
        .I1(s1o_shr_t_4[1]),
        .I2(\mul_fast_result_o[3]_i_11_n_0 ),
        .I3(\mul_fast_result_o[7]_i_10_n_0 ),
        .I4(\mul_fast_result_o[3]_i_9_n_0 ),
        .I5(s1o_shr_2),
        .O(s2t_g[2]));
  LUT6 #(
    .INIT(64'hB8B8B8B8FF33CC00)) 
    \mul_fast_result_o[3]_i_7 
       (.I0(\mul_fast_result_o[7]_i_11_n_0 ),
        .I1(s1o_shr_t_4[1]),
        .I2(\mul_fast_result_o[3]_i_11_n_0 ),
        .I3(\mul_fast_result_o[3]_i_9_n_0 ),
        .I4(\mul_fast_result_o[3]_i_10_n_0 ),
        .I5(s1o_shr_2),
        .O(s2t_g[1]));
  LUT6 #(
    .INIT(64'h67986F80CD32CF20)) 
    \mul_fast_result_o[3]_i_8 
       (.I0(rmode_i_IBUF[1]),
        .I1(rmode_i_IBUF[0]),
        .I2(\fpcsr_o[8]_i_4_n_0 ),
        .I3(\mul_fast_result_o[3]_i_4_n_0 ),
        .I4(\mul_fast_result_o[3]_i_12_n_0 ),
        .I5(s1o_sign_5),
        .O(\mul_fast_result_o[3]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[3]_i_9 
       (.I0(\mul_fast_result_o[7]_i_12_n_0 ),
        .I1(s1o_shr_t_4[2]),
        .I2(\fpcsr_o[8]_i_14_n_0 ),
        .O(\mul_fast_result_o[3]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
    \mul_fast_result_o[4]_i_1 
       (.I0(\mul_fast_result_o[21]_i_3_n_0 ),
        .I1(\mul_fast_result_o[30]_i_6_n_0 ),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(s1o_inf_9),
        .I4(\mul_fast_result_o[30]_i_4_n_0 ),
        .I5(\mul_fast_result_o[4]_i_2_n_0 ),
        .O(\mul_fast_result_o[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[4]_i_2 
       (.I0(\mul_fast_result_o_reg[7]_i_3_n_6 ),
        .I1(p_0_in),
        .I2(\mul_fast_result_o_reg[7]_i_3_n_7 ),
        .O(\mul_fast_result_o[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
    \mul_fast_result_o[5]_i_1 
       (.I0(\mul_fast_result_o[21]_i_3_n_0 ),
        .I1(\mul_fast_result_o[30]_i_6_n_0 ),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(s1o_inf_9),
        .I4(\mul_fast_result_o[30]_i_4_n_0 ),
        .I5(\mul_fast_result_o[5]_i_2_n_0 ),
        .O(\mul_fast_result_o[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[5]_i_2 
       (.I0(\mul_fast_result_o_reg[7]_i_3_n_5 ),
        .I1(p_0_in),
        .I2(\mul_fast_result_o_reg[7]_i_3_n_6 ),
        .O(\mul_fast_result_o[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
    \mul_fast_result_o[6]_i_1 
       (.I0(\mul_fast_result_o[21]_i_3_n_0 ),
        .I1(\mul_fast_result_o[30]_i_6_n_0 ),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(s1o_inf_9),
        .I4(\mul_fast_result_o[30]_i_4_n_0 ),
        .I5(\mul_fast_result_o[6]_i_2_n_0 ),
        .O(\mul_fast_result_o[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[6]_i_2 
       (.I0(\mul_fast_result_o_reg[7]_i_3_n_4 ),
        .I1(p_0_in),
        .I2(\mul_fast_result_o_reg[7]_i_3_n_5 ),
        .O(\mul_fast_result_o[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
    \mul_fast_result_o[7]_i_1 
       (.I0(\mul_fast_result_o[21]_i_3_n_0 ),
        .I1(\mul_fast_result_o[30]_i_6_n_0 ),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(s1o_inf_9),
        .I4(\mul_fast_result_o[30]_i_4_n_0 ),
        .I5(\mul_fast_result_o[7]_i_2_n_0 ),
        .O(\mul_fast_result_o[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00B8FFFF00B80000)) 
    \mul_fast_result_o[7]_i_10 
       (.I0(s1o_fract35[20]),
        .I1(s1o_shr_t_4[3]),
        .I2(s1o_fract35[12]),
        .I3(s1o_shr_t_4[4]),
        .I4(s1o_shr_t_4[2]),
        .I5(\fpcsr_o[8]_i_12_n_0 ),
        .O(\mul_fast_result_o[7]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[7]_i_11 
       (.I0(\mul_fast_result_o[11]_i_15_n_0 ),
        .I1(s1o_shr_t_4[2]),
        .I2(\fpcsr_o[8]_i_10_n_0 ),
        .O(\mul_fast_result_o[7]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \mul_fast_result_o[7]_i_12 
       (.I0(s1o_fract35[18]),
        .I1(s1o_shr_t_4[3]),
        .I2(s1o_fract35[26]),
        .I3(s1o_shr_t_4[4]),
        .I4(s1o_fract35[10]),
        .O(\mul_fast_result_o[7]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[7]_i_2 
       (.I0(\mul_fast_result_o_reg[11]_i_3_n_7 ),
        .I1(p_0_in),
        .I2(\mul_fast_result_o_reg[7]_i_3_n_4 ),
        .O(\mul_fast_result_o[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8FF33CC00)) 
    \mul_fast_result_o[7]_i_4 
       (.I0(\mul_fast_result_o[11]_i_9_n_0 ),
        .I1(s1o_shr_t_4[1]),
        .I2(\mul_fast_result_o[11]_i_11_n_0 ),
        .I3(\mul_fast_result_o[11]_i_10_n_0 ),
        .I4(\mul_fast_result_o[7]_i_8_n_0 ),
        .I5(s1o_shr_2),
        .O(s2t_g[7]));
  LUT6 #(
    .INIT(64'hFF33CC00B8B8B8B8)) 
    \mul_fast_result_o[7]_i_5 
       (.I0(\mul_fast_result_o[11]_i_11_n_0 ),
        .I1(s1o_shr_t_4[1]),
        .I2(\mul_fast_result_o[7]_i_9_n_0 ),
        .I3(\mul_fast_result_o[11]_i_10_n_0 ),
        .I4(\mul_fast_result_o[7]_i_8_n_0 ),
        .I5(s1o_shr_2),
        .O(s2t_g[6]));
  LUT6 #(
    .INIT(64'hB8B8B8B8FF33CC00)) 
    \mul_fast_result_o[7]_i_6 
       (.I0(\mul_fast_result_o[11]_i_11_n_0 ),
        .I1(s1o_shr_t_4[1]),
        .I2(\mul_fast_result_o[7]_i_9_n_0 ),
        .I3(\mul_fast_result_o[7]_i_8_n_0 ),
        .I4(\mul_fast_result_o[7]_i_10_n_0 ),
        .I5(s1o_shr_2),
        .O(s2t_g[5]));
  LUT6 #(
    .INIT(64'hFF33CC00B8B8B8B8)) 
    \mul_fast_result_o[7]_i_7 
       (.I0(\mul_fast_result_o[7]_i_9_n_0 ),
        .I1(s1o_shr_t_4[1]),
        .I2(\mul_fast_result_o[7]_i_11_n_0 ),
        .I3(\mul_fast_result_o[7]_i_8_n_0 ),
        .I4(\mul_fast_result_o[7]_i_10_n_0 ),
        .I5(s1o_shr_2),
        .O(s2t_g[4]));
  LUT6 #(
    .INIT(64'h00B8FFFF00B80000)) 
    \mul_fast_result_o[7]_i_8 
       (.I0(s1o_fract35[22]),
        .I1(s1o_shr_t_4[3]),
        .I2(s1o_fract35[14]),
        .I3(s1o_shr_t_4[4]),
        .I4(s1o_shr_t_4[2]),
        .I5(\mul_fast_result_o[7]_i_12_n_0 ),
        .O(\mul_fast_result_o[7]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h00B8FFFF00B80000)) 
    \mul_fast_result_o[7]_i_9 
       (.I0(s1o_fract35[21]),
        .I1(s1o_shr_t_4[3]),
        .I2(s1o_fract35[13]),
        .I3(s1o_shr_t_4[4]),
        .I4(s1o_shr_t_4[2]),
        .I5(\fpcsr_o[8]_i_8_n_0 ),
        .O(\mul_fast_result_o[7]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
    \mul_fast_result_o[8]_i_1 
       (.I0(\mul_fast_result_o[21]_i_3_n_0 ),
        .I1(\mul_fast_result_o[30]_i_6_n_0 ),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(s1o_inf_9),
        .I4(\mul_fast_result_o[30]_i_4_n_0 ),
        .I5(\mul_fast_result_o[8]_i_2_n_0 ),
        .O(\mul_fast_result_o[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[8]_i_2 
       (.I0(\mul_fast_result_o_reg[11]_i_3_n_6 ),
        .I1(p_0_in),
        .I2(\mul_fast_result_o_reg[11]_i_3_n_7 ),
        .O(\mul_fast_result_o[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
    \mul_fast_result_o[9]_i_1 
       (.I0(\mul_fast_result_o[21]_i_3_n_0 ),
        .I1(\mul_fast_result_o[30]_i_6_n_0 ),
        .I2(\mul_fast_result_o[30]_i_5_n_0 ),
        .I3(s1o_inf_9),
        .I4(\mul_fast_result_o[30]_i_4_n_0 ),
        .I5(\mul_fast_result_o[9]_i_2_n_0 ),
        .O(\mul_fast_result_o[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mul_fast_result_o[9]_i_2 
       (.I0(\mul_fast_result_o_reg[11]_i_3_n_5 ),
        .I1(p_0_in),
        .I2(\mul_fast_result_o_reg[11]_i_3_n_6 ),
        .O(\mul_fast_result_o[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(\mul_fast_result_o[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[10]_i_1_n_0 ),
        .Q(Q[10]),
        .R(\mul_fast_result_o[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[11]_i_1_n_0 ),
        .Q(Q[11]),
        .R(\mul_fast_result_o[21]_i_1_n_0 ));
  CARRY4 \mul_fast_result_o_reg[11]_i_3 
       (.CI(\mul_fast_result_o_reg[7]_i_3_n_0 ),
        .CO({\mul_fast_result_o_reg[11]_i_3_n_0 ,\mul_fast_result_o_reg[11]_i_3_n_1 ,\mul_fast_result_o_reg[11]_i_3_n_2 ,\mul_fast_result_o_reg[11]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\mul_fast_result_o_reg[11]_i_3_n_4 ,\mul_fast_result_o_reg[11]_i_3_n_5 ,\mul_fast_result_o_reg[11]_i_3_n_6 ,\mul_fast_result_o_reg[11]_i_3_n_7 }),
        .S(s2t_g[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[12]_i_1_n_0 ),
        .Q(Q[12]),
        .R(\mul_fast_result_o[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[13]_i_1_n_0 ),
        .Q(Q[13]),
        .R(\mul_fast_result_o[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[14]_i_1_n_0 ),
        .Q(Q[14]),
        .R(\mul_fast_result_o[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[15]_i_1_n_0 ),
        .Q(Q[15]),
        .R(\mul_fast_result_o[21]_i_1_n_0 ));
  CARRY4 \mul_fast_result_o_reg[15]_i_3 
       (.CI(\mul_fast_result_o_reg[11]_i_3_n_0 ),
        .CO({\mul_fast_result_o_reg[15]_i_3_n_0 ,\mul_fast_result_o_reg[15]_i_3_n_1 ,\mul_fast_result_o_reg[15]_i_3_n_2 ,\mul_fast_result_o_reg[15]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\mul_fast_result_o_reg[15]_i_3_n_4 ,\mul_fast_result_o_reg[15]_i_3_n_5 ,\mul_fast_result_o_reg[15]_i_3_n_6 ,\mul_fast_result_o_reg[15]_i_3_n_7 }),
        .S(s2t_g[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[16]_i_1_n_0 ),
        .Q(Q[16]),
        .R(\mul_fast_result_o[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[17]_i_1_n_0 ),
        .Q(Q[17]),
        .R(\mul_fast_result_o[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[18]_i_1_n_0 ),
        .Q(Q[18]),
        .R(\mul_fast_result_o[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[19]_i_1_n_0 ),
        .Q(Q[19]),
        .R(\mul_fast_result_o[21]_i_1_n_0 ));
  CARRY4 \mul_fast_result_o_reg[19]_i_3 
       (.CI(\mul_fast_result_o_reg[15]_i_3_n_0 ),
        .CO({\mul_fast_result_o_reg[19]_i_3_n_0 ,\mul_fast_result_o_reg[19]_i_3_n_1 ,\mul_fast_result_o_reg[19]_i_3_n_2 ,\mul_fast_result_o_reg[19]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\mul_fast_result_o_reg[19]_i_3_n_4 ,\mul_fast_result_o_reg[19]_i_3_n_5 ,\mul_fast_result_o_reg[19]_i_3_n_6 ,\mul_fast_result_o_reg[19]_i_3_n_7 }),
        .S(s2t_g[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(\mul_fast_result_o[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[20]_i_1_n_0 ),
        .Q(Q[20]),
        .R(\mul_fast_result_o[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[21]_i_2_n_0 ),
        .Q(Q[21]),
        .R(\mul_fast_result_o[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[22]_i_1_n_0 ),
        .Q(Q[22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[23]_i_1_n_0 ),
        .Q(Q[23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[24]_i_1_n_0 ),
        .Q(Q[24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[25]_i_1_n_0 ),
        .Q(Q[25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[26]_i_1_n_0 ),
        .Q(Q[26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[27]_i_1_n_0 ),
        .Q(Q[27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[28]_i_1_n_0 ),
        .Q(Q[28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[29]_i_1_n_0 ),
        .Q(Q[29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[2]_i_1_n_0 ),
        .Q(Q[2]),
        .R(\mul_fast_result_o[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[30]_i_1_n_0 ),
        .Q(Q[30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[31]_i_1_n_0 ),
        .Q(Q[31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[3]_i_1_n_0 ),
        .Q(Q[3]),
        .R(\mul_fast_result_o[21]_i_1_n_0 ));
  CARRY4 \mul_fast_result_o_reg[3]_i_3 
       (.CI(1'b0),
        .CO({\mul_fast_result_o_reg[3]_i_3_n_0 ,\mul_fast_result_o_reg[3]_i_3_n_1 ,\mul_fast_result_o_reg[3]_i_3_n_2 ,\mul_fast_result_o_reg[3]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\mul_fast_result_o[3]_i_4_n_0 }),
        .O({\mul_fast_result_o_reg[3]_i_3_n_4 ,\mul_fast_result_o_reg[3]_i_3_n_5 ,\mul_fast_result_o_reg[3]_i_3_n_6 ,\mul_fast_result_o_reg[3]_i_3_n_7 }),
        .S({s2t_g[3:1],\mul_fast_result_o[3]_i_8_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[4]_i_1_n_0 ),
        .Q(Q[4]),
        .R(\mul_fast_result_o[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[5]_i_1_n_0 ),
        .Q(Q[5]),
        .R(\mul_fast_result_o[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[6]_i_1_n_0 ),
        .Q(Q[6]),
        .R(\mul_fast_result_o[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[7]_i_1_n_0 ),
        .Q(Q[7]),
        .R(\mul_fast_result_o[21]_i_1_n_0 ));
  CARRY4 \mul_fast_result_o_reg[7]_i_3 
       (.CI(\mul_fast_result_o_reg[3]_i_3_n_0 ),
        .CO({\mul_fast_result_o_reg[7]_i_3_n_0 ,\mul_fast_result_o_reg[7]_i_3_n_1 ,\mul_fast_result_o_reg[7]_i_3_n_2 ,\mul_fast_result_o_reg[7]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\mul_fast_result_o_reg[7]_i_3_n_4 ,\mul_fast_result_o_reg[7]_i_3_n_5 ,\mul_fast_result_o_reg[7]_i_3_n_6 ,\mul_fast_result_o_reg[7]_i_3_n_7 }),
        .S(s2t_g[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[8]_i_1_n_0 ),
        .Q(Q[8]),
        .R(\mul_fast_result_o[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \mul_fast_result_o_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(adv_i_IBUF),
        .D(\mul_fast_result_o[9]_i_1_n_0 ),
        .Q(Q[9]),
        .R(\mul_fast_result_o[21]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    s0o_ready_i_1
       (.I0(flush_i_IBUF),
        .I1(rst_IBUF),
        .O(SR));
  FDRE #(
    .INIT(1'b0)) 
    s1o_anan_sign_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1o_anan_sign),
        .Q(s1o_anan_sign_10),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    s1o_carry_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1o_carry),
        .Q(s1o_carry_3),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10sh0_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s1o_exp10sh0_reg[9]_0 [0]),
        .Q(s1o_exp10sh0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10sh0_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s1o_exp10sh0_reg[9]_0 [1]),
        .Q(s1o_exp10sh0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10sh0_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s1o_exp10sh0_reg[9]_0 [2]),
        .Q(s1o_exp10sh0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10sh0_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s1o_exp10sh0_reg[9]_0 [3]),
        .Q(s1o_exp10sh0[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10sh0_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s1o_exp10sh0_reg[9]_0 [4]),
        .Q(s1o_exp10sh0[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10sh0_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s1o_exp10sh0_reg[9]_0 [5]),
        .Q(s1o_exp10sh0[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10sh0_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s1o_exp10sh0_reg[9]_0 [6]),
        .Q(s1o_exp10sh0[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10sh0_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s1o_exp10sh0_reg[9]_0 [7]),
        .Q(s1o_exp10sh0[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10sh0_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s1o_exp10sh0_reg[9]_0 [8]),
        .Q(s1o_exp10sh0[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10sh0_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s1o_exp10sh0_reg[9]_0 [9]),
        .Q(s1o_exp10sh0[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10shr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s1o_exp10shr_reg[8]_0 [0]),
        .Q(s1o_exp10shr[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10shr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s1o_exp10shr_reg[8]_0 [1]),
        .Q(s1o_exp10shr[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10shr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s1o_exp10shr_reg[8]_0 [2]),
        .Q(s1o_exp10shr[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10shr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s1o_exp10shr_reg[8]_0 [3]),
        .Q(s1o_exp10shr[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10shr_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s1o_exp10shr_reg[8]_0 [4]),
        .Q(s1o_exp10shr[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10shr_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s1o_exp10shr_reg[8]_0 [5]),
        .Q(s1o_exp10shr[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10shr_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s1o_exp10shr_reg[8]_0 [6]),
        .Q(s1o_exp10shr[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10shr_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s1o_exp10shr_reg[8]_0 [7]),
        .Q(s1o_exp10shr[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_exp10shr_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\s1o_exp10shr_reg[8]_0 [8]),
        .Q(s1o_exp10shr[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[8]),
        .Q(s1o_fract35[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[9]),
        .Q(s1o_fract35[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[10]),
        .Q(s1o_fract35[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[11]),
        .Q(s1o_fract35[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[12]),
        .Q(s1o_fract35[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[13]),
        .Q(s1o_fract35[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[14]),
        .Q(s1o_fract35[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[15]),
        .Q(s1o_fract35[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[16]),
        .Q(s1o_fract35[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[17]),
        .Q(s1o_fract35[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[18]),
        .Q(s1o_fract35[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[19]),
        .Q(s1o_fract35[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[20]),
        .Q(s1o_fract35[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[21]),
        .Q(s1o_fract35[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[22]),
        .Q(s1o_fract35[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[23]),
        .Q(s1o_fract35[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[24]),
        .Q(s1o_fract35[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[25]),
        .Q(s1o_fract35[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[0]),
        .Q(s1o_fract35[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[1]),
        .Q(s1o_fract35[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[2]),
        .Q(s1o_fract35[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[3]),
        .Q(s1o_fract35[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[4]),
        .Q(s1o_fract35[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[5]),
        .Q(s1o_fract35[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[6]),
        .Q(s1o_fract35[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_fract35_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D[7]),
        .Q(s1o_fract35[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    s1o_inf_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1o_inf),
        .Q(s1o_inf_9),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    s1o_inv_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1o_inv),
        .Q(s1o_inv_8),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    s1o_qnan_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1o_qnan),
        .Q(s1o_qnan_0),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h000000E2)) 
    s1o_ready_i_1
       (.I0(s1o_ready_11),
        .I1(adv_i_IBUF),
        .I2(s1o_ready),
        .I3(rst_IBUF),
        .I4(flush_i_IBUF),
        .O(s1o_ready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s1o_ready_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1o_ready_i_1_n_0),
        .Q(s1o_ready_11),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_shr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1o_shr),
        .Q(s1o_shr_2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_shr_t_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1o_shr_t[0]),
        .Q(s1o_shr_t_4[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_shr_t_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1o_shr_t[1]),
        .Q(s1o_shr_t_4[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_shr_t_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1o_shr_t[2]),
        .Q(s1o_shr_t_4[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_shr_t_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1o_shr_t[3]),
        .Q(s1o_shr_t_4[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1o_shr_t_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1o_shr_t[4]),
        .Q(s1o_shr_t_4[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    s1o_sign_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1o_sign),
        .Q(s1o_sign_5),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    s1o_snan_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1o_snan),
        .Q(s1o_snan_1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    s1o_sticky_l_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1o_sticky_l),
        .Q(s1o_sticky_l_6),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    s1o_sticky_r_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s1o_sticky_r),
        .Q(s1o_sticky_r_7),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
