module mul_32_32_64(clk, a, b, out);
   input clk;
   input [31:0] a, b;
   output reg [63:0] out;

   reg [63:0]        out_r;

   parameter START = 2'b00, CALC = 2'b01, FIN = 2'b10;

   reg [3:0]     count = 4'b0000;
   reg [1:0]     state = START;
   reg           last = 0;
   wire [31:0]    tmp_sum;
   wire [31:0]    addend;
   wire [2:0]     booth;

   assign booth = {3{out_r[1:0], last}};
   assign addend = (booth[1] ^ booth[0]) ? a : {32{a[30:0], 1'b0}} & {32{booth[2] ^ booth[0]}};
   // 07: 0, 1256: a, 34: 2a
   adder_32bits adder_m(.A(out_r[63:32]),
                        .B(addend),
                        .Ctr(booth[2]),    // 0123: +, 4567: -
                        .S(tmp_sum),
                        .Co(),
                        .Cy());

   always @(posedge clk) begin
      case (state)
        START: begin
           out_r <= b;
           state <= CALC;
        end
        CALC: begin
           if (count != 4'b1111) begin
              count <= count + 1;
              // asr 2 bits
              out_r[63:62] <= {2{tmp_sum[31]}};
              out_r[61:30] <= tmp_sum[31:0];
              out_r[29:0] <= out_r[31:2];
              last <= out_r[1];
           end // if (count != 4'b1111)
           else
             state <= FIN;
        end // case: CALC
        FIN: begin
           out <= out_r;
           state <= START;
           count <= 4'b0000;
        end
        default:;
      endcase // case (state)
   end // always @ (posedge clk)

endmodule // mul_32_32_64
