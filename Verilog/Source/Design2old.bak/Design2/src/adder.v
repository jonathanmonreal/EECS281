module OAO(d, e, f, g, y1, y3_, y4);
	
	input d, e, f, g;
	output y1, y3_, y4;
	
	nand #10 U1(y1, e_, f_);
	nand #10 U2(y1ANDd_, y1, d);
	nand #10 U3(y3_, f, g);
	nand #10 U4(y4, y1ANDd_, y3_);
	not #5 U5(e_, e);
	not #5 U6(f_, f);
	
endmodule

module adder(a, b, ci, co, s);
	
	input a, b, ci;
	output co, s;
	
	nand U1(aORb, a_, b_);
	nand U2(aORbANDci_, aORb, ci);
	nand U3(aANDb_, a, b);
	nand U4(co, aORbANDci_, aANDb_);
	not #5 U5(a_, a);
	not #5 U6(b_, b);
	
	OAO OAOM(!co, aORb, ci, a & b, aORb, aANDb, s);
	
endmodule