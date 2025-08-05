module output_wrapper_top (input clk, rst, got_data, Done, input [15:0] quotient_16b, remainder_16b,
                           output [7:0] Bus_out, output empty_buffer, buffer_ready, ready_for_input);
    
    wire en, load_bus, co, InzCnt, IncCnt; 


    output_wrapper_dp OUTPUT_WRAPPER_DP (clk, rst, en, load_bus, InzCnt, IncCnt, quotient_16b, remainder_16b, co, Bus_out);

    output_wrapper_cu OUTPUT_WRAPPER_CU (clk, rst, got_data, Done, co, en, load_bus, empty_buffer, buffer_ready, ready_for_input, InzCnt, IncCnt);

endmodule