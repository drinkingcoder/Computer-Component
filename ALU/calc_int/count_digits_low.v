`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:58:39 04/07/2015 
// Design Name: 
// Module Name:    count_digits 
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
module count_digits_low(
	clk, a, s, x
    );

input wire clk;
input wire[31:0] a;
output reg[31:0] s=0;
output reg [31:0]x;
reg [31:0]olda=0;
	
always @(posedge clk)
begin
	if(olda!=a)
	begin
		olda=a;
		x=a;
		s=0;
	end
	if((x&32'h00800000)==0)
	begin
		x=x<<1;
		s=s+1;
	end
end

endmodule
