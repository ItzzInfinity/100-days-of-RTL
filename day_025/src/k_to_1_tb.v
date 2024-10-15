`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/16/2024 07:00:13 AM
// Module Name: k_to_1_tb
//////////////////////////////////////////////////////////////////////////////////

//module k_to_1_tb;
//  reg [63:0] a;
//  reg [6:0] sel;     
//  wire y;             
//  k_to_1_mux #(64) uut (
//    .a(a),
//    .sel(sel),
//    .y(y)
//  );

//  initial begin
//    a = 64'h0;  
//    #10;
//    a = 64'hF0F0F0F0F0F0F0F0;  // Sample input pattern
//    for (sel = 0; sel < 64; sel = sel + 1) begin
//      #10; 
//      $display("sel = %d, y = %b", sel, y);
//    end
//    $finish;
//  end
//endmodule




/*      16 x 16 Register File       */
//module tb_register_file;
//module k_to_1_tb;
//    reg clk;               // Clock signal
//    reg we;                // Write enable
//    reg [3:0] read_addr1;   // Address for first read operation
//    reg [3:0] read_addr2;   // Address for second read operation
//    reg [3:0] write_addr;   // Address for write operation
//    reg [15:0] write_data;  // Data to be written
//    wire [15:0] read_data1; // Output of first read operation
//    wire [15:0] read_data2; // Output of second read operation

//    // Instantiate the register file module
//    k_to_1_mux DUT(
////    register_file uut (
//        .clk(clk),
//        .we(we),
//        .read_addr1(read_addr1),
//        .read_addr2(read_addr2),
//        .write_addr(write_addr),
//        .write_data(write_data),
//        .read_data1(read_data1),
//        .read_data2(read_data2)
//    );

//    // Clock generation
//    always #5 clk = ~clk;

//    initial begin
//        // Initialize
//        clk = 0;
//        we = 0;
//        read_addr1 = 4'b0000;
//        read_addr2 = 4'b0001;
//        write_addr = 4'b0000;
//        write_data = 16'h0000;

//        // Write data to register 0
//        #10 we = 1; write_addr = 4'b0000; write_data = 16'hAAAA;
//        #10 we = 0; // Disable write

//        // Write data to register 1
//        #10 we = 1; write_addr = 4'b0001; write_data = 16'h5555;
//        #10 we = 0;

//        // Read data from register 0 and register 1
//        #10 read_addr1 = 4'b0000;
//        read_addr2 = 4'b0001;

//        // Write data to register 2
//        #10 we = 1; write_addr = 4'b0010; write_data = 16'hF0F0;
//        #10 we = 0;

//        // Read data from register 0 and register 2
//        #10 read_addr1 = 4'b0000;
//        read_addr2 = 4'b0010;

//        // End simulation
//        #20 $finish;
//    end

//    initial begin
//        // Monitor output
//        $monitor("Time = %0d, we = %b, write_addr = %b, write_data = %h, read_addr1 = %b, read_data1 = %h, read_addr2 = %b, read_data2 = %h", 
//                 $time, we, write_addr, write_data, read_addr1, read_data1, read_addr2, read_data2);
//    end
//endmodule



/*    Cache Memory (Direct Mapping)      */
//module tb_direct_mapped_cache();
module k_to_1_tb();

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

    // Instantiate the cache module
//    direct_mapped_cache #(
    k_to_1_mux #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH),
        .CACHE_SIZE(CACHE_SIZE)
    ) uut (
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
