module Test_Bench_Adder_2_bit;

    reg [1:0]A, B;
    reg Cin;
    wire [1:0]S;
    wire Cout;

    Adder_2_bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    // Testbench sequence
    initial begin
 
        // Apply test cases
        #200 A = 2'b00; B = 2'b10; Cin = 0;

        #200 A = 2'b00; B = 2'b00; Cin = 0;

        #200 A = 2'b10; B = 2'b00; Cin = 0;

        #200 A = 2'b10; B = 2'b01; Cin = 0;

        #200 A = 2'b10; B = 2'b01; Cin = 1; 

        // Finish the simulation
        #300 $stop;
    end

endmodule