`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/25/2024 11:14:18 AM
// Module Name: exponentiation
//////////////////////////////////////////////////////////////////////////////////

module exponentiation #(parameter DATA_WIDTH = 8) (
    input clk,
    input reset,
    input start,
    input [DATA_WIDTH-1:0] base,
    input [DATA_WIDTH-1:0] exponent,
    output reg [DATA_WIDTH*2-1:0] result,
    output reg done
);

    reg [DATA_WIDTH-1:0] counter;
    reg [1:0] state;
    reg [DATA_WIDTH*2-1:0] temp_result;

    // FSM States
    localparam IDLE = 2'b00,
               COMPUTE = 2'b01,
               DONE = 2'b10;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            result <= 0;
            temp_result <= 1;
            counter <= 0;
            done <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (start) begin
                        state <= COMPUTE;
                        temp_result <= 1;
                        counter <= 0;
                        done <= 0;
                    end
                end

                COMPUTE: begin
                    if (counter < exponent) begin
                        temp_result <= temp_result * base;
                        counter <= counter + 1;
                    end else begin
                        result <= temp_result;
                        state <= DONE;
                    end
                end

                DONE: begin
                    done <= 1;
                    if (!start) state <= IDLE;  // Wait for new start signal
                end
            endcase
        end
    end

endmodule

