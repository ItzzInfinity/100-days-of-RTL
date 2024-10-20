`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/21/2024 06:13:39 AM
// Module Name: demux_32_to_1
//////////////////////////////////////////////////////////////////////////////////


module demux_32_to_1(
    input wire [4:0] sel, 
    input wire din,       
    output reg [31:0] dout 
);
    always @(*) begin
        dout = 32'b0;      
        dout[sel] = din;   
    end
endmodule
