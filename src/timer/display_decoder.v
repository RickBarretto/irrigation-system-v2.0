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
    //!  0  0000  1 1 1 1 1 1 0
    //!  1  0001  0 1 1 0 0 0 0
    //!  2  0010  1 1 0 1 1 0 1
    //!  3  0011  1 1 1 1 0 0 1
    //!  4  0100  0 1 1 0 0 1 1
    //!  5  0101  1 0 1 1 0 1 1
    //!  6  0110  1 0 1 1 1 1 1
    //!  7  0111  1 1 1 0 0 0 0
    //!  8  1000  1 1 1 1 1 1 1
    //!  9  1001  1 1 1 0 1 1 1
    //!  .  1010  * * * * * * *
    //!  .  1011  * * * * * * *
    //!  E  1100  1 0 0 1 1 1 1
    //!  .  1101  * * * * * * *
    //!  r  1110  0 0 0 0 1 0 1
    //!  o  1111  0 0 1 1 1 0 1

    // Negative Wires
    wire [3:0] negative;

    not (negative[3], data[3]);
    not (negative[2], data[2]);
    not (negative[1], data[1]);
    not (negative[0], data[0]);

    // Common Minterms:

    // Term 01: BC'
    and (term_01, data[2], negative[1]);

    // Term 02: BC'D
    and (term_02, term_01, data[0]);

    // Term 03: AC'
    and (term_03, data[3], negative[1]);

    // Term 04: B'D'
    and (term_04, negative[2], negative[0]);

    // Term 05: A'CD
    and (term_05, negative[3], data[1], data[0]);

    // Term 06: A'BD'
    and (term_06, negative[3], data[2], negative[0]);

    // Term 07: AB'
    and (term_07, data[3], negative[2]);

    // Term 08: CD'
    and (term_08, data[1], negative[0]);


    // Segments

    // Segment A = BC'D + AC' + A'C + B'D'
    and (a_term_3, negative[3], data[1]);
    or  (a, term_02, term_03, a_term_3, term_04);

    // Segment B = A'C'D' + A'CD + B'
    and (b_term_01, negative[3], negative[1], negative[0]);
    or  (b, b_term_01, term_05, negative[2]);

    // Segment C = A'BD' + AB' + A'C' + AD + B'D
    and (c_term_03, negative[3], negative[1]);
    and (c_term_04, data[3], data[0]);
    and (c_term_05, negative[2], data[0])
    or  (c, term_06, term_07, c_term_03, c_term_04, c_term_05);

    // Segment D = AC'D + BC'D + ACD + A'CD' + B'C + B'D'
    and (d_term_01, term_03, data[0]);
    and (d_term_03, data[3], data[1], data[0]);
    and (d_term_04, negative[3], data[1], negative[0]);
    and (d_term_05, negative[2], data[1]);
    or  (d, d_term_01, term_02, d_term_03, d_term_04, d_term_05, term_04);

    // Segment E = CD' + B'D' + A
    or  (e, term_08, term_04, data[3]);

    // Segment F = A'BD' + C'D' + AB' + BC'
    and (f_term_02, negative[1], negative[0]);
    or  (f, term_06, f_term_02, term_07, term_01);

    // Segment G = CD' + BC' + B'C' + A
    and (g_term_03, negative[2], negative[1]);
    or  (g, term_08, term_01, g_term_03, data[3]);


endmodule
