`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:08:34 04/10/2015
// Design Name:   float_mul
// Module Name:   D:/Project_Calculator/Calculator/test_float_mul.v
// Project Name:  Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: float_mul
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_float_mul;

	// Inputs
	reg clk;
	reg [31:0] A;
	reg [31:0] B;

	// Outputs
	wire [31:0] S;
	wire [31:0] ans;
	wire [31:0] ch;
	wire [31:0] m;
	wire [31:0] m1;
	wire [31:0] m2;
	wire [31:0] e;
	wire flag;
	wire oldflag;
	wire overflow;

	// Instantiate the Unit Under Test (UUT)
	float_mul uut (
		.clk(clk), 
		.A(A), 
		.B(B), 
		.S(S),
/*		.ans(ans),
		.counthigh(ch),
		.m(m),
		.m1(m1),
		.m2(m1),
		.flag(flag),
		.oldflag(oldflag)
		*/
		.overflow(overflow),
		.e(e)
	);
	integer i;

	initial begin
		// Initialize Inputs
		clk = 0;
		A = 32'h1;
		B = 32'h7f800000;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		for(i=0;i<=500;i=i+1)
		begin
			clk=~clk;
			#100;
		end

	end
      
endmodule

