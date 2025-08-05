`timescale 1ns/1ns
module dividerQ2_tb ();
	
	reg clk, rst, start;
	reg [8:0] Abus,Bbus;
	wire [8:0] Qbus1,Rbus1, Qbus2,Rbus2,  Qbus3,Rbus3;
	wire ready;
	
	dividerQ uut1(clk, rst, start,Abus, Bbus, Qbus1, Rbus1, ready );
	divider uut2(clk, rst, start,Abus, Bbus, Qbus2, Rbus2, ready );	

	dividerQ2 uut3(clk, rst, start,Abus, Bbus, Qbus3, Rbus3, ready );	
	
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