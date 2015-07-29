`timescale 1 ns / 10 ps

// Jonathan Monreal

// Implements a complete adder
module adder(a, b, ci, s, co);
						 
	input a, b, ci;
	output s, co;
	wire aORb, aANDb_, aANDb, d1, d2;
	
	OAO U1(ci, a, b, a, aORb, aANDb_, co);   // Finds the carry out
	OAO U2(co_, aORb, ci, aANDb, d1, d2, s); // Finds the sum
	not #0.5 U3(co_, co);       // Inverts the carry out for use in U2
	not #0.5 U4(aANDb, aANDb_); // Inverts aANDb_ for use in U2
	
endmodule

// Implements an or-and-or arrangement
module OAO(d, e, f, g, y1, y3_, y4);
	
	input d, e, f, g;
	output y1, y3_, y4;
	wire e_, f_, y2_;
	
	not #0.5 u5(e_, e);
	not #0.5 u6(f_, f);
	nand #1 u1(y1, e_, f_);
	nand #1 u2(y2_, d, y1);
	nand #1 u3(y3_, f, g);
	nand #1 u4(y4, y2_, y3_);
	
endmodule