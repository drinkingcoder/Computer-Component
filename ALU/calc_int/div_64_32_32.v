module div_64_32_32(clk, a, b, quo, mod);
   input clk;
   input [63:0] a;
   input [31:0] b;
   output reg [31:0] quo, mod;

   reg [31:0]        quo_r, mod_r;

   parameter START = 2'b00, CALC = 2'b01, FIN = 2'b11;

   reg [1:0]         state = START;
   reg [4:0]         count = 5'b00000;
   wire [31:0]       tmp_sum;
   reg               op;

   adder_32bits adder_m(.A(mod_r),
                        .B(b),
                        .Ctr(op),
                        .S(tmp_sum),
                        .Co(),
                        .Cy());

   always @(posedge clk) begin
      case (state)
        START: begin
           mod_r <= a[62:31];
           quo_r <= {32{a[30:0], 1'b0}};
           op <= 1;    // first operation: subtraction
           state <= CALC;
        end
        CALC: begin
           if (count != 5'b11111) begin
              mod_r <= {32{tmp_sum[30:0], quo_r[31]}};
           quo_r <= {32{quo_r[30:0], ~tmp_sum[31]}};
           op <= ~tmp_sum[31];
           count <= count + 1;
        end
           else begin
              quo_r <= {32{quo_r[30:0], ~tmp_sum[31]}};
              mod_r <= tmp_sum[31] ? tmp_sum + b : tmp_sum;
              state <= FIN;
              count <= 5'b00000;
           end
        end
        FIN: begin
           quo <= quo_r;
           mod <= mod_r;
           state <= START;
           count <= 5'b00000;
        end
        default:;
      endcase // case (state)
   end // always @ (posedge clk)

endmodule // div_64_32_32
