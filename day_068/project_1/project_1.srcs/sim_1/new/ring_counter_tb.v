`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/28/2024 04:45:04 AM
// Module Name: ring_counter_tb
//////////////////////////////////////////////////////////////////////////////////

module ring_counter_tb;
parameter N=8;

reg clk, reset;
wire [N-1:0] counter;

ring_counter DUT(clk, reset, counter);

initial begin
    clk= 1'b0;
    forever #5 clk= ~clk;
    end

initial begin 
    reset = 1;
    #10;
    reset = 0;
    end

initial begin
    $monitor("\t\t counter: %d", counter);
    #90 $finish;
end
endmodule
