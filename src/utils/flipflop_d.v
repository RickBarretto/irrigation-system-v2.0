module flipflop_d (
    output reg q,

    input clock,
    input reset,
	input set,
    input d
);

    always @(posedge clock) begin
        if (!reset)    q <= 0;
		else if (!set) q <= 1;
        else           q <= d;
    end

endmodule