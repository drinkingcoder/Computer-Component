`timescale 1ns / 1ps

module Display(input [63:0] disp_num,
                input [1:0] SW,
                input flash_clk,
                input [1:0] Scanning,
                input [3:0] pointing,
                input [3:0] blinking,
                output [3:0] AN,
                output [7:0] SEGMENT);

    reg [3:0] digit, anode;
    reg [7:0] digit_seg;
    wire [15:0] disp_current;
    reg Dp;

    assign SEGMENT[7:0]={Dp,digit_seg[6:0]};
	 
	 assign disp_current=SW[1] ? (SW[0] ? disp_num[63:48] : disp_num[47:32]) : (SW[0] ? disp_num[31:16] : disp_num[15:0]);

//	case (SW[1:0])
//		2'b00:assign disp_current=disp_num[15:0];
//		2'b01:assign disp_current=disp_num[31:16];
//		2'b10:assign disp_current=disp_num[47:32];
//		2'b11:assign disp_current=disp_num[63:48];
//	endcase

    always @(*) begin
        case (Scanning)
            0:digit[3:0]<=disp_current[3:0];
            1:digit[3:0]<=disp_current[7:4];
            2:digit[3:0]<=disp_current[11:8];
            3:digit[3:0]<=disp_current[15:12];
        endcase
	end

    always @* begin
        anode = 4'b1111;
        case (Scanning)
                0: begin anode = 4'b1110; Dp = pointing[0]; end
                1: begin anode = 4'b1101; Dp = pointing[1]; end
                2: begin anode = 4'b1011; Dp = pointing[2]; end
                3: begin anode = 4'b0111; Dp = pointing[3]; end
        endcase
    end

    assign AN = anode |(blinking & {flash_clk,flash_clk,flash_clk,flash_clk});

    always @* begin
        case ({1'b0, digit})
            5'b00000 : digit_seg <= 8'b11000000;  // 0
            5'b00001 : digit_seg <= 8'b11111001;  // 1
            5'b00010 : digit_seg <= 8'b10100100;  // 2
            5'b00011 : digit_seg <= 8'b10110000;  // 3
            5'b00100 : digit_seg <= 8'b10011001;  // 4
            5'b00101 : digit_seg <= 8'b10010010;  // 5
            5'b00110 : digit_seg <= 8'b10000010;  // 6
            5'b00111 : digit_seg <= 8'b11111000;  // 7
            5'b01000 : digit_seg <= 8'b10000000;  // 8
            5'b01001 : digit_seg <= 8'b10010000;  // 9
            5'b01010 : digit_seg <= 8'b10001000;  // A
            5'b01011 : digit_seg <= 8'b10000011;  // b
            5'b01100 : digit_seg <= 8'b11000110;  // C
            5'b01101 : digit_seg <= 8'b10100001;  // d
            5'b01110 : digit_seg <= 8'b10000110;  // E
            5'b01111 : digit_seg <= 8'b10001110;  // F
            5'b10000 : digit_seg <= 8'b11000010;  // G
            5'b10001 : digit_seg <= 8'b10001011;  // h
            5'b10010 : digit_seg <= 8'b10001001;  // H
            5'b10011 : digit_seg <= 8'b11000111;  // L
            5'b10100 : digit_seg <= 8'b10101011;  // n
            5'b10101 : digit_seg <= 8'b10100011;  // o
            5'b10110 : digit_seg <= 8'b10001100;  // P
            5'b10111 : digit_seg <= 8'b10011000;  // q
            5'b11000 : digit_seg <= 8'b10101111;  // r
            5'b11001 : digit_seg <= 8'b10000111;  // t
            5'b11010 : digit_seg <= 8'b11000001;  // U
            5'b11011 : digit_seg <= 8'b10010001;  // y
            5'b11100 : digit_seg <= 8'b10111111;  // -
            5'b11101 : digit_seg <= 8'b10111110;  // =
            5'b11110 : digit_seg <= 8'b10011011;  // S
            5'b11111 : digit_seg <= 8'b11110001;  // J
        endcase
    end

endmodule
