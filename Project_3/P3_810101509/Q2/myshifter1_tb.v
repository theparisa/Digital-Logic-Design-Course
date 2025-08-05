`timescale 1ns/1ns
module myshifter1_tb();
reg clk2=0;
reg rst2, shn2;
reg [3:0] si2;
wire [3:0] so2;
	
my_4bit_shifter1 cut(clk2, rst2, shn2 ,si2, so2);

	always  #50 clk2= ~clk2;
	initial begin
	#10  shn2= 1'b1;
		 rst2= 1'b0;
		 si2= $random;
	#760 shn2=1'b0;
	#850 shn2 = 1'b1;
	     si2= $random;
	#2500 $stop;
	end
endmodule