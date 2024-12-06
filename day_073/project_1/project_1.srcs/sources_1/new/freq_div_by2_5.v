`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/03/2024 12:05:02 AM
// Module Name: freq_div_by2_5
//////////////////////////////////////////////////////////////////////////////////

module freq_div_by2_5 (
    input clk,       
    input reset,     
    output reg clk_out 
);
    reg [1:0] counter;  
    reg [1:0] accumulator; // Accumulator for fractional part

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;
            accumulator <= 0;
            clk_out <= 0;
        end else begin
            accumulator <= accumulator + 2; // Add fractional part (0.5 = 2 in 4-scale)
            if (accumulator >= 4) begin
                accumulator <= accumulator - 4; // Reset accumulator after a full count
                counter <= counter + 1;        // Add extra cycle
            end

            if (counter == 1) begin
                counter <= 0;         // Toggle every 2.5 cycles
                clk_out <= ~clk_out; // Toggle clk_out
            end else begin
                counter <= counter + 1;
            end
        end
    end
endmodule
