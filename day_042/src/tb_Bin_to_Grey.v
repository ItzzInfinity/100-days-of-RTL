`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/02/2024 04:34:02 AM
// Module Name: tb_Bin_to_Grey
//////////////////////////////////////////////////////////////////////////////////

module tb_Bin_to_Grey;
    reg [3:0] bin;       
    wire [3:0] grey;
    Bin_to_Grey uut (.b(bin),.g(grey));
    initial begin
        $monitor("Binary = %b, Grey = %b", bin, grey);
        bin = 4'b0000; #10;
        bin = 4'b0001; #10;
        bin = 4'b0010; #10;
        bin = 4'b0011; #10;
        bin = 4'b0100; #10;
        bin = 4'b0101; #10;
        bin = 4'b0110; #10;
        bin = 4'b0111; #10;
        bin = 4'b1000; #10;
        bin = 4'b1001; #10;
        bin = 4'b1010; #10;
        bin = 4'b1011; #10;
        bin = 4'b1100; #10;
        bin = 4'b1101; #10;
        bin = 4'b1110; #10;
        bin = 4'b1111; #10;
        
        $finish;
    end
endmodule

