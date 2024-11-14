`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/14/2024 04:09:24 AM
// Module Name: D_flipflop
//////////////////////////////////////////////////////////////////////////////////

module D_flipflop (
    input D, clk, reset,
    output Q
);
    wire T;
    assign T = D ^ Q; // T flips only when D is different from current Q
    T_flipflop tff (.T(T), .clk(clk), .reset(reset), .Q(Q));
endmodule

