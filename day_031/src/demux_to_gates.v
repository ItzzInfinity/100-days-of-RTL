
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/22/2024 06:19:32 AM
// Module Name: demux_to_gates
//////////////////////////////////////////////////////////////////////////////////


module demux_to_gates(
    input a, b,
    output and_g,or_g,nand_g,nor_g
    );
    wire w0,w1, w2, w3,w4,w5,w6,w7,w8,w9,w10,w11;
    
    demux_1_to_2 andgate(b, a, w0, and_g);
    
    
    demux_1_to_2 gate(b, ~a, w1, w2);
    demux_1_to_2 not_t1(w1, 1'b1, or_g, w3);
    
    
    demux_1_to_2 nandgate(b, a, w4, w5);
    demux_1_to_2 not_t2(w5, 1'b1, nand_g, w6);
    
    
    demux_1_to_2 norgate(b, ~a, nor_g, w7);
    
   
endmodule

