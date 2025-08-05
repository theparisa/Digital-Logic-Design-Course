module Adder_4_bit (
    input wire [3:0] A, B,   // 4-bit inputs
    input wire Cin,          // Carry-in for the least significant bit
    output wire [3:0] S,     // 4-bit sum output
    output wire Cout         // Carry-out from the most significant bit
);

    wire C1;                 // Intermediate carry between the two 2-bit adders

    // First 2-bit adder for the least significant bits
    Adder_2_bit adder0 (
        .A(A[1:0]),
        .B(B[1:0]),
        .Cin(Cin),
        .S(S[1:0]),
        .Cout(C1)
    );

    // Second 2-bit adder for the most significant bits
    Adder_2_bit adder1 (
        .A(A[3:2]),
        .B(B[3:2]),
        .Cin(C1),
        .S(S[3:2]),
        .Cout(Cout)
    );

endmodule
