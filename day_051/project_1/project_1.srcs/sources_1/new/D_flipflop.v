`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/11/2024 06:21:51 AM
// Module Name: D_flipflop
//////////////////////////////////////////////////////////////////////////////////


module D_flipflop (
    input D, clk, reset,
    output Q
);
    wire S, R;

    assign S = D;
    assign R = ~D;

    SR_flipflop sr_ff (.S(S), .R(R), .clk(clk), .reset(reset), .Q(Q));
endmodule
