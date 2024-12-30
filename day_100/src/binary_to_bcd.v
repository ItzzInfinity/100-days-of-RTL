`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/14/2024 11:49:46 PM
// Module Name: binary_to_bcd
//////////////////////////////////////////////////////////////////////////////////


//module binary_to_bcd (
//    input wire [7:0] binary,  // 8-bit binary input
//    output reg [11:0] bcd     // 12-bit BCD output (3 BCD digits)
//);
//    integer i;
    
//    always @(*) begin
//        // Initialize BCD output to 0
//        bcd = 12'b000000000000;

//        // Loop over all bits in the binary number (8 bits)
//        for (i = 7; i >= 0; i = i - 1) begin
//            // Shift the BCD digits left by 1 bit
//            bcd = bcd << 1;

//            // Place the next binary bit into the least significant bit of BCD
//            bcd[0] = binary[i];

//            // Add 3 to any BCD digit that is 5 or greater
//            if (bcd[11:8] >= 5)
//                bcd[11:8] = bcd[11:8] + 3;
//            if (bcd[7:4] >= 5)
//                bcd[7:4] = bcd[7:4] + 3;
//            if (bcd[3:0] >= 5)
//                bcd[3:0] = bcd[3:0] + 3;
//        end
//    end
//endmodule

module binary_to_bcd(
input wire clk,Rst_n,
 input [8:0] bin,
   output reg [15:0] bcd,
   output reg [3:0] ones,tens,hundreds
   );
   
integer i;
	
always @(posedge clk or negedge Rst_n) begin
    if (!Rst_n)begin
    bcd<=0;
    end else begin
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
end
endmodule
 