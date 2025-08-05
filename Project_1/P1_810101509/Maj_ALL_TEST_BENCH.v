module Maj_ALL_TEST_BENCH();
    reg A, B, C;
    wire W1, W2, W3;

    // Instantiate the Majority gates
    Maj1 maj1 (W1, A, B, C);       // Maj1: Switch-level Majority gate
    Maj2 maj2 (W2, A, B, C);       // Maj2: NAND and NOT implementation
    Maj3 maj3 (W3, A, B, C); // Maj3: assign-based implementation

    // Apply test data
    initial begin
        // Monitor output
        //$monitor("Time: %0t | A = %b, B = %b, C = %b | Y1 = %b, Y2 = %b, Y3 = %b", $time, A, B, C, Y1, Y2, Y3);

        // Initialize inputs
        A = 0; B = 0; C = 0;
        #15 A = 0; B = 0; C = 1;  // Test majority when A is 1

        #70 A = 0; B = 1; C = 1;  // Check for majority with A and B
        #70 A = 0; B = 0; C = 1;  // Check for all inputs being 1

        // Finish simulation
        #100 $stop;
    end
endmodule
