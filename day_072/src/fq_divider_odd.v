`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/02/2024 11:33:31 AM
// Module Name: fq_divider_odd
//////////////////////////////////////////////////////////////////////////////////

module fq_divider_odd(
    input clk,       
    input reset,     
    output reg clk_out 
);
    reg [1:0] counter; 

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 2'b00;
            clk_out <= 1'b0;
        end else begin
            if (counter == 2'b10) begin
                counter <= 2'b00;       // Reset counter after 3 cycles
                clk_out <= ~clk_out;   // Toggle output clock
            end else begin
                counter <= counter + 1; 
            end
        end
    end
endmodule
