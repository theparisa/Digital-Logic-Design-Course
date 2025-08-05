module Q1_TEST_BENCH_2();
    reg A, B;
    wire W_nand, W_not, W_nand_v;
    
    // Instantiate the NAND gate
    NAND_2 nand_gate (W_nand, A, B);
    
    // Instantiate the NOT gate
    NOT_1 not_gate (W_not, A);
    
    // NAND gate primitive using worst-case delays
    nand #(14, 10) nand_v (W_nand_v, A, B);
    
    // Apply test data to cause worst-case delays
    initial begin
        // Monitor output
        //$monitor("Time: %0t | A = %b, B = %b, Y_nand = %b, Y_not = %b, Y_nand_prim = %b", $time, A, B, Y_nand, Y_not, Y_nand_prim);

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
