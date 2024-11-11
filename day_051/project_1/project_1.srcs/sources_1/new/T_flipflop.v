`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/11/2024 06:21:51 AM
// Module Name: T_flipflop
//////////////////////////////////////////////////////////////////////////////////


module T_flipflop (
    input T, clk, reset,
    output Q
);
    wire S, R;

    assign S = T & ~Q; // Toggle logic: set when T=1 and Q=0
    assign R = T & Q;  // Toggle logic: reset when T=1 and Q=1

    SR_flipflop sr_ff (.S(S), .R(R), .clk(clk), .reset(reset), .Q(Q));
endmodule
