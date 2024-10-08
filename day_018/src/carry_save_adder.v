
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/09/2024 09:59:34 AM
// Module Name: carry_save_adder
//////////////////////////////////////////////////////////////////////////////////


module carry_save_adder(
input [3:0] a,b,c,
output [5:0] sum,
output cout
    );
    wire [3:0] s,c1,c2;
    
    
  full_adder FA1(a[0],b[0],c[0],s[0],c1[0]);  
  full_adder FA2(a[1],b[1],c[1],s[1],c1[1]);  
  full_adder FA3(a[2],b[2],c[2],s[2],c1[2]);  
  full_adder FA4(a[3],b[3],c[3],s[3],c1[3]); 

   
  assign sum[0] = s[0];
  assign sum[5] = cout;
//  assign c2 = {s[1],s[2],s[3],0};
//  ripple_carry_adder_4bit RCA (c1,c2,0,sum[4:1],cout);

  full_adder FA5( c1[0], s[1],    0,  sum[1], c2[0]);  
  full_adder FA6( c1[1], s[2], c2[0], sum[2], c2[1]);  
  full_adder FA7( c1[2], s[3], c2[1], sum[3], c2[2]);  
  full_adder FA8( c1[3],   0,  c2[2], sum[4], cout);  

    endmodule
  
  
  
  
  
  
  
//module carry_save_adder( 
//    input [3:0] a,b,c,
//    output [5:0] sum,
//    output cout
//);
//    wire [3:0] s, c1, c2;

//    // First layer of full adders
//    full_adder FA1 (a[0], b[0], c[0], s[0], c1[0]);  
//    full_adder FA2 (a[1], b[1], c[1], s[1], c1[1]);  
//    full_adder FA3 (a[2], b[2], c[2], s[2], c1[2]);  
//    full_adder FA4 (a[3], b[3], c[3], s[3], c1[3]); 

//    // Prepare carry-in for the next stage (RCA)
//    assign c2 = {s[0], s[1], s[2], 1'b0};  // Shift carries for RCA addition

//    // Assign sum[0] from the first layer
//    assign sum[0] = s[0];

//    // Ripple Carry Adder to add the results of first layer's sum and carry
//    ripple_carry_adder_4bit RCA (
//        .A(s[3:0]),    // Taking s[3], s[2], s[1] for further addition
//        .B(c2[3:0]),   // Adding c2[3:1] 
//        .Cin(1'b0),    // No carry-in for RCA
//        .Sum(sum[4:1]), // Outputs sum[4:1]
//        .Cout(cout)     // Final carry out
//    );

//    // Assign sum[5] to Cout since it's a 6-bit sum
//    assign sum[5] = cout;
//endmodule

