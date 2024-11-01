
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/01/2024 12:55:59 AM
// Module Name: majority_7
//////////////////////////////////////////////////////////////////////////////////


module majority_7 (
    input [6:0] in,  // 7 input lines
    output out       // Majority output
);


    wire [3:0] count;  

    // Count how many inputs are high using a simple adder
    assign count = in[0] + in[1] + in[2] + in[3] + in[4] + in[5] + in[6];

    // Output is high if count is greater than or equal to 4
    assign out = (count >= 4) ? 1'b1 : 1'b0;

endmodule
