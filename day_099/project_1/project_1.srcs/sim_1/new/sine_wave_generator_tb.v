`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/29/2024 09:27:51 AM
// Module Name: sine_wave_generator_tb
//////////////////////////////////////////////////////////////////////////////////

module sine_wave_generator_tb;

    parameter PHASE_WIDTH = 10;
    parameter DATA_WIDTH = 8;

    reg clk;
    reg reset;
    reg [PHASE_WIDTH-1:0] freq_control;
    wire [DATA_WIDTH-1:0] sine_out;

    
    sine_wave_generator #(.PHASE_WIDTH(PHASE_WIDTH), .DATA_WIDTH(DATA_WIDTH)) DUT (
        .clk(clk),
        .reset(reset),
        .freq_control(freq_control),
        .sine_out(sine_out)
    );

    always #5 clk = ~clk;

    initial begin
        
        clk = 0;
        reset = 1;
        freq_control = 0;
       
        #10 reset = 0;
        
        #10 freq_control = 10;

        #1000 $stop;
    end

    initial begin
        $monitor("Time=%0t | freq_control=%d | sine_out=%d", $time, freq_control, sine_out);
    end

endmodule

