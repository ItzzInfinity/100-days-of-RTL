`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/20/2024 02:41:29 AM
// Module Name: lifo_stack
//////////////////////////////////////////////////////////////////////////////////

module lifo_stack #(
    parameter DATA_WIDTH = 8,
    parameter STACK_DEPTH = 16
)(
    input clk,reset,push,  pop,       
    input [DATA_WIDTH-1:0] data_in, 
    output reg [DATA_WIDTH-1:0] data_out, 
    output reg full, empty    
);

    reg [DATA_WIDTH-1:0] stack_mem [0:STACK_DEPTH-1];
    reg [$clog2(STACK_DEPTH):0] sp; 

    initial begin
        full = 0;
        empty = 1;
        sp = 0;
    end    

    always @(posedge clk or posedge reset) begin  // Push and Pop operations
        if (reset) begin         // Reset the stack
            sp <= 0; 
            full <= 0; 
            empty <= 1;
        end else begin

            if (push && !full) begin             // Push operation
                stack_mem[sp] <= data_in;
                sp <= sp + 1;
                empty <= 0;
                if (sp == STACK_DEPTH - 1)
                    full <= 1;
            end else if (pop && !empty) begin   // Pop operation

                sp <= sp - 1;
                data_out <= stack_mem[sp - 1];
                full <= 0;
                if (sp == 1)
                    empty <= 1;
            end
        end
    end
endmodule
