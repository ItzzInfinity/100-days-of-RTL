`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/19/2024 05:59:44 AM
// Module Name: demux_tb
//////////////////////////////////////////////////////////////////////////////////


module demux_tb;

reg [3:0]a;
reg sel;
wire [3:0] y1, y2;
demux_2_to_1 DUT(a,sel,y1,y2);

initial begin 
a = 0; sel = 0; #10;
a = 0; sel = 1; #10;
a = 4'ha; sel = 0; #10;
a = 4'hb; sel = 1; #10;
$finish;
end
endmodule
