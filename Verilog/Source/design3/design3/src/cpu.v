module cpu4(clk, reset, s, b, a);
	
	input clk, reset;
	input [3:0] b;
	input [1:0] s;
	output [3:0] a;
	wire [3:0] f;
	
	alu4 U1(a, b, s, f);
	dff4 U2(clk, reset, f, a);
	
endmodule