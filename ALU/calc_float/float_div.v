`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:31:19 04/10/2015 
// Design Name: 
// Module Name:    float_div 
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
module float_div(
	clk, A, B, S, overflow, ERR
    );
	
input wire clk;
input wire [31:0]A;
input wire [31:0]B;
output reg [31:0]S;
output reg overflow;
output reg ERR=0;

reg [31:0]m;
reg [31:0]m1;
reg [31:0]m2;
reg [31:0]e;
reg [31:0]e1;
reg [31:0]e2;
reg [31:0]olda=0;
reg [31:0]oldb=0;

always @(posedge clk)
begin
	if((olda!=A)||(oldb!=B))
	begin
		olda=A;
		oldb=B;
		if(B==0) ERR=1;
		else ERR=0;
		e1=(A>>23)&32'hFF;
		e2=(B>>23)&32'hFF;
		m1=(A&32'h7FFFFF)|32'h800000;
		m2=(B&32'h7FFFFF)|32'h800000;
		e=(e1-e2)+127;
		if(m1<m2) e=e-1;
		m=0;
	end
	if((m&32'h800000)==0)
	begin
		m=m<<1;
		if(m1>=m2)
		begin
			m=m+1;
			m1=m1-m2;
		end
		m1=m1<<1;
	end	
	if((A[30:23]==8'hff)||(B[30:23]==8'hff))
	begin
		S=32'h7f800000;
		overflow=1;
	end else if(A==0) 
	begin
		S=0;
		overflow=0;
	end else if(e<255)
	begin
		S=((A^B)&32'h80000000)|(e<<23)|(m&32'h7FFFFF);
		overflow=0;
	end else begin
		S=((A[31]^B[31])<<31)|31'h7f800000;
		overflow=1;
	end 
end

endmodule
