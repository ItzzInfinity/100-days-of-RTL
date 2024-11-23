`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/25/2024 08:35:29 AM
// Module Name: booth_multiplier_tb
//////////////////////////////////////////////////////////////////////////////////

module test_bench;
reg signed [3:0] Q,M;
wire signed [7:0] result;

booth_multiplier DUT (Q,M,result);

initial begin
Q= 3; M= 7; #10;
Q= 3; M= -7; #10;
Q= -3; M= -7; #10;
Q= 5; M= 6; #10;
Q= 5; M= -6; #10;
Q= -5; M= -6; #10;
end

initial begin
$monitor("%d * %d = %d", Q,M,result);
#60 $finish;
end
endmodule

