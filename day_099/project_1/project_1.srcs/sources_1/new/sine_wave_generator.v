`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/29/2024 09:25:52 AM
// Module Name: sine_wave_generator
//////////////////////////////////////////////////////////////////////////////////

module sine_wave_generator #(
    parameter PHASE_WIDTH = 10,    
    parameter DATA_WIDTH = 8      
) (
    input wire clk,               
    input wire reset,            
    input wire [PHASE_WIDTH-1:0] freq_control, 
    output reg [DATA_WIDTH-1:0] sine_out       
);

    reg [PHASE_WIDTH-1:0] phase_acc;

    // Sine LUT
    reg [DATA_WIDTH-1:0] sine_lut [0:(1<<PHASE_WIDTH)-1];
    integer i;
    // Initialize LUT with precomputed sine values
    initial begin

        for (i = 0; i < (1<<PHASE_WIDTH); i = i + 1) begin
            sine_lut[i] = $rtoi((2**(DATA_WIDTH-1)-1) * 
                        (1 + $sin(2 * 3.14159265359 * i / (1<<PHASE_WIDTH))));
        end
    end


    always @(posedge clk or posedge reset) begin
        if (reset) begin
            phase_acc <= 0;
        end else begin
            phase_acc <= phase_acc + freq_control; // Increment phase by frequency control
        end
    end

    always @(posedge clk) begin
        sine_out <= sine_lut[phase_acc[PHASE_WIDTH-1:0]];
    end

endmodule

