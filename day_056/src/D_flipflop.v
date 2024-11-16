
module D_flipflop(
    input d, clk, reset,
    output reg Q
    );
    
    always @(posedge clk) begin
        if (reset)
            Q <= 1'b0;
        else 
            Q <= d;
    end

endmodule