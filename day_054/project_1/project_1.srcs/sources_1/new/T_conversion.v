`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/14/2024 04:07:54 AM
// Module Name: T_conversion
//////////////////////////////////////////////////////////////////////////////////

module T_conversion (
    input S, R, J, K, D, clk, reset,
    output q_sr, q_jk, q_d
);
    // Instantiate SR, JK, and D flip-flops using T flip-flop
    SR_flipflop sr_ff (.S(S), .R(R), .clk(clk), .reset(reset), .Q(q_sr));
    JK_flipflop jk_ff (.J(J), .K(K), .clk(clk), .reset(reset), .Q(q_jk));
    D_flipflop d_ff (.D(D), .clk(clk), .reset(reset), .Q(q_d));
endmodule

