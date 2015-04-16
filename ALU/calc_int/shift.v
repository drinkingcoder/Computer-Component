`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:53 04/08/2015 
// Design Name: 
// Module Name:    shift 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module shift(input[31:0]indata,
			input[4:0]shift,
			output [31:0]logic_right,
			output [31:0]logic_left,
			output [31:0]loop_right,
			output [31:0]loop_left,
			output [31:0]arith_right);
/*
wire [31:0]logic_right;
wire [31:0]logic_left;
wire [31:0]loop_right;
wire [31:0]loop_left;
wire [31:0]arith_right;
*/
ls_R s1(indata[31:0],shift[4:0],logic_right[31:0]);
ls_L s2(indata[31:0],shift[4:0],logic_left[31:0]);
lps_R s3(indata[31:0],shift[4:0],loop_right[31:0]);
lps_L s4(indata[31:0],shift[4:0],loop_left[31:0]);
as_R s5(indata[31:0],shift[4:0],arith_right[31:0]);
/*
always @(*) begin
case(switch)
3'b000:out=out1;
3'b001:out=out2;
3'b010:out=out3;
3'b011:out=out4;
3'b100:out=out5;
endcase
end
*/

endmodule

