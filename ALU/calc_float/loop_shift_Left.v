`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:38 04/08/2015 
// Design Name: 
// Module Name:    loop_shift_Left 
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
module lps_L(input[31:0]indata,input[4:0]shift,output reg[31:0]outdata  //#loop shift Left
    );
always @(*)
begin
case (shift)
   5'b00000: outdata=indata;
   5'b00001: outdata={indata[30:0],indata[31]};
   5'b00010: outdata={indata[29:0],indata[31:30]};
   5'b00011: outdata={indata[28:0],indata[31:29]};
   5'b00100: outdata={indata[27:0],indata[31:28]};
   5'b00101: outdata={indata[26:0],indata[31:27]};
   5'b00110: outdata={indata[25:0],indata[31:26]};
	5'b00111: outdata={indata[24:0],indata[31:25]};
   5'b01000: outdata={indata[23:0],indata[31:24]};
   5'b01001: outdata={indata[22:0],indata[31:23]};
   5'b01010: outdata={indata[21:0],indata[31:22]};
   5'b01011: outdata={indata[20:0],indata[31:21]};
   5'b01100: outdata={indata[19:0],indata[31:20]};
   5'b01101: outdata={indata[18:0],indata[31:19]};
	5'b01110: outdata={indata[17:0],indata[31:18]};
   5'b01111: outdata={indata[16:0],indata[31:17]};	
   5'b10000: outdata={indata[15:0],indata[31:16]};
   5'b10001: outdata={indata[14:0],indata[31:15]};
   5'b10010: outdata={indata[13:0],indata[31:14]};
   5'b10011: outdata={indata[12:0],indata[31:13]};
   5'b10100: outdata={indata[11:0],indata[31:12]};
   5'b10101: outdata={indata[10:0],indata[31:11]};
   5'b10110: outdata={indata[9:0],indata[31:10]};	
   5'b10111: outdata={indata[8:0],indata[31:9]};
   5'b11000: outdata={indata[7:0],indata[31:8]};
   5'b11001: outdata={indata[6:0],indata[31:7]};
   5'b11010: outdata={indata[5:0],indata[31:6]};
   5'b11011: outdata={indata[4:0],indata[31:5]};
   5'b11100: outdata={indata[3:0],indata[31:4]};
   5'b11101: outdata={indata[2:0],indata[31:3]};
	5'b11110: outdata={indata[1:0],indata[31:2]};
   5'b11111: outdata={indata[0],indata[31:1]};	
endcase


end
endmodule
