`timescale 1ns/1ns
module divider_tb ();
	
	reg clk, rst, start;
	reg [8:0] Abus,Bbus;
	wire [8:0] Qbus,Rbus;
	wire ready;
	
	divider uut(clk, rst, start,Abus, Bbus, Qbus, Rbus, ready );
	
	always #5 clk <= ~clk;
	
	initial begin
		 #3 clk=1;
		 rst=0;
		 start=0;
		 #13 Abus= 9'b001000001;
		     Bbus= 9'b000000010;
		 #3 start=1;
		 #13 start=0;
		 #400 Abus= 9'b010000001;
			  Bbus= 9'b000000011;
		 #3 start=1;
		 #13 start=0;
		 #400 $stop;
		 
	end
	
endmodule