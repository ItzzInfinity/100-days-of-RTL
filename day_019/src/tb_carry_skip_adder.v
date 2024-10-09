`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/10/2024 09:12:03 AM
// Module Name: tb_carry_skip_adder
//////////////////////////////////////////////////////////////////////////////////

module tb_carry_skip_adder;
    reg [3:0] a, b;
    reg c;
    wire [3:0] sum;
    wire cout;
    wire [4:0] total;
   
    carry_skip_adder uut (.a(a),.b(b),.c(c), .sum(sum), .cout(cout));
assign total = {cout,sum};
   
    initial begin
      
        $monitor("Time=%0t | a=%d, b=%d, c=%b | total=%d  | sum=%d, cout=%b", $time, a, b, c,total, sum, cout);
        a = 4'b0001; b = 4'b0010; c = 1'b0; 
        #10;
        a = 4'b0110; b = 4'b0101; c = 1'b0;
        #10;
        a = 4'b1111; b = 4'b0001; c = 1'b1;
        #10;
        a = 4'b1010; b = 4'b0101; c = 1'b1;
        #10;
        a = 4'b1111; b = 4'b1111; c = 1'b0;
        #10;
        a = 4'b1100; b = 4'b0011; c = 1'b1;
        #10;

        $stop; 
    end
endmodule
