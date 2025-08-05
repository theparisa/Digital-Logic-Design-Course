`timescale 1ns/1ns
module my_4bit_shifter2 (input clk,rst, shn, input [3:0] si, output reg [3:0] so);
	reg [0:8][3:0] w;
	integer k;
	assign  w[0][3:0]  = si;
	assign  so = w[8][3:0];
    always @(posedge clk, posedge rst)begin
		if (rst)
			so <= 4'b0;
		else if (shn) begin
			for (k=1; k<9; k=k+1) begin
				w[k][3:0] <= w[k-1][3:0];
			end
		end
		else so <=4'b0;		
	end

endmodule