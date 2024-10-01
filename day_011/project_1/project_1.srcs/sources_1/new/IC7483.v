
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 10/02/2024 11:10:41 AM
// Module Name: multiplier
//////////////////////////////////////////////////////////////////////////////////

module IC7483(
input A0,
input A1,
input A2,
input A3,
input B0,
input B1,
input B2,
input B3,
input Cin,
output S0,
output S1,
output S2,
output S3,
output Cout);
wire C1,C2,C3;
full_adder FA1(.a(A0), .b(B0), .cin(Cin), .sum(S0), .cout(C1));
full_adder FA2(.a(A1), .b(B1), .cin(C1), .sum(S1), .cout(C2));
full_adder FA3(.a(A2), .b(B2), .cin(C2), .sum(S2), .cout(C3));
full_adder FA4(.a(A3), .b(B3), .cin(C3), .sum(S3), .cout(Cout));
endmodule