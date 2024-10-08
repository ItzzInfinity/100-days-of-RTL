
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/11/2024 11:06:28 AM
// Module Name: even_parity_gen
//////////////////////////////////////////////////////////////////////////////////


module even_parity_gen(input [7:0] a,
output p_even,
output [8:0]b
);

assign p_even = ^a;
assign b = {a,p_even};
endmodule
