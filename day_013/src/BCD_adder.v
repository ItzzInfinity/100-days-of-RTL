//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/04/2024 09:08:42 AM
// Module Name: BCD_adder
//////////////////////////////////////////////////////////////////////////////////


module BCD_adder(
input [3:0] X,Y,
input Cin,
output [3:0] P,
output Cout);
wire [3:0] C;
wire D,Z; 
assign Z = ((C[1]|C[2])&C[3])|D;
IC7483 ic1 (.A0(X[0]),.A1(X[1]),.A2(X[2]),.A3(X[3]),.B0(Y[0]),.B1(Y[1]),.B2(Y[2]),.B3(Y[3]),.S0(C[0]),.S1(C[1]),.S2(C[2]),.S3(C[3]),.Cin(Cin),.Cout(D));
IC7483 ic2 (.A0(0),.A1(Z),.A2(Z),.A3(0),.B0(C[0]),.B1(C[1]),.B2(C[2]),.B3(C[3]),.S0(P[0]),.S1(P[1]),.S2(P[2]),.S3(P[3]),.Cin(0),.Cout(Cout));
endmodule