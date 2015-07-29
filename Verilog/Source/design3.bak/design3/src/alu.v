module alu(A, B, CI, S0, S1, F, CO);
	
	input A, B, CI, S0, S1;
	output F, CO;
	
	adder U1(A, B ^ S0, CI & S1, F, CO);
	
endmodule

module alu4(A, B, S, F);
	
	input [3:0] A, B;
	input [1:0] S;
	output [3:0] F;
	wire CO0, CO1, CO2, CO3;
	
	alu B0(A[0], B[0], S[0], S[0], S[1], F[0], CO0);
	alu B1(A[1], B[1], CO0, S[0], S[1], F[1], CO1);
	alu B2(A[2], B[2], CO1, S[0], S[1], F[2], CO2);
	alu B3(A[3], B[3], CO2, S[0], S[1], F[3], CO3);
	
endmodule