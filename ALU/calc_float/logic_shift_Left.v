`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:19:36 04/08/2015 
// Design Name: 
// Module Name:    logic_shift_Left 
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
module ls_L(input[31:0]indata,input[4:0]shift,output reg[31:0]outdata  //##logic shift Left
    );
always @(*)
begin
case (shift)
   5'b00000: outdata=indata;
   5'b00001: outdata={indata[30:0],0};
   5'b00010: outdata={indata[29:0],2'h0000};
   5'b00011: outdata={indata[28:0],3'h0000};
   5'b00100: outdata={indata[27:0],4'h0000};
   5'b00101: outdata={indata[26:0],5'h0000};
   5'b00110: outdata={indata[25:0],6'h0000};
	5'b00111: outdata={indata[24:0],7'h0000};
   5'b01000: outdata={indata[23:0],8'h0000};
   5'b01001: outdata={indata[22:0],9'h0000};
   5'b01010: outdata={indata[21:0],10'h0000};
   5'b01011: outdata={indata[20:0],11'h0000};
   5'b01100: outdata={indata[19:0],12'h0000};
   5'b01101: outdata={indata[18:0],13'h0000};
	5'b01110: outdata={indata[17:0],14'h0000};
   5'b01111: outdata={indata[16:0],15'h0000};	
   5'b10000: outdata={indata[15:0],16'h0000};
   5'b10001: outdata={indata[14:0],17'h0000};
   5'b10010: outdata={indata[13:0],18'h0000};
   5'b10011: outdata={indata[12:0],19'h0000};
   5'b10100: outdata={indata[11:0],20'h0000};
   5'b10101: outdata={indata[10:0],21'h0000};
   5'b10110: outdata={indata[9:0],22'h0000};	
   5'b10111: outdata={indata[8:0],23'h0000};
   5'b11000: outdata={indata[7:0],24'h0000};
   5'b11001: outdata={indata[6:0],25'h0000};
   5'b11010: outdata={indata[5:0],26'h0000};
   5'b11011: outdata={indata[4:0],27'h0000};
   5'b11100: outdata={indata[3:0],28'h0000};
   5'b11101: outdata={indata[2:0],29'h0000};
	5'b11110: outdata={indata[1:0],30'h0000};
   5'b11111: outdata={indata[0],31'h0000};	
endcase


end
endmodule
