module Maj3 (output W, input A, input B, input C);
    // Using the assign statement for the Majority logic
    assign #(47, 41) W = (A & B) | (A & C) | (B & C);
endmodule
