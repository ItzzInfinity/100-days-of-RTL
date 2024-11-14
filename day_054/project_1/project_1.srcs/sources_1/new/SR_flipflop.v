`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/14/2024 04:09:24 AM
// Module Name: SR_flipflop
//////////////////////////////////////////////////////////////////////////////////

module SR_flipflop (
    input S, R, clk, reset,
    output Q
);
    wire T;
    assign T = S ^ R; // T is high when S and R are different
    T_flipflop tff (.T(T), .clk(clk), .reset(reset), .Q(Q));
endmodule

