//////////////////////////////////////////////////////////////////////////////////
// Engineer: 
// Create Date: 12/30/2024 08:40:19 AM
// Module Name: top
//////////////////////////////////////////////////////////////////////////////////


module top(input Clk,Rst_n,
input [7:0] bin,
output [6:0] seg,
output [3:0] digit

    );

    wire [3:0] ones_1,tens_1,hundreds_1; 
    
    binary_to_bcd BIN2BCD (.Rst_n(Rst_n),.clk(Clk),.bin({1'b0,bin}),.ones(ones_1),.tens(tens_1),.hundreds(hundreds_1));
    
    seven_segment_decoder sevDEC(.Clk(Clk),.ones(ones_1),.tens(tens_1),.hundreds(hundreds_1),.seg(seg),.digit(digit));



endmodule
