`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:18:30 04/08/2015 
// Design Name: 
// Module Name:    arithmetic_shift_Right 
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
module as_R(input[31:0]indata,input[4:0]shift,output reg[31:0]outdata  //#Arithmetic shift right
    );
always @(*)
begin
case (shift)
   5'b00000: outdata=indata;
   5'b00001: outdata={{1{indata[31]}},indata[31:1]};
   5'b00010: outdata={{2{indata[31]}},indata[31:2]};
   5'b00011: outdata={{3{indata[31]}},indata[31:3]};
   5'b00100: outdata={{4{indata[31]}},indata[31:4]};
   5'b00101: outdata={{5{indata[31]}},indata[31:5]};
   5'b00110: outdata={{6{indata[31]}},indata[31:6]};
	5'b00111: outdata={{7{indata[31]}},indata[31:7]};
   5'b01000: outdata={{8{indata[31]}},indata[31:8]};
   5'b01001: outdata={{9{indata[31]}},indata[31:9]};
   5'b01010: outdata={{10{indata[31]}},indata[31:10]};
   5'b01011: outdata={{11{indata[31]}},indata[31:11]};
   5'b01100: outdata={{12{indata[31]}},indata[31:12]};
   5'b01101: outdata={{13{indata[31]}},indata[31:13]};
	5'b01110: outdata={{14{indata[31]}},indata[31:14]};
   5'b01111: outdata={{15{indata[31]}},indata[31:15]};	
   5'b10000: outdata={{16{indata[31]}},indata[31:16]};
   5'b10001: outdata={{17{indata[31]}},indata[31:17]};
   5'b10010: outdata={{18{indata[31]}},indata[31:18]};
   5'b10011: outdata={{19{indata[31]}},indata[31:19]};
   5'b10100: outdata={{20{indata[31]}},indata[31:20]};
   5'b10101: outdata={{21{indata[31]}},indata[31:21]};
   5'b10110: outdata={{22{indata[31]}},indata[31:22]};	
   5'b10111: outdata={{23{indata[31]}},indata[31:23]};
   5'b11000: outdata={{24{indata[31]}},indata[31:24]};
   5'b11001: outdata={{25{indata[31]}},indata[31:25]};
   5'b11010: outdata={{26{indata[31]}},indata[31:26]};
   5'b11011: outdata={{27{indata[31]}},indata[31:27]};
   5'b11100: outdata={{28{indata[31]}},indata[31:28]};
   5'b11101: outdata={{29{indata[31]}},indata[31:29]};
	5'b11110: outdata={{30{indata[31]}},indata[31:30]};
   5'b11111: outdata={{31{indata[31]}},indata[31]};	
endcase


end
endmodule

