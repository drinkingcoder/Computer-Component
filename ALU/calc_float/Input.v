`timescale 1ns / 1ps
module Input(input [2:0] push_out,
			input [4:0] disp_ctr,
			input [1:0] disp_bit,
			output reg [63:0] A=64'hFEDCBA9876543210,
			output reg [63:0] B=64'h0123456789ABCDEF,
			output reg [1:0] state=2'b01,
			output reg [3:0] blinke);

    always @(posedge push_out[0]) begin
        if (disp_ctr[4:0]<=5'b00001)
            if (!push_out[1])
                state<=state-1;
            else
                state<=state+1;
        else
            state<=state;
    end

    always
        if (disp_ctr[4:0]<5'b00010)
            case (state[1:0])
                2'b00: blinke<=4'b0001;
                2'b01: blinke<=4'b0010;
                2'b10: blinke<=4'b0100;
                2'b11: blinke<=4'b1000;
            endcase
        else
            blinke<=4'b0000;

    always @(posedge push_out[2]) begin
        if (disp_ctr[4:0]==5'b00000) begin
            case ({disp_bit[1:0],state})
                4'b0000: begin A[3:0]<=A[3:0]+1; end
                4'b0001: begin A[7:4]<=A[7:4]+1; end
                4'b0010: begin A[11:8]<=A[11:8]+1; end
                4'b0011: begin A[15:12]<=A[15:12]+1; end
                4'b0100: begin A[19:16]<=A[19:16]+1; end
                4'b0101: begin A[23:20]<=A[23:20]+1; end
                4'b0110: begin A[27:24]<=A[27:24]+1; end
                4'b0111: begin A[31:28]<=A[31:28]+1; end
                4'b1000: begin A[35:32]<=A[35:32]+1; end
                4'b1001: begin A[39:36]<=A[39:36]+1; end
                4'b1010: begin A[43:40]<=A[43:40]+1; end
                4'b1011: begin A[47:44]<=A[47:44]+1; end
                4'b1100: begin A[51:48]<=A[51:48]+1; end
                4'b1101: begin A[55:52]<=A[55:52]+1; end
                4'b1110: begin A[59:56]<=A[59:56]+1; end
                4'b1111: begin A[63:60]<=A[63:60]+1; end
            endcase
        end
        else if (disp_ctr[4:0]==5'b00001)
            begin
                case ({disp_bit[1:0],state})
					4'b0000: begin B[3:0]<=B[3:0]+1; end
					4'b0001: begin B[7:4]<=B[7:4]+1; end
					4'b0010: begin B[11:8]<=B[11:8]+1; end
					4'b0011: begin B[15:12]<=B[15:12]+1; end
					4'b0100: begin B[19:16]<=B[19:16]+1; end
					4'b0101: begin B[23:20]<=B[23:20]+1; end
					4'b0110: begin B[27:24]<=B[27:24]+1; end
					4'b0111: begin B[31:28]<=B[31:28]+1; end
					4'b1000: begin B[35:32]<=B[35:32]+1; end
					4'b1001: begin B[39:36]<=B[39:36]+1; end
					4'b1010: begin B[43:40]<=B[43:40]+1; end
					4'b1011: begin B[47:44]<=B[47:44]+1; end
					4'b1100: begin B[51:48]<=B[51:48]+1; end
					4'b1101: begin B[55:52]<=B[55:52]+1; end
					4'b1110: begin B[59:56]<=B[59:56]+1; end
					4'b1111: begin B[63:60]<=B[63:60]+1; end
                endcase
            end
    end

endmodule
