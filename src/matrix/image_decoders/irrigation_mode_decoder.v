
// Helper modules

module is_splinker(output out, input [1:0]data);
    not (not_dripper, data[1]);
    and (out, not_dripper, data[0]);
endmodule


module is_dripper(output out, input [1:0]data);
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

endmodule