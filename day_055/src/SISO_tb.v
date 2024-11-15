`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/15/2024 10:21:47 AM
// Module Name: SISO_tb
//////////////////////////////////////////////////////////////////////////////////
module SISO_tb;

    reg clk, reset, serial_in;
    wire serial_out;

    SISO uut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .serial_out(serial_out)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns period
    end
    initial begin
        reset = 1;
        serial_in = 0;
        #10 reset = 0;
        #10 serial_in = 1; // Input '1' -> expect serial_out = 0 after 4 cycles
        #10 serial_in = 0;
        #10 serial_in = 1;
        #10 serial_in = 1;
        #10 serial_in = 0;
        #10 serial_in = 1;
        #10 serial_in = 0;
        #50;
        reset = 1;
        #10 reset = 0;
        #20 $stop;
    end
endmodule
