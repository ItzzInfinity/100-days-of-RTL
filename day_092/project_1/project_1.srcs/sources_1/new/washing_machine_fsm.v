`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: ANjan Prasad
// Create Date: 12/22/2024 04:56:57 AM
// Module Name: washing_machine_fsm
//////////////////////////////////////////////////////////////////////////////////

module washing_machine_fsm (
    input clk,
    input rst_n,        // Active low reset
    input start,        
    input door_closed,  
    input water_level,cycle_complete, 
    output reg [2:0] state, 
    output reg motor_on,    
    output reg water_valve, 
    output reg drain_valve, 
    output reg buzzer       
);

    localparam IDLE        = 3'b000;
    localparam FILL_WATER  = 3'b001;
    localparam WASH        = 3'b010;
    localparam RINSE       = 3'b011;
    localparam SPIN        = 3'b100;
    localparam DRAIN_WATER = 3'b101;
    localparam END         = 3'b110;
    localparam ERROR       = 3'b111;

    reg [2:0] next_state;

    // State transition logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        next_state = state;
        case (state)
            IDLE: begin
                if (start && door_closed)
                    next_state = FILL_WATER;
                else if (start && !door_closed)
                    next_state = ERROR;
            end

            FILL_WATER: begin
                if (!door_closed)
                    next_state = ERROR;
                else if (water_level)
                    next_state = WASH;
            end

            WASH: begin
                if (!door_closed)
                    next_state = ERROR;
                else if (cycle_complete)
                    next_state = RINSE;
            end

            RINSE: begin
                if (!door_closed)
                    next_state = ERROR;
                else if (cycle_complete)
                    next_state = SPIN;
            end

            SPIN: begin
                if (!door_closed)
                    next_state = ERROR;
                else if (cycle_complete)
                    next_state = DRAIN_WATER;
            end

            DRAIN_WATER: begin
                if (!door_closed)
                    next_state = ERROR;
                else if (cycle_complete)
                    next_state = END;
            end

            END: begin
                if (!start)
                    next_state = IDLE;
            end

            ERROR: begin
                if (!start)
                    next_state = IDLE;
            end

            default: next_state = IDLE;
        endcase
    end

    // Output logic
    always @(*) begin
        // Default values
        motor_on = 0;
        water_valve = 0;
        drain_valve = 0;
        buzzer = 0;

        case (state)
            FILL_WATER: water_valve = 1;
            WASH: motor_on = 1;
            RINSE: motor_on = 1;
            SPIN: motor_on = 1;
            DRAIN_WATER: drain_valve = 1;
            END: buzzer = 1;
            ERROR: buzzer = 1;
        endcase
    end
endmodule

