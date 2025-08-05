module Q4 (
    input wire A, B, C,       // Three inputs
    output wire [1:0] out     // 2-bit output {maj_out, odd3_out}
);

    wire maj_out, odd3_out;   // Internal signals for Majority and Odd3 outputs

    // Instantiating the Majority gate (Maj3)
    Maj3 maj_gate (
        .W(maj_out),          // Connecting to the output of Majority gate
        .A(A),                // Connecting input A
        .B(B),                // Connecting input B
        .C(C)                 // Connecting input C
    );

    // Instantiating the Odd3 gate (3-input XOR)
    Odd3 odd3_gate (
        .W(odd3_out),         // Connecting to the output of Odd3 (3-input XOR)
        .A(A),                // Connecting input A
        .B(B),                // Connecting input B
        .C(C)                 // Connecting input C
    );

    // Combine maj_out and odd3_out into a 2-bit output
    assign out = {maj_out, odd3_out};

endmodule

