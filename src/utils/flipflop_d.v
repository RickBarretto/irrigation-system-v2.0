module flipflop_d (
    output reg q,

    input clock,
    input reset,
    input d
);

    always @ (posedge clock) begin
        if (!reset) q <= 0;
        else        q <= d;
    end

endmodule