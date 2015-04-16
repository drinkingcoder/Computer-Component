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
module count_digits_high(
	clk, a, s, tmp
    );

input wire clk;
input wire[31:0] a;
output reg[31:0] s=0;
output reg [31:0]tmp;
reg olda=0;

always @(posedge clk)
begin
	if(olda!=a)
	begin
		olda=a;
		tmp=a;
		s=0;
	end
	if((tmp&32'hFF000000)!=0)
	begin
		tmp=tmp>>1;
		s=s+1;
	end
end

endmodule
