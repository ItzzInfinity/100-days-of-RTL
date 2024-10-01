`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 10/02/2024 11:10:41 AM
// Module Name: multiplier
//////////////////////////////////////////////////////////////////////////////////
module multiplier(
    input [3:0] X, Y,
    output [7:0] P
);
    wire [3:0] C, D;
    wire [3:0] And_0, And_1, And_2, And_3;

    IC7483 ic1 (
        .A0(And_0[1]), .A1(And_0[2]), .A2(And_0[3]), .A3(0),
        .B0(And_1[0]), .B1(And_1[1]), .B2(And_1[2]), .B3(And_1[3]),
        .S0(P[1]), .S1(C[0]), .S2(C[1]), .S3(C[2]), .Cin(0), .Cout(C[3])
    );

    IC7483 ic2 (
        .A0(C[0]), .A1(C[1]), .A2(C[2]), .A3(C[3]),
        .B0(And_2[0]), .B1(And_2[1]), .B2(And_2[2]), .B3(And_2[3]),
        .S0(P[2]), .S1(D[0]), .S2(D[1]), .S3(D[2]), .Cin(0), .Cout(D[3])
    );

    IC7483 ic3 (
        .A0(D[0]), .A1(D[1]), .A2(D[2]), .A3(D[3]),
        .B0(And_3[0]), .B1(And_3[1]), .B2(And_3[2]), .B3(And_3[3]),
        .S0(P[3]), .S1(P[4]), .S2(P[5]), .S3(P[6]), .Cin(0), .Cout(P[7])
    );

    assign P[0] = And_0[0];  

    assign And_0 = {{4{Y[0]}} & X};
    assign And_1 = {{4{Y[1]}} & X};
    assign And_2 = {{4{Y[2]}} & X};
    assign And_3 = {{4{Y[3]}} & X};

endmodule







//module multiplier(
//input [3:0] X,Y,
//output [7:0] P);

//wire [3:0] C,D,And_0,And_1,And_2,And_3; 
//IC7483 ic1 (.A0(And_0[1]),.A1(And_0[2]),.A2(And_0[3]),.A3(0),.B0(And_1[0]),.B1(And_1[1]),.B2(And_1[2]),.B3(And_1[3]),.S0(P[1]),.S1(C[0]),.S2(C[1]),.S3(C[2]),.Cin(0),.Cout(C[3]));
//IC7483 ic2 (.A0(C[0]),.A1(C[1]),.A2(C[2]),.A3(C[3]),.B0(And_2[0]),.B1(And_2[1]),.B2(And_2[2]),.B3(And_2[3]),.S0(P[2]),.S1(D[0]),.S2(D[1]),.S3(D[2]),.Cin(0),.Cout(D[3]));
//IC7483 ic3 (.A0(D[0]),.A1(D[1]),.A2(D[1]),.A3(D[3]),.B0(And_3[0]),.B1(And_3[1]),.B2(And_3[2]),.B3(And_3[3]),.S0(P[3]),.S1(P[4]),.S2(P[5]),.S3(P[6]),.Cin(0),.Cout(P[7]));
//assign P[0] = And_0[0];
//assign And_0 = {{4{Y[0]}}&X};
//assign And_1 = {{4{Y[1]}}&X};
//assign And_2 = {{4{Y[2]}}&X};
//assign And_3 = {{4{Y[3]}}&X};
//endmodule