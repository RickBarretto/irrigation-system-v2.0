
// Helper modules

module is_splinker (
    output out,
    input [1:0]data
);
    not (not_dripper, data[1]);
    and (out, not_dripper, data[0]);
endmodule


module is_dripper (
    output out,
    input [1:0]data
);
    not (not_splinker, data[0]);
    and (out, not_splinker, data[1]);
endmodule



//! LED matrix's decoder
//! 
//! This decoder takes an encoded data and generates the needed images 
//! to be displayed on the LED matrix of the CPLD Kit, when showing the irrigation system.
//! 
//! To reduce resources usage, the images have been choosen to be simetric on the Y-axis,
//! what means that only three columns are needed for a 5-column display.
module irrigation_mode_decoder (
    output [6:0] col_2, //! Columns: 0 & 4
    output [6:0] col_1, //! Columns: 1 & 3
    output [6:0] col_0, //! Columns: 2

    //! Quick explanation of the entries
    //! --------------------------------
    //! 
    //! Data Meaning
    //! ---- ---------------
    //! 01   Splinker output
    //! 10   Dripper output

    input [1:0] data
);

    // Helper function
    always_on (on, data[1]);
    not (b1_not, data[1]);
    not (b0_not, data[0]);


    // =================================
    // When data is a Splinker

    // col_2[6] = b1'b0
    // col_2[4] = b1'b0
    // col_2[4] = b1'b0
    is_splinker (col_2[6], data);
    is_splinker (col_2[4], data);
    is_splinker (col_2[0], data);

    // col_1[4:2]
    is_splinker (col_1[4], data);
    is_splinker (col_1[3], data);
    is_splinker (col_1[2], data);


    // =================================
    // Always Off

    // col_2[5] = 0
    not (col_2[5], on);

    // col_1[6] = 0
    not (col_1[6], on);
    

    // =================================
    // Always On

    // col_2[3] = 1
    always_on (col_2[3], data[1]);

    // col_1[1:0] = 1
    always_on (col_1[1], data[1]);
    always_on (col_1[0], data[1]);

    // col_0[6:0] = 1
    always_on (col_0[6], data[1]);
    always_on (col_0[5], data[1]);
    always_on (col_0[4], data[1]);
    always_on (col_0[3], data[1]);
    always_on (col_0[2], data[1]);
    always_on (col_0[1], data[1]);
    always_on (col_0[0], data[1]);


    // =================================
    // When data is a Dripper

    // col_2[2:1] = b1b0' 
    is_dripper (col_2[2], data);
    is_dripper (col_2[1], data);

    // col_1[5] = b1b0'
    is_dripper (col_1[5], data);

endmodule 