`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/11/2024 06:29:36 AM
// Module Name: SR_conversion_tb
//////////////////////////////////////////////////////////////////////////////////
module SR_conversion_tb;
    reg J, K, D, T, clk, reset;
    wire q_jk, q_d, q_t;

    SR_conversion DUT (.J(J),.K(K),.D(D),.T(T),.clk(clk),.reset(reset),.q_jk(q_jk),.q_d(q_d),.q_t(q_t));
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end
    initial begin
        reset = 1; J = 0; K = 0; D = 0; T = 0;
        #10 reset = 1;
        #10 reset = 0; 
        // Test JK Flip-Flop
        $display("Testing JK Flip-Flop");
        J = 0; K = 0; #10; // Hold
        J = 1; K = 0; #10; // Set
        J = 0; K = 1; #10; // Reset
        J = 1; K = 1; #10; // Toggle
        $display("q_jk: %b", q_jk);
        #20 $stop;
    end
    initial begin
        // Test D Flip-Flop
        $display("Testing D Flip-Flop");
        D = 0; #30; // Set D to 0
        D = 1; #10; // Set D to 1
        D = 0; #10; // Set D back to 0
        $display("q_d: %b", q_d);
        #20 $stop;
    end
    initial begin
        // Test T Flip-Flop
        $display("Testing T Flip-Flop");
        T = 0; #10; // Hold
        T = 1; #10; // Toggle
        T = 1; #10; // Toggle again
        $display("q_t: %b", q_t);

        // Final hold state
        $display("Final States - q_jk: %b, q_d: %b, q_t: %b", q_jk, q_d, q_t);
        #20 $stop;
    end
endmodule

/* to check the SR FF */

//module SR_conversion_tb;
//    reg S, R, clk, reset;
//    wire Q;

//    // Instantiate the SR_flipflop module
//    SR_flipflop uut (
//        .S(S),
//        .R(R),
//        .clk(clk),
//        .reset(reset),
//        .Q(Q)
//    );

//    // Clock generation
//    initial begin
//        clk = 0;
//        forever #5 clk = ~clk; // 10ns clock period
//    end

//    // Test sequence
//    initial begin
//        // Initialize inputs
//        reset = 1; S = 0; R = 0;

//        // Apply reset
//        #10 reset = 0; // Release reset
        
//        // Test Set condition
//        S = 1; R = 0;
//        #10;
//        $display("Set: Q = %b", Q);

//        // Test Reset condition
//        S = 0; R = 1;
//        #10;
//        $display("Reset: Q = %b", Q);

//        // Test hold condition (S = 0, R = 0)
//        S = 0; R = 0;
//        #10;
//        $display("Hold: Q = %b", Q);

//        // Test invalid condition (S = 1, R = 1)
//        S = 1; R = 1;
//        #10;
//        $display("Invalid (S=1, R=1): Q = %b", Q);

//        // Finalize test
//        $display("Final Q: %b", Q);
//        #20 $stop;
//    end
//endmodule

