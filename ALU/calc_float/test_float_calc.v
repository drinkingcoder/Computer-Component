`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:46:03 04/10/2015
// Design Name:   float_calc
// Module Name:   D:/Project_Calculator/Calculator/test_float_calc.v
// Project Name:  Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: float_calc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_float_calc;

	// Inputs
	reg clk;
	reg [31:0] A;
	reg [31:0] B;

	// Outputs
	wire [31:0] float_add;
	wire [31:0] float_sub;
	wire [31:0] float_mul;
	wire [31:0] float_div;
	wire [3:0] overflow;
	wire err;

	// Instantiate the Unit Under Test (UUT)
	float_calc uut (
		.clk(clk), 
		.A(A), 
		.B(B), 
		.float_add(float_add), 
		.float_sub(float_sub), 
		.float_mul(float_mul), 
		.float_div(float_div), 
		.overflow(overflow),
		.err(err)
	);
	
	integer i;
	
	initial begin
		// Initialize Inputs
		#10;
		A=32'h0;
		B=32'h0;
		#10;
		clk = 0;
		A = 32'h7f800000;
		B = 32'h43b01ed9;

		// Wait 100 ns for global reset to finish
		#100;
		for(i=0;i<=500;i=i+1)
		begin
			clk=~clk;
			#100;
		end
		// Add stimulus here

	end
      
endmodule

