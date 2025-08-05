module DIVDP (input clk, rst, loadA, loadM, loadD, shiftA, shiftQ, shiftD, InitA, InitQ, Q0sel,input [3:0] MSB_D,
               input [15:0] DBus, MBus, output [15:0] quotient, remainder ,output SB);
    
    reg [15:0] Areg, Qreg, Mreg, Dreg;
    wire [15:0] subtracted, A_new;
    wire SoLQ;
    wire sl;

    always @(posedge clk, posedge rst) begin
        if (rst)
            Mreg <= 16'b0;
        else if (loadM)
            Mreg <= MBus;
    end

    always @(posedge clk, posedge rst) begin
        if (rst)
            Dreg <= 16'b0;
        else begin
            if (loadD)
                Dreg <= DBus;
            else if (shiftD)
                Dreg <= {Dreg[14:0], sl};
        end
    end

    always @(posedge clk, posedge rst) begin
        if (rst)
            Qreg <= 16'b0;
        else begin
	    if (InitQ)
                Qreg <= 16'b0;
            else if (shiftQ)
                Qreg <= {Qreg[14:0], sl};
        end
    end

    always @(posedge clk, posedge rst) begin
        if (rst)
            Areg <= 16'b0;
        else begin
	    if (InitA)
                Areg <= 16'b0;
            else if (loadA)
                Areg <= subtracted;
            else if (shiftA)
                Areg <= {Areg[14:0], SoLQ};
        end
    end

    assign SoLQ = Dreg[MSB_D];
    assign sl = Q0sel? 0 : 1;
    assign A_new = {Areg[14:0],SoLQ};
    assign {SB, subtracted} = ~{1'b0, Mreg} + {1'b0, A_new} + 1; 
    assign quotient = Qreg;
    assign remainder = Areg;
endmodule
