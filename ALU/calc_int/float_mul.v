`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:52:03 04/10/2015 
// Design Name: 
// Module Name:    float_mul 
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
module float_mul(
	clk, A, B, S, overflow, e
    );

input wire clk;
input wire [31:0]A;
input wire [31:0]B;
output reg [31:0]S;
output reg overflow;

reg [31:0]e1;
reg [31:0]e2;
reg [31:0]m1;
reg [31:0]m2;
output reg [31:0]e;
reg [31:0]m;
reg [31:0]olda=0;
reg [31:0]oldb=0;
wire [31:0]ans;
wire [31:0]counthigh;
reg [31:0]h;
reg l;

count_digits_high counthigh_ins(clk,m,counthigh,ans);

always @(posedge clk)
begin
	if((olda!=A)||(oldb!=B))
	begin
		olda=A;
		oldb=B;
		e1=(A>>23)&32'hFF;
		e2=(B>>23)&32'hFF;
		m1=(A&32'h7FFFFF)|32'h800000;
		m2=(B&32'h7FFFFF)|32'h800000;
		e=(e1+e2)-127;
		h=32'h0;
		l=0;
		m=0;
	end
	if(m2!=0)
	begin
		l=h[0];
		h=h>>1;
		if((m2&1)==1) h=h+m1;
		m2=m2>>1;
	end
	m=h+l;
	if((A[30:23]==8'hff)||(B[30:23]==8'hff))
	begin
		S=32'h7f800000;
		overflow=1;
	end else if(e<255)
	begin
		if(A==0) S=0;
		else if(B==0) S=0;
		else S=((A^B)&32'h80000000)|((e+counthigh)<<23)|(ans&32'h7FFFFF);
		overflow=0;
	end else begin
		S=32'h7f800000;
		overflow=1;
	end
end

endmodule
