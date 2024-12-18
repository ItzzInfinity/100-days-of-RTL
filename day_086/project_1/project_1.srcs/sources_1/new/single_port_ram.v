`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/16/2024 10:19:35 AM
// Module Name: single_port_ram
//////////////////////////////////////////////////////////////////////////////////

module single_port_ram #(
    parameter DATA_WIDTH = 8,   
    parameter ADDR_WIDTH = 4   
)(
    input clk,                           
    input we,                            // Write enable
    input [ADDR_WIDTH-1:0] addr,         
    input [DATA_WIDTH-1:0] data_in,      
    output reg [DATA_WIDTH-1:0] data_out 
);

    reg [DATA_WIDTH-1:0] ram [2**ADDR_WIDTH-1:0];

    always @(posedge clk) begin
        if (we) begin
            ram[addr] <= data_in;
        end
        else begin
            data_out <= ram[addr];
        end
    end

endmodule
