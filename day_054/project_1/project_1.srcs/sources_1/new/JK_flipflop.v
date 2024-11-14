`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/14/2024 04:09:24 AM
// Module Name: JK_flipflop
//////////////////////////////////////////////////////////////////////////////////

module JK_flipflop (
    input J, K, clk, reset,
    output Q
);
    wire T;
    assign T = J ^ (Q & ~K); // T depends on JK inputs and current Q
    T_flipflop tff (.T(T), .clk(clk), .reset(reset), .Q(Q));
endmodule

