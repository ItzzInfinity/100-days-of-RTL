`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/12/2024 10:34:56 AM
// Module Name: tb_digital_clock
//////////////////////////////////////////////////////////////////////////////////

module tb_digital_clock;

    reg clk;
    reg reset;
    wire [5:0] sec;
    wire [5:0] min;
    wire [4:0] hrs;

    digital_clock DUT (
        .clk(clk),.reset(reset),.sec(sec),.min(min),.hrs(hrs)
    );

    // Clock generation (1 Hz simulation)
    initial begin
        clk = 0;
        forever #500000000 clk = ~clk; // 1 Hz clock (500ms period)
    end

    initial begin
        reset = 1;
        #1000000000 reset = 0;

        #2000000000 $finish; 
    end

    initial begin
        $monitor("Time: %0t | Hours: %0d, Minutes: %0d, Seconds: %0d",
        $time, hrs, min, sec);
    end
endmodule

