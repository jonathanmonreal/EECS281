module dff4(clk, reset, d, q);
	
	input clk, reset; 
	input [3:0] d;
	output reg [3:0] q;
	
	always @ (posedge clk or posedge reset)
		if (reset) q = 0;
		else q = d;
	
endmodule