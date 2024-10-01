`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/02/2024 11:10:41 AM
// Module Name: multiplier
//////////////////////////////////////////////////////////////////////////////////

module multiplier_tb;
reg [3:0] X,Y;
wire [7:0] P;
multiplier DUT (X,Y,P);
initial begin
        $display("X    Y    | P");
        $monitor("%d  %d    | %d ", X, Y, P);
repeat(10) begin
#10
        X= $random %16 ;
        Y= $random %16 ;
       
end
$finish;
end

endmodule
