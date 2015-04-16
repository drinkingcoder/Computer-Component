`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:22:52 04/14/2015 
// Design Name: 
// Module Name:    LED_DEV 
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
module LED_DEV(input addCo, input addCy, input subCo, input subCy, input [3:0] overfloat, output [7:0] LED);

assign LED[7:0]={addCo, addCy, subCo, subCy, overfloat};

endmodule
