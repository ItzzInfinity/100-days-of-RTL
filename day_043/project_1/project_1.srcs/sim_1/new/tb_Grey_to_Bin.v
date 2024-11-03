`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/03/2024 04:47:48 AM
// Module Name: tb_Grey_to_Bin
//////////////////////////////////////////////////////////////////////////////////


module tb_Grey_to_Bin;
    reg [3:0] grey;       
    wire [3:0] bin;
    Grey_to_Bin uut (.g(grey),.b(bin));
    initial begin
        $monitor("grey = %b, bin = %b", grey, bin);
        grey = 4'b0000; #10;
        grey = 4'b0001; #10;
        grey = 4'b0010; #10;
        grey = 4'b0011; #10;
        grey = 4'b0100; #10;
        grey = 4'b0101; #10;
        grey = 4'b0110; #10;
        grey = 4'b0111; #10;
        grey = 4'b1000; #10;
        grey = 4'b1001; #10;
        grey = 4'b1010; #10;
        grey = 4'b1011; #10;
        grey = 4'b1100; #10;
        grey = 4'b1101; #10;
        grey = 4'b1110; #10;
        grey = 4'b1111; #10;
        
        $finish;
    end
endmodule

