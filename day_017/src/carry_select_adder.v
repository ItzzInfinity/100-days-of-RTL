//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/08/2024 08:36:17 AM
// Module Name: carry_select_adder
//////////////////////////////////////////////////////////////////////////////////


module carry_select_adder(
input [3:0] A,B,
input Cin,
output [4:0] Sum,
output Cout);
wire [3:0] w0,w1,c0,c1;
///FOR CARRY=0;
full_adder FA1(.a(A[0]),.b(B[0]),.cin(0),.sum(w0[0]),.cout(c0[0]));
full_adder FA2(.a(A[1]),.b(B[1]),.cin(c0[0]),.sum(w0[1]),.cout(c0[1]));
full_adder FA3(.a(A[2]),.b(B[2]),.cin(c0[1]),.sum(w0[2]),.cout(c0[2]));
full_adder FA4(.a(A[3]),.b(B[3]),.cin(c0[2]),.sum(w0[3]),.cout(c0[3]));
///FOR CARRY=1;
full_adder FA5(.a(A[0]),.b(B[0]),.cin(1),.sum(w1[0]),.cout(c1[0]));
full_adder FA6(.a(A[1]),.b(B[1]),.cin(c1[0]),.sum(w1[1]),.cout(c1[1]));
full_adder FA7(.a(A[2]),.b(B[2]),.cin(c1[1]),.sum(w1[2]),.cout(c1[2]));
full_adder FA8(.a(A[3]),.b(B[3]),.cin(c1[2]),.sum(w1[3]),.cout(c1[3]));

///To select the carry

mux m1(.a(w0[0]),.b(w1[0]),.sel(Cin),.y(Sum[0]));
mux m2(.a(w0[1]),.b(w1[1]),.sel(Cin),.y(Sum[1]));
mux m3(.a(w0[2]),.b(w1[2]),.sel(Cin),.y(Sum[2]));
mux m4(.a(w0[3]),.b(w1[3]),.sel(Cin),.y(Sum[3]));
mux m5(.a(c0[3]),.b(c1[3]),.sel(Cin),.y(Cout));

assign Sum[4]=Cout;
endmodule
