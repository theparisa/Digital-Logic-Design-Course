module output_wrapper_cu(input clk, rst, got_data, Done, co,
              output reg en, load_bus, empty_buffer, buffer_ready, ready_for_input, InzCnt, IncCnt);

    reg [2:0] pstate, nstate;

    parameter [2:0]
	Idle = 0, 
        empty = 1, 
        diverging = 2,
        waiting_for_got = 3, 
        making_sure_got_data = 4;

    always @(pstate, got_data, Done, co) begin
        nstate = 0;
        {en, load_bus, empty_buffer, ready_for_input, buffer_ready, InzCnt, IncCnt} = 7'b0;

        case (pstate)
	    Idle:begin
		nstate = Done ? Idle : empty;
		empty_buffer = 1'b1;
	    end
            empty: begin
                nstate = Done ? diverging : empty;
		InzCnt = 1'b1;
		en = Done ? 1 : 0;
		ready_for_input = 1'b1;
            end
            diverging: begin
                nstate = waiting_for_got;
		load_bus = 1'b1;
		IncCnt = 1'b1;
            end
            waiting_for_got: begin
                nstate = got_data ? making_sure_got_data : waiting_for_got;
		
		buffer_ready = 1'b1;
            end
            making_sure_got_data: begin
		if (got_data) nstate = making_sure_got_data;
		else if (~got_data & ~co) nstate = diverging;
		else if (~got_data & co) nstate = Idle;
		   
            end

            default: nstate = Idle;
        endcase
    end
    always @(posedge clk, posedge rst) begin
        if (rst)
            pstate <= Idle;
        else
            pstate <= nstate;
    end

endmodule


