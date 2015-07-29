// Jonathan Monreal

module partS(a, b, y1, y2, y3);
						   				  
	input a, b;
	output y1, y2, y3;
	
	// This is the body of the module in structural style
	
	and u1(y1, a, b);
	or u2(y2, a, b);
	xor u3(y3, a, b);
	
endmodule