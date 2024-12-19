`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/17/2024 10:58:43 AM
// Module Name: dual_port_ram
//////////////////////////////////////////////////////////////////////////////////

module dual_port_ram #(
    parameter DATA_WIDTH = 8,    
    parameter ADDR_WIDTH = 4     
) (
    input clk,                    
    input we_a,                   
    input we_b,                   
    input [ADDR_WIDTH-1:0] addr_a,
    input [ADDR_WIDTH-1:0] addr_b,
    input [DATA_WIDTH-1:0] data_a,
    input [DATA_WIDTH-1:0] data_b,
    output reg [DATA_WIDTH-1:0] q_a,
    output reg [DATA_WIDTH-1:0] q_b 
);

    // Memory declaration
    reg [DATA_WIDTH-1:0] ram [2**ADDR_WIDTH-1:0];

    // Port A operations
    always @(posedge clk) begin
        if (we_a) 
            ram[addr_a] <= data_a; 
        else
            q_a <= ram[addr_a];    
    end

    // Port B operations
    always @(posedge clk) begin
        if (we_b) 
            ram[addr_b] <= data_b; 
        else
            q_b <= ram[addr_b];    
    end

endmodule
