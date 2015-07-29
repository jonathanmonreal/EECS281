// Jonathan Monreal

module TestBench;
	
	reg a, b;		 // Two registers for inputs
	wire y1, y2, y3; // Three wires for outputs for and, or, and xor gates
	
	partD UUT(a, b, y1, y2, y3); // The current unit under test
	
	// Initial conditions for a and b
	initial
		begin			   
			a = 0; b = 0;
		end
	
	// Changes values of a and/or b every 10ms
	always
		begin
			#10 b = 1;
			#10 a = 1; b = 0;
			#10 b = 1;
		end
	
	// Displays values of a and b
	initial
		begin						   
			$display("                 TIME | a | b | y1 | y2 | y3");
			$monitor($time, "    %b   %b   %b    %b    %b", a, b, y1, y2, y3);
		end
	
	// Sets test to finish after 40ms
	initial
		#40 $finish;
	
endmodule
	