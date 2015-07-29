`timescale 1 ns / 10 ps

module TestBench;
	
	reg clk, reset, d;
	wire q;
	
	parity UUT(clk, reset, d, q);
	
	// Initial conditions for clk, reset, and d
	initial
		begin
			clk = 1; reset = 0; d = 0; 
		end
	
	always #5 clk = ~clk;
	
	// Computational tests of the dff
	initial
		begin
	        #2 reset = 1;
			#10 reset = 0; d = 1;
			#10 d = 0;
			#20 d = 1;
			#20	d = 0;
			#10 d = 1;
			#10 d = 0;
			#10 d = 1;
			#30 d = 0;
    	end											   
		
	// Monitor the console and save simulation data
	initial
		begin
			$dumpfile("dff.vcd");
			$dumpvars(1, clk, reset, d, q);
			$dumpflush;
		end
		
	// Set test to finish after 80ms
	initial
		#142 $finish;
		
endmodule