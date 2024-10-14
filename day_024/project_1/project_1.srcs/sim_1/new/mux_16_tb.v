`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/15/2024 08:27:52 AM
// Module Name: mux_16_tb
//////////////////////////////////////////////////////////////////////////////////
module mux_16_tb;
    reg [15:0] a;
    reg [3:0] sel;
    wire y;
    
    mux_16_to_1 uut (
        .a(a), .sel(sel), .
        y(y)
    );
    
    initial begin
        $monitor("The value of y is %b when a = %d (%b) & sel = %d",y,a,a,sel);
        #10;
        a = 16'b0000000000000000; sel = 4'b0000; #10; // Select a[0]
        a = 16'b0000000000000010; sel = 4'b0001; #10; // Select a[1]
        a = 16'b0000000000000100; sel = 4'b0010; #10; // Select a[2]
        a = 16'b0000000000001000; sel = 4'b0011; #10; // Select a[3]
        a = 16'b0000000000010000; sel = 4'b0100; #10; // Select a[4]
        a = 16'b0000000000100000; sel = 4'b0101; #10; // Select a[5]
        a = 16'b0000000001000000; sel = 4'b0110; #10; // Select a[6]
        a = 16'b0000000010000000; sel = 4'b0111; #10; // Select a[7]
        a = 16'b0000000100000000; sel = 4'b1000; #10; // Select a[8]
        a = 16'b0000001000000000; sel = 4'b1001; #10; // Select a[9]
        a = 16'b0000010000000000; sel = 4'b1010; #10; // Select a[10]
        a = 16'b0000100000000000; sel = 4'b1011; #10; // Select a[11]
        a = 16'b0001000000000000; sel = 4'b1100; #10; // Select a[12]
        a = 16'b0010000000000000; sel = 4'b1101; #10; // Select a[13]
        a = 16'b0100000000000000; sel = 4'b1110; #10; // Select a[14]
        a = 16'b1000000000000000; sel = 4'b1111; #10; // Select a[15]
        
        $finish;
    end
endmodule
