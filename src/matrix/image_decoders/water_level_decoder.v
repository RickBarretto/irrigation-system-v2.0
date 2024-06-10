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

    //! Images
    //! ------
    //!
    //!  Critical      Low        Mid        High
    //!  ---------  ---------  ---------  ---------
    //!  1 0 0 0 1  1 0 0 0 1  1 0 0 0 1  1 0 0 0 1
    //!  - - - - -  - - - - -  - - - - -  - - - - -
    //!  *       *  *       *  *       *  * * * * *
    //!  *       *  *       *  *       *  * * * * *
    //!  *       *  *       *  * * * * *  * * * * *
    //!  *       *  *       *  * * * * *  * * * * *
    //!  *       *  * * * * *  * * * * *  * * * * *
    //!  *       *  * * * * *  * * * * *  * * * * *
    //!  * * * * *  * * * * *  * * * * *  * * * * *

    // Helper wires

    wire not_1, not_0;
    wire on, off;

    always_on(on, data[1]);
    not (off, on);

    not (not_1, data[1]);
    not (not_0, data[0]);

    // Column 1 is always off
    pipe (col_1[6], off);   // Y = 0
    pipe (col_1[5], off);   // Y = 0
    pipe (col_1[4], off);   // Y = 0
    pipe (col_1[3], off);   // Y = 0
    pipe (col_1[2], off);   // Y = 0
    pipe (col_1[1], off);   // Y = 0
    pipe (col_1[0], off);   // Y = 0

    // Bottom is always off
    pipe (col_0[0], off);   // Y = 0


    // Variable Dots

    or   (col_0[6], not_1, not_0);  // Y = B1' + B0'
    pipe (col_0[5], col_1[6]);      // Y = B1' + B0'

    pipe (col_0[4], data[1]);       // Y = B1
    pipe (col_0[3], data[1]);       // Y = B1

    and  (col_0[2], not_1, not_0);  // Y = B1' * B0'
    pipe (col_0[1], col_1[1]);      // Y = B1' * B0'

endmodule