module NAND_2 (output W, input A, input B);
    supply1 Vdd;  // Positive power supply
    supply0 Gnd;  // Ground
     
    wire net_1;

    // Pull-up network using pMOS transistors (connected in parallel)
    pmos #(4, 7, 9) P1 (W, Vdd, A);  // pMOS with A as input
    pmos #(4, 7, 9) P2 (W, Vdd, B);  // pMOS with B as input

    // Pull-down network using nMOS transistors (connected in series)
    nmos #(3, 5, 7) N1 (W, net_1, B);  // nMOS with A as input
    nmos #(3, 5, 7) N2 (net_1, Gnd, A);  // nMOS with B as input

endmodule


