`timescale 1ns/1ps

module Output_2_Disp(input clk,
					 input rst,
					 input EN,
					 input [4:0] Disp_sel,
					 input [63:0] point_in,
					 input [3:0] blink_in,
					 input [63:0] Disp0,
					 input [63:0] Disp1,
					 input [63:0] Disp2,
					 input [63:0] Disp3,
					 input [63:0] Disp4,
					 input [63:0] Disp5,
					 input [31:0] Disp6,
					 input [31:0] Disp7,
					 input [31:0] Disp8,
					 input [31:0] Disp9,
					 input [31:0] Disp10,
					 input [31:0] Disp11,
					 input [31:0] Disp12,
					 input [31:0] Disp13,
					 input [31:0] Disp14,
					 input [31:0] Disp15,
					 input [31:0] Disp16,
					 input [31:0] Disp17,
					 input [31:0] Disp18,
					 output reg [3:0] point_out,
					 output reg [3:0] blink_out,
					 output reg [63:0] Disp_num=64'h012345678ABCDEF
					 );

    always @(posedge clk) begin
        point_out<=4'b1111;
        blink_out<=4'b0000;

        case (Disp_sel)
            5'b00000:begin
						Disp_num<=Disp0;
						blink_out<=blink_in[3:0];
					 end
            5'b00001:begin
						Disp_num<=Disp1;
						blink_out<=blink_in[3:0];
					 end
            5'b00010:
                Disp_num<={32'h00000000,Disp2};
            5'b00011:
                Disp_num<={32'h00000000,Disp3};
            5'b00100:
                Disp_num<=Disp4;
            5'b00101:
                Disp_num<={32'h00000000,Disp5};
            5'b00110:
                Disp_num<={32'h00000000,Disp6};
            5'b00111:
                Disp_num<={32'h00000000,Disp7};
				5'b01000:
                Disp_num<={32'h00000000,Disp8};
            5'b01001:
                Disp_num<={32'h00000000,Disp9};
            5'b01010:
                Disp_num<={32'h00000000,Disp10};
            5'b01011:
                Disp_num<={32'h00000000,Disp11};
            5'b01100:
                Disp_num<={32'h00000000,Disp12};
            5'b01101:
                Disp_num<={32'h00000000,Disp13};
            5'b01110:
                Disp_num<={32'h00000000,Disp14};
            5'b01111:
                Disp_num<={32'h00000000,Disp15};
            5'b10000:
                Disp_num<={32'h00000000,Disp16};
            5'b10001:
                Disp_num<={32'h00000000,Disp17};
            5'b10010:
                Disp_num<={32'h00000000,Disp18};
        endcase

    end

endmodule
