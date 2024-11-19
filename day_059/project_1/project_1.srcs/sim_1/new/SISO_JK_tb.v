`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/19/2024 07:36:50 AM
// Module Name: SISO_JK_tb
//////////////////////////////////////////////////////////////////////////////////


module SISO_JK_tb;
    reg serial_in, clk, reset;
    wire serial_out;


    SISO_JK DUT(.serial_in(serial_in), .clk(clk), .reset(reset), .serial_out(serial_out));

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin

        reset = 1;
        serial_in = 0;
        #10 reset = 0; 

        // Shift in a sequence of bits (e.g., 1011)
        #10 serial_in = 1;  
        #10 serial_in = 0;  
        #10 serial_in = 1;  
        #10 serial_in = 1;  


        #40;
        $stop;
    end
endmodule

