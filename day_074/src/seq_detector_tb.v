`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer : Anjan Prasad
// Create Date: 12/04/2024 08:22:44 AM
// Module Name: seq_detector_tb
//////////////////////////////////////////////////////////////////////////////////

module seq_detector_tb;
    reg clk;
    reg reset;
    reg in;

    wire detected_0110;
    wire detected_0111;

    seq_detector DUT (
        .clk(clk),
        .reset(reset),
        .in(in),
        .detected_0110(detected_0110),
        .detected_0111(detected_0111)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end

    initial begin

        reset = 1;
        in = 0;

        #10 reset = 0;

        #10 in = 0;  // Starting with 0
        #10 in = 1;  // 01
        #10 in = 1;  // 011
        #10 in = 0;  // 0110 (should detect sequence 0110)
        #10 in = 0;  
        #10 in = 1;  // 01
        #10 in = 1;  // 011
        #10 in = 1;  // 0111 (should detect sequence 0111)
        #10 in = 0;  
        
        #10 in = 1;  // Unmatched sequence
        #10 in = 0;  // 0
        #10 in = 1;  // 01
        #10 in = 1;  // 011
        #10 in = 0;  // 0110 (should detect again)
        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | Reset=%b | In=%b | Det_0110=%b | Det_0111=%b", 
                 $time, reset, in, detected_0110, detected_0111);
    end
endmodule

