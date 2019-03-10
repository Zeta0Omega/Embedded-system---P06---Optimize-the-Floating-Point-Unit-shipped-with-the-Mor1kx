`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2018 19:47:31
// Design Name: 
// Module Name: tb_i2f_fast
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


`include "./mor1kx-defines.v"


module tb #(parameter OPTION_OPERAND_WIDTH=32)();

	logic clk;
	logic rst;
	logic flush_i;
	logic padv_decode_i;
	logic padv_execute_i;
	logic [`OR1K_FPUOP_WIDTH-1:0]    op_fpu_i;
	logic [`OR1K_FPCSR_RM_SIZE-1:0]  round_mode_i;
	logic [OPTION_OPERAND_WIDTH-1:0] opa_i;
	logic [OPTION_OPERAND_WIDTH-1:0] opb_i;
	
	logic [OPTION_OPERAND_WIDTH-1:0] fpu_result_o;
	logic fpu_arith_valid_o;
	logic fpu_cmp_flag_o;
	logic fpu_cmp_valid_o;
	logic [`OR1K_FPCSR_WIDTH-1:0] fpcsr_o;

	
	logic [OPTION_OPERAND_WIDTH-1:0] temp_res;
	logic [OPTION_OPERAND_WIDTH-1:0] af;
	logic [OPTION_OPERAND_WIDTH-1:0] bf;
	logic [OPTION_OPERAND_WIDTH-1:0] valref;


	pfpu32_top_fast #(.OPTION_OPERAND_WIDTH(OPTION_OPERAND_WIDTH))
	pfpu0(.*);

	always #3.5 clk=~clk;


/*	
 *	runFpuOp: executes an FPU operation and returns res is ready
 *  inputs:
 *		+ op_fpu	: FPU opcode 
 *		+ rfa		: operand a
 *		+ rfb		: operand b
 */
	task automatic runFpuOp( 	input [`OR1K_FPUOP_WIDTH-1:0]    op_fpu,
					input [OPTION_OPERAND_WIDTH-1:0] rfa,
					input [OPTION_OPERAND_WIDTH-1:0] rfb
				);

		@(posedge clk);
		padv_decode_i	<= 1'b1;
		padv_execute_i 	<= 1'b1;
		opa_i			<= rfa;
		opb_i			<= rfb;
		op_fpu_i		<= op_fpu;
		@(posedge clk);
		padv_decode_i<=0;

		@(posedge fpu_arith_valid_o);
	

	endtask

	initial
	begin
		$dumpfile("out.vcd");
		$dumpvars(0,tb);
		clk<=0;
		rst=1;
		flush_i=0;
		padv_decode_i=0;
		padv_execute_i=0;
		op_fpu_i=`OR1K_FPUOP_ADD;
		
        //set desired rounding mode
        //0 - round to the nearest
        //1 - round to zero
        //2 - round to infp
        //3 - round to infm
		round_mode_i=0;

		repeat(5) @(posedge clk);
		rst<=0;

		//perform 5*4 = 20
        @(posedge clk);
        runFpuOp(`OR1K_FPUOP_ITOF,32'd5,32'd0);   
        af    <= fpu_result_o;
        @(posedge clk);
        runFpuOp(`OR1K_FPUOP_ITOF,32'd4,32'd0);   
        bf    <= fpu_result_o;
        @(posedge clk);
        runFpuOp(`OR1K_FPUOP_MUL,af,bf);   
        temp_res    <= fpu_result_o;
        @(posedge clk);
        runFpuOp(`OR1K_FPUOP_FTOI,temp_res,32'd0); 


		repeat(3) @(posedge clk);
		$finish;
	end

endmodule
