`timescale 1 ns / 10 ps

module TestBench;
	
	reg [3:0] A, B;
	reg [1:0] S;
	wire [3:0] F;
	
	alu4 UUT(A, B, S, F);
	
	// Initial conditions for A, B, and S
	initial
		begin
			A = 4; B = 1; S[1] = 1; S[0] = 0;
		end
	
	// Computational tests of the ALU
	initial
		begin
	        #10 A = 7; B = -8;
	        #10 A = -1; B = 5; S[0] = 1;
	        #10 A = 3; B = 2;
	        #10 A = 'b1111; B = 'b0101; S[1] = 0; S[0] = 0;
	        #10 A = 'b1010; B = 'b0000;
	        #10 A = 'b1111; B = 'b0101; S[0] = 1;
	        #10 A = 'b1010; B = 'b1111;
    	end
	
	// Display the truth table
	initial
		begin						   
			$display("                 TIME | A | B | S0 | S1 | F");
			$monitor($time, "   %d  %d    %b    %b  %d", A, B, S[0], S[1], F);
		end	
		
	// Monitor the console and saves simulation data
	initial
		begin
			$dumpfile("alu.vcd");
			$dumpvars(1, A, B, S, F);
			$dumpflush;
		end
		
	// Set test to finish after 80ms
	initial
		#80 $finish;
		
endmodule