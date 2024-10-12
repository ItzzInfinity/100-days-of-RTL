`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/13/2024 06:16:57 PM
// Module Name: mux_tb
//////////////////////////////////////////////////////////////////////////////////


module mux_tb;
reg [3:0] a,b;
reg sel;
wire [3:0] y;

mux_2_to_1 DUT (a,b,sel,y);
 initial begin
        $display("Select line is Sel  so now the output is y  , where a and b are:");
        $monitor("               %b                       %d,         %d    %d", sel,y,a,b);
repeat(10) begin
#10
        a= $random %16 ;
        b= $random %16 ;
        sel = $random;
       
end
$finish;
end
endmodule