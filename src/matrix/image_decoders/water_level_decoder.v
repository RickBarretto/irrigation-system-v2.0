//! LED matrix's decoder
//!
//! This decoder takes an encoded data and generates the images to be displayed on the LED matrix of the CPLD Kit
//!
//! To reduce resources usage, the images have been choosen to be simetric on the Y-axis,
//! what means that only three columns are needed for a 5-column display.
module water_level_decoder (
    output [6:0]col_1, //! Columns: 0 & 4
    output [6:0]col_0, //! Columns: 1, 2 & 3

    //! Quick explanation of the entries
    //! Data Meaning
    //! ---- ----------------------
    //!  00   Critical Water Level
    //!  01   Low Water Level
    //!  10   Mid Water Level
    //!  11   High Water Level
    input [1:0] data
);


endmodule