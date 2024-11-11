`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/11/2024 06:21:51 AM
// Module Name: JK_flipflop
//////////////////////////////////////////////////////////////////////////////////


module JK_flipflop (
    input J, K, clk, reset,
    output Q
);
    wire S, R;

    assign S = J & ~Q; // Set when J=1 and Q=0
    assign R = K & Q;  // Reset when K=1 and Q=1

    SR_flipflop sr_ff (.S(S), .R(R), .clk(clk), .reset(reset), .Q(Q));
endmodule

