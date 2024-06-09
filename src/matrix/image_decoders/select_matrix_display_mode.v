//! Select Matrix's Display Mode is a multiplexer that chooses between 
//! Irrigation mode display and Water mode display.
//!
//! This changes when the clock, changes.
//!
module select_matrix_display_mode (
	output [6:0] column_2,
	output [6:0] column_1,
	output [6:0] column_0,
	
	input clock,
	
	input [6:0] water_col_2,
	input [6:0] water_col_1,
	input [6:0] water_col_0,
	
	input [6:0] irrigation_col_2,
	input [6:0] irrigation_col_1,
	input [6:0] irrigation_col_0
);

	wire [6:0] bus_waters_image_2; 
	wire [6:0] bus_waters_image_1;
	wire [6:0] bus_waters_image_0;
	
	wire [6:0] bus_irrigations_image_2;
	wire [6:0] bus_irrigations_image_1;
	wire [6:0] bus_irrigations_image_0;
	
   	not (clock_down, clock);

	// TODO: test LE usage
	//
	// multiplexer_2x1(column_2, water_col_2[6], irrigation_col_2[6], clock);
	// multiplexer_2x1(column_2, water_col_2[5], irrigation_col_2[5], clock);
	// multiplexer_2x1(column_2, water_col_2[4], irrigation_col_2[4], clock);
	// multiplexer_2x1(column_2, water_col_2[3], irrigation_col_2[3], clock);
	// multiplexer_2x1(column_2, water_col_2[2], irrigation_col_2[2], clock);
	// multiplexer_2x1(column_2, water_col_2[1], irrigation_col_2[1], clock);
	// multiplexer_2x1(column_2, water_col_2[0], irrigation_col_2[0], clock);

	// Water

	and (bus_waters_image_2[6], clock, water_col_2[6]);
	and (bus_waters_image_2[5], clock, water_col_2[5]);
	and (bus_waters_image_2[4], clock, water_col_2[4]);
	and (bus_waters_image_2[3], clock, water_col_2[3]);
	and (bus_waters_image_2[2], clock, water_col_2[2]);
	and (bus_waters_image_2[1], clock, water_col_2[1]);
	and (bus_waters_image_2[0], clock, water_col_2[0]);
	
	and (bus_waters_image_1[6], clock, water_col_1[6]);
	and (bus_waters_image_1[5], clock, water_col_1[5]);
	and (bus_waters_image_1[4], clock, water_col_1[4]);
	and (bus_waters_image_1[3], clock, water_col_1[3]);
	and (bus_waters_image_1[2], clock, water_col_1[2]);
	and (bus_waters_image_1[1], clock, water_col_1[1]);
	and (bus_waters_image_1[0], clock, water_col_1[0]);
	
	and (bus_waters_image_0[6], clock, water_col_0[6]);
	and (bus_waters_image_0[5], clock, water_col_0[5]);
	and (bus_waters_image_0[4], clock, water_col_0[4]);
	and (bus_waters_image_0[3], clock, water_col_0[3]);
	and (bus_waters_image_0[2], clock, water_col_0[2]);
	and (bus_waters_image_0[1], clock, water_col_0[1]);
	and (bus_waters_image_0[0], clock, water_col_0[0]);
	
	
	// Irrigation

	and (bus_irrigations_image_2[6], clock_down, irrigation_col_2[6]);
	and (bus_irrigations_image_2[5], clock_down, irrigation_col_2[5]);
	and (bus_irrigations_image_2[4], clock_down, irrigation_col_2[4]);
	and (bus_irrigations_image_2[3], clock_down, irrigation_col_2[3]);
	and (bus_irrigations_image_2[2], clock_down, irrigation_col_2[2]);
	and (bus_irrigations_image_2[1], clock_down, irrigation_col_2[1]);
	and (bus_irrigations_image_2[0], clock_down, irrigation_col_2[0]);
	
	and (bus_irrigations_image_1[6], clock_down, irrigation_col_1[6]);
	and (bus_irrigations_image_1[5], clock_down, irrigation_col_1[5]);
	and (bus_irrigations_image_1[4], clock_down, irrigation_col_1[4]);
	and (bus_irrigations_image_1[3], clock_down, irrigation_col_1[3]);
	and (bus_irrigations_image_1[2], clock_down, irrigation_col_1[2]);
	and (bus_irrigations_image_1[1], clock_down, irrigation_col_1[1]);
	and (bus_irrigations_image_1[0], clock_down, irrigation_col_1[0]);
	
	and (bus_irrigations_image_0[6], clock_down, irrigation_col_0[6]);
	and (bus_irrigations_image_0[5], clock_down, irrigation_col_0[5]);
	and (bus_irrigations_image_0[4], clock_down, irrigation_col_0[4]);
	and (bus_irrigations_image_0[3], clock_down, irrigation_col_0[3]);
	and (bus_irrigations_image_0[2], clock_down, irrigation_col_0[2]);
	and (bus_irrigations_image_0[1], clock_down, irrigation_col_0[1]);
	and (bus_irrigations_image_0[0], clock_down, irrigation_col_0[0]);

	// Output
	
	or (column_2[6], bus_waters_image_2[6], bus_irrigations_image_2[6]);
	or (column_2[5], bus_waters_image_2[5], bus_irrigations_image_2[5]);
	or (column_2[4], bus_waters_image_2[4], bus_irrigations_image_2[4]);
	or (column_2[3], bus_waters_image_2[3], bus_irrigations_image_2[3]);
	or (column_2[2], bus_waters_image_2[2], bus_irrigations_image_2[2]);
	or (column_2[1], bus_waters_image_2[1], bus_irrigations_image_2[1]);
	or (column_2[0], bus_waters_image_2[0], bus_irrigations_image_2[0]);
	
	or (column_1[6], bus_waters_image_1[6], bus_irrigations_image_1[6]);
	or (column_1[5], bus_waters_image_1[5], bus_irrigations_image_1[5]);
	or (column_1[4], bus_waters_image_1[4], bus_irrigations_image_1[4]);
	or (column_1[3], bus_waters_image_1[3], bus_irrigations_image_1[3]);
	or (column_1[2], bus_waters_image_1[2], bus_irrigations_image_1[2]);
	or (column_1[1], bus_waters_image_1[1], bus_irrigations_image_1[1]);
	or (column_1[0], bus_waters_image_1[0], bus_irrigations_image_1[0]);
	
	or (column_0[6], bus_waters_image_0[6], bus_irrigations_image_0[6]);
	or (column_0[5], bus_waters_image_0[5], bus_irrigations_image_0[5]);
	or (column_0[4], bus_waters_image_0[4], bus_irrigations_image_0[4]);
	or (column_0[3], bus_waters_image_0[3], bus_irrigations_image_0[3]);
	or (column_0[2], bus_waters_image_0[2], bus_irrigations_image_0[2]);
	or (column_0[1], bus_waters_image_0[1], bus_irrigations_image_0[1]);
	or (column_0[0], bus_waters_image_0[0], bus_irrigations_image_0[0]);
	
	
endmodule 