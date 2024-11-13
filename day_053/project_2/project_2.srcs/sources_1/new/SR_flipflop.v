`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/13/2024 05:46:27 AM
// Module Name: SR_flipflop
//////////////////////////////////////////////////////////////////////////////////

module SR_flipflop (
    input S, R, clk, reset,
    output Q
);
    wire d;
    assign d = S & ~Q | ~R & Q; // SR logic converted to D input
    D_flipflop d_ff (.clk(clk), .reset(reset), .d(d), .Q(Q));
endmodule
