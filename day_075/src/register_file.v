`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/05/2024 08:22:44 AM
// Module Name: register_file
//////////////////////////////////////////////////////////////////////////////////

module register_file (
    input clk,                
    input we,                 
    input [3:0] read_addr1,   
    input [3:0] read_addr2,   
    input [3:0] write_addr,   
    input [15:0] write_data,  
    output [15:0] read_data1, 
    output [15:0] read_data2  
);

    reg [15:0] reg_file [15:0];  // 16 registers, each 16 bits wide

    // Read operation (asynchronous)
    assign read_data1 = reg_file[read_addr1];
    assign read_data2 = reg_file[read_addr2];

    // Write operation (synchronous)
    always @(posedge clk) begin
        if (we) begin
            reg_file[write_addr] <= write_data;  
        end
    end

endmodule
