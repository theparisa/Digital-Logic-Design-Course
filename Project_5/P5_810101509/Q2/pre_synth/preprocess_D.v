module preprocess_D (input clk,rst, priority_en, input [15:0] D16b, output [3:0] MSB_D);
   wire [3:0] pri_encoder_out;
   reg [3:0] MSB_D_reg;
   priorityencoder_16 pri_encoder(priority_en, D16b, pri_encoder_out);

   always @(posedge clk, posedge rst) begin
        if (rst)
            MSB_D_reg <= 4'b0;
        else begin
	    if (pri_encoder_out)
                MSB_D_reg <= pri_encoder_out;
        end
    end

    assign MSB_D = MSB_D_reg;
endmodule