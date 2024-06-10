module simple_flipflop_d(
    output reg q,

    input preset,
    input clock,
    input d
);
    always @(posedge clock, posedge preset) begin
        if (preset) q <= preset;
        q <= d;
    end
endmodule


//! Column Selector is a 3 bit Ring Counter
//!
//! The reason why we just need 3 bits for a 5 columns lenght matrix
//! is the fact of the images being mirrored,
//! so 2 of those columns are exactly the same.
module column_selector (output [2:0] col, input clock);

    //                     Q    preset clock    D
    //                   ------ ------ -----  ------
    simple_flipflop_d D2(col[2],  1,   clock, col[0]);
    simple_flipflop_d D1(col[1],  0,   clock, col[2]);
    simple_flipflop_d D0(col[0],  0,   clock, col[1]);

endmodule
