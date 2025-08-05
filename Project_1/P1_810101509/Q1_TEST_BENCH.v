module Q1_TEST_BENCH();
    reg A, B;
    wire W_nand, W_not;
    
    // Instantiate the NAND gate
    NAND_2 nand_gate (W_nand, A, B);
    
    // Instantiate the NOT gate
    NOT_1 not_gate (W_not, A);
    
    // Apply test data to cause worst-case delays
    initial begin
        // Monitor output
        //$monitor("Time: %0t | A = %b, B = %b, Y_nand = %b, Y_not = %b", $time, A, B, Y_nand, Y_not);

        // Initialize inputs
        A = 0; B = 0;

        #15 B = 1; A = 0;  // Worst case delay for NAND gate occurs when A and B both switch

        #20 B = 1; A = 1;  // Change inputs again to check for steady state
        
	#25 B = 1; A = 0;

        // Apply input to NOT gate for worst-case delay
        #30 A = 1;
        #35 A = 0;

        // Finish simulation
        #100 $stop;
    end
endmodule

