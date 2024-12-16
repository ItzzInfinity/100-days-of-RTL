`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/14/2024 11:29:19 AM
// Module Name: tb_fsm_one_hot
//////////////////////////////////////////////////////////////////////////////////

module tb_fsm_one_hot;

    reg clk;
    reg reset;
    reg start;
    reg done_signal;
    wire [3:0] state;

    fsm_one_hot DUT (
        .clk(clk),
        .reset(reset),
        .start(start),
        .done_signal(done_signal),
        .state(state)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end
    
    initial begin
        reset = 1; start = 0; done_signal = 0; #15;

        reset = 0; #10;

        start = 1; #10;

        start = 0; #20;

        done_signal = 1; #10;

        done_signal = 0; #20;

        $finish; 
    end

    initial begin
        $monitor("Time = %0t | Reset = %b | Start = %b | Done = %b | State = %b",
                 $time, reset, start, done_signal, state);
    end

endmodule
