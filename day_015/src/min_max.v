//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/06/2024 10:25:08 AM
// Module Name: min_max
//////////////////////////////////////////////////////////////////////////////////

module min_max(
	input [3:0] a,b,
	output A_less_B,A_great_B,A_equal_B
);

assign A_great_B = (a>b)?1'b1:1'b0;
assign A_less_B = (a<b)?1'b1:1'b0;
assign A_equal_B = (a==b)?1'b1:1'b0;
endmodule



















//module min_max (
//input [3:0] a,b,
//input cin,
//output [3:0] s,
//output Cout);
//wire [3:0] g,p;
//half_adder HA0 (.a(a[0]),.b(b[0]),.sum(p[0]),.carry(g[0]));
//half_adder HA1 (.a(a[1]),.b(b[1]),.sum(p[1]),.carry(g[1]));
//half_adder HA2 (.a(a[2]),.b(b[2]),.sum(p[2]),.carry(g[2]));
//half_adder HA3 (.a(a[3]),.b(b[3]),.sum(p[3]),.carry(g[3]));
//assign Cout = g[3]|(p[3]&&g[2])|(p[3]&&p[2]&&g[1])|(g[0]&&p[1]&&p[2]&&p[3])|(cin&&p[0]&&p[1]&&p[2]&&p[3]);
//assign s[3] = g[2]|(p[2]&&g[1])|(p[2]&&p[1]&&g[0])|(cin&&p[1]&&p[2]&&p[0]);
//assign s[2] = g[1]|(p[1]&&g[0])|(p[0]&&p[1]&&cin);
//assign s[1] = g[0]|(p[0]&&cin);
//assign s[0] = (cin^p[0]);
//endmodule

//module half_adder ( 
//    input a, 
//    input b, 
//    output sum,
//	 output carry);
//	assign carry = a & b;
//	assign sum = (a ^ b);
//	endmodule

//module min_max(

//    );
//endmodule
//module min_max (
//    input [3:0] a, b,
//    input cin,
//    output [3:0] s,
//    output Cout
//);
//    wire [3:0] p, g;  // propagate and generate signals
//    wire [3:0] c;     // carry signals
    
//    // Propagate (p) and Generate (g) signals
//    assign p = a ^ b;     // Propagate: P[i] = a[i] ^ b[i]
//    assign g = a & b;     // Generate: G[i] = a[i] & b[i]
    
//    // Carry calculation using lookahead logic
//    assign c[0] = cin;
//    assign c[1] = g[0] | (p[0] & c[0]);
//    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
//    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);

//    // Sum calculation
//    assign s = p ^ {c[2:0], cin};  // Sum: S[i] = P[i] ^ C[i]
    
//    // Carry out
//    assign Cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & c[0]);

//endmodule
