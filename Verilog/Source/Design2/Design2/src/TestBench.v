`timescale 1 ns / 10 ps

module testbench();
	reg a, b, ci; // Three registers for inputs
	wire s, co;   // Three wires for outputs for and, or, and xor gates
	
	adder UUT(a, b, ci, s, co);
	
	// Initial conditions for a, b, and ci
	initial
		begin			   
			a = 0; b = 0; ci = 0;
		end
	
	// Change values of a, b, and ci at appropriate intervals
	always #40 a = ~a;
	always #20 b = ~b;
	always #10 ci = ~ci;
	
	// Display the truth table
	initial
		begin						   
			$display("                 TIME | a | b | ci | s | co");
			$monitor($time, "    %b   %b   %b    %b   %b", a, b, ci, s, co);
		end
	
	// Monitor the console and saves simulation data
	initial
		begin
			$dumpfile("adder.vcd");
			$dumpvars(1, a, b, ci, s, co);
			$dumpflush;
		end
		
	// Set test to finish after 80ms
	initial
		#80 $finish;
	
endmodule