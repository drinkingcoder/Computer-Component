module int_calc(clk, A, B, int_add, int_sub, int_mul, int_div, int_mod);
   input clk;
   input [63:0] A;
   input [31:0] B;
   output [31:0] int_add;
   output [31:0] int_sub;
   output [63:0] int_mul;
   output [31:0] int_div;
   output [31:0] int_mod;

   adder_32bits adder(.A(A[31:0]),
                      .B(B[31:0]),
                      .Ctr(1'b0),
                      .S(int_add),
                      .Co(),
                      .Cy());

   adder_32bits suber(.A(A[31:0]),
                      .B(B[31:0]),
                      .Ctr(1'b1),
                      .S(int_sub),
                      .Co(),
                      .Cy());

   mul_32_32_64 muler(.clk(clk),
                      .a(A[31:0]),
                      .b(B[31:0]),
                      .out(int_mul));

   div_64_32_32 diver(.clk(clk),
                      .a(A[63:0]),
                      .b(B[31:0]),
                      .quo(int_div),
                      .mod(int_mod));

endmodule // int_calc
