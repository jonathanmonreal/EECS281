module parity(clk, reset, d, q);
	input clk, reset, d;
	output q;
	
	dff u1(clk, reset, d ^ q, q);
	
endmodule
	