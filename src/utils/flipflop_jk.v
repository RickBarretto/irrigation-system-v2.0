module flipflop_jk (
	output reg q,
	output reg not_q,

	input clock,
	input reset,
	input j, k
);

	always @(posedge clock)
		case ({j, k})
			2'b00: q <= q;
			2'b01: q <= 0;
			2'b10: q <= 1;
			2'b11: q <= ~q;
		endcase
	
endmodule 