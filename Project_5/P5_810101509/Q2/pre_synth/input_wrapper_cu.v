module input_wrapper_cu(input clk, rst, data_ready, Done, empty_buffer, co,
              output reg load_bus, load, start, data_accepted, InzCnt, IncCnt);

    reg [2:0] pstate, nstate;

    parameter [2:0] 
        Idle = 0,
 	wating_for_data_ready = 1,
        loading = 2,
        accepting = 3, 
	converging = 4,
        wating_for_buffer = 5,
	starting = 6,
	calculating = 7;

    always @(pstate, data_ready, Done, empty_buffer, co) begin
        nstate = 0;
        {load_bus, load, start, data_accepted, InzCnt, IncCnt} = 6'b0;

        case (pstate)
	    Idle: begin
                nstate = wating_for_data_ready;
		InzCnt = 1'b1;
            end
            wating_for_data_ready: begin
                nstate = data_ready ? loading : wating_for_data_ready;
            end
            loading: begin
                nstate = accepting;
		load_bus = 1'b1;
            end
            accepting: begin
                nstate = data_ready ? accepting : converging;
		data_accepted = 1'b1;
		
            end
	    converging: begin
                nstate = co ? wating_for_buffer : wating_for_data_ready;
		IncCnt = 1'b1;
		load = 1'b1;
            end
            wating_for_buffer: begin
		if (~Done | ~empty_buffer) nstate = wating_for_buffer;
		else if (Done & empty_buffer) nstate = starting;   
            end
 	    starting: begin
                nstate = Done ? starting : calculating;
		start = 1'b1;
            end
	    calculating: begin
                nstate = Done ? Idle : calculating;
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


