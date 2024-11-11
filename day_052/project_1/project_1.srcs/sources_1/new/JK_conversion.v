`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/12/2024 10:59:56 AM
// Module Name: JK_conversion
//////////////////////////////////////////////////////////////////////////////////


module JK_conversion (
    input S, R, D, T, clk, reset,
    output q_sr, q_d, q_t
);

    SR_flipflop sr_ff (.S(S), .R(R), .clk(clk), .reset(reset), .Q(q_sr));

    D_flipflop d_ff (.D(D), .clk(clk), .reset(reset), .Q(q_d));

    T_flipflop t_ff (.T(T), .clk(clk), .reset(reset), .Q(q_t));
endmodule
