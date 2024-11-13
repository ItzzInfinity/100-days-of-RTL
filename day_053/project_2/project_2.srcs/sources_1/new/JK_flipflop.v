`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/13/2024 05:46:27 AM
// Module Name: JK_flipflop
//////////////////////////////////////////////////////////////////////////////////

module JK_flipflop (
    input J, K, clk, reset,
    output Q
);
    wire d;
    assign d = J & ~Q | ~K & Q; // JK logic converted to D input
    D_flipflop d_ff (.clk(clk), .reset(reset), .d(d), .Q(Q));
endmodule