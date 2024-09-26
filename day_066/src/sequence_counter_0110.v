`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/26/2024 08:51:42 AM
// Module Name: sequence_counter_0110
//////////////////////////////////////////////////////////////////////////////////

module sequence_counter_0110(
    input clk,          // Clock signal
    input reset,        // Active high reset
    input in,           // Serial input
    output reg detected // High when sequence 0110 is detected
);
    // State encoding as parameters
    localparam S0 = 3'b000, // Initial state
               S1 = 3'b001, // Detected '0'
               S2 = 3'b010, // Detected '01'
               S3 = 3'b011, // Detected '011'
               S4 = 3'b100; // Detected '0110'

    reg [2:0] current_state, next_state;

    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0; // Reset to initial state
        else
            current_state <= next_state;
    end
    always @(*) begin
        // Default assignments
        next_state = current_state;
        detected = 1'b0;

        case (current_state)
            S0: if (in == 1'b0) next_state = S1; // Transition to S1 on '0'
            S1: if (in == 1'b1) next_state = S2; // Transition to S2 on '1'
                else next_state = S1;            // Stay in S1 on '0'
            S2: if (in == 1'b1) next_state = S3; // Transition to S3 on '1'
                else next_state = S0;            // Back to S0 on '0'
            S3: if (in == 1'b0) next_state = S4; // Transition to S4 on '0'
                else next_state = S2;            // Back to S2 on '1'
            S4: begin
                detected = 1'b1;                 // Sequence detected
                if (in == 1'b0) next_state = S1; // Allow overlapping detection
                else next_state = S2;
            end
            default: next_state = S0;            // Default state
        endcase
    end
endmodule


