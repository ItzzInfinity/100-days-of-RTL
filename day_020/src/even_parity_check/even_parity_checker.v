
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/11/2024 11:55:12 AM
// Module Name: even_parity_checker
//////////////////////////////////////////////////////////////////////////////////


module even_parity_checker(
    input [7:0] a,
    input manual_entry,
    output p_check,error,
    output [8:0]b
);
    
    even_parity_gen PARITY(.a(a),.b(b)); 
   assign p_check =(manual_entry==0)?^b[8:1]:1'b1; //created a 2 to 1 mux to enter parity bit and check
   assign error = (b[0]==p_check)?1'b0:1'b1;
    
endmodule
