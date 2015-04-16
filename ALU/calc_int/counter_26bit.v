`timescale 1ns/1ps

module counter_26bit(clk, reset, clk_1ms, count_out);
	parameter COUNTER=26;
	input clk;
	input reset;
	output clk_1ms;
	output [COUNTER-1:0] count_out;
	reg [COUNTER-1:0] count;
	reg second_m;
	wire clk;

	initial
		count<=0;

	always @(posedge clk)  begin
		if (!reset || (count[15:0]==49999)) begin
			count[15:0]<=0;
			count[25:16]<=count[25:16]+1;
			second_m<=1;
		end
		else begin
			count[15:0]<=count[15:0]+1;
			second_m<=0;
		end
	end

	assign clk_1ms=second_m;
	assign count_out=count;

endmodule
