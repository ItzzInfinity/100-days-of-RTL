
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/23/2024 06:10:57 AM
// Module Name: mux_comp
//////////////////////////////////////////////////////////////////////////////////


module mux_comp(
    input a,b,
    output lessThan, greaterThan, equalTo
    );
      
    mux_4_to_1 M1(4'b1001,{a,b},equalTo);
    mux_4_to_1 M2(4'b0100,{a,b},lessThan);
    mux_4_to_1 M3(4'b0010,{a,b},greaterThan);

endmodule
