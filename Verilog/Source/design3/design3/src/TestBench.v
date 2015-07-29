`timescale 1 ns / 10 ps

module TestBench;
	
	reg clk, reset;
	reg [1:0] s;
	reg [3:0] b;
	wire [3:0] a;
	
	cpu4 UUT(clk, reset, s, b, a);
	
	// Initial conditions for clk, reset, b, and s
	initial
		begin
			clk = 1; reset = 0; b = 'h0; s = 'h0;
		end
	
	always #5 clk = ~clk;
	
	// Computational tests of the cpu
	initial
		begin
	        #2 reset = 1;
			#10 reset = 0; s = 'h2; b = 'h1;
			#100 s = 'h3; b = 'h3;
			#40 s = 'h1; b = 'hE;
    	end
	
		// Monitor the console and save simulation data
	initial
		begin
			$dumpfile("cpu.vcd");
			$dumpvars(1, clk, reset, b, s, a);
			$dumpflush;
		end
		
	// Set test to finish after 80ms
	initial
		#170 $finish;
	
endmodule