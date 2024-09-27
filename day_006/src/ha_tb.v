`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 09/27/2024 08:41:55 PM
// Module Name: half_adder
//////////////////////////////////////////////////////////////////////////////////


module ha_tb;
reg a,b;
wire sum,carry;
half_adder DUT (a,b,sum,carry);


initial begin
#10 a = 0; b = 0;
#10 a = 0; b = 1;
#10 a = 1; b = 0;
#10 a = 1; b = 1;
end

endmodule
