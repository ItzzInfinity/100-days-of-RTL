`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/13/2024 09:23:36 AM
// Module Name: stopwatch
//////////////////////////////////////////////////////////////////////////////////

module stopwatch (
    input clk,               // Clock input (1Hz)
    input reset_n,           // Active low reset
    input lap,               // LAP button
    output reg [5:0] sec,    
    output reg [5:0] min,    
    output reg [5:0] lap_sec, 
    output reg [5:0] lap_min 
);

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            sec <= 0;
            min <= 0;
            lap_sec <= 0;
            lap_min <= 0;
        end else begin
            if (sec == 59) begin
                sec <= 0;
                if (min == 59)
                    min <= 0;
                else
                    min <= min + 1;
            end else begin
                sec <= sec + 1;
            end
        end
    end
   always @(posedge lap or negedge reset_n) begin
        if (!reset_n) begin
            lap_sec <= 0;
            lap_min <= 0;
        end else begin
            lap_sec <= sec;
            lap_min <= min;
        end
    end

endmodule
