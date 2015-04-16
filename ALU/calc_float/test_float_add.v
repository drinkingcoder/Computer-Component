`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:12:14 04/07/2015
// Design Name:   float_add
// Module Name:   F:/DrinkingCoder/Project_Calculator/Calculator/test_float_add.v
// Project Name:  Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: float_add
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_float_add;

	// Inputs
	reg clk;
	reg [31:0] A;
	reg [31:0] B;

	// Outputs
	wire [31:0] S;
	wire o;
	wire [31:0] ch;
	wire [31:0] cl;
	wire [31:0] ans1;
	wire [31:0] ans2;
	// Instantiate the Unit Under Test (UUT)
	float_add uut (
		.clk(clk), 
		.A(A), 
		.B(B), 
		.S(S),
		.overflow(o)/*,
		.count_high(ch),
		.count_low(cl),
		.ans1(ans1),
		.ans2(ans2)*/
	);
	integer i;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		A = 32'h414a24dd;
		B = 32'h49978d42;

		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		for(i=0;i<200;i=i+1)
		begin
			clk=~clk;
			#100;
		end
	end
    
endmodule

