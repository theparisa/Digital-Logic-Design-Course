module DIVTOP (input clk, rst, start, input [15:0] DBus, MBus, output [15:0] quotient, remainder, output ready);
    wire SB, priority_en;
    wire loadA, loadM, loadD, shiftA, shiftQ, shiftD, InitA, InitQ, Q0sel;
    wire [3:0] MSB_D;

    preprocess_D preprocessor(clk, rst, priority_en, DBus, MSB_D);

    DIVDP dp(clk, rst, loadA, loadM, loadD, shiftA, shiftQ, shiftD, InitA, InitQ, Q0sel, MSB_D, DBus, MBus,
             quotient, remainder , SB);

    DIVCU cu(clk, rst, start, SB, MSB_D,
             loadA, loadM, loadD, shiftA, shiftQ, shiftD, InitA, InitQ, Q0sel, priority_en, ready);
endmodule

