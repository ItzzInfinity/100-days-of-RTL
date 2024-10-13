`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/14/2024 06:16:57 PM
// Module Name: mux_tb
//////////////////////////////////////////////////////////////////////////////////


module mux_tb;
reg [3:0] a,b,c,d;
reg [1:0] sel;
wire [3:0] y;

mux_4to1 DUT (a,b,c,d,sel,y);
 initial begin
        $display("Select line is Sel  so now the output is y  , where a , b , a , b are:");
        $monitor("               %b                       %d,         %d   %d   %d   %d", sel,y,a,b,c,d);
//repeat(10) begin
#10
//        a= $random %16 ;
//        b= $random %16 ;
//        c= $random %16 ;
//        d= $random %16 ;
//        sel = $random;
        
        
        a= 4'd15 ;b= 4'd10 ;c= 4'd5 ;d= 4'd3 ;sel = 2'b00 ;
        #10
        a= 4'd3 ;b= 4'd7 ;c= 4'd5 ;d= 4'd8 ;sel = 2'b01 ;
        #10
        a= 4'd5 ;b= 4'd11 ;c= 4'd6 ;d= 4'd1 ;sel = 2'b10 ;
        #10
        a= 4'd7 ;b= 4'd13 ;c= 4'd15 ;d= 4'd6 ;sel = 2'b11 ;
        #10
        a= 4'd8 ;b= 4'd6 ;c= 4'd1 ;d= 4'd10 ;sel = 2'b11 ;
//end
$finish;
end
endmodule
