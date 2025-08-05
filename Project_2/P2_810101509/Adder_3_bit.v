module Adder_3_bit (
    input wire [2:0] A, B,   // 3-bit inputs
    input wire Cin,          // Carry-in for the least significant bit
    output wire [2:0] S,     // 3-bit sum output
    output wire Cout         // Carry-out from the most significant bit
);

    wire C1;                 // Intermediate carry between the 2-bit and 1-bit adders

    // 2-bit adder for the first two bits
    Adder_2_bit adder0 (
        .A(A[1:0]),
        .B(B[1:0]),
        .Cin(Cin),
        .S(S[1:0]),
        .Cout(C1)
    );

    // 1-bit adder for the most significant bit
    Adder_1_bit adder1 (
        .A(A[2]),
        .B(B[2]),
        .Cin(C1),
        .S(S[2]),
        .Cout(Cout)
    );

endmodule
