`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/18/2024 05:28:19 AM
// Module Name: PIPO_tb
//////////////////////////////////////////////////////////////////////////////////


module PIPO_tb;
reg clk, reset;
reg [3:0] parallel_in;
wire [3:0] parallel_out;

PIPO DUT(clk, reset, parallel_in, parallel_out);

initial begin
    clk=1'b0;
    forever #5 clk=~clk;
    end
    
 initial begin
    reset= 1'b1;
    parallel_in= 4'b0000;
    #10 reset= 1'b0;
    end
    
    always #10 parallel_in= $random;
    
 initial begin
    $monitor("\t\t clk: %d  reset: %d  parallel_in: %b  parallel_out: %b", clk, reset, parallel_in, parallel_out);
    #100 $finish;
    end
endmodule
