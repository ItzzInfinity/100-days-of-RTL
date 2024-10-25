
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/25/2024 07:01:43 AM
// Module Name: priority_encoder
//////////////////////////////////////////////////////////////////////////////////

module IC_74148(
    input[7:0]d,
    input En,
    output reg [2:0]a,
    output reg Group_signal,Enable_output);

    always @(*)begin
        if(~En)begin
            casex(d)
                8'b11111111:begin
                    a = 3'b111;Group_signal = 1;Enable_output = 0;
                end
                8'bxxxxxxx0:begin
                    a = 3'b000;Group_signal = 0;Enable_output = 1;
                end
                8'bxxxxxx01:begin
                    a = 3'b001;Group_signal = 0;Enable_output = 1;
                end
                8'bxxxxx011:begin
                    a = 3'b010;Group_signal = 0;Enable_output = 1;
                end
                8'bxxxx0111:begin
                    a = 3'b011;Group_signal = 0;Enable_output = 1;
                end
                8'bxxx01111:begin
                    a = 3'b100;Group_signal = 0;Enable_output = 1;
                end
                8'bxx011111:begin
                    a = 3'b101;Group_signal = 0;Enable_output = 1;
                end
                8'bx0111111:begin
                    a = 3'b110;Group_signal = 0;Enable_output = 1;
                end
                8'b01111111:begin
                    a = 3'b111;Group_signal = 0;Enable_output = 1;
                end
              endcase
            end
       else begin
          casex(d)
                8'bxxxxxxxx:begin
                    a = 3'b111;Group_signal = 1;Enable_output = 1;
                end
          endcase
        end
    end
endmodule
