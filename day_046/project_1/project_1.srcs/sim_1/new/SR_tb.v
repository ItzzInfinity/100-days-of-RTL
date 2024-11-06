`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/06/2024 06:21:28 AM
// Module Name: SR_tb
//////////////////////////////////////////////////////////////////////////////////


module SR_tb;
 reg S,R;
wire Q,Qbar;

SR_latch DUT(S,R,Q,Qbar);
 initial begin 
S = 0 ; R = 0;
#10 S = 0 ; R = 1;
#10 S = 1 ; R = 0;
#10 S = 1 ; R = 1;
#10 $finish;
end
endmodule
