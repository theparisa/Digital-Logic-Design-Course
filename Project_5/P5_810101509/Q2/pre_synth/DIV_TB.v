`timescale 1ns/1ns

module DIV_TB ();
    reg clk = 1'b0;
    reg rst = 0;
    reg start = 0;
    reg [15:0] DBus;
    reg [15:0] MBus;
    wire [15:0] quotient, remainder;
    wire ready;

    DIVTOP UUT (clk, rst, start, DBus, MBus, quotient, remainder, ready);

    always #5 clk <= ~clk;

    initial begin
        #3 rst = 1;
        #3 rst = 0;
	
	#13 DBus = 16'd65; MBus = 16'd3;
        #13 start = 1;
        #13 start = 0;
        #200


        #13 DBus = 16'd15; MBus = 16'd3;
        #13 start = 1;
        #13 start = 0;
        #200
	
	#13 DBus = 16'd113; MBus = 16'd10;
        #13 start = 1;
        #13 start = 0;
        #200
        $stop;

    end
endmodule
