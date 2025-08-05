module Maj1_TEST_BENCH();
    reg A, B, C;
    wire W;

    // Instantiate the Majority gate
    Maj1 maj_gate (W, A, B, C);

    // Apply test data to cause worst-case delays
    initial begin
        // Monitor output
        //$monitor("Time: %0t | A = %b, B = %b, C = %b, Y = %b", $time, A, B, C, W);

        // Initialize inputs
        A = 0; B = 0; C = 0;
        #35 A = 0; B = 1; C = 1;  // Test majority when A is 1

        #50 A = 0; B = 0; C = 1;  // Check for majority with A and B
        #50 A = 0; B = 1; C = 1;  // Check for all inputs being 1

        // Finish simulation
        #150 $stop;
    end
endmodule
