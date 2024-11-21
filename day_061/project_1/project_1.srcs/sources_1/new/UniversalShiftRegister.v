`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/21/2024 08:55:45 AM
// Module Name: UniversalShiftRegister
//////////////////////////////////////////////////////////////////////////////////


module UniversalShiftRegister (
    input wire [3:0] data_in,       
    input wire clk, reset,          
    input wire shift_in_left,       
    input wire shift_in_right,      
    input wire [1:0] mode,          // Mode select: 00-Hold, 01-Shift Right, 10-Shift Left, 11-Parallel Load
    output wire [3:0] data_out     
);

    wire [3:0] mux_out;             // Outputs of the multiplexers
    wire [3:0] q;                   // Outputs of the D flip-flops

    Mux4to1 mux0 (.in0(q[0]), .in1(shift_in_right), .in2(q[1]), .in3(data_in[0]), .sel(mode), .out(mux_out[0]));
    Mux4to1 mux1 (.in0(q[1]), .in1(q[0]), .in2(q[2]), .in3(data_in[1]), .sel(mode), .out(mux_out[1]));
    Mux4to1 mux2 (.in0(q[2]), .in1(q[1]), .in2(q[3]), .in3(data_in[2]), .sel(mode), .out(mux_out[2]));
    Mux4to1 mux3 (.in0(q[3]), .in1(q[2]), .in2(shift_in_left), .in3(data_in[3]), .sel(mode), .out(mux_out[3]));

    D_FF dff0 (.d(mux_out[0]), .clk(clk), .reset(reset), .q(q[0]));
    D_FF dff1 (.d(mux_out[1]), .clk(clk), .reset(reset), .q(q[1]));
    D_FF dff2 (.d(mux_out[2]), .clk(clk), .reset(reset), .q(q[2]));
    D_FF dff3 (.d(mux_out[3]), .clk(clk), .reset(reset), .q(q[3]));

    assign data_out = q;            

endmodule
