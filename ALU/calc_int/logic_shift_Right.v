`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:19:50 04/08/2015 
// Design Name: 
// Module Name:    logic_shift_Right 
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
module ls_R(input[31:0]indata,input[4:0]shift,output reg[31:0]outdata  //##logic shift Right
    );
always @(*)
begin
case (shift)
   5'b00000: outdata=indata;
   5'b00001: outdata={{0},indata[31:1]};
   5'b00010: outdata={{0},indata[31:2]};
   5'b00011: outdata={{0},indata[31:3]};
   5'b00100: outdata={{0},indata[31:4]};
   5'b00101: outdata={{0},indata[31:5]};
   5'b00110: outdata={{0},indata[31:6]};
	5'b00111: outdata={{0},indata[31:7]};
   5'b01000: outdata={{0},indata[31:8]};
   5'b01001: outdata={{0},indata[31:9]};
   5'b01010: outdata={{0},indata[31:10]};
   5'b01011: outdata={{0},indata[31:11]};
   5'b01100: outdata={{0},indata[31:12]};
   5'b01101: outdata={{0},indata[31:13]};
	5'b01110: outdata={{0},indata[31:14]};
   5'b01111: outdata={{0},indata[31:15]};	
   5'b10000: outdata={{0},indata[31:16]};
   5'b10001: outdata={{0},indata[31:17]};
   5'b10010: outdata={{0},indata[31:18]};
   5'b10011: outdata={{0},indata[31:19]};
   5'b10100: outdata={{0},indata[31:20]};
   5'b10101: outdata={{0},indata[31:21]};
   5'b10110: outdata={{0},indata[31:22]};	
   5'b10111: outdata={{0},indata[31:23]};
   5'b11000: outdata={{0},indata[31:24]};
   5'b11001: outdata={{0},indata[31:25]};
   5'b11010: outdata={{0},indata[31:26]};
   5'b11011: outdata={{0},indata[31:27]};
   5'b11100: outdata={{0},indata[31:28]};
   5'b11101: outdata={{0},indata[31:29]};
	5'b11110: outdata={{0},indata[31:30]};
   5'b11111: outdata={{0},indata[31]};	
endcase


end
endmodule

