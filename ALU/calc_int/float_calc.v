`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:43:05 04/10/2015 
// Design Name: 
// Module Name:    float_calc 
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
module float_calc(
	clk, A, B, float_add, float_sub, float_mul, float_div, overflow, err
    );

input wire clk;
input wire [31:0]A;
input wire [31:0]B;
output wire [31:0]float_add;
output wire [31:0]float_sub;
output wire [31:0]float_mul;
output wire [31:0]float_div;
output wire [3:0]overflow;
output wire err;

float_add float_add_ins(clk, A, B, float_add, overflow[0]);
float_sub float_sub_ins(clk, A, B, float_sub, overflow[1]);
float_mul float_mul_ins(clk, A, B, float_mul, overflow[2]);
float_div float_div_ins(clk, A, B, float_div, overflow[3], err);


endmodule
