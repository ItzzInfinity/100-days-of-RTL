`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/18/2024 05:23:28 AM
// Module Name: PIPO
//////////////////////////////////////////////////////////////////////////////////


module PIPO(
    input clk, reset, 
    input [3:0] parallel_in,
    output [3:0] parallel_out
    );

    D_flipflop D3(parallel_in[3], clk, reset, parallel_out[3]);
    D_flipflop D2(parallel_in[2], clk, reset, parallel_out[2]);
    D_flipflop D1(parallel_in[1], clk, reset, parallel_out[1]);
    D_flipflop D0(parallel_in[0], clk, reset, parallel_out[0]);
    
endmodule
