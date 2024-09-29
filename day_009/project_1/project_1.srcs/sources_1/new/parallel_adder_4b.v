`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 09/30/2024 09:14:36 PM 
// Module Name: parallel_adder_subtractor_16b
//////////////////////////////////////////////////////////////////////////////////

module parallel_adder_4b(
    input selAddSub,
    input [3:0] x, y,
    input cin,               // Added carry-in input
    output [3:0] s,
    output cout              // Carry-out signal
);

    wire [2:0] c;

    full_adder FA0(.a(x[0]), .b(y[0]^selAddSub), .cin(cin),       .sum(s[0]), .cout(c[0]));
    full_adder FA1(.a(x[1]), .b(y[1]^selAddSub), .cin(c[0]),     .sum(s[1]), .cout(c[1]));
    full_adder FA2(.a(x[2]), .b(y[2]^selAddSub), .cin(c[1]),     .sum(s[2]), .cout(c[2]));
    full_adder FA3(.a(x[3]), .b(y[3]^selAddSub), .cin(c[2]),     .sum(s[3]), .cout(cout));

endmodule

















//module parallel_adder_4b(

//  input selAddSub,
//  input [3:0] x,y,
//  output [3:0] s,
//  output cout);
//  wire [2:0] c;
// full_adder FA0(.a(x[0]),.b(y[0]^selAddSub),.cin(selAddSub),.sum(s[0]),.cout(c[0]));
// full_adder FA1(.a(x[1]),.b(y[1]^selAddSub),.cin(c[0]),.sum(s[1]),.cout(c[1]));
// full_adder FA2(.a(x[2]),.b(y[2]^selAddSub),.cin(c[1]),.sum(s[2]),.cout(c[2]));
// full_adder FA3(.a(x[3]),.b(y[3]^selAddSub),.cin(c[2]),.sum(s[3]),.cout(cout));
// endmodule
