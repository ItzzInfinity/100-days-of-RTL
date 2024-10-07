`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/08/2024 08:36:17 AM
// Module Name: csa_tb
//////////////////////////////////////////////////////////////////////////////////


module csa_tb;
    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire carry;
    wire [4:0] add;
    carry_select_adder DUT(a, b, cin, sum, carry);
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