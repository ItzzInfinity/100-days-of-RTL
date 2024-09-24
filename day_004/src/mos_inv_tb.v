`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 09/25/2024 09:54:11 AM
// Module Name: mos_inv_tb
//////////////////////////////////////////////////////////////////////////////////


module mos_inv_tb;

    reg in;
    wire out;
    mos_inv dut(in, out);
    initial in= 1'b0;
    initial forever #50 in = ~in;
    initial #600 $finish;
endmodule