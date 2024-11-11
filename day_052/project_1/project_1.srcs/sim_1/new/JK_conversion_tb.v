`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/12/2024 11:53:21 AM
// Module Name: JK_conversion_tb
//////////////////////////////////////////////////////////////////////////////////

module JK_conversion_tb;
    reg S, R, D, T, clk, reset;
    wire q_sr, q_d, q_t;

    JK_conversion DUT (.S(S),.R(R),.D(D),.T(T),.clk(clk),.reset(reset),.q_sr(q_sr),.q_d(q_d),.q_t(q_t));
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end
    initial begin
        S = 0; R = 0; D = 0; T = 0; reset = 1;
        #10 reset = 0;
        // Test SR flip-flop behavior
        #10 S = 1; R = 0;     
        #10 S = 0; R = 1;     
        #10 S = 0; R = 0;     
        #10 S = 1; R = 1;      // Invalid condition for SR flip-flop
    end
    initial begin
        // Test D flip-flop behavior
        #10 D = 1;             // output should set
        #10 D = 0;             // output should reset
    end
    initial begin
        // Test T flip-flop behavior
        #10 T = 1;           
        #30 T = 1;           
        #10 T = 0;           
    end
    initial begin
        // Reset the flip-flops and repeat
        #50 reset = 1;
        #10 reset = 0;
        // Test SR flip-flop behavior again
        #10 S = 1; R = 0;
        #10 S = 0; R = 1;
        #50 $stop;
    end
    initial begin
        $monitor("Time = %0t | S = %b, R = %b, D = %b, T = %b | q_sr = %b, q_d = %b, q_t = %b", 
                  $time, S, R, D, T, q_sr, q_d, q_t);
    end
endmodule
