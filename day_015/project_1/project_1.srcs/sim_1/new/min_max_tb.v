`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/06/2024 10:25:08 AM
// Module Name: min_max_tb
//////////////////////////////////////////////////////////////////////////////////


module min_max_tb;
reg [3:0] a,b;
wire A_less_B,A_great_B,A_equal_B;
 min_max DUT (a,b,A_less_B,A_great_B,A_equal_B);
 initial begin
        $display("in between  a  and  b    A_lessThan_B  A_greaterThan_B  A_equalTo_B ");
        $monitor("           %d      %d    %b            %b                %b ", a, b,A_less_B,A_great_B,A_equal_B);
repeat(10) begin
#10
        a= $random %16 ;
        b= $random %16 ;
       
end
$finish;
end

endmodule
