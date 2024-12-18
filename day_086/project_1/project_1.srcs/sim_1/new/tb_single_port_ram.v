`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/16/2024 10:22:08 AM
// Module Name: tb_single_port_ram
//////////////////////////////////////////////////////////////////////////////////


module tb_single_port_ram;
    parameter DATA_WIDTH = 8;   
    parameter ADDR_WIDTH = 4;
 
    reg clk,we;
    reg [ADDR_WIDTH-1:0] addr;         
    reg [DATA_WIDTH-1:0] data_in;      
    wire [DATA_WIDTH-1:0] data_out;
    
    single_port_ram #(DATA_WIDTH, ADDR_WIDTH) 
    DUT (.clk(clk),
        .we(we),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out));
    
    initial begin
      clk = 0;
      forever #5 clk = ~clk;
    end

    initial begin 
     // Write operations
         we = 1; addr = 16'd32; data_in = 8'd12;
      #5 we = 1; addr = 16'd25; data_in = 8'd254;
      #5 we = 1; addr = 16'd12; data_in = 8'd232;
      #5 we = 1; addr = 16'd10; data_in = 8'd121;
      #5 we = 1; addr = 16'd19; data_in = 8'd13;
      #5 we = 1; addr = 16'd24; data_in = 8'd1;
      #5 we = 1; addr = 16'd34; data_in = 8'd16;
     // read operations
      #10 we = 0; addr = 16'd32;
      #10 we = 0; addr = 16'd31;
      #5  we = 0; addr = 16'd25; 
      #5  we = 0; addr = 16'd12; 
      #5  we = 0; addr = 16'd10; 
      #5  we = 0; addr = 16'd19; 
      #5  we = 0; addr = 16'd24; 
      #5  we = 0; addr = 16'd34;      
      #10 $finish;
    end
endmodule
