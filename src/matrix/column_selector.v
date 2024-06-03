module column_selector (
    column_0,
    column_1,
    column_2,
    
    input enable,
    input clock,
    input reset
);

    flipflop_d (column_0, clock, column_0, enable);
    flipflop_d (column_1, clock, column_2, column_0);
    flipflop_d (column_2, clock, reset, column_1);

endmodule