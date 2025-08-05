`timescale 1ns/1ns
module myreg (input clk,rst, cen, input [3:0] parin, output reg [3:0] parout);
	always @(posedge clk, posedge rst) begin
		parout <= 4'b0;
		if (rst)
			parout <= 4'b0;
		else if (cen)
			parout <= parin;
	end
endmodule