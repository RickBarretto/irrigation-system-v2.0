module column_selector (
    output [2:0]col,
    
    input clock,
	 input clear
);

    flipflop_d (col[2], clock, 1, clear, col[0]);
    flipflop_d (col[1], clock, clear, 1, col[1]);
    flipflop_d (col[0], clock, clear, 1, col[2]);

endmodule
