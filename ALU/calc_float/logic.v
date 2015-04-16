
module logic_(input [31:0]in1,
			input [31:0]in2,
			output [31:0]or_,
			output [31:0]and_,
			output [31:0]xor_,
			output [31:0]not_
);




or_32  l1(in1[31:0],in2,or_[31:0]);

and_32 l2(in1[31:0],in2,and_[31:0]);

xor_32 l3(in1[31:0],in2,xor_[31:0]);

not_32 l4(in1[31:0],not_[31:0]);



/*always @(*) 
begin

case(switch)
2'b00:out=out1;
2'b01:out=out2;
2'b10:out=out3;
2'b11:out=out4;

endcase

end
*/


endmodule
