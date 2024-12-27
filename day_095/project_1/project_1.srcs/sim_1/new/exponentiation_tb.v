`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/25/2024 11:15:17 AM
// Module Name: exponentiation_tb
//////////////////////////////////////////////////////////////////////////////////


module exponentiation_tb;

    parameter DATA_WIDTH = 8;

    reg clk;
    reg reset;
    reg start;
    reg [DATA_WIDTH-1:0] base;
    reg [DATA_WIDTH-1:0] exponent;
    wire [DATA_WIDTH*2-1:0] result;
    wire done;

    exponentiation #(DATA_WIDTH) DUT (
        .clk(clk),
        .reset(reset),
        .start(start),
        .base(base),
        .exponent(exponent),
        .result(result),
        .done(done)
    );

    // Clock Generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        start = 0;
        base = 0;
        exponent = 0;

        // Reset
        #10 reset = 0;

        // Test Case 1: 3^4 = 81
        #10 start = 1; base = 3; exponent = 4;
        #10 start = 0;
        wait(done);
        #10;

        // Test Case 2: 5^3 = 125
        #10 start = 1; base = 5; exponent = 3;
        #10 start = 0;
        wait(done);
        #10;

        // Test Case 3: 2^0 = 1
        #10 start = 1; base = 2; exponent = 0;
        #10 start = 0;
        wait(done);
        #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | start=%b | base=%d | exponent=%d | result=%d | done=%b", 
                  $time, start, base, exponent, result, done);
    end

endmodule
