`timescale 1 ns / 10 ps

module TestBench;
	
	wire co, s;
	integer ctr;
	wire a = ctr[2]; wire b = ctr[1]; wire ci = ctr[0];
	
	
	adder UUT(a, b, ci, co, s);
	
	initial
		begin
			ctr = 0;
			$display("                TIME | A | B | CI || CO | S");
			$monitor($time,"   %b   %b   %b     %b    %b", a, b, ci, co, s);
			$dumpfile("adder.vcd");
			$dumpvars(1, a, b, ci, co, s);
			$dumpflush;
			#80 $finish;
		end
	
	always forever #10 ctr = ctr + 1;
		
endmodule