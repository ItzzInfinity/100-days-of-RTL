`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/31/2024 08:08:42 AM
// Module Name: monostable_multivibrator
//////////////////////////////////////////////////////////////////////////////////


module monostable_multivibrator(
    input clk,          // Clock signal
    input rst,          // Reset signal
    input trigger,      // Trigger input
    output reg out      // Output pulse
);
    
    reg [31:0] counter;  // Counter for pulse duration
    reg pulse_active;    // Flag to check if the pulse is active

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            out <= 0;
            pulse_active <= 0;
        end
        else if (trigger && !pulse_active) begin
            pulse_active <= 1;
            counter <= 0;
            out <= 1;
        end
        else if (pulse_active) begin
            if (counter == 20) begin   // Duration of the pulse
                pulse_active <= 0;
                out <= 0;
            end
            else begin
                counter <= counter + 1;
            end
        end
    end
endmodule
