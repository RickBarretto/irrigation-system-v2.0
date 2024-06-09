module matrix_display (
	output m_col0,
	output m_col1,
	output m_col2,
	output m_col3,
	output m_col4,

	output m_row0,
	output m_row1,
	output m_row2,
	output m_row3,
	output m_row4,
	output m_row5,
	output m_row6,
	
	input [2:0]ring_counter,
	 
	input [6:0]col_2, //! Columns: 0 & 4
   input [6:0]col_1, //! Columns: 1 & 3
   input [6:0]col_0  //! Columns: 2
);

	// Columns
	
	and (m_col0, ring_counter[0], ring_counter[0]); 
	and (m_col4, ring_counter[0], ring_counter[0]);
	and (m_col1, ring_counter[1], ring_counter[1]);
	and (m_col2, ring_counter[1], ring_counter[1]);
	and (m_col3, ring_counter[2], ring_counter[2]);

	// Rows
	
	wire [6:0]img_2;
	wire [6:0]img_1;
	wire [6:0]img_0;
	
	nand (img_2[6], ring_counter[0], col_2[6]);
	nand (img_2[5], ring_counter[0], col_2[5]);
	nand (img_2[4], ring_counter[0], col_2[4]);
	nand (img_2[3], ring_counter[0], col_2[3]);
	nand (img_2[2], ring_counter[0], col_2[2]);
	nand (img_2[1], ring_counter[0], col_2[1]);
   nand (img_2[0], ring_counter[0], col_2[0]);
	
	nand (img_1[6], ring_counter[1], col_1[6]);
	nand (img_1[5], ring_counter[1], col_1[5]);
	nand (img_1[4], ring_counter[1], col_1[4]);
	nand (img_1[3], ring_counter[1], col_1[3]);
	nand (img_1[2], ring_counter[1], col_1[2]);
	nand (img_1[1], ring_counter[1], col_1[1]);
   nand (img_1[0], ring_counter[1], col_1[0]);
	
	nand (img_0[6], ring_counter[0], col_0[6]);
	nand (img_0[5], ring_counter[0], col_0[5]);
	nand (img_0[4], ring_counter[0], col_0[4]);
	nand (img_0[3], ring_counter[0], col_0[3]);
	nand (img_0[2], ring_counter[0], col_0[2]);
	nand (img_0[1], ring_counter[0], col_0[1]);
   nand (img_0[0], ring_counter[0], col_0[0]);
	
	// Merging rows
	or (m_row0, img_0[6], img_1[6], img_2[6]);
	or (m_row1, img_0[5], img_1[5], img_2[5]);
	or (m_row2, img_0[4], img_1[4], img_2[4]);
	or (m_row3, img_0[3], img_1[3], img_2[3]);
	or (m_row4, img_0[2], img_1[2], img_2[2]);
	or (m_row5, img_0[1], img_1[1], img_2[1]);
   or (m_row6, img_0[0], img_1[0], img_2[0]);
	
	
endmodule 