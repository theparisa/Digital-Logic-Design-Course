module Adder_2_bit (
    input wire [1:0] A, B,     // 2-bit inputs
    input wire Cin,            // Carry-in for the least significant bit
    output wire [1:0] S,       // 2-bit sum output
    output wire Cout           // Carry-out from the most significant bit
);

    wire C1;                   // Intermediate carry between the two 1-bit adders

    // First 1-bit adder (LSB)
    Adder_1_bit adder0 (
        .A(A[0]),
        .B(B[0]),
        .Cin(Cin),
        .S(S[0]),
        .Cout(C1)
    );

    // Second 1-bit adder (MSB)
    Adder_1_bit adder1 (
        .A(A[1]),
        .B(B[1]),
        .Cin(C1),
        .S(S[1]),
        .Cout(Cout)
    );

endmodule
