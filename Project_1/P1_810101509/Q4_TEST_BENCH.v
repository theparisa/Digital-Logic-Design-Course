module Q4_TEST_BENCH;

    // Testbench signals
    reg A, B, C;               // Inputs for the testbench
    wire [1:0] out;            // Output from the Maj_Odd3_Combined module

    // Instantiate the Maj_Odd3_Combined module
    Q4 uut (
        .A(A),
        .B(B),
        .C(C),
        .out(out)
    );

    // Testbench sequence
    initial begin
        // Display header
        //$display("A B C | Combined Output (maj_out, odd3_out)");

        // Apply test cases
        #20 A = 0; B = 0; C = 0;
        //$display("%b %b %b | %b", A, B, C, out);

        #60 A = 0; B = 0; C = 1;
        //$display("%b %b %b | %b", A, B, C, out);

        #60 A = 0; B = 1; C = 1; 
        //$display("%b %b %b | %b", A, B, C, out);

        #100 A = 1; B = 1; C = 1;
        //$display("%b %b %b | %b", A, B, C, out);

        #60 A = 0; B = 1; C = 0; 
        //$display("%b %b %b | %b", A, B, C, out);

        // Finish the simulation
        #100 $stop;
    end

endmodule

