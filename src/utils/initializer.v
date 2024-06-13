module initializer (
    output pulse,
    input clock
);

    wire reset, d;

    always_on (on, clock);

    and (reset, on, d);
    flipflop_d (d, clock, , reset, on);

endmodule