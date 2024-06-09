//! Matrix Ring's Decoder is a 3x5 decoder
//!
//! This module creates the logic of mirror the image on the Y-axis. 
module matrix_ring_decoder(
    output column_0,
	output column_1,
	output column_2,
	output column_3,
	output column_4,

    input [2:0] ring_counter
);
	
	and (column_0, ring_counter[0], ring_counter[0]); 
	and (column_1, ring_counter[1], ring_counter[1]);
	and (column_2, ring_counter[2], ring_counter[2]);
    and (column_3, ring_counter[1], ring_counter[1]);
	and (column_4, ring_counter[0], ring_counter[0]);


endmodule