`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/03/2024 12:10:26 AM
// Module Name: tb_freq_div_by2_5
//////////////////////////////////////////////////////////////////////////////////

module tb_freq_div_by2_5;
    reg clk;
    reg reset;
    wire clk_out;

    freq_div_by2_5 DUT (
        .clk(clk),
        .reset(reset),
        .clk_out(clk_out)
    );

    always #10 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        #25 reset = 0;
        #500;
        #25 reset = 1;
        #25 reset = 0;
        #500;
        $finish;
    end
    initial begin
        $monitor("Time = %0t | clk = %b | reset = %b | clk_out = %b", 
                 $time, clk, reset, clk_out);
    end
endmodule
