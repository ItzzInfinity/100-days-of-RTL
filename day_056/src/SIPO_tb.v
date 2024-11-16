`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/16/2024 11:00:34 PM
// Module Name: SIPO_tb
//////////////////////////////////////////////////////////////////////////////////
module SIPO_tb;
 reg clk, reset, Din;
    wire Qa,Qb,Qc,Qd;

    SIPO DUT (
        .clk(clk),.reset(reset),.Din(Din),.Qa(Qa),.Qb(Qb),.Qc(Qc),.Qd(Qd)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns period
    end
    initial begin
        reset = 1;
        Din = 0;
        #10 reset = 0;
        #10 Din = 1; // Input '1' -> expect serial_out = 0 after 4 cycles
        #10 Din = 0;
        #10 Din = 1;
        #10 Din = 1;
        #10 Din = 0;
        #10 Din = 1;
        #10 Din = 0;
        #50;
        reset = 1;
        #10 reset = 0;
        #20 $stop;
    end
endmodule
