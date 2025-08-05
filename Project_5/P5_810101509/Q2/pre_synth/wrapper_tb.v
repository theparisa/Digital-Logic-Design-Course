`timescale 1ns/1ns

module wrapper_tb ();
    reg clk = 1'b0;
    reg rst;
    reg data_ready;
    reg got_data;
    reg [7:0] Bus_in;

    wire data_accepted;
    wire buffer_ready;
    wire ready_for_input;
    wire [7:0] Bus_out;

    wrapper_top UUT(clk, rst, data_ready, got_data, Bus_in,
                    data_accepted, buffer_ready, ready_for_input, Bus_out);

    always #3 clk <= ~clk;

    initial begin
        #3 rst = 1;
	#10 got_data = 0; data_ready = 0;
        #3 rst = 0;
	
	#8 Bus_in = 8'd35;
        #8 data_ready = 1;
	#16 data_ready = 0;
	
	#100

        #8 Bus_in = 8'd0;
        #16 data_ready = 1;
	#16 data_ready = 0;
	
	#100

	#8 Bus_in = 8'd9;
        #16 data_ready = 1;
	#16 data_ready = 0;

	#100

	#8 Bus_in = 8'd0;
        #16 data_ready = 1;
	#16 data_ready = 0;

	wait(buffer_ready);

	got_data = 1;
	#16 got_data = 0;

	#25

	#16 got_data = 1;
	#16 got_data = 0;

	#25

	#16 got_data = 1;
	#16 got_data = 0;

	#25

	#16 got_data = 1;
	#16 got_data = 0;
	
	#100

        $stop;

    end
endmodule
