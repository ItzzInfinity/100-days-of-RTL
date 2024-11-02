
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/02/2024 04:31:54 AM
// Module Name: Bin_to_Grey
//////////////////////////////////////////////////////////////////////////////////

/* Binary to Grey Code Converters */
module Bin_to_Grey(
input [3:0] b,
output [3:0]g);
assign g[0] = b[0] ^ b[1];
assign g[1] = b[1] ^ b[2];
assign g[2] = b[2] ^ b[3];
assign g[3] = b[3];
endmodule
