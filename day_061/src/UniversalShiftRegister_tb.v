`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/21/2024 09:01:48 AM
// Module Name: UniversalShiftRegister_tb
//////////////////////////////////////////////////////////////////////////////////
module UniversalShiftRegister_tb;

    reg [3:0] data_in;
    reg clk, reset, shift_in_left, shift_in_right;
    reg [1:0] mode;
    wire [3:0] data_out;

    UniversalShiftRegister UUT (
        .data_in(data_in),.clk(clk),.reset(reset),.shift_in_left(shift_in_left),.shift_in_right(shift_in_right),.mode(mode),.data_out(data_out)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    initial begin
        // Initialize inputs
        reset = 1; shift_in_left = 0; shift_in_right = 0; data_in = 4'b1010; mode = 2'b00;
        // Reset the register
        #10 reset = 0;
        // Parallel load
        mode = 2'b11; #10;
        // Shift Right
        mode = 2'b01; shift_in_right = 1; #40;
        // Shift Left
        mode = 2'b10; shift_in_left = 1; #40;
        // Hold
        mode = 2'b00; #20;
        $stop;
    end

endmodule

