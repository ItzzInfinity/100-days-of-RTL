`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/05/2024 08:22:44 AM
// Module Name: tb_register_file
//////////////////////////////////////////////////////////////////////////////////


module tb_register_file;
    reg clk;               
    reg we;                
    reg [3:0] read_addr1;  
    reg [3:0] read_addr2;  
    reg [3:0] write_addr;  
    reg [15:0] write_data; 
    wire [15:0] read_data1;
    wire [15:0] read_data2;

    
    register_file DUT(
        .clk(clk),
        .we(we),
        .read_addr1(read_addr1),
        .read_addr2(read_addr2),
        .write_addr(write_addr),
        .write_data(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    always #5 clk = ~clk;

    initial begin
        
        clk = 0;
        we = 0;
        read_addr1 = 4'b0000;
        read_addr2 = 4'b0001;
        write_addr = 4'b0000;
        write_data = 16'h0000;

        // Write data to register 0
        #10 we = 1; write_addr = 4'b0000; write_data = 16'hAAAA;
        #10 we = 0; // Disable write

        // Write data to register 1
        #10 we = 1; write_addr = 4'b0001; write_data = 16'h5555;
        #10 we = 0;

        // Read data from register 0 and register 1
        #10 read_addr1 = 4'b0000;
        read_addr2 = 4'b0001;

        // Write data to register 2
        #10 we = 1; write_addr = 4'b0010; write_data = 16'hF0F0;
        #10 we = 0;

        // Read data from register 0 and register 2
        #10 read_addr1 = 4'b0000;
        read_addr2 = 4'b0010;

        // End simulation
        #20 $finish;
    end

    initial begin
        // Monitor output
        $monitor("Time = %0d, we = %b, write_addr = %b, write_data = %h, read_addr1 = %b, read_data1 = %h, read_addr2 = %b, read_data2 = %h", 
                 $time, we, write_addr, write_data, read_addr1, read_data1, read_addr2, read_data2);
    end
endmodule
