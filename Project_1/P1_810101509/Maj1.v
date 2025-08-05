module Maj1 (output W, input A, input B, input C);
    supply1 Vdd;  // Positive power supply
    supply0 Gnd;  // Ground

    wire p_net1, p_net2, p_net3,
         n_net1, n_net2, n_net,
         not_A, not_B, not_C;


    not #(7,9) Not1 (not_A, A);
    not #(7,9) Not2 (not_B, B);
    not #(7,9) Not3 (not_C, C);

    // Pull-up network using pMOS transistors (inverted inputs)
    pmos #(4, 7, 9) P1 (p_net1, Vdd, not_A);
    pmos #(4, 7, 9) P2 (W, p_net1, not_B); 

    pmos #(4, 7, 9) P3 (p_net2, Vdd, not_B);
    pmos #(4, 7, 9) P4 (W, p_net2, not_C);

    pmos #(4, 7, 9) P5 (p_net3, Vdd, not_A);
    pmos #(4, 7, 9) P6 (W, p_net3, not_C);

    // Pull-down network using nMOS transistors (complement of A.B + A.C + B.C)

    nmos #(3, 5, 7) N3 (n_net1, Gnd, not_B);
    nmos #(3, 5, 7) N4 (n_net1, Gnd, not_C);

    nmos #(3, 5, 7) N1 (n_net2, n_net1, not_A);
    nmos #(3, 5, 7) N2 (n_net2, n_net1, not_B);

    nmos #(3, 5, 7) N5 (W, n_net2, not_A);
    nmos #(3, 5, 7) N6 (W, n_net2, not_C);

    
endmodule
