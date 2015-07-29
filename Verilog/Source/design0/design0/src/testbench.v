// Jonathan Monreal

module testbench;
	
	reg a, b;
	wire y1, y2, y3;
	
	partS UUT(a, b, y1, y2, y3);
	
	// Initial conditions for a and b
	initial
		begin			   
			a = 0; b = 0;
		end
	
	// Changes values of a and b
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
		
	initial
		#40 $finish;
	
endmodule
	