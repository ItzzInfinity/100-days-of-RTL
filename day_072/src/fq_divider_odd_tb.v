`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/02/2024 11:38:20 AM
// Module Name: fq_divider_odd_tb
//////////////////////////////////////////////////////////////////////////////////


module fq_divider_odd_tb;
    reg clk;
    reg reset;
    wire clk_out;

    fq_divider_odd DUT (
        .clk(clk),
        .reset(reset),
        .clk_out(clk_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1; 
        #10 reset = 0; 

        #120; 
        $stop;
    end
endmodule
