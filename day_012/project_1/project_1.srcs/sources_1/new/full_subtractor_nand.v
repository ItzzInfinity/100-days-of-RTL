module full_subtractor_nand(
    input a,
    input b,
    input bin,
    output diff,
    output borrow
);
    wire diff1, borrow1, borrow2;

    
    half_subtractor_nand hs1(.a(a), .b(b), .diff(diff1), .borrow(borrow1));
    half_subtractor_nand hs2(.a(diff1), .b(bin), .diff(diff), .borrow(borrow2));

  
    nand(borrow, borrow1, borrow2);
endmodule
