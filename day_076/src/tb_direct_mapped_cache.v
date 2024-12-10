`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date:     
// Module Name: tb_direct_mapped_cache
//////////////////////////////////////////////////////////////////////////////////


module tb_direct_mapped_cache();

    // Parameters
    parameter DATA_WIDTH = 32;
    parameter ADDR_WIDTH = 8;
    parameter CACHE_SIZE = 16;

    // Inputs and Outputs for the cache
    reg clk, rst;
    reg [ADDR_WIDTH-1:0] address;
    reg [DATA_WIDTH-1:0] write_data;
    reg mem_write, mem_read;
    wire [DATA_WIDTH-1:0] read_data;
    wire hit;


    direct_mapped_cache #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH),
        .CACHE_SIZE(CACHE_SIZE)
    ) DUT (
        .clk(clk),
        .rst(rst),
        .address(address),
        .write_data(write_data),
        .mem_write(mem_write),
        .mem_read(mem_read),
        .read_data(read_data),
        .hit(hit)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Clock period is 10 units
    end

    // Test procedure
    initial begin
        // Initialize Inputs
        rst = 1;
        address = 0;
        write_data = 0;
        mem_write = 0;
        mem_read = 0;

        // Reset the system
        #10;
        rst = 0;

        // Test Case 1: Write to cache and then read from it
        // Write data 0x12345678 at address 8
        address = 8;
        write_data = 32'h12345678;
        mem_write = 1;
        #10;
        mem_write = 0;

        // Read from address 8 and expect a cache hit
        mem_read = 1;
        address = 8;
        #10;
        if (read_data == 32'h12345678 && hit) 
            $display("Test Case 1 Passed: Cache Hit and Correct Data");
        else 
            $display("Test Case 1 Failed: Cache Miss or Incorrect Data");

        mem_read = 0;

        // Test Case 2: Read from address 4 (should be a miss)
        address = 4;
        mem_read = 1;
        #10;
        if (!hit) 
            $display("Test Case 2 Passed: Cache Miss");
        else 
            $display("Test Case 2 Failed: Cache Hit Unexpected");

        mem_read = 0;

        // Test Case 3: Write new data and verify cache update
        address = 8;
        write_data = 32'hDEADBEEF;
        mem_write = 1;
        #10;
        mem_write = 0;

        // Read back the updated data from address 8
        mem_read = 1;
        #10;
        if (read_data == 32'hDEADBEEF && hit) 
            $display("Test Case 3 Passed: Cache Updated and Hit");
        else 
            $display("Test Case 3 Failed: Cache Not Updated Correctly");

        mem_read = 0;

        // End simulation
        $stop;
    end

endmodule
