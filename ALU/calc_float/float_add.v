`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:03:06 04/07/2015 
// Design Name: 
// Module Name:    float_add 
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
module float_add(
	clk, A, B, S, overflow//, count_high, count_low, ans1, ans2
    );

input wire clk;
input wire [31:0]A;
input wire [31:0]B;
output reg [31:0]S=0;
output reg overflow;
wire [31:0]ans1;
wire [31:0]ans2;
wire [31:0]count_high;
wire [31:0]count_low;

reg [31:0]a=0;
reg [31:0]b=0;
reg [31:0]m=0;
reg [31:0]e=0;
reg [31:0]m1=0;
reg [31:0]m2=0;
reg [31:0]e1=0;
reg [31:0]e2=0;
reg flag=0;
reg add_sub=0;

assign s1=A>>31;
assign s2=B>>31;

count_digits_low countlow_ins(clk,m,count_low,ans1);
count_digits_high counthigh_ins(clk,m,count_high,ans2);

always @(A or B)
begin
	if((A!=0)&&(B!=0))
	begin
		case ({s1,s2})
			2'b00:begin a=A; b=B; flag=0; add_sub=0;	end
			2'b01:begin a=A; b=B^(1<<31);flag=0; add_sub=1;	end
			2'b10:begin a=B; b=A^(1<<31); flag=0; add_sub=1; end
			2'b11:begin a=A^(1<<31); b=B^(1<<31); flag=1; add_sub=0; end
		endcase
		e1=(a>>23)&32'hFF;
		e2=(b>>23)&32'hFF;
		m1=(a&32'h7FFFFF)|32'h00800000;
		m2=(b&32'h7FFFFF)|32'h00800000;
		if(e1>e2)
		begin
			e=e1;
			m2=m2>>(e1-e2);
		end else
		begin
			e=e2;
			m1=m1>>(e2-e1);
		end
		if(add_sub==0) m=m1+m2;
		else if(m1>=m2) m=m1-m2;
		else begin
			flag=flag^1;
			m=m2-m1;
		end
		if(m<0)
		begin
			m=-m;
			flag=flag^1;
		end
		if(m==0) e=0;
	end
end

always @(count_low or count_high or ans1 or ans2 or A or B)
begin 
	if((A[30:23]==8'hff)||(B[30:23]==8'hff))
	begin
		S=32'h7f800000;
		overflow=1;
	end else if(A==0)
	begin
		S=B;
		overflow=0;
	end else if(B==0)
	begin
		S=A;
		overflow=0;
	end else if(m==0) 
	begin 
		S=0;
		overflow=0;
	end else if(count_high>0)
	begin
		S=((e+count_high)<<23)|(ans2&32'h7FFFFF)|(flag<<31);
		if(((e+count_high)>=255)||((e+count_high)<0)) overflow=1;
		else overflow=0;
	end else
	begin
		S=((e-count_low)<<23)|(ans1&32'h7FFFFF)|(flag<<31);
		if(((e-count_low)<0)||((e-count_low)>=255)) overflow=1;
		else overflow=0;
	end
end

endmodule
