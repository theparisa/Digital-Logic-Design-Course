module Adder_1_bit (
    input wire A, B, Cin,       // Three inputs: A, B, and Cin (carry-in)
    output wire S, Cout         // Outputs: S (sum) and Cout (carry-out)
);

    wire maj_out, odd3_out;     // Internal signals for Majority and Odd3 outputs

    // Majority gate to calculate Cout (majority of A, B, and Cin)
    Maj3 maj_gate (
        .W(maj_out),            // Connect to the output of Majority gate
        .A(A),
        .B(B),
        .C(Cin)
    );

    // Odd3 gate to calculate S (3-input XOR for sum)
    Odd3 odd3_gate (
        .W(odd3_out),           // Connect to the output of Odd3 (3-input XOR)
        .A(A),
        .B(B),
        .C(Cin)
    );

    assign S = odd3_out;        // Sum output
    assign Cout = maj_out;      // Carry-out output

endmodule

