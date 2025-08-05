module NOT_1 (output W, input A);
    supply1 Vdd;  // Positive power supply
    supply0 Gnd;  // Ground

    // Pull-up network uSing pMOS transistor
    pmos #(4, 7, 9) P1 (W, Vdd, A);

    // Pull-down network using nMOS transistor
    nmos #(3, 5, 7) N1 (W, Gnd, A);
endmodule