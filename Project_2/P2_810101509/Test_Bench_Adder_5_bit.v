module Test_Bench_Adder_5_bit;

    reg [4:0]A, B;
    reg Cin;
    wire [4:0]S;
    wire Cout;

    Adder_5_bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    // Testbench sequence
    initial begin
 
        // Apply test cases
        #400 A = 5'd4; B = 5'd5; Cin = 0;

        #400 A = 5'd2; B = 5'd6; Cin = 0;

        #400 A = 5'd12; B = 5'd8; Cin = 1;

        #400 A = 5'd30; B = 5'd1; Cin = 0;

        #400 A = 5'd30; B = 5'd1; Cin = 1; 

        // Finish the simulation
        #500 $stop;
    end

endmodule
