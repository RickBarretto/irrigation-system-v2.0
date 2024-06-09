module clock_divisor(
    output new_frequency,

    input clock,
    input reset
);

  flipflop_t (wire_1,   clock,  reset, 1);
  flipflop_t (wire_2,  wire_1,  reset, 1);
  flipflop_t (wire_3,  wire_2,  reset, 1);
  flipflop_t (wire_4,  wire_3,  reset, 1);
  flipflop_t (wire_5,  wire_4,  reset, 1);

  flipflop_t (wire_6,  wire_5,  reset, 1);
  flipflop_t (wire_7,  wire_6,  reset, 1);
  flipflop_t (wire_8,  wire_7,  reset, 1);
  flipflop_t (wire_9,  wire_8,  reset, 1);
  flipflop_t (wire_10, wire_9,  reset, 1);

  flipflop_t (wire_11, wire_10, reset, 1);
  flipflop_t (wire_12, wire_11, reset, 1);
  flipflop_t (wire_13, wire_12, reset, 1);
  flipflop_t (wire_14, wire_13, reset, 1);
  flipflop_t (wire_15, wire_14, reset, 1);

  flipflop_t (wire_16, wire_15, reset, 1);
  flipflop_t (wire_17, wire_16, reset, 1);
  flipflop_t (wire_18, wire_17, reset, 1);
  flipflop_t (wire_19, wire_18, reset, 1);
  flipflop_t (wire_20, wire_19, reset, 1);

  flipflop_t (wire_21, wire_20, reset, 1);
  flipflop_t (wire_22, wire_21, reset, 1);
  flipflop_t (wire_23, wire_22, reset, 1);
  flipflop_t (wire_24, wire_23, reset, 1);
  flipflop_t (wire_25, wire_24, reset, 1);
  
  flipflop_t (new_frequency, wire_25, reset, 1);

endmodule 