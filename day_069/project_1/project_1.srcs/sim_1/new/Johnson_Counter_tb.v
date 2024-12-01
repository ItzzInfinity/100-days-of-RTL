`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/29/2024 05:55:49 AM
// Module Name: Johnson_Counter_tb
//////////////////////////////////////////////////////////////////////////////////

module Johnson_Counter_tb;

    reg clk,reset;

    wire [3:0] q;

    Johnson_Counter DUT (
        .clk(clk),
        .q(q),
        .reset(reset)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        $monitor("Time = %0d, clk = %b, q = %b", $time, clk, q);
    end
    initial begin
        #10 reset = 1;
        #10 reset = 0;
        #100 $finish; 
    end

endmodule
