
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/20/2024 07:15:59 PM
// Module Name: demux_1_to_8
//////////////////////////////////////////////////////////////////////////////////


module demux_1_to_8(
input a,
input [2:0] sel,
output [7:0] y
    );
    wire x1,x2,x3,x4,x5,x6;
    // level 1
    demux_2_to_1 mux_1 (a,sel[2],x1,x2);
    // level 2
    demux_2_to_1 mux_2 (x1,sel[1],x3,x4);
    demux_2_to_1 mux_3 (x2,sel[1],x5,x6);
    // level 3
    demux_2_to_1 mux_4 (x3,sel[0],y[0],y[1]);
    demux_2_to_1 mux_5 (x4,sel[0],y[2],y[3]);
    demux_2_to_1 mux_6 (x5,sel[0],y[4],y[5]);
    demux_2_to_1 mux_7 (x6,sel[0],y[6],y[7]); 
endmodule
