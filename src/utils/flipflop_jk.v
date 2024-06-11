module flipflop_jk (
	output reg q,

	input clock,
	input set,
	input reset,

	input j, k
);

	always @(posedge clock or posedge reset or posedge set) begin
		if (reset) 		q <= 0;
		else if (set)	q <= 1;
		else
			case ({j, k})
				2'b00: 	q <= q;
				2'b01: 	q <= 0;
				2'b10: 	q <= 1;
				2'b11: 	q <= ~q;
			endcase
	end

endmodule