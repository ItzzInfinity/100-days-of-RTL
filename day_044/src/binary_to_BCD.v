`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad 
// Create Date: 11/04/2024 07:01:00 AM
// Module Name: binary_to_BCD
//////////////////////////////////////////////////////////////////////////////////

module binary_to_BCD(
input clk,
 input [8:0] bin,
   output reg [15:0] bcd,
   output reg [3:0] ones,tens,hundreds
   );
   
integer i;
	
always @(posedge clk) begin
    bcd=0;		 	
    for (i=0;i<9;i=i+1) begin					//Iterate once for each bit in input number
        if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;		//If any BCD digit is >= 5, add three
	if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
	if (bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 3;
	if (bcd[15:12] >= 5) bcd[15:12] = bcd[15:12] + 3;
	bcd = {bcd[14:0],bin[8-i]};				//Shift one bit, and shift in proper bit from input 
	ones = bcd[3:0];
	tens = bcd[7:4];
	hundreds = bcd[11:8];
    end
end
endmodule
 
