module Test_Bench_Adder_1_bit;

    reg A, B, Cin;       // Three inputs: A, B, and Cin (carry-in)
    wire S, Cout;

    Adder_1_bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    // Testbench sequence
    initial begin
 
        // Apply test cases
        #200 A = 0; B = 0; Cin = 0;
        //$display("%b %b %b | %b", A, B, C, out);

        #200 A = 0; B = 0; Cin = 1;
        //$display("%b %b %b | %b", A, B, C, out);

        #200 A = 0; B = 1; Cin = 1; 
        //$display("%b %b %b | %b", A, B, C, out);

        #200 A = 1; B = 1; Cin = 1;
        //$display("%b %b %b | %b", A, B, C, out);

        #200 A = 0; B = 1; Cin = 0; 
        //$display("%b %b %b | %b", A, B, C, out);

        // Finish the simulation
        #300 $stop;
    end

endmodule
