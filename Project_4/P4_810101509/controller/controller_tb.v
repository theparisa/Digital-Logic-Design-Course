`timescale 1ns/1ns
module controller_tb ();
	
	reg clk, rst, start, signbit;
	reg [3:0] count;
	wire ready;
	wire  loadA, loadM, loadQ, PQ, PA, initA0, init_counter, shift, dec_counter;
	
	controller uut ( clk, rst, start, signbit, count, loadA, loadM, loadQ, PQ, PA, initA0, init_counter, shift, dec_counter, ready);
	
	always #5 clk <= ~clk;
	
	initial begin
		 #3 clk=1;
		 #3 rst=1;
		 #3 rst=0;
		 #13 count= 4'b0110;
		     signbit = 1'b0;
		 #3 start=1;
		 #13 start=0;
		 #97 signbit = 1'b1;
		 #20  count= 4'b0000;
		 #150 $stop;
		 
	end
	
endmodule