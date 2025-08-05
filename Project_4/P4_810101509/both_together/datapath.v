`timescale 1ns/1ns
module datapath (input clk, rst, input loadA, loadM, loadQ, PQ, PA, initA0, init_counter, shift, dec_counter, input [8:0] Abus,Bbus, output [8:0] Qbus, Rbus, output reg [3:0] count , output signbit );
	reg [8:0] Qreg, Mreg, Areg;
	wire [8:0] sub_bus, shiftedA, QPar, QPar1;
	reg [15:0] shiftedAQ;
	wire rewrite;
	
	always @(posedge clk, posedge rst)begin 
		if (rst) Mreg <= 9'b0;
		else if (loadM)  Mreg <= Bbus;
	end
	
		always @(posedge clk, posedge rst)begin 
		if (rst) shiftedAQ <= 16'b0;
		else if (shift) shiftedAQ <= {Areg[6:0], Qreg[7:0],1'b0};
	end
	
	always @(posedge clk, posedge rst)begin 
		if (rst) Areg <= 9'b0;
		else if (initA0)  Areg <= 9'b0;
		else if (loadA)  Areg <= shiftedA;
		else if (PA)  Areg <= sub_bus;
	end
	
	always @(posedge clk, posedge rst)begin 
		if (rst) Qreg <= 9'b0;
		else if (loadQ)  Qreg <= Abus;
		else if (PQ)  Qreg <= QPar;
	end	
	
	always @(posedge clk, posedge rst)begin 
		if (rst) count <= 4'b0;
		else if (init_counter) count <= 4'b0111;
		else if (dec_counter)  count <= count -1'b1;
	end	
	
	
	assign sub_bus = shiftedA+ (~Mreg)+1;
	assign signbit= sub_bus[8];
	assign shiftedA= {1'b0,shiftedAQ[15:8]};
	assign rewrite= ~(sub_bus[8]);
	assign QPar1= shiftedAQ[7:0];
	assign QPar= { 1'b0,QPar1[7:1], rewrite};
	
	assign Qbus= Qreg;
	assign Rbus= Areg;
	
endmodule