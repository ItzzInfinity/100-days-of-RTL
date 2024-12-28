`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/26/2024 08:21:46 AM
// Module Name: car_parking_system
//////////////////////////////////////////////////////////////////////////////////

module car_parking_system #(
    parameter MAX_CAPACITY = 10 
) (
    input clk,            
    input reset,          
    input entry_sensor,   // Sensor for car entry
    input exit_sensor,    // Sensor for car exit
    output reg [3:0] car_count, 
    output parking_full   
);

    // Parking full signal
    assign parking_full = (car_count >= MAX_CAPACITY);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            car_count <= 0; 
        end else begin
            // Car entering
            if (entry_sensor && !parking_full) begin
                car_count <= car_count + 1;
            end
            // Car exiting
            if (exit_sensor && car_count > 0) begin
                car_count <= car_count - 1;
            end
        end
    end

endmodule
