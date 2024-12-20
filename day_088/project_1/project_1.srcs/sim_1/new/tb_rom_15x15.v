`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/18/2024 11:19:40 PM
// Module Name: tb_rom_15x15
//////////////////////////////////////////////////////////////////////////////////

module tb_rom_15x15;
    reg [3:0] addr;         
    wire [14:0] data;       
    
    rom_15x15 DUT (
        .addr(addr),
        .data(data)
    );
    
    initial begin
        $display("Address   Data");
        $monitor("%4b    %d", addr, data);

        addr = 4'b0000; #10; // Read data at address 0
        addr = 4'b0001; #10; 
        addr = 4'b0010; #10; 
        addr = 4'b0011; #10; 
        addr = 4'b0100; #10; 
        addr = 4'b0101; #10; 
        addr = 4'b0110; #10; 
        addr = 4'b0111; #10; 
        addr = 4'b1000; #10; 
        addr = 4'b1001; #10; 
        addr = 4'b1010; #10; 
        addr = 4'b1011; #10; 
        addr = 4'b1100; #10; 
        addr = 4'b1101; #10; 
        addr = 4'b1110; #10; // Read data at address 14

        $stop;
    end
endmodule
