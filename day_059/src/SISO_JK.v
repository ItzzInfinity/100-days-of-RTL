`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/19/2024 07:33:05 AM
// Module Name: SISO_JK
//////////////////////////////////////////////////////////////////////////////////


module SISO_JK(
    input serial_in, clk, reset,
    output serial_out
);
    wire Q1, Q2, Q3;

    // Instantiate JK flip-flops in series
    jk_ff FF1(.j(serial_in), .k(serial_in), .clk(clk), .reset(reset), .Q(Q1));
    jk_ff FF2(.j(Q1), .k(Q1), .clk(clk), .reset(reset), .Q(Q2));
    jk_ff FF3(.j(Q2), .k(Q2), .clk(clk), .reset(reset), .Q(Q3));
    jk_ff FF4(.j(Q3), .k(Q3), .clk(clk), .reset(reset), .Q(serial_out));

endmodule
