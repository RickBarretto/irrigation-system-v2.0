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
    input [1:0]data
);

    // Helper function
    always_on (on, data[1]);

    // Column 01 -- Always on
    // Shows the border of the watter supply

    always_on (col_1[6], data[1]);
    always_on (col_1[5], data[1]);
    always_on (col_1[4], data[1]);
    always_on (col_1[3], data[1]);
    always_on (col_1[2], data[1]);
    always_on (col_1[1], data[1]);
    always_on (col_1[0], data[1]);

    // Column 00
    // Shows the water level itself
    
    // row[6,5] = b1*b0
    and (col_0[6], data[1], data[0]);
    and (col_0[5], data[1], data[0]);

    // row[4,3] = b1
    and (col_0[4], data[1], on);
    and (col_0[3], data[1], on);
    
    // row[2,1] = b0 + b1
    or (col_0[2], data[0], data[1]);
    or (col_0[1], data[0], data[1]);

    // row[0] = 1
    or (col_0[0], data[1], on);


endmodule 