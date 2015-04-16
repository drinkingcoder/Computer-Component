`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:39:31 04/10/2015
// Design Name:   float_div
// Module Name:   D:/Project_Calculator/Calculator/test_float_div.v
// Project Name:  Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: float_div
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_float_div;

	// Inputs
	reg clk;
	reg [31:0] A;
	reg [31:0] B;

	// Outputs
	wire [31:0] S;
	wire ERR;

	// Instantiate the Unit Under Test (UUT)
	float_div uut (
		.clk(clk), 
		.A(A), 
		.B(B), 
		.S(S), 
		.ERR(ERR)
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
		for(i=0;i<=500;i=i+1)
		begin
			clk=~clk;
			#100;
		end
	end
      
endmodule

