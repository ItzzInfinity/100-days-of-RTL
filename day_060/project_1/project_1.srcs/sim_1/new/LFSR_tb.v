`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/20/2024 08:31:43 AM
// Module Name: LFSR_tb
//////////////////////////////////////////////////////////////////////////////////


module LFSR_tb;
    reg clk, reset;
    wire [7:0] lfsr_out;

    // Instantiate the LFSR module
    LFSR DUT(.clk(clk), .reset(reset), .lfsr_out(lfsr_out));

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 ns clock period
    end

    // Test stimulus
    initial begin
        reset = 1;  // Apply reset
        #10 reset = 0;  // Release reset

        // Observe the output over several clock cycles
        #200;
        $stop;
    end

    // Monitor for debugging
    initial begin
        $monitor("Time: %0dns, LFSR Output: %b", $time, lfsr_out);
    end
endmodule

