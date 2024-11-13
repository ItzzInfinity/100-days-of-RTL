`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/13/2024 05:44:45 AM
// Module Name: D_conversion
//////////////////////////////////////////////////////////////////////////////////

module D_conversion (
    input S, R, J, K, T, clk, reset,
    output q_sr, q_jk, q_t
);
    // Instantiate SR, JK, and T Flip-Flops
    SR_flipflop sr_ff (.S(S), .R(R), .clk(clk), .reset(reset), .Q(q_sr));
    JK_flipflop jk_ff (.J(J), .K(K), .clk(clk), .reset(reset), .Q(q_jk));
    T_flipflop t_ff (.T(T), .clk(clk), .reset(reset), .Q(q_t));
endmodule
