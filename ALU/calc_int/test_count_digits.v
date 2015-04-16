`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:21:52 04/07/2015
// Design Name:   count_digits
// Module Name:   F:/DrinkingCoder/Project_Calculator/Calculator/test_count_digits.v
// Project Name:  Calculator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: count_digits
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_count_digits;

	// Inputs
	reg clk;
	reg [31:0] a;
	
	// Outputs
	wire [31:0] s;

	// Instantiate the Unit Under Test (UUT)
	count_digits_low uut (
		.clk(clk), 
		.a(a), 
		.s(s)
	);
	integer i;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		a = 32'h00001000;

		// Wait 100 ns for global reset to finish
		#100;
		
      for(i=0;i<=200;i=i+1)
		begin
			clk=~clk;
			#100;
		end
		// Add stimulus here

	end
	

      
endmodule

