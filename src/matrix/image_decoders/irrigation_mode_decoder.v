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

    input splinker_mode_on
);

    //! Images
    //! ------
    //!
    //!  Splinker    Dripper
    //! ----------  ---------
    //!  2 1 0 1 2  2 1 0 1 2
    //!  - - - - -  - - - - -
    //!    * * *
    //!  *   *   *      *
    //!  *   *   *    * * *
    //!      *        * * *
    //!      *      * * * * *
    //!    * * *    * * * * *
    //!  * * * * *    * * *

    // Helper wires

    wire on, off;
    wire dripper_mode_on;

    always_on (on, splinker_mode_on);
    not (off, on);
    not (dripper_mode_on, splinker_mode_on);

    // Colunn 2
    pipe (col_2[6], on);                // Y = 1
    pipe (col_2[5], dripper_mode_on);   // Y = S'
    pipe (col_2[4], dripper_mode_on);   // Y = S'
    pipe (col_2[3], on);                // Y = 1
    pipe (col_2[2], splinker_mode_on);  // Y = S
    pipe (col_2[1], splinker_mode_on);  // Y = S
    pipe (col_2[0], dripper_mode_on);   // Y = S'

    // Column 1
    pipe (col_1[6], dripper_mode_on);   // Y = S'
    pipe (col_1[5], on);                // Y = 1
    pipe (col_1[4], splinker_mode_on);  // Y = S
    pipe (col_1[3], splinker_mode_on);  // Y = S
    pipe (col_1[2], splinker_mode_on);  // Y = S
    pipe (col_1[1], off);               // Y = 0
    pipe (col_1[0], off);               // Y = 0

    // Column 0
    pipe (col_0[6], dripper_mode_on);   // Y = S'
    pipe (col_0[5], on);                // Y = 1
    pipe (col_0[4], on);                // Y = 1
    pipe (col_0[3], on);                // Y = 1
    pipe (col_0[2], on);                // Y = 1
    pipe (col_0[1], on);                // Y = 1
    pipe (col_0[0], on);                // Y = 1


endmodule