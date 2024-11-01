
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/01/2024 01:03:20 AM
// Module Name: majority_7_tb
//////////////////////////////////////////////////////////////////////////////////


module majority_7_tb;
    reg [6:0] in;
    wire out;
    majority_7 dut (.in(in),.out(out));

    initial begin
        in = 7'b0000000;  // Test case 1: Majority of 0s
        #10; 
        in = 7'b1111111;  // Test case 2: Majority of 1s
        #10;
        in = 7'b1010101;
        #10;
        in = 7'b1000001;
        #10;
        in = 7'b1000011;
        #10;
        in = 7'b1000111;
        #10;
        $finish;
    end

endmodule