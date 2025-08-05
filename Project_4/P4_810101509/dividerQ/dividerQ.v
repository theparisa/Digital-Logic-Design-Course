`timescale 1ns/1ns
module dividerQ (input clk, rst, start,  input [8:0] Abus,Bbus, output [8:0] Qbus,Rbus, output ready );
	wire loadA, loadM, loadQ, PQ, PA, initA0, init_counter, shift, dec_counter, signbit;
	wire [3:0] count;
	
	datapath d(clk, rst, loadA, loadM, loadQ, PQ, PA, initA0, init_counter, shift, dec_counter, Abus,Bbus, Qbus, Rbus, count, signbit );
	controller c (clk, rst, start, signbit, count, loadA, loadM, loadQ, PQ, PA, initA0, init_counter, shift, dec_counter, ready);
	
endmodule