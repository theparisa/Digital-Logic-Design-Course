`timescale 1ns/1ns
module my_4bit_shifter1 (input clk,rst, shn, input [3:0] si, output reg [3:0] so);
	wire [0:8][3:0] w;
	assign  w[0][3:0]  = si;
	assign  so = w[8][3:0];
	genvar k;
	generate 
		for (k=1; k<9; k=k+1) begin
			myreg i (clk, rst,shn,w[k-1][3:0], w[k][3:0]);
		end
	endgenerate

endmodule