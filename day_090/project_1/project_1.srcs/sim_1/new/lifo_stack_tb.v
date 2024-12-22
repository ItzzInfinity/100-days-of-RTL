`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/20/2024 02:43:07 AM
// Module Name: lifo_stack_tb
//////////////////////////////////////////////////////////////////////////////////

module lifo_stack_tb;

    parameter DATA_WIDTH = 8;
    parameter STACK_DEPTH = 16;

    reg clk,reset, push, pop;
    reg [DATA_WIDTH-1:0] data_in;
    wire [DATA_WIDTH-1:0] data_out;
    wire full,empty;

    lifo_stack #(
        .DATA_WIDTH(DATA_WIDTH),
        .STACK_DEPTH(STACK_DEPTH)
    ) DUT (
        .clk(clk),.reset(reset),
        .push(push),.pop(pop),
        .data_in(data_in),.data_out(data_out),
        .full(full),.empty(empty)
    );

    initial clk = 0;
    always #5 clk = ~clk;
        integer i;
    initial begin
        $monitor("Time=%0t | push=%b, pop=%b, data_in=%d, data_out=%d, full=%b, empty=%b",
                 $time, push, pop, data_in, data_out, full, empty);

        reset = 1; push = 0; pop = 0; data_in = 0;
        #10 reset = 0;
        push = 1;
        
        for (i = 1; i <= 10; i = i + 1) begin   // Push data
            data_in = i;
            #10;
        end
        push = 0;

        pop = 1;
        #100;
        pop = 0;
        $finish;
    end
endmodule
