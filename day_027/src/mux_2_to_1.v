module mux_2_to_1(
    input a,b,
    input sel,
    output y_out    
    );
    assign y_out= sel ? b : a;
endmodule