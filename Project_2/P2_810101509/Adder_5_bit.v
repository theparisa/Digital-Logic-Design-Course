module Adder_5_bit (
    input wire [4:0] A, B,   // 5-bit inputs
    input wire Cin,          // Carry-in for the least significant bit
    output wire [4:0] S,     // 5-bit sum output
    output wire Cout         // Carry-out from the most significant bit
);

    wire C1;                 // Intermediate carry between the 2-bit and 3-bit adders

    // 2-bit adder for the least significant bits
    Adder_2_bit adder0 (
        .A(A[1:0]),
        .B(B[1:0]),
        .Cin(Cin),
        .S(S[1:0]),
        .Cout(C1)
    );

    // 3-bit adder for the remaining bits
    Adder_3_bit adder1 (
        .A(A[4:2]),
        .B(B[4:2]),
        .Cin(C1),
        .S(S[4:2]),
        .Cout(Cout)
    );

endmodule
