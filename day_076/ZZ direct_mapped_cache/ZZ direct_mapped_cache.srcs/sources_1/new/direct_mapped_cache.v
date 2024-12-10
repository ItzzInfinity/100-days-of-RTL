`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 
// Module Name: direct_mapped_cache
//////////////////////////////////////////////////////////////////////////////////



module direct_mapped_cache #(

    parameter DATA_WIDTH = 32,   // Data width (32-bit)
    parameter ADDR_WIDTH = 8,    // Address width (8-bit)
    parameter CACHE_SIZE = 16    // Cache size in terms of number of blocks (16 blocks)
)(
    input clk,                   // Clock signal
    input rst,                   // Reset signal
    input [ADDR_WIDTH-1:0] address, // Address from CPU
    input [DATA_WIDTH-1:0] write_data, // Data to be written
    input mem_write,             // Memory write signal
    input mem_read,              // Memory read signal
    output reg [DATA_WIDTH-1:0] read_data, // Data to CPU
    output reg hit               // Cache hit signal
);

    // Cache line structure
    reg [DATA_WIDTH-1:0] cache_data [CACHE_SIZE-1:0];   // Cache memory for storing data
    reg [ADDR_WIDTH-ADDR_WIDTH/2-1:0] tag_array [CACHE_SIZE-1:0]; // Tag array
    reg valid_array [CACHE_SIZE-1:0];                  // Valid bits

    wire [ADDR_WIDTH/2-1:0] index; // Cache index
    wire [ADDR_WIDTH-ADDR_WIDTH/2-1:0] tag; // Tag for comparison

    // Split address into index and tag
    assign index = address[ADDR_WIDTH/2-1:0];
    assign tag = address[ADDR_WIDTH-1:ADDR_WIDTH/2];

    // Reset logic
    integer i;
    always @(posedge rst) begin
        if (rst) begin
            for (i = 0; i < CACHE_SIZE; i = i + 1) begin
                valid_array[i] <= 0;
            end
        end
    end

    // Cache read/write logic
    always @(posedge clk) begin
        if (mem_read) begin
            // Check if the tag matches and the block is valid
            if (valid_array[index] && (tag_array[index] == tag)) begin
                read_data <= cache_data[index]; // Cache hit
                hit <= 1;
            end else begin
                read_data <= 0; // Cache miss
                hit <= 0;
            end
        end
        
        if (mem_write) begin
            // Write data into cache, update tag and valid bit
            cache_data[index] <= write_data;
            tag_array[index] <= tag;
            valid_array[index] <= 1;
        end
    end

endmodule
