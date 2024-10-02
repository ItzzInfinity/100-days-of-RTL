module half_subtractor_nand(
    input a,
    input b,
    output diff,
    output borrow
);
    wire nand1, nand2, nand3, nand4;

    nand(nand1, a, b);
    nand(nand2, a, nand1);
    nand(nand3, b, nand1);
    nand(diff, nand2, nand3);

    nand(nand4, a, a);
    nand(borrow, nand4, b);
endmodule
