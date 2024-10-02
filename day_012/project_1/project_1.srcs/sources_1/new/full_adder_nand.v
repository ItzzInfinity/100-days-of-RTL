module full_adder_nand(
    input a,
    input b,
    input cin,
    output sum,
    output carry
);
    wire sum1, carry1, carry2;

    
    half_adder_nand ha1(.a(a), .b(b), .sum(sum1), .carry(carry1));
    half_adder_nand ha2(.a(sum1), .b(cin), .sum(sum), .carry(carry2));

   
    nand(carry, carry1, carry2);
endmodule
