module Test_Bench_Adder_3_bit;

    reg [2:0]A, B;
    reg Cin;   
    wire [2:0]S;
    wire Cout;

    Adder_3_bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    // Testbench sequence
    initial begin
 
        // Apply test cases
        #250 A = 3'b001; B = 3'b001; Cin = 0;

        #250 A = 3'b010; B = 3'b011; Cin = 0;

        #250 A = 3'b110; B = 3'b010; Cin = 1;

        #250 A = 3'b001; B = 3'b110; Cin = 0;

        #250 A = 3'b001; B = 3'b110; Cin = 1; 

        // Finish the simulation
        #300 $stop;
    end

endmodule