module Test_Bench_OnesCounter63;

    reg [62:0]I;
    wire [5:0]S;


    OnesCounter63 uut (
        .I(I),
        .S(S)
    );

    // Testbench sequence
    initial begin
 
        // Apply test cases
	#400000 I = 63'h0000000000000001;  // Example test case with one '1' bit
	
	#400000 I = 63'h0000000000000071;
	
	#400000 I = 63'h0000000000000F71;
	
	#400000 I = 63'h7FFFFFFFFFFFFFFF;  // All bits set to '1' except the MSB


        // Finish the simulation
        #500000 $stop;
    end

endmodule
