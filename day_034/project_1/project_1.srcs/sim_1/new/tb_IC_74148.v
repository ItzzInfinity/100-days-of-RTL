`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/25/2024 07:11:35 AM
// Module Name: tb_IC_74148
//////////////////////////////////////////////////////////////////////////////////

module tb_IC_74148;
    reg [7:0] d;       
    reg En;            
    wire [2:0] a;      
    wire g;            
    wire e;            

    IC_74148 DUT (.d(d),.En(En),.a(a),.Group_signal(g),.Enable_output(e));

    initial begin
        En = 0;                                     // Enable the encoder
        d = 8'b00000000; #10;                       // Test case 1: All inputs are low
        $display("Input: %b, Output: a=%b, g=%b, e=%b", d, a, g, e);
        d = 8'b00000001; #10;                       // Test case 2: Input 0 is high
        $display("Input: %b, Output: a=%b, g=%b, e=%b", d, a, g, e);
        d = 8'b00000100; #10;                       // Test case 3: Input 3 is high
        $display("Input: %b, Output: a=%b, g=%b, e=%b", d, a, g, e);
        d = 8'b00100000; #10;                       // Test case 4: Input 5 is high
        $display("Input: %b, Output: a=%b, g=%b, e=%b", d, a, g, e);
        d = 8'b10000000; #10;                       // Test case 5: Input 7 is high
        $display("Input: %b, Output: a=%b, g=%b, e=%b", d, a, g, e);
        d = 8'b11111111; #10;                       // Test case 6: All inputs high
        $display("Input: %b, Output: a=%b, g=%b, e=%b", d, a, g, e);
        En = 1;                                     // Test case 7: Enable signal high
        d = 8'b00001111; #10;                       // Irrelevant when En is high
        $display("Input: %b, Output: a=%b, g=%b, e=%b", d, a, g, e);
        $finish;
    end

endmodule