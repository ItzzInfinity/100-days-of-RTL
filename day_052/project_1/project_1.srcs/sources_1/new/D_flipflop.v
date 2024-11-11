`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/12/2024 11:01:59 AM
// Module Name: D_flipflop
//////////////////////////////////////////////////////////////////////////////////


module D_flipflop (
    input D, clk, reset,
    output Q
);
    wire J = D;
    wire K = ~D;
    
    JK_flipflop jk_ff (.J(J), .K(K), .clk(clk), .reset(reset), .Q(Q));
endmodule
