`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/16/2024 10:52:41 AM
// Module Name: SIPO
//////////////////////////////////////////////////////////////////////////////////


module SIPO(
input clk, Din,reset,
output Qa,Qb,Qc,Qd);

 D_flipflop D0 (.d(Din), .clk(clk), .reset(reset), .Q(Qa));
 D_flipflop D1 (.d(Qa), .clk(clk), .reset(reset), .Q(Qb));
 D_flipflop D2 (.d(Qb), .clk(clk), .reset(reset), .Q(Qc));
 D_flipflop D3 (.d(Qc), .clk(clk), .reset(reset), .Q(Qd));


endmodule
