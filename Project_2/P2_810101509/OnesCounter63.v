module OnesCounter63 (
    input wire [62:0] I,   // 63-bit input
    output wire [5:0] S    // 6-bit output for number of ones in the input
);

    // Intermediate signals for carries and sums
    wire [1:0] sum1_1, sum1_2, sum1_3, sum1_4, sum1_5, sum1_6, sum1_7, sum1_8,
               sum1_9, sum1_10, sum1_11, sum1_12, sum1_13, sum1_14, sum1_15, sum1_16;
    wire [2:0] sum2_1, sum2_2, sum2_3, sum2_4, sum2_5, sum2_6, sum2_7, sum2_8;
    wire [3:0] sum3_1, sum3_2, sum3_3, sum3_4;
    wire [4:0] sum4_1, sum4_2;

    wire c_out0, c_out1, c_out2, c_out3, c_out4, c_out5;

    // Count ones from I[0] to I[6]
    Adder_1_bit adder1_1 (
        .A(I[0]), .B(I[1]), .Cin(I[2]), .S(sum1_1[0]), .Cout(sum1_1[1])
    );

    Adder_1_bit adder1_2 (
        .A(I[3]), .B(I[4]), .Cin(I[5]), .S(sum1_2[0]), .Cout(sum1_2[1])
    );

    Adder_2_bit adder2_1 (
        .A(sum1_1), .B(sum1_2), .Cin(I[6]), .S(sum2_1[1:0]), .Cout(sum2_1[2])
    );

    // Count ones from I[7] to I[13]
    Adder_1_bit adder1_3 (
        .A(I[7]), .B(I[8]), .Cin(I[9]), .S(sum1_3[0]), .Cout(sum1_3[1])
    );

    Adder_1_bit adder1_4 (
        .A(I[10]), .B(I[11]), .Cin(I[12]), .S(sum1_4[0]), .Cout(sum1_4[1])
    );

    Adder_2_bit adder2_2 (
        .A(sum1_3), .B(sum1_4), .Cin(I[13]), .S(sum2_2[1:0]), .Cout(sum2_2[2])
    );

    // Combine results from I[0] to I[13] using a 3-bit adder
    Adder_3_bit adder3_1 (
        .A(sum2_1), .B(sum2_2), .Cin(I[14]), .S(sum3_1[2:0]), .Cout(sum3_1[3])
    );



    // Count ones from I[15] to I[29] using similar structure
    Adder_1_bit adder1_5 (
        .A(I[15]), .B(I[16]), .Cin(I[17]), .S(sum1_5[0]), .Cout(sum1_5[1])
    );

    Adder_1_bit adder1_6 (
        .A(I[18]), .B(I[19]), .Cin(I[20]), .S(sum1_6[0]), .Cout(sum1_6[1])
    );

    Adder_2_bit adder2_3 (
        .A(sum1_5), .B(sum1_6), .Cin(I[21]), .S(sum2_3[1:0]), .Cout(sum2_3[2])
    );

    Adder_1_bit adder1_7 (
        .A(I[22]), .B(I[23]), .Cin(I[24]), .S(sum1_7[0]), .Cout(sum1_7[1])
    );

    Adder_1_bit adder1_8 (
        .A(I[25]), .B(I[26]), .Cin(I[27]), .S(sum1_8[0]), .Cout(sum1_8[1])
    );

    Adder_2_bit adder2_4 (
        .A(sum1_7), .B(sum1_8), .Cin(I[28]), .S(sum2_4[1:0]), .Cout(sum2_4[2])
    );

    // Combine results from I[15] to I[29] using a 3-bit adder
    Adder_3_bit adder3_2 (
        .A(sum2_3), .B(sum2_4), .Cin(I[29]), .S(sum3_2[2:0]), .Cout(sum3_2[3])
    );



    // Combine results from I[0] to I[29] using a 4-bit adder
    Adder_4_bit adder4_1 (
        .A(sum3_1), .B(sum3_2), .Cin(I[30]), .S(sum4_1[3:0]), .Cout(sum4_1[4])
    );




    // Count ones from I[31] to I[61] using similar structure
    Adder_1_bit adder1_9 (
        .A(I[31]), .B(I[32]), .Cin(I[33]), .S(sum1_9[0]), .Cout(sum1_9[1])
    );

    Adder_1_bit adder1_10 (
        .A(I[34]), .B(I[35]), .Cin(I[36]), .S(sum1_10[0]), .Cout(sum1_10[1])
    );

    Adder_2_bit adder2_5 (
        .A(sum1_9), .B(sum1_10), .Cin(I[37]), .S(sum2_5[1:0]), .Cout(sum2_5[2])
    );

    Adder_1_bit adder1_11 (
        .A(I[38]), .B(I[39]), .Cin(I[40]), .S(sum1_11[0]), .Cout(sum1_11[1])
    );

    Adder_1_bit adder1_12 (
        .A(I[41]), .B(I[42]), .Cin(I[43]), .S(sum1_12[0]), .Cout(sum1_12[1])
    );

    Adder_2_bit adder2_6 (
        .A(sum1_11), .B(sum1_12), .Cin(I[44]), .S(sum2_6[1:0]), .Cout(sum2_6[2])
    );

    // Combine results from I[31] to I[61] using a 3-bit adder
    Adder_3_bit adder3_3 (
        .A(sum2_5), .B(sum2_6), .Cin(I[45]), .S(sum3_3[2:0]), .Cout(sum3_3[3])
    );


    Adder_1_bit adder1_13 (
        .A(I[46]), .B(I[47]), .Cin(I[48]), .S(sum1_13[0]), .Cout(sum1_13[1])
    );

    Adder_1_bit adder1_14 (
        .A(I[49]), .B(I[50]), .Cin(I[51]), .S(sum1_14[0]), .Cout(sum1_14[1])
    );

    Adder_2_bit adder2_7 (
        .A(sum1_13), .B(sum1_14), .Cin(I[52]), .S(sum2_7[1:0]), .Cout(sum2_7[2])
    );

    Adder_1_bit adder1_15 (
        .A(I[53]), .B(I[54]), .Cin(I[55]), .S(sum1_15[0]), .Cout(sum1_15[1])
    );

    Adder_1_bit adder1_16 (
        .A(I[56]), .B(I[57]), .Cin(I[58]), .S(sum1_16[0]), .Cout(sum1_16[1])
    );

    Adder_2_bit adder2_8 (
        .A(sum1_15), .B(sum1_16), .Cin(I[59]), .S(sum2_8[1:0]), .Cout(sum2_8[2])
    );

    // Combine results from I[15] to I[29] using a 3-bit adder
    Adder_3_bit adder3_4 (
        .A(sum2_7), .B(sum2_8), .Cin(I[60]), .S(sum3_4[2:0]), .Cout(sum3_4[3])
    );

    // Combine results from I[0] to I[29] using a 4-bit adder
    Adder_4_bit adder4_2 (
        .A(sum3_3), .B(sum3_4), .Cin(I[61]), .S(sum4_2[3:0]), .Cout(sum4_2[4])
    );





    // Final 5-bit adder to sum all ones from I[0] to I[61]
    Adder_5_bit adder5_0 (
        .A(sum4_1), .B(sum4_2), .Cin(I[62]), .S(S), .Cout()
    );

endmodule
