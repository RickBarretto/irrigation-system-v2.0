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
    //!    * * *
    //!  *   *   *      *
    //!  *   *   *    * * *
    //!      *        * * *
    //!      *      * * * * *
    //!    * * *    * * * * *
    //!  * * * * *    * * *

    // Helper function
    always_on (on, data[1]);



endmodule