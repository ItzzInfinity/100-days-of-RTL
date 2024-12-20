`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/18/2024 11:17:26 AM
// Module Name: rom_15x15
//////////////////////////////////////////////////////////////////////////////////

module rom_15x15 (
    input [3:0] addr,         // 4-bit address (15 locations require 4 bits)
    output reg [14:0] data    // 15-bit data output
);

    // ROM storage
    reg [14:0] rom [14:0];
    
    initial begin
        rom[0]  = 15'b000000100000001;
        rom[1]  = 15'b000010000000010;
        rom[2]  = 15'b000000000000011;
        rom[3]  = 15'b000000000000100;
        rom[4]  = 15'b000000100000101;
        rom[5]  = 15'b000000000000110;
        rom[6]  = 15'b000100000000111;
        rom[7]  = 15'b000000001001000;
        rom[8]  = 15'b000000000001001;
        rom[9]  = 15'b000000000001010;
        rom[10] = 15'b000000000001011;
        rom[11] = 15'b000001001001100;
        rom[12] = 15'b000100000001101;
        rom[13] = 15'b000000000001110;
        rom[14] = 15'b010000001001111;
    end

    // Read data based on address
    always @(*) begin
        data = rom[addr];
    end

endmodule

