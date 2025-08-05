`timescale 1ns/1ns
module datapath_tb ();
	
	reg clk, rst, loadA, loadM, loadQ, PQ, PA, initA0, init_counter, shift, dec_counter;
	reg  [8:0] Abus,Bbus;	
	wire [8:0] Qbus, Rbus;
	wire [3:0] count;
	wire signbit;
	
	datapath uut2(clk, rst, loadA, loadM, loadQ, PQ, PA, initA0, init_counter, shift, dec_counter, Abus,Bbus, Qbus, Rbus, count, signbit );
	
	always #5 clk <= ~clk;
	
	initial begin
		 #3 clk=1;
		 #3 rst=1;
		 #3 rst=0;
		 #13 Abus= 9'b000001011;
		 #13 Bbus = 9'b000000011;
		 #3 initA0= 1'b1;
		    init_counter= 1'b1;
		#13 initA0= 1'b0;
		    init_counter= 1'b0;
		#13  loadM=1'b1;
			 loadQ= 1'b1;
		#13  loadM=1'b0;
			 loadQ= 1'b0;		
		#13  shift=1'b1;
		#13  shift=1'b0;		
		#13 PA=1'b1;
					PQ=1'b1;
		#13 PA=1'b0;
					PQ=1'b0;
		#13 loadA=1'b1;

		#13 loadA=1'b0;

		#13 dec_counter=1'b1;
				#10 dec_counter=1'b0;
		 #100 $stop;
		 
	end
	
endmodule