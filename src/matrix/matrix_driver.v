//! Matrix Driver is a multiplexer that syncronizates the rows 
//! with the current column of the LED Matrix.
module matrix_driver (
	output row_0,
	output row_1,
	output row_2,
	output row_3,
	output row_4,
	output row_5,
	output row_6,
	
	input [2:0] ring_counter,
	 
	input [6:0] col_2, //! Columns: 0 & 4
   	input [6:0] col_1, //! Columns: 1 & 3
   	input [6:0] col_0  //! Columns: 2
);
	
	wire [6:0] bus_column_2;
	wire [6:0] bus_column_1;
	wire [6:0] bus_column_0;
	
	and (bus_column_2[6], ring_counter[2], col_2[6]);
	and (bus_column_2[5], ring_counter[2], col_2[5]);
	and (bus_column_2[4], ring_counter[2], col_2[4]);
	and (bus_column_2[3], ring_counter[2], col_2[3]);
	and (bus_column_2[2], ring_counter[2], col_2[2]);
	and (bus_column_2[1], ring_counter[2], col_2[1]);
   	and (bus_column_2[0], ring_counter[2], col_2[0]);
	
	and (bus_column_1[6], ring_counter[1], col_1[6]);
	and (bus_column_1[5], ring_counter[1], col_1[5]);
	and (bus_column_1[4], ring_counter[1], col_1[4]);
	and (bus_column_1[3], ring_counter[1], col_1[3]);
	and (bus_column_1[2], ring_counter[1], col_1[2]);
	and (bus_column_1[1], ring_counter[1], col_1[1]);
   	and (bus_column_1[0], ring_counter[1], col_1[0]);
	
	and (bus_column_0[6], ring_counter[0], col_0[6]);
	and (bus_column_0[5], ring_counter[0], col_0[5]);
	and (bus_column_0[4], ring_counter[0], col_0[4]);
	and (bus_column_0[3], ring_counter[0], col_0[3]);
	and (bus_column_0[2], ring_counter[0], col_0[2]);
	and (bus_column_0[1], ring_counter[0], col_0[1]);
   	and (bus_column_0[0], ring_counter[0], col_0[0]);
	
	// Merging rows

	or (row_0, bus_column_0[6], bus_column_1[6], bus_column_2[6]);
	or (row_1, bus_column_0[5], bus_column_1[5], bus_column_2[5]);
	or (row_2, bus_column_0[4], bus_column_1[4], bus_column_2[4]);
	or (row_3, bus_column_0[3], bus_column_1[3], bus_column_2[3]);
	or (row_4, bus_column_0[2], bus_column_1[2], bus_column_2[2]);
	or (row_5, bus_column_0[1], bus_column_1[1], bus_column_2[1]);
   	or (row_6, bus_column_0[0], bus_column_1[0], bus_column_2[0]);
	
	
endmodule 