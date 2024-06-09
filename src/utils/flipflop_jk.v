module flipflop_jk (
	output reg q,
	output reg not_q,

	input clock,
	input clear,
	input preset,
	input j, k
);

	always @(posedge clock or posedge clear or posedge preset) begin
		if (clear)  
			q <= 0;
		else if (preset) 
			q <= 1;
		else
			case ({j, k})
				2'b00: q <= q;
				2'b01: q <= 0;
				2'b10: q <= 1;
				2'b11: q <= ~q;
			endcase
	end

	not (not_q, q);

endmodule 