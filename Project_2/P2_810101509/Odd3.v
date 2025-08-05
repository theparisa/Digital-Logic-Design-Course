module Odd3 (
    input wire A,    // First input
    input wire B,    // Second input
    input wire C,    // Third input
    output wire W    // Output
);

assign #(50) W = A ^ B ^ C; // XOR operation for 3 inputs

endmodule
