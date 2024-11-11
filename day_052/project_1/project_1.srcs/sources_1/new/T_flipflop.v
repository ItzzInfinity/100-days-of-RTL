`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/12/2024 11:01:59 AM
// Module Name: T_flipflop
//////////////////////////////////////////////////////////////////////////////////


module T_flipflop (
    input T, clk, reset,
    output Q
);
    wire J = T;
    wire K = T;
    
    JK_flipflop jk_ff (.J(J), .K(K), .clk(clk), .reset(reset), .Q(Q));
endmodule
