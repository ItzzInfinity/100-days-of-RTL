`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/13/2024 06:16:57 AM
// Module Name: mux_to_gates
//////////////////////////////////////////////////////////////////////////////////


module mux_to_gates(
input a,b,
output m_and,m_or,m_nand,m_nor,m_xor,m_xnor,m_not);

mux_2_to_1 m1 (1'b1,  1'b0,  b, m_not);
mux_2_to_1 m2 (1'b0,  b,     a, m_and);
mux_2_to_1 m3 (b,     1'b1,  a, m_or);
mux_2_to_1 m4 (m_not, 1'b0,  a, m_nand);
mux_2_to_1 m5 (1'b1,  m_not, a, m_nor);
mux_2_to_1 m6 (m_not, b,     a, m_xor);
mux_2_to_1 m7 (b,     m_not, a, m_xnor);


endmodule
