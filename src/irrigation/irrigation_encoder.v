module irrigation_encoder (
	output [1:0]encoded_irrigation,
	input splinker_mode_on
);

	not (encoded_irrigation[1], splinker_mode_on);
	and (encoded_irrigation[0], splinker_mode_on, splinker_mode_on);

endmodule