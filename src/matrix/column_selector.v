module column_selector (
    output col[2:0],
    
    input enable,
    input clock,
    input reset
);

// flipflop_jk
//     output reg q,
//     output reg not_q,
//
//    input clock,
//    input reset,
//    input j, k

    flipflop_jk (col[2], not_col2, clock, 1, col[0], not_col0);
    flipflop_jk (col[1], not_col1, clock, 1, col[2], not_col2);
    flipflop_jk (col[0], not_col0, clock, 1, col[1], not_col1);

endmodule