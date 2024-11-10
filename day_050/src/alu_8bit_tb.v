
//////////////////////////////////////////////////////////////////////////////////
// Engineer: 
// Create Date: 11/10/2024 05:24:45 AM
// Module Name: alu_8bit_tb
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module tb_alu_8bit;

                                                                                                                    // Inputs
    reg [7:0] A;
    reg [7:0] B;
    reg [3:0] opcode;

                                                                                                                    // Outputs
    wire [7:0] result;
    wire carry;
    wire zero;
    wire overflow;
    wire sign;

                                                                                                                    // Instantiate the ALU
    alu_8bit uut (
        .A(A),.B(B),.opcode(opcode),.result(result),.carry(carry),.zero(zero),.overflow(overflow),.sign(sign)
    );

                                                                                                                    // Task to display results
    task display_results;
        input [7:0] A;
        input [7:0] B;
        input [3:0] opcode;
        input [7:0] expected_result;
        input expected_carry;
        input expected_zero;
        input expected_overflow;
        input expected_sign;
        begin
                                                                                                                    // Display the results
            $display("A = %b, B = %b, Opcode = %b | Result = %b, Carry = %b, Zero = %b, Overflow = %b, Sign = %b", 
                     A, B, opcode, result, carry, zero, overflow, sign);
                                                                                                                    // Check the results
            if (result !== expected_result) 
                $display("Error: Expected Result = %b", expected_result);
            if (carry !== expected_carry) 
                $display("Error: Expected Carry = %b", expected_carry);
            if (zero !== expected_zero) 
                $display("Error: Expected Zero = %b", expected_zero);
            if (overflow !== expected_overflow) 
                $display("Error: Expected Overflow = %b", expected_overflow);
            if (sign !== expected_sign) 
                $display("Error: Expected Sign = %b", expected_sign);
        end
    endtask

    initial begin
                                                                                                                    // Test Addition
        A = 8'b00001111; B = 8'b00000001; opcode = 4'b0000;                                                         // 15 + 1
        #10 display_results(A, B, opcode, 8'b00010000, 1'b0, 1'b0, 1'b0, 1'b0);                                     // Expected: 16, no carry, no zero, no overflow, positive

        A = 8'b01111111; B = 8'b00000001; opcode = 4'b0000;                                                         // 127 + 1
        #10 display_results(A, B, opcode, 8'b10000000, 1'b0, 1'b0, 1'b1, 1'b1);                                     // Expected: 128, no carry, no zero, overflow, negative

                                                                                                                    // Test Subtraction
        A = 8'b00001000; B = 8'b00000100; opcode = 4'b0001;                                                         // 8 - 4
        #10 display_results(A, B, opcode, 8'b00000100, 1'b0, 1'b0, 1'b0, 1'b0);                                     // Expected: 4, no carry, no zero, no overflow, positive

        A = 8'b00001000; B = 8'b00001000; opcode = 4'b0001;                                                         // 8 - 8
        #10 display_results(A, B, opcode, 8'b00000000, 1'b0, 1'b1, 1'b0, 1'b0);                                     // Expected: 0, no carry, zero, no overflow, positive

        A = 8'b00000000; B = 8'b00000001; opcode = 4'b0001;                                                         // 0 - 1
        #10 display_results(A, B, opcode, 8'b11111111, 1'b1, 1'b0, 1'b0, 1'b1);                                     // Expected: 255, carry (borrow), no zero, no overflow, negative

                                                                                                                    // Test Logical Operations
        A = 8'b11001100; B = 8'b10101010; opcode = 4'b0010;                                                         // A AND B
        #10 display_results(A, B, opcode, 8'b10001000, 1'b0, 1'b0, 1'b0, 1'b0);                                     // Expected: 136, no carry, no zero, no overflow, positive

        A = 8'b11001100; B = 8'b10101010; opcode = 4'b0011;                                                         // A OR B
        #10 display_results(A, B, opcode, 8'b11101110, 1'b0, 1'b0, 1'b0, 1'b0);                                     // Expected: 238, no carry, no zero, no overflow, positive

        A = 8'b11001100; B = 8'b10101010; opcode = 4'b0100;                                                         // A XOR B
        #10 display_results(A, B, opcode, 8'b01100110, 1'b0, 1'b0, 1'b0, 1'b0);                                     // Expected: 102, no carry, no zero, no overflow, positive

        A = 8'b00001111; opcode = 4'b0101;                                                                          // NOT A
        #10 display_results(A, B, opcode, 8'b11110000, 1'b0, 1'b0, 1'b0, 1'b1);                                     // Expected: 240, no carry, no zero, no overflow, negative

                                                                                                                    // Test Shift Operations
        A = 8'b00001111; opcode = 4'b0110;                                                                          // A LSHIFT
        #10 display_results(A, B, opcode, 8'b00011110, 1'b0, 1'b0, 1'b0, 1'b0);                                     // Expected: 30, no carry, no zero, no overflow, positive

        A = 8'b00001111; opcode = 4'b0111;                                                                          // A RSHIFT
        #10 display_results(A, B, opcode, 8'b00000111, 1'b0, 1'b0, 1'b0, 1'b0);                                     // Expected: 7, no carry, no zero, no overflow, positive

                                                                                                                    // Test Comparison Operations
        A = 8'b00001000; B = 8'b00000100; opcode = 4'b1000;                                                         // A < B
        #10 display_results(A, B, opcode, 8'b00000000, 1'b0, 1'b0, 1'b0, 1'b0);                                     // Expected: 0, no carry, no zero, no overflow, positive

        A = 8'b00000100; B = 8'b00001000; opcode = 4'b1000;                                                         // A < B
        #10 display_results(A, B, opcode, 8'b00000001, 1'b0, 1'b0, 1'b0, 1'b0);                                     // Expected: 1, no carry, no zero, no overflow, positive

        A = 8'b00001000; B = 8'b00001000; opcode = 4'b1001;                                                         // A == B
        #10 display_results(A, B, opcode, 8'b00000001, 1'b0, 1'b0, 1'b0, 1'b0);                                     // Expected: 1, no carry, no zero, no overflow, positive

                                                                                                                    // Test Increment and Decrement
        A = 8'b00001111; opcode = 4'b1010;                                                                          // Increment A
        #10 display_results(A, B, opcode, 8'b00010000, 1'b0, 1'b0, 1'b0, 1'b0);                                     // Expected: 16, no carry, no zero, no overflow, positive

        A = 8'b00000001; opcode = 4'b1011;                                                                          // Decrement A
        #10 display_results(A, B, opcode, 8'b00000000, 1'b0, 1'b1, 1'b0, 1'b0);                                     // Expected: 0, no carry, zero, no overflow, positive

        A = 8'b00000000; opcode = 4'b1011;                                                                          // Decrement A
        #10 display_results(A, B, opcode, 8'b11111111, 1'b1, 1'b0, 1'b0, 1'b1);                                     // Expected: 255, carry, no zero, no overflow, negative

                                                                                                                    // Test Multiplication
        A = 8'b00000010; B = 8'b00000010; opcode = 4'b1100;                                                         // 2 * 2
        #10 display_results(A, B, opcode, 8'b00000100, 1'b0, 1'b0, 1'b0, 1'b0);                                     // Expected: 4, no carry, no zero, no overflow, positive

        A = 8'b00001000; B = 8'b00000010; opcode = 4'b1100;                                                         // 8 * 2
        #10 display_results(A, B, opcode, 8'b00010000, 1'b0, 1'b0, 1'b0, 1'b0);                                     // Expected: 16, no carry, no zero, no overflow, positive

                                                                                                                    // Test Division
        A = 8'b00001000; B = 8'b00000010; opcode = 4'b1101;                                                         // 8 / 2
        #10 display_results(A, B, opcode, 8'b00000100, 1'b0, 1'b0, 1'b0, 1'b0);                                     // Expected: 4, no carry, no zero, no overflow, positive

        A = 8'b00000000; B = 8'b00000001; opcode = 4'b1101;                                                         // 0 / 1
        #10 display_results(A, B, opcode, 8'b00000000, 1'b0, 1'b1, 1'b0, 1'b0);                                     // Expected: 0, no carry, zero, no overflow, positive

        A = 8'b00001000; B = 8'b00000000; opcode = 4'b1101;                                                         // Division by zero
        #10 display_results(A, B, opcode, 8'b00000000, 1'b1, 1'b0, 1'b0, 1'b0);                                     // Expected: 0, carry for division by zero

                                                                                                                    // End of simulation
        $finish;
    end
endmodule
