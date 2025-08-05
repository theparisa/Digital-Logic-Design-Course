module input_wrapper_dp (input clk, rst, load_bus, load, InzCnt, IncCnt, input [7:0] Bus,
                         output co, output reg [15:0] D_16b, M_16b );
    
    reg [7:0] Dreg_8b;
    reg [1:0] Count;
    always @(posedge clk or posedge rst) begin
        if (rst)
            Dreg_8b <= 8'b0;
        else if (load_bus)
            Dreg_8b <= Bus;
    end
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            D_16b <= 16'b0;
            M_16b <= 16'b0;
        end else if(load) begin
            case(Count)
                2'd0: D_16b[7:0] <= Dreg_8b;
                2'd1: D_16b[15:8] <= Dreg_8b;
                2'd2: M_16b[7:0] <= Dreg_8b;
                2'd3: M_16b[15:8] <= Dreg_8b;
            endcase
        end
    end
    always @(posedge clk or posedge rst) begin
        if (rst)
            Count <= 2'b0;
        else if (InzCnt)
            Count <= 2'b0;
        else if (IncCnt)
            Count <= Count + 1;
    end 
    assign co = &Count;

endmodule
