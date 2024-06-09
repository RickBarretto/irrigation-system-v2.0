module select_matrix_display (
	output [6:0]col_2,
	output [6:0]col_1,
	output [6:0]col_0,
	
	input clock,
	
	input [6:0]water_col_2,
	input [6:0]water_col_1,
	input [6:0]water_col_0,
	
	input [6:0]irrigation_col_2,
	input [6:0]irrigation_col_1,
	input [6:0]irrigation_col_0
);

	wire [6:0] water_2; 
	wire [6:0] water_1;
	wire [6:0] water_0;
	
	wire [6:0] irrigation_2;
	wire [6:0] irrigation_1;
	wire [6:0] irrigation_0;
	
   not (clock_down, clock);

	// Water
	and (water_2[6], clock, water_col_2[6]);
	and (water_2[5], clock, water_col_2[5]);
	and (water_2[4], clock, water_col_2[4]);
	and (water_2[3], clock, water_col_2[3]);
	and (water_2[2], clock, water_col_2[2]);
	and (water_2[1], clock, water_col_2[1]);
	and (water_2[0], clock, water_col_2[0]);
	
	and (water_1[6], clock, water_col_1[6]);
	and (water_1[5], clock, water_col_1[5]);
	and (water_1[4], clock, water_col_1[4]);
	and (water_1[3], clock, water_col_1[3]);
	and (water_1[2], clock, water_col_1[2]);
	and (water_1[1], clock, water_col_1[1]);
	and (water_1[0], clock, water_col_1[0]);
	
	and (water_0[6], clock, water_col_0[6]);
	and (water_0[5], clock, water_col_0[5]);
	and (water_0[4], clock, water_col_0[4]);
	and (water_0[3], clock, water_col_0[3]);
	and (water_0[2], clock, water_col_0[2]);
	and (water_0[1], clock, water_col_0[1]);
	and (water_0[0], clock, water_col_0[0]);
	
	
	// Irrigation
	and (irrigation_2[6], clock_down, irrigation_col_2[6]);
	and (irrigation_2[5], clock_down, irrigation_col_2[5]);
	and (irrigation_2[4], clock_down, irrigation_col_2[4]);
	and (irrigation_2[3], clock_down, irrigation_col_2[3]);
	and (irrigation_2[2], clock_down, irrigation_col_2[2]);
	and (irrigation_2[1], clock_down, irrigation_col_2[1]);
	and (irrigation_2[0], clock_down, irrigation_col_2[0]);
	
	and (irrigation_1[6], clock_down, irrigation_col_1[6]);
	and (irrigation_1[5], clock_down, irrigation_col_1[5]);
	and (irrigation_1[4], clock_down, irrigation_col_1[4]);
	and (irrigation_1[3], clock_down, irrigation_col_1[3]);
	and (irrigation_1[2], clock_down, irrigation_col_1[2]);
	and (irrigation_1[1], clock_down, irrigation_col_1[1]);
	and (irrigation_1[0], clock_down, irrigation_col_1[0]);
	
	and (irrigation_0[6], clock_down, irrigation_col_0[6]);
	and (irrigation_0[5], clock_down, irrigation_col_0[5]);
	and (irrigation_0[4], clock_down, irrigation_col_0[4]);
	and (irrigation_0[3], clock_down, irrigation_col_0[3]);
	and (irrigation_0[2], clock_down, irrigation_col_0[2]);
	and (irrigation_0[1], clock_down, irrigation_col_0[1]);
	and (irrigation_0[0], clock_down, irrigation_col_0[0]);

	// Output
	or (col_2[6], water_2[6], irrigation_2[6]);
	or (col_2[5], water_2[5], irrigation_2[5]);
	or (col_2[4], water_2[4], irrigation_2[4]);
	or (col_2[3], water_2[3], irrigation_2[3]);
	or (col_2[2], water_2[2], irrigation_2[2]);
	or (col_2[1], water_2[1], irrigation_2[1]);
	or (col_2[0], water_2[0], irrigation_2[0]);
	
	or (col_1[6], water_1[6], irrigation_1[6]);
	or (col_1[5], water_1[5], irrigation_1[5]);
	or (col_1[4], water_1[4], irrigation_1[4]);
	or (col_1[3], water_1[3], irrigation_1[3]);
	or (col_1[2], water_1[2], irrigation_1[2]);
	or (col_1[1], water_1[1], irrigation_1[1]);
	or (col_1[0], water_1[0], irrigation_1[0]);
	
	or (col_0[6], water_0[6], irrigation_0[6]);
	or (col_0[5], water_0[5], irrigation_0[5]);
	or (col_0[4], water_0[4], irrigation_0[4]);
	or (col_0[3], water_0[3], irrigation_0[3]);
	or (col_0[2], water_0[2], irrigation_0[2]);
	or (col_0[1], water_0[1], irrigation_0[1]);
	or (col_0[0], water_0[0], irrigation_0[0]);
	
	
endmodule 