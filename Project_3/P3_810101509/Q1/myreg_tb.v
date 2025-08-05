`timescale 1ns/1ns
module myreg_tb();
reg clk2=0;
reg rst2, cen2;
reg [3:0] parin2;
wire [3:0] parout2;
	
myreg cut(clk2, rst2, cen2 ,parin2, parout2);

	always  #50 clk2= ~clk2;
	initial begin
	#10  cen2= 1'b1;
		 rst2= 1'b0;
		 parin2= $random;
	#50 cen2= 1'b0;
		 parin2 = $random;
	#100 cen2= 1'b1;
	     parin2= $random;
	#100 rst2= 1'b1;
	#50 rst2= 1'b0;
	#100 $stop;
	end
endmodule