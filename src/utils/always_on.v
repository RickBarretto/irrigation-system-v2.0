module always_on (
	output on, 
	input a
);

	not (a_not, a);
	or  (on, a, a_not);

endmodule 