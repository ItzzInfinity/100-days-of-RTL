`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 09/28/2024 10:15:06 PM
// Module Name: half_subtractor
//////////////////////////////////////////////////////////////////////////////////

module fs_tb;
reg Y,X,Bin;
wire D,Bout;
full_subtractor DUT (X,Y,Bin,D,Bout);


initial begin
#10 X = 0; Y = 0; Bin = 0;
#10 X = 0; Y = 0; Bin = 1;
#10 X = 0; Y = 1; Bin = 0;
#10 X = 0; Y = 1; Bin = 1;
#10 X = 1; Y = 0; Bin = 0;
#10 X = 1; Y = 0; Bin = 1;
#10 X = 1; Y = 1; Bin = 0;
#10 X = 1; Y = 1; Bin = 1;


end

endmodule