module output_wrapper_dp (input clk, rst, en, load_bus, InzCnt, IncCnt, input [15:0] quotient_16b, remainder_16b,
                         output co, output reg [7:0] Bus );
    
    reg [1:0] Count;
    reg co_reg;
    
    always @(posedge clk, posedge rst) begin
        if (rst)
            {co_reg,Count} <= 3'b0;
        else if (InzCnt)
            {co_reg,Count} <= 3'b0;
        else if (IncCnt)
            {co_reg,Count} <= Count + 1;
    end
  
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            Bus <= 8'b0;
        end else if(load_bus) begin
            case(Count)
                2'd0: Bus <= quotient_16b[15:8];
                2'd1: Bus <= quotient_16b[7:0];
                2'd2: Bus <= remainder_16b[15:8];
                2'd3: Bus <= remainder_16b[7:0];
            endcase
        end
    end

    assign co = co_reg;

endmodule
