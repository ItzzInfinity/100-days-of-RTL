
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/10/2024 09:12:03 AM
// Module Name: carry_skip_adder
//////////////////////////////////////////////////////////////////////////////////


module carry_skip_adder(
input [3:0] a,b,
input c,
output [3:0] sum,
output cout);
    wire [3:0] s,c1,p;
    
    
  full_adder FA1(a[0],b[0],c,sum[0],c1[0]);  
  full_adder FA2(a[1],b[1],c1[0],sum[1],c1[1]);  
  full_adder FA3(a[2],b[2],c1[1],sum[2],c1[2]);  
  full_adder FA4(a[3],b[3],c1[2],sum[3],c1[3]); 
 assign p = a^b;
 assign s = & (p [3:0]);
 mux_2_to_1 M1 (c,c1[3],s,cout);
endmodule

























//module CarryskipAdder(input [3:0] A, B, input cin, output [3:0] sum, output Cout);
// wire [3:0] P ;
// wire w1,w2; 
// wire [3:0] ///Instantiating FULL ADDERS 
//full_adder MI (A(A[0]),.8(B[0]),C(Cin)..Sum(Sum(0)), Carry(C[0])); 
//full_adder M21.A(A[1]),B(B[1]),.C(C[0]),.Sum(Sum[1]), Carry([1])); 
//full_adder M3(.A(A[2]),8(B[2]),.C(C[1]), Sum(Sum[2]), Carry (C[2])); 
//full_adder M4(.A(A[3]),8(B[3]),C(C[2]),.Sum(Sum(3)), Carry (C[3])); 
//aasign P[0]=A[0]^B[0]; 
//assign P[1]=A[1]^B[1]; 
//assign P[2]=A[2]^B[2]; 
//assign P[3]=A[3]^B[3]; 
//and gl (wl, P[0],P[1], P[2],P[3]); //Instantiating Multiplexer 
//Mux M5 (.A(Cin),.B(C[3]),.sel(wl),.y(Cout)); 
//endmodule
