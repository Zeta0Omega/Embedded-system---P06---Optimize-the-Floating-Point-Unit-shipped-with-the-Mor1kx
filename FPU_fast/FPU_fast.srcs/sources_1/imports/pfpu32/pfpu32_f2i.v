/////////////////////////////////////////////////////////////////////
////                                                             ////
////  pfpu32_f2i                                                 ////
////  32-bit floating point to integer converter                 ////
////                                                             ////
////  Author: Andrey Bacherov                                    ////
////          avbacherov@opencores.org                           ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2014 Andrey Bacherov                          ////
////                    avbacherov@opencores.org                 ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`include "mor1kx-defines.v"

module pfpu32_f2i
(
   input             clk,
   input             rst,
   input             flush_i,  // flush pipe
   input             adv_i,    // advance pipe
   input             start_ii,  // start conversion
   input             signa_ii,  // input 'a' related values
   input       [9:0] exp10a_ii,
   input      [23:0] fract24a_ii,
   input             snan_ii,   // 'a'/'b' related
   input             qnan_ii,
   input       [1:0] rmode_ii,
   
   output reg                  [31:0] f2i_fast_result_o,
   output reg                         f2i_fast_ready_o,
   output reg [`OR1K_FPCSR_WIDTH-1:0] fpcsr_o
);
  
  reg start_i;
  reg signa_i;
  reg [9:0] exp10a_i;
  reg [23:0] fract24a_i;
  reg snan_i;
  reg qnan_i;
  reg [1:0] rmode_i;
  
  always@(posedge clk)
    begin
      if(adv_i)
        begin
          signa_i <= signa_ii;
          exp10a_i <= exp10a_ii;
          fract24a_i <= fract24a_ii;
          snan_i <= snan_ii;
          qnan_i <= qnan_ii;
          rmode_i <= rmode_ii;
        end
    end
    
  always @(posedge clk `OR_ASYNC_RST) begin
    if (rst)
      start_i <= 1'b0;
    else if(flush_i)
      start_i <= 1'b0;
    else if(adv_i)
      start_i <= start_ii;
  end // posedge clock
  
  localparam INF  = 31'b1111111100000000000000000000000;
  localparam QNAN = 31'b1111111110000000000000000000000;
  localparam SNAN = 31'b1111111101111111111111111111111;

  

  // exponent after moving binary point at the end of mantissa
  // bias is also removed
  wire [9:0] s1t_exp10m = exp10a_i - 10'd150; // (- 127 - 23)

  // detect if now shift right is required
  wire [9:0] s1t_shr_t = {10{s1t_exp10m[9]}} & (10'd150 - exp10a_i);
  // limit right shift by 31
  wire [4:0] s1t_shr = s1t_shr_t[4:0] | {5{|s1t_shr_t[9:5]}};

  // detect if left shift required for mantissa
  // (limited by 15)
  wire [3:0] s1t_shl = {4{~s1t_exp10m[9]}} & (s1t_exp10m[3:0] | {4{|s1t_exp10m[9:4]}});
  // check overflow
  wire s1t_is_shl_gt8 = s1t_shl[3] & (|s1t_shl[2:0]);
  wire s1t_is_shl_eq8 = s1t_shl[3] & (~(|s1t_shl[2:0]));
  wire s1t_is_shl_ovf =
     s1t_is_shl_gt8 |
    (s1t_is_shl_eq8 & (~signa_i)) |
    (s1t_is_shl_eq8 &   signa_i & (|fract24a_i[22:0]));
 
  //new stuff
  //fract34
  wire [34:0] f2i_int35_t = {8'd0, fract24a_i, 3'd0};
  
  wire  [4:0] s1_shr;
  wire  [4:0] s1_shl;

  assign s1_shr = (|s1t_shr) ? s1t_shr : 5'd0;
  assign s1_shl = {1'b0,s1t_shl};
    
  // align
  wire [34:0] s1t_fract35sh =
       (|s1_shr) ? (f2i_int35_t >> s1_shr) :
                     (f2i_int35_t << s1_shl);
  
  reg s1r_sticky;
   always @(f2i_int35_t or s1_shr) begin
     case (s1_shr)
      5'd0   : s1r_sticky = |f2i_int35_t[ 1:0];
      5'd1   : s1r_sticky = |f2i_int35_t[ 2:0];
      5'd2   : s1r_sticky = |f2i_int35_t[ 3:0];
      5'd3   : s1r_sticky = |f2i_int35_t[ 4:0];
      5'd4   : s1r_sticky = |f2i_int35_t[ 5:0];
      5'd5   : s1r_sticky = |f2i_int35_t[ 6:0];
      5'd6   : s1r_sticky = |f2i_int35_t[ 7:0];
      5'd7   : s1r_sticky = |f2i_int35_t[ 8:0];
      5'd8   : s1r_sticky = |f2i_int35_t[ 9:0];
      5'd9   : s1r_sticky = |f2i_int35_t[10:0];
      5'd10  : s1r_sticky = |f2i_int35_t[11:0];
      5'd11  : s1r_sticky = |f2i_int35_t[12:0];
      5'd12  : s1r_sticky = |f2i_int35_t[13:0];
      5'd13  : s1r_sticky = |f2i_int35_t[14:0];
      5'd14  : s1r_sticky = |f2i_int35_t[15:0];
      5'd15  : s1r_sticky = |f2i_int35_t[16:0];
      5'd16  : s1r_sticky = |f2i_int35_t[17:0];
      5'd17  : s1r_sticky = |f2i_int35_t[18:0];
      5'd18  : s1r_sticky = |f2i_int35_t[19:0];
      5'd19  : s1r_sticky = |f2i_int35_t[20:0];
      5'd20  : s1r_sticky = |f2i_int35_t[21:0];
      5'd21  : s1r_sticky = |f2i_int35_t[22:0];
      5'd22  : s1r_sticky = |f2i_int35_t[23:0];
      5'd23  : s1r_sticky = |f2i_int35_t[24:0];
      5'd24  : s1r_sticky = |f2i_int35_t[25:0];
      5'd25  : s1r_sticky = |f2i_int35_t[26:0];
      default: s1r_sticky = |f2i_int35_t[27:0];
     endcase
   end // always
    
    reg s1l_sticky;
       always @(f2i_int35_t or s1_shl) begin
         case (s1_shl)
           5'd0   : s1l_sticky = |f2i_int35_t[1:0];
           5'd1   : s1l_sticky =  f2i_int35_t[0];
           default: s1l_sticky = 1'b0;
         endcase
       end // always
     
     wire s1t_sticky = (|s1t_shr) ? s1r_sticky : s1l_sticky;
            
    
    // output of align stage 
      reg        s1o_sign;
      reg [31:0] s1o_fract32;
      reg  [1:0] s1o_rs;
      reg        s1o_inv;
      reg        s1o_snan_i;
      reg        s1o_f2i_ovf, s1o_f2i;
      reg  [1:0] s1o_rmode;
      // registering
      always @(posedge clk) begin
        if(adv_i) begin
          s1o_sign    <= signa_i & (!(qnan_i | snan_i));
          s1o_fract32 <= s1t_fract35sh[34:3];
          s1o_rs      <= {s1t_fract35sh[2],s1t_sticky};
          // various flags:
          s1o_inv         <= 1'b0;
          s1o_snan_i      <= snan_i;
         
          // I2F specials
          s1o_f2i_ovf <= s1t_is_shl_ovf;
          s1o_f2i     <= start_i;
          s1o_rmode   <= rmode_i;
        end // advance
      end // posedge clock
    
      // ready is special case
      reg s1o_ready;
      always @(posedge clk `OR_ASYNC_RST) begin
        if (rst)
          s1o_ready <= 1'b0;
        else if(flush_i)
          s1o_ready <= 1'b0;
        else if(adv_i)
          s1o_ready <= start_i;
      end // posedge clock
    wire rm_nearest = (s1o_rmode==2'b00);
    wire rm_to_zero = (s1o_rmode==2'b01);
    wire rm_to_infp = (s1o_rmode==2'b10);
    wire rm_to_infm = (s1o_rmode==2'b11);
    wire s2t_g    = s1o_fract32[0];
    wire s2t_r    = s1o_rs[1];
    wire s2t_s    = s1o_rs[0];
    wire s2t_lost = s2t_r | s2t_s;
  
    wire s2t_rnd_up = (rm_nearest & s2t_r & s2t_s) |
                      (rm_nearest & s2t_g & s2t_r & (~s2t_s)) |
                      (rm_to_infp & (~s1o_sign) & s2t_lost) |
                      (rm_to_infm &   s1o_sign  & s2t_lost);
                      
    wire [31:0] s2t_rnd_v32 =
      s2t_rnd_up ? 32'd1 : // +1
                   32'd0;         // no rounding
                   
    // rounded fractional
    wire [31:0] s2t_fract32_rnd = s1o_fract32 + s2t_rnd_v32;

    // integer output (f2i)
    wire s2t_i32_carry_rnd = s2t_fract32_rnd[31];
    wire s2t_i32_inv = ((~s1o_sign) & s2t_i32_carry_rnd) | s1o_f2i_ovf;
    // two's complement for negative number
    wire [31:0] s2t_i32_int32 = (s2t_fract32_rnd ^ {32{s1o_sign}}) + {31'd0,s1o_sign};
    // zero
    wire s2t_i32_int32_00 = (~s2t_i32_inv) & (~(|s2t_i32_int32));
    // int32 output
    wire [31:0] s2t_i32_opc;
    assign s2t_i32_opc =
           s2t_i32_inv ? (32'h7fffffff ^ {32{s1o_sign}}) : s2t_i32_int32;
    
     wire s2t_ine, s2t_ovf, s2t_inf, s2t_unf, s2t_zer;
     wire [31:0] s2t_opc;
     
     assign {s2t_opc,s2t_ine,s2t_ovf,s2t_inf,s2t_unf,s2t_zer} =
            {s2t_i32_opc,s2t_lost,1'b0,1'b0,1'b0,s2t_i32_int32_00};
            
            
    // Output Register
      always @(posedge clk `OR_ASYNC_RST) begin
        if (rst) begin
            // arithmetic results
          f2i_fast_result_o      <= 32'd0;
          f2i_fast_ready_o <=  1'b0;
          // exeptions
          fpcsr_o         <= {`OR1K_FPCSR_WIDTH{1'b0}};
        end
        else if(flush_i) begin
            // arithmetic results
          f2i_fast_result_o      <= 32'd0;
          f2i_fast_ready_o <=  1'b0;
          // exeptions
          fpcsr_o         <= {`OR1K_FPCSR_WIDTH{1'b0}};
        end
        else if(adv_i) begin
            // arithmetic results
          f2i_fast_result_o      <= s2t_opc;
          f2i_fast_ready_o <= s1o_ready;
          // exeptions
          fpcsr_o[`OR1K_FPCSR_OVF] <= s2t_ovf;
          fpcsr_o[`OR1K_FPCSR_UNF] <= s2t_unf;
          fpcsr_o[`OR1K_FPCSR_SNF] <= s1o_inv | (s1o_snan_i & s1o_f2i);
          fpcsr_o[`OR1K_FPCSR_QNF] <= 1'b0;
          fpcsr_o[`OR1K_FPCSR_ZF]  <= s2t_zer;
          fpcsr_o[`OR1K_FPCSR_IXF] <= s2t_ine;
          fpcsr_o[`OR1K_FPCSR_IVF] <= (s1o_inv | (s2t_i32_inv & s1o_f2i) | s1o_snan_i);                         
          fpcsr_o[`OR1K_FPCSR_INF] <= s2t_inf; 
          fpcsr_o[`OR1K_FPCSR_DZF] <= 1'b0;
        end
      end // posedge clock 
                
endmodule // pfpu32_f2i
