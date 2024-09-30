`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/01/2024 08:41:17 AM
// Module Name: RCA_tb
//////////////////////////////////////////////////////////////////////////////////

module RCA_tb;
reg [3:0] A,B;
reg Cin;
wire [3:0] Sum;
wire Cout;
ripple_carry_adder_4bit DUT (A, B,Cin,Sum,Cout);
initial begin
    A = 4'b0000;
    B = 4'b0000;
    Cin = 1'b0;
    #5;
$display("A  +  B  (Cin)   =    Sum    Cout");
$monitor("%d + %d  (%d)    =    %d     %d", A, B,Cin,Sum, Cout*16);
repeat(10) begin
#10
A = $random % 16 ;
B = $random % 16 ;
Cin = $random;
end
$finish;
end

endmodule
