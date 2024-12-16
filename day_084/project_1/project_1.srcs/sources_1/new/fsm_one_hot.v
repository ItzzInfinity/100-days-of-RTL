`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/14/2024 11:28:23 AM
// Module Name: fsm_one_hot
//////////////////////////////////////////////////////////////////////////////////

module fsm_one_hot (
    input clk,reset,start,done_signal,   
    output reg [3:0] state 
);

    parameter IDLE    = 4'b0001,
              LOAD    = 4'b0010,
              PROCESS = 4'b0100,
              DONE    = 4'b1000;
              
    reg [3:0] next_state;

    // Sequential Block for State Transition
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE; 
        else
            state <= next_state;
    end
    // Combinational Block for Next State Logic
    always @(*) begin
        case (state)
            IDLE: 
                if (start) next_state = LOAD;
                else next_state = IDLE;

            LOAD: 
                next_state = PROCESS;

            PROCESS: 
                if (done_signal) next_state = DONE;
                else next_state = PROCESS;

            DONE: 
                next_state = IDLE;

            default: 
                next_state = IDLE; // Default to IDLE for safety
        endcase
    end
endmodule

