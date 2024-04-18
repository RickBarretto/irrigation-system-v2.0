module main(
	input low, 
	input mid, 
	input Us, 
	input Ua,
	input T,
	input high, 
	output watter_supply, 
	output error, 
	output alarme, 
	output asp,
	output got
);

	wire rega;

	sensor_checker check_error(low, mid, high, error);
	open_watter_supply open(error, high, watter_supply);

	irrigation_selector select(error, Us, low,rega);

	splinker open(Us, Ua, T, mid, asp);
	dripper open(Us, Ua, T, mid, got);
	
endmodule