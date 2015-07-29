// Jonathan Monreal

module partD(a, b, y1, y2, y3);
	
	input a, b;
	output y1, y2, y3;
	
	// This is the body of the module in design flow style
	
	assign y1 = a & b;
	assign y2 = a | b;
	assign y3 = a ^ b;
	
endmodule