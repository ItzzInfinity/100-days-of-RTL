`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/13/2024 05:46:27 AM
// Module Name: T_flipflop
//////////////////////////////////////////////////////////////////////////////////

module T_flipflop (
    input T, clk, reset,
    output Q
);
    wire d;
    assign d = T ^ Q; // T logic converted to D input
    D_flipflop d_ff (.clk(clk), .reset(reset), .d(d), .Q(Q));
endmodule
