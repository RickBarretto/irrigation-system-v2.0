//! Column Selector is a 3 bit Ring Counter
//! 
//! The reason why we just need 3 bits for a 5 columns lenght matrix
//! is the fact of the images being mirrored, 
//! so 2 of those columns are exactly the same.
module column_selector (
    output [2:0]col,
    
    input clock
);

    // Reset = 1
    // Clear = 0

    flipflop_d (col[2], clock, 1, 0, col[0]);
    flipflop_d (col[1], clock, 0, 1, col[1]);
    flipflop_d (col[0], clock, 0, 1, col[2]);

endmodule
