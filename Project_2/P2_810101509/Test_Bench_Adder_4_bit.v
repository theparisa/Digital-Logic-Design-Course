module Test_Bench_Adder_4_bit;

    reg [3:0]A, B, Cin;       // Three inputs: A, B, and Cin (carry-in)
    wire [3:0]S;
    wire Cout;

    Adder_4_bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    // Testbench sequence
    initial begin
 
        // Apply test cases
        #350 A = 4'd5; B = 4'd3; Cin = 0;

        #350 A = 4'd7; B = 4'd3; Cin = 1;

        #350 A = 4'd9; B = 4'd4; Cin = 0;

        #350 A = 4'd14; B = 4'd1; Cin = 0;

        #350 A = 4'd14; B = 4'd1; Cin = 1; 

        // Finish the simulation
        #400 $stop;
    end

endmodule