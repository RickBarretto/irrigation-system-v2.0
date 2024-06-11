//! Decodes binary code to output display
//!
//! Moreover, this also implements the letters E, r and o,
//! what makes it possible to create the word Erro, on display.
//!
//! Being their codes:
//!
//! Char [3:0]data
//! ---- ---------
//!  E     1100
//!  r     1110
//!  o     1111
module display_decoder(
    output a, output b, output c,
    output d, output e, output f,
    output g,

    input [3:0] data
);

    //!     a
    //!   -----
    //! f |   | b
    //!   --g--
    //! e |   | c
    //!   -----
    //!     d

    //!     Input    Output
    //! --- ----- -------------
    //! Rep  Bin  A B C D E F G
    //! --- ----- - - - - - - -
    //!  0  0000  0 0 0 0 0 0 1
    //!  1  0001  1 0 0 1 1 1 1
    //!  2  0010  0 0 1 0 0 1 0
    //!  3  0011  0 0 0 0 1 1 0
    //!  4  0100  1 0 0 1 1 0 0
    //!  5  0101  0 1 0 0 1 0 0
    //!  6  0110  0 1 0 0 0 0 0
    //!  7  0111  0 0 0 1 1 1 1
    //!  8  1000  0 0 0 0 0 0 0
    //!  9  1001  0 0 0 0 1 0 0
    //!  .  1010  * * * * * * *
    //!  .  1011  * * * * * * *
    //!  E  1100  0 1 1 0 0 0 0
    //!  .  1101  * * * * * * *
    //!  r  1110  1 1 1 1 0 1 0
    //!  o  1111  1 1 0 0 0 1 0

    // Negative Wires
    wire [3:0] negative;

    not (negative[3], data[3]);
    not (negative[2], data[2]);
    not (negative[1], data[1]);
    not (negative[0], data[0]);

    // Segments

    // Segment A =
    // Segment B =
    // Segment C =
    // Segment D =
    // Segment E =
    // Segment F =
    // Segment G =


endmodule
