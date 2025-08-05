module Maj2 (output W, input A, input B, input C);

    wire net_1, net_2, net_3, net_4, net_5;

    // Implementing the logic using NAND gates
    nand #(14, 10) nand1 (net_1, A, B);
    nand #(14, 10) nand2 (net_2, B, C);
    nand #(14, 10) nand3 (net_3, A, C);
    nand #(14, 10) nand4 (net_4, net_2, net_3);
    nand #(14, 10) nand5 (W, net_1, net_5);

    not #(7, 9) not1 (net_5, net_4);

endmodule

