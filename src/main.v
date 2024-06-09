module main(
	input low_water_level,
	input mid_water_level,
	input high_water_level,

	input earth_humidity,
	input air_humidity,
	input low_temperature,
	
	input selector,
	input clock,


	// LED RGB

	output alarm,


	// Array of LEDs Display

	output water_supply_valvule,

	output counter_2, output counter_1,
	output counter_0,

	output splinker_bomb,
	output dripper_valvule,
	

	// 7-Segment Display

	output segment_a, output segment_b, output segment_c,
    output segment_d, output segment_e, output segment_f,
    output segment_g,
	 
	output display_0, output display_1, 
	output display_2, output display_3, 
	output displays_point,


	// Matrix of LEDs Display

	output matrix_col0, output matrix_col1, output matrix_col2, 
	output matrix_col3, output matrix_col4,

	output matrix_row0, output matrix_row1, output matrix_row2, 
	output matrix_row3, output matrix_row4, output matrix_row5,
	output matrix_row6

);

	//-------------------------------------------
	// Input related
	//-------------------------------------------

	water_sensors_checker check_error(
		conflicting_values,

		low_water_level,
		mid_water_level,
		high_water_level
	);


	//-------------------------------------------
	// Water supply related
	//-------------------------------------------

	water_supply_controller open_water_supply(
		water_supply_valvule,

		conflicting_values,
		high_water_level
	);


	//-------------------------------------------
	// Irrigation related
	//-------------------------------------------

	irrigation_controller check_prerequisites(
		irrigation_on,
		conflicting_values,
		earth_humidity,
		low_water_level
	);

	irrigation_selector select_irrigation(
		splinker_mode_on,

		air_humidity,
		low_temperature,
		mid_water_level
	);

	and open_splinker(splinker_bomb, splinker_mode_on, irrigation_on);
	and open_dripper(dripper_valvule, dripper_mode_on, irrigation_on);


	//-------------------------------------------
	// Alarm related
	//-------------------------------------------

	alarm_controller enable_alarm(alarm, mid_water_level, conflicting_values);
	

	//-------------------------------------------
	// Matrix Display related
	//-------------------------------------------

	wire [2:0] matrix_column;
	wire [6:0] water_column_1;
	wire [6:0] water_column_2;
	wire [6:0] irrigation_column_2;
	wire [6:0] irrigation_column_1;
	wire [6:0] irrigation_column_0;

	water_encoder encode_water(
		encoded_water,

		high_water_level,
		mid_water_level,
		low_water_level
	);
	
	irrigation_encoder encode_irrigation(
		encoded_irrigation,
		splinker_mode_on
	);
	
	clock_div (reduced_clock, clock, 1);
	column_selector (matrix_column, reduced_clock, 0);
	
	pipe (led2, matrix_column[2]);
	pipe (led1, matrix_column[1]);
	pipe (led0, matrix_column[0]);
	
	water_level_decoder (
	   water_column_1,
	   water_column_0,
		
		encoded_water
	);
	
	irrigation_mode_decoder(
		irrigation_column_2,
		irrigation_column_1,
		irrigation_column_0,
		
		encoded_irrigation
	);

endmodule
