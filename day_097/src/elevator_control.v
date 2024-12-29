`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/27/2024 09:40:53 AM
// Module Name: elevator_control
//////////////////////////////////////////////////////////////////////////////////

module elevator_control(
    input clk,
    input reset,
    input [3:0] floor_request, // Requested floor (1 to 4)
    input emergency_stop,      
    output reg [1:0] state,    
    output reg [1:0] current_floor, 
    output reg door_open        
);

    localparam IDLE       = 2'b00,
               MOVING_UP  = 2'b01,
               MOVING_DOWN = 2'b10,
               DOOR_OPEN  = 2'b11;

    reg [3:0] target_floor; // Holds the requested floor

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            current_floor <= 2'b01; // Assume starting at floor 1
            door_open <= 0;
            target_floor <= 4'b0;
        end else if (emergency_stop) begin
            state <= IDLE;
            door_open <= 1;
        end else begin
            case (state)
                IDLE: begin
                    if (floor_request != current_floor) begin
                        target_floor <= floor_request;
                        if (floor_request > current_floor)
                            state <= MOVING_UP;
                        else
                            state <= MOVING_DOWN;
                    end
                end
                MOVING_UP: begin
                    if (current_floor == target_floor) begin
                        state <= DOOR_OPEN;
                        door_open <= 1;
                    end else begin
                        current_floor <= current_floor + 1;
                    end
                end
                MOVING_DOWN: begin
                    if (current_floor == target_floor) begin
                        state <= DOOR_OPEN;
                        door_open <= 1;
                    end else begin
                        current_floor <= current_floor - 1;
                    end
                end
                DOOR_OPEN: begin
                    door_open <= 0;
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule






























