`timescale 1ns/1ns
module controller (input clk, rst, start, signbit,  input [3:0] count, output reg loadA, loadM, loadQ, PQ, PA, initA0, init_counter, shift, dec_counter, ready);
	reg [2:0] ps,ns;
	parameter  [2:0] 
	idle= 0, init= 1, load=2, shifting=3, parA=4, restore=5, dec=6;
	
	always @(start, count, ps, signbit)begin 
		{loadA, loadM, loadQ, PQ, PA, initA0, init_counter, shift, dec_counter, ready}= 10'b0;
		ns=idle;
		case (ps)
			idle:begin ns= start ? init: idle;  ready= 1'b1;   end
			init: begin ns= start ? init: load;  initA0= 1'b1; init_counter=1'b1;   end
			load: begin ns= shifting; loadM=1'b1; loadQ=1'b1;	end			
			shifting: begin  ns= parA; shift=1'b1;    end
			parA: begin ns= (signbit) ? restore: dec;  PA= 1'b1; PQ=1'b1;  end
			restore: begin ns=  dec; loadA=1'b1;  end
			dec: begin ns=(|count) ? shifting: idle; dec_counter=1'b1; end
			default: ns= idle;
		endcase
	end
	
	always @(posedge clk, posedge rst)begin 
		if (rst) ps <= 3'b0;
		else ps <= ns;
	end

endmodule