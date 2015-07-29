// Jonathan Monreal

module OAO(d, e, f, g, y1, y3_, y4);
	
	input d, e, f, g;
	output y1, y3_, y4;
	wire e_, f_, y2_;
	
	not u5(e_, e);
	not u6(f_, f);
	nand u1(y1, e_, f_);
	nand u2(y2_, d, y1);
	nand u3(y3_, f, g);
	nand u4(y4, y2_, y3_);
	
endmodule