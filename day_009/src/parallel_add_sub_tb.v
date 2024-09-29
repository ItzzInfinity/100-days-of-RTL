`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 09/30/2024 09:14:36 PM 
// Module Name: parallel_adder_subtractor_16b
//////////////////////////////////////////////////////////////////////////////////

module parallel_add_sub_tb;
    reg [15:0] x, y;
    reg selAddSub;
    wire [15:0] s;
    wire cout;
    reg Cin;

    parallel_adder_subtractor_16b dut (
        .x(x),
        .y(y),
        .selAddSub(selAddSub),
        .s(s),
        .cout(cout),.Cin(Cin)
    );

    initial begin
        $display("x         y        Cin    selAddSub       | s         cout");
        $monitor("x = %d, y = %d, Cin =%b    selAddSub = %b | s = %d, cout = %b", x, y,Cin, selAddSub, s, cout);
        #10 x = 16'd32565; y = 16'd11323; selAddSub =1'b0; Cin = 0;
        #10 x = 16'd19136; y = 16'd11323; selAddSub =1'b1; Cin = 0;
        #10 x = 16'd43210; y = 16'd1323; selAddSub =1'b0;  Cin = 0;
        #10 x = 16'd32565; y = 16'd23320; selAddSub =1'b1; Cin = 0;
        #10 x = 16'd16565; y = 16'd10353; selAddSub =1'b0; Cin = 0;
        #10 x = 16'd42565; y = 16'd11323; selAddSub =1'b0; Cin = 0;
        #10 x = 16'd49136; y = 16'd11323; selAddSub =1'b1; Cin = 0;
        #10 x = 16'd51210; y = 16'd1323; selAddSub =1'b0;  Cin = 0;
        #10 x = 16'd42565; y = 16'd23320; selAddSub =1'b1; Cin = 0;
        #10 x = 16'd56565; y = 16'd10353; selAddSub =1'b0; Cin = 0;     

        $finish;
    end
endmodule

