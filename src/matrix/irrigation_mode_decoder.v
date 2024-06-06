module is_splinker (
    output out,
    input data[1:0]
);
    not (not_dripper, data[1])
    and (out, not_dripper, data[0]);
endmodule

module is_dripper (
    output out,
    input data[1:0]
);
    not (not_splinker, data[0])
    and (out, not_splinker, data[1]);
endmodule

//! LED matrix's decoder
//! 
//! This decoder takes an encoded data and generates the images to be displayed on the LED matrix of the CPLD Kit
//! 
//! To reduce resources usage, the images have been choosen to be simetric on the Y-axis,
//! what means that only three columns are needed for a 5-column display.
module irrigation_mode_decoder (
    output col_2[6:0], //! Columns: 0 & 4
    output col_1[6:0], //! Columns: 1 & 3
    output col_0[6:0], //! Columns: 2

    //! Quick explanation of the entries
    //! Data Meaning
    //! ---- ---------------
    //! 01   Splinker output
    //! 10   Dripper output

    input data[1:0]
);

    // Helper function
    always_on (on, data[1]);
    not (b1_not, data[1]);
    not (b0_not, data[0]);

    // =================================
    // 01

    // col_2[6, 4, 0] = b1'b0
    is_splinker (col_2[6], data);
    is_splinker (col_2[4], data);
    is_splinker (col_2[0], data);

    // col_1[4, 3, 2]
    is_splinker (col_1[4], data);
    is_splinker (col_1[3], data);
    is_splinker (col_1[2], data);

    // =================================
    // 00

    // col_2[5] = 0
    not (col_2[5], always_on);

    // col_1[6] = 0
    not (col_1[6], always_on);
    

    // =================================
    // 11

    // col_2[3] = 1
    always_on (col_2[3], data[1]);

    // col_1[1, 0] = 1
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
    // 10

    // col_2[2, 1] = b1b0' 
    is_dripper (col_2[2], data);
    is_dripper (col_2[1], data);

    // col_1[5] = b1b0'
    is_dripper (col_1[5], data);

endmodule 