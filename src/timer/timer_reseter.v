module timer_reseter (
    output [1:0] minutes_d_preset,
    output [3:0] minutes_u_preset,
    output [2:0] seconds_d_preset,

    output reset,

    input forced_reset_from_button,
    input irrigation_on,
    input conflicting_values,

    input splinker_mode_on,

    input [1:0] minutes_d,
    input [3:0] minutes_u,
    input [2:0] seconds_d
);

    // Reset logic

    not (button_released, forced_reset_from_button);
    not (irrigation_off, irrigation_on);

    nor all_zero(
        reached_zero,
		seconds_d[2], seconds_d[1], seconds_d[0],
		minutes_u[3], minutes_u[2], minutes_u[1], minutes_u[0],
		minutes_d[1], minutes_d[0]
    );

    nor (reset, irrigation_off, reached_zero, button_released, conflicting_values);


    // splinker_mode_on = 15:00 <= 0001 0101 0000
    // dripper_mode_on  = 30:00 <= 0011 0000 0000

    //! Splinker Minutes-D Minutes-U Seconds-D
    //! -------- --------- --------- ---------
    //!    1      0 0 0 1   0 1 0 1  0 0 0 0
    //!    0      0 0 1 1   0 0 0 0  0 0 0 0

    // pipe (minutes_d_preset[1], reset); // Y = S'
    // pipe (minutes_d_preset[0], reset);             // Y = 1

    // pipe (minutes_u_preset[2], reset); // Y = S
    // pipe (minutes_u_preset[0], reset); // Y = S


endmodule