`timescale 1ns / 1ps
module top(BTN, clk_50mhz, SW, AN, LED, SEGMENT);
	input [3:0] BTN;
	input clk_50mhz;
	input [7:0] SW;
	output [3:0] AN;
	output [7:0] LED;
	output [7:0] SEGMENT;

	wire [3:0] button_out;
	wire [7:0] SW_OK;
	wire [25:0] count_out;
	wire [63:0] disp_num;
	wire [3:0] blink;
	wire [3:0] blink_out;
	wire [3:0] pointing;
	wire [63:0] A;
	wire [63:0] B;
	wire [31:0] intadd;
	wire [31:0] intsub;
	wire [63:0] intmul;
	wire [31:0] intdiv;
	wire [31:0] floatadd;
	wire [31:0] floatsub;
	wire [31:0] floatmul;
	wire [31:0] floatdiv;
	wire [31:0] logicright;
	wire [31:0] logicleft;
	wire [31:0] loopright;
	wire [31:0] loopleft;
	wire [31:0] arithright;
	wire [31:0] or_;
	wire [31:0] and_;
	wire [31:0] xor_;
	wire [31:0] not_;
	wire [3:0] overfloat;

	Anti_jitter M1(.clk(clk_50mhz),
					.button(BTN[3:0]),
					.SW(SW[7:0]),
					.button_out(button_out[3:0]),
					.button_pluse(),
					.SW_OK(SW_OK[7:0]));
	counter_26bit M2(.clk(clk_50mhz), 
					.reset(v5), 
                    .clk_1ms(), 
                    .count_out(count_out[25:0]));
	Input M3(.push_out(button_out[3:0]),
			.disp_ctr(SW[7:3]),
			.disp_bit(SW[1:0]),
			.A(A[63:0]),
			.B(B[63:0]),
			.state(),
			.blinke(blink[3:0]));
	Output_2_Disp M4(.clk(clk_50mhz),
					.rst(),
					.EN(),
					.Disp_sel(SW[7:3]),
					.point_in(),
					.blink_in(blink[3:0]),
					.Disp0(A[63:0]),
					.Disp1(B[63:0]),
					.Disp2(intadd[31:0]),
					.Disp3(intsub[31:0]),
					.Disp4(intmul[63:0]),
					.Disp5(intdiv[31:0]),
					.Disp6(floatadd[31:0]),
					.Disp7(floatsub[31:0]),
					.Disp8(floatmul[31:0]),
					.Disp9(floatdiv[31:0]),
					.Disp10(logicright[31:0]),
					.Disp11(logicleft[31:0]),
					.Disp12(loopright[31:0]),
					.Disp13(loopleft[31:0]),
					.Disp14(arithright[31:0]),
					.Disp15(or_[31:0]),
					.Disp16(and_[31:0]),
					.Disp17(xor_[31:0]),
					.Disp18(not_[31:0]),
					.point_out(pointing[3:0]),
					.blink_out(blink_out[3:0]),
					.Disp_num(disp_num[63:0]));
	Display M5(.disp_num(disp_num[63:0]),
				.SW(SW[1:0]),
				.flash_clk(count_out[24]),
				.Scanning(count_out[19:18]),
				.pointing(pointing[3:0]),
				.blinking(blink_out[3:0]),
				.AN(AN[3:0]),
				.SEGMENT(SEGMENT[7:0]));
/*	int_calc M6(.clk(clk_50mhz),
				.A(A[63:0]),
				.B(B[31:0]),
				.int_add(intadd[31:0]),
				.int_sub(intsub[31:0]),
				.int_mul(intmul[63:0]),
				.int_div(intdiv[31:0]),
				.int_mod());*/
	float_calc M7(.clk(clk_50mhz),
				.A(A[31:0]),
				.B(B[31:0]),
				.float_add(floatadd[31:0]),
				.float_sub(floatsub[31:0]),
				.float_mul(floatmul[31:0]),
				.float_div(floatdiv[31:0]),
				.overflow(overfloat[3:0]),
				.err());
/*	shift M8(.indata(A[31:0]),
			.shift(B[4:0]),
			.logic_right(logicright[31:0]),
			.logic_left(logicleft[31:0]),
			.loop_right(loopright[31:0]),
			.loop_left(loopleft[31:0]),
			.arith_right(arithright[31:0]));
	logic_ M9(.in1(A[31:0]),
			.in2(B[31:0]),
			.or_(or_[31:0]),
			.and_(and_[31:0]),
			.xor_(xor_[31:0]),
			.not_(not_[31:0]));*/
	LED_DEV M10(.overfloat(overfloat[3:0]),
			.LED(LED[7:0]));
	VCC M(.P(v5));
endmodule
