`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 09/25/2024 11:40:15 AM
// Module Name: N_bit_comparator_tb
//////////////////////////////////////////////////////////////////////////////////


module N_bit_comp_tb;
reg [7:0] a,b;
wire Lesser,Greater,Equal;
 N_bit_comparator DUT (a,b,Lesser,Greater,Equal);
 initial begin
        $display("in between  a  and  b    A_lessThan_B  A_greaterThan_B  A_equalTo_B ");
        $monitor("           %d      %d    %b            %b                %b ", a, b,Lesser,Greater,Equal);
repeat(10) begin
#10
        a= $random %8 ;
        b= $random %8 ;
       
end
$finish;
end

endmodule