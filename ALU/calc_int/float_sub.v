`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:46:39 04/10/2015 
// Design Name: 
// Module Name:    float_sub 
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
module float_sub(
	clk, A, B, S, overflow
    );
	
input wire clk;
input wire [31:0]A;
input wire [31:0]B;
output wire [31:0]S;
output wire overflow;

float_add float_add_ins(clk,A,B^(1<<31),S,overflow);

endmodule
