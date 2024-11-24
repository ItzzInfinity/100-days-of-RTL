`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/25/2024 08:42:16 AM
// Module Name: mod_n_counter_tb
//////////////////////////////////////////////////////////////////////////////////

module mod_n_counter_tb;

    reg clk, reset;
    wire [3:0] q;  // Assuming n=10, q is 4 bits wide
    
    mod_n_counter #(10) DUT (
        .clk(clk),
        .reset(reset),
        .q(q)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    
    initial begin
        reset = 1;       
        #10 reset = 0;   

        #100;            
        reset = 1;       
        #10 reset = 0;

        #50 $stop;       
    end

    initial begin
        $monitor("Time = %0t | Reset = %b | Count = %d", $time, reset, q);
    end

endmodule

