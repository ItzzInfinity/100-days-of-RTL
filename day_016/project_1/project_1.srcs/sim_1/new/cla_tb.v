`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/07/2024 06:43:35 AM
// Module Name: cla_tb
//////////////////////////////////////////////////////////////////////////////////


module cla_tb;
    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire carry;
    wire [4:0] add;
    carry_look_ahead_adder dut(a, b, cin, sum, carry);
    assign add = {carry, sum};
    initial
        begin
            a = 4'b1000; b = 4'b0011; cin = 1'b0;
        #10 a = 4'b0011; b = 4'b1010; cin = 1'b1;
        #10 a = 4'b0110; b = 4'b0110; cin = 1'b0;
        #10 a = 4'b0111; b = 4'b1110; cin = 1'b0;
        #10 a = 4'b1011; b = 4'b0110; cin = 1'b1;
        #10 a = 4'b1001; b = 4'b0100; cin = 1'b0;
        #10 a = 4'b1110; b = 4'b1110; cin = 1'b1;
    end
    initial
    begin 
        $display("a  +  b , Cin = add | sum  cout");
        $monitor("%d + %d , %b  = %d  | %d   %b", a, b,cin, add, sum, carry);
        
    #70 $finish;
    end
endmodule