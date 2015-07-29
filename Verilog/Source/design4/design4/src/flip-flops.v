module dff(clk, reset, d, q);
	
	input clk, reset, d;
	output reg q;
	
	always @ (posedge clk or posedge reset)
		if (reset) q = 0;
		else q = d;
	
endmodule