`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/12/2024 10:33:33 AM
// Module Name: digital_clock
//////////////////////////////////////////////////////////////////////////////////

module digital_clock (
    input clk,       // 1 Hz clock input
    input reset,     // Active high reset
    output reg [5:0] sec, 
    output reg [5:0] min, 
    output reg [4:0] hrs);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            sec <= 6'b0;  
            min <= 6'b0;  
            hrs <= 5'b0;  
        end else begin

            if (sec == 59) begin
                sec <= 0;
                if (min == 59) begin
                    min <= 0;
                    if (hrs == 23) begin
                        hrs <= 0; 
                    end else begin
                        hrs <= hrs + 1;
                    end
                end else begin
                    min <= min + 1;
                end
            end else begin
                sec <= sec + 1;
            end
        end
    end
endmodule
