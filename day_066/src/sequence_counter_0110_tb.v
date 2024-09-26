`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/26/2024 09:08:55 AM
// Module Name: sequence_counter_0110_tb
//////////////////////////////////////////////////////////////////////////////////

module sequence_counter_0110_tb;
    reg clk, reset, in;
    wire detected;

    sequence_counter_0110 DUT (
    .clk(clk),.reset(reset),.in(in),.detected(detected)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        
        reset = 1;
        in = 0;

        #10 reset = 0;      // Release reset

        // Apply test sequence: 01100110
        #10 in = 0;         // S1
        #10 in = 1;         // S2
        #10 in = 1;         // S3
        #10 in = 0;         // S4 (detected = 1)
        #10 in = 0;
        #10 in = 0;         
        #10 in = 1;         
        #10 in = 1;         
        #10 in = 1;         
        #10 in = 0;         

        #10 $stop;          
    end

    initial begin
        $monitor("Time: %0t | in = %b | detected = %b ", 
                  $time, in, detected);
    end
endmodule
