`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/14/2024 04:18:18 AM
// Module Name: T_conversion_tb
//////////////////////////////////////////////////////////////////////////////////

module T_conversion_tb;
    reg S, R, J, K, D, clk, reset;
    wire q_sr, q_jk, q_d;

    T_conversion uut (.S(S), .R(R), .J(J), .K(K), .D(D),.clk(clk), .reset(reset),.q_sr(q_sr), .q_jk(q_jk), .q_d(q_d));
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end
    initial begin
        reset = 1;
        #10 reset = 0; // Release reset after 10 ns
    end
    initial begin
        S = 0; R = 0;
        #20 S = 1; R = 0;  // Set condition
        #20 S = 0; R = 1;  // Reset condition
        #20 S = 1; R = 1;  // Invalid condition
        #20 S = 0; R = 0;  // Hold condition
    end
    initial begin
        J = 0; K = 0;
        #20 J = 1; K = 0;  // Set condition
        #20 J = 0; K = 1;  // Reset condition
        #20 J = 1; K = 1;  // Toggle condition
        #20 J = 0; K = 0;  // Hold condition
    end

    initial begin
        D = 0;
        #20 D = 1;         // Set D to 1
        #20 D = 0;         // Set D to 0
        #20 D = 1;         // Set D to 1 again
    end
    initial begin
        $monitor("Time = %0d | S = %b, R = %b, q_sr = %b | J = %b, K = %b, q_jk = %b | D = %b, q_d = %b", 
                  $time, S, R, q_sr, J, K, q_jk, D, q_d);
    end
    initial begin
        #100 $stop;
    end
endmodule

