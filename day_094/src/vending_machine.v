`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/24/2024 12:10:52 AM
// Module Name: vending_machine
//////////////////////////////////////////////////////////////////////////////////

module vending_machine (
    input clk,reset,select_item,         
    input [1:0] coin,     // Input coin: 2'b01 for 1 unit, 2'b10 for 2 units
    output reg dispense,  
    output reg [3:0] change 
);

    parameter IDLE      = 3'b000,
              ONE_UNIT  = 3'b001,
              TWO_UNITS = 3'b010,
              ITEM_READY = 3'b011,
              DISPENSE  = 3'b100;

    reg [2:0] current_state, next_state;
    reg [3:0] amount; // Tracks the inserted amount

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= IDLE;
            amount <= 0;
        end else begin
            current_state <= next_state;
        end
    end

    always @(*) begin
        next_state = current_state;
        dispense = 0;
        change = 0;

        case (current_state)
            IDLE: begin
                if (coin == 2'b01) begin
                    next_state = ONE_UNIT;
                end else if (coin == 2'b10) begin
                    next_state = TWO_UNITS;
                end
            end
            ONE_UNIT: begin
                if (coin == 2'b01) begin
                    next_state = ITEM_READY;
                end else if (coin == 2'b10) begin
                    next_state = DISPENSE;
                end
            end
            TWO_UNITS: begin
                if (coin == 2'b01) begin
                    next_state = DISPENSE;
                end else if (coin == 2'b10) begin
                    next_state = DISPENSE;
                end
            end
            ITEM_READY: begin
                if (select_item) begin
                    next_state = DISPENSE;
                end
            end
            DISPENSE: begin
                dispense = 1;
                change = (amount > 2) ? amount - 2 : 0; // Calculate change
                next_state = IDLE;
            end
            default: next_state = IDLE;
        endcase
    end
    
    always @(posedge clk or posedge reset) begin  // Update Amount Logic
        if (reset) begin
            amount <= 0;
        end else begin
            case (current_state)
                IDLE: begin
                    if (coin == 2'b01) amount <= amount + 1;
                    else if (coin == 2'b10) amount <= amount + 2;
                end

                ONE_UNIT: begin
                    if (coin == 2'b01) amount <= amount + 1;
                    else if (coin == 2'b10) amount <= amount + 2;
                end

                TWO_UNITS: begin
                    if (coin == 2'b01) amount <= amount + 1;
                    else if (coin == 2'b10) amount <= amount + 2;
                end

                DISPENSE: amount <= 0;

                default: amount <= amount;
            endcase
        end
    end
endmodule
