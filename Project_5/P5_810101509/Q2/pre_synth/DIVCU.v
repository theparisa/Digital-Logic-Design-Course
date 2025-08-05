module DIVCU(input clk, rst, start, SB, input [3:0] MSB_D,
              output reg loadA, loadM, loadD, shiftA, shiftQ, shiftD, InitA, InitQ, Q0sel, priority_en, ready);

    wire end_signal;
    reg Init_counter, Inc_counter;
    reg [1:0] pstate, nstate;
    reg [3:0] Count;

    parameter [1:0] 
        Idle = 0, 
        starting = 1, 
        loading = 2, 
        dividing = 3;

    always @(pstate, start, SB, end_signal) begin
        nstate = 0;
        {loadA, loadM, loadD, shiftA, shiftQ, shiftD, InitA, InitQ, Q0sel, priority_en, ready} = 11'b0;
        {Init_counter, Inc_counter} = 2'b0;

        case (pstate)
            Idle: begin
                nstate = start ? starting : Idle;
                ready = 1'b1; 
            end
            starting: begin
                nstate = start ? starting : loading;
		priority_en = 1'b1;
            end
            loading: begin
                nstate = dividing;
		loadD = 1'b1;
  		loadM = 1'b1;
                InitA = 1'b1;
 		InitQ = 1'b1;
                Init_counter = 1'b1;
            end
            dividing: begin
                nstate = end_signal ? Idle : dividing;
		Q0sel = SB;
		shiftD = 1'b1;
		shiftQ = 1'b1;
		shiftA = SB ? 1 : 0;
		loadA = SB ? 0 : 1;
		Inc_counter = 1'b1;
  
            end
            default: nstate = Idle;
        endcase
    end
    always @(posedge clk, posedge rst) begin
        if (rst)
            pstate <= Idle;
        else
            pstate <= nstate;
    end

    always @(posedge clk, posedge rst) begin
        if (rst)
            Count <= 4'b0;
        else if (Init_counter)
            Count <= 4'b0;
        else if (Inc_counter)
            Count <= Count + 1;
    end

    assign end_signal = (Count == MSB_D );

endmodule


