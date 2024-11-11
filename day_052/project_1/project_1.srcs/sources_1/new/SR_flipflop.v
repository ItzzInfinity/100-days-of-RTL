`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/12/2024 11:01:59 AM
// Module Name: SR_flipflop
//////////////////////////////////////////////////////////////////////////////////


module SR_flipflop (
    input S, R, clk, reset,
    output Q
);
    wire J = S;
    wire K = R;
    
    JK_flipflop jk_ff (.J(J), .K(K), .clk(clk), .reset(reset), .Q(Q));
endmodule
