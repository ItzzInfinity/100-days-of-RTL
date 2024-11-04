`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/04/2024 07:34:27 AM
// Module Name: bin_to_BCD_tb
//////////////////////////////////////////////////////////////////////////////////


module bin_to_BCD_tb;
reg clk=0;
 reg [8:0] bin;
   wire [15:0] bcd;
  wire [3:0] ones,tens,hundreds;          
binary_to_BCD DUT(clk,bin,bcd,ones,tens,hundreds);

always #5 clk = ~clk;
initial begin
bin = 9'd0;
#10 bin = 9'd10;
#10 bin = 9'd248;
#10 bin = 9'd255;
#10 bin = 9'd25;
#10 bin = 9'd28;
$finish;
end

endmodule
