`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/13/2024 05:52:13 AM
// Module Name: D_conversion_tb
//////////////////////////////////////////////////////////////////////////////////

module D_conversion_tb;
    reg S, R, J, K, T, clk, reset;
    wire q_sr, q_jk, q_t;

    D_conversion DUT (.S(S),.R(R),.J(J),.K(K),.T(T),.clk(clk),.reset(reset),.q_sr(q_sr),.q_jk(q_jk),.q_t(q_t));

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end
    initial begin

        S = 0; R = 0; J = 0; K = 0; T = 0; reset = 1;
        #10 reset = 0;
        // Test SR Flip-Flop
        #10 S = 1; R = 0; // Set
        #10 S = 0; R = 1; // Reset
        #10 S = 0; R = 0; // Hold
        #10 S = 1; R = 1; // Invalid (both set and reset)
        #10 S = 0; R = 1; 
    end
    initial begin
        // Test JK Flip-Flop
        #20 S = 0; R = 0; // Disable SR inputs
        J = 1; K = 0;     // Set
        #10 J = 0; K = 1; // Reset
        #10 J = 1; K = 1; // Toggle
        #10 J = 0; K = 0; // Hold
        #50 $stop;
    end
    initial begin
        // Test T Flip-Flop
        #20 J = 0; K = 0; // Disable JK inputs
        T = 1;            // Toggle
        #10 T = 0;        // Hold
        #10 T = 1;        // Toggle again
    end
endmodule

