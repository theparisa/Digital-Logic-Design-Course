module input_wrapper_top (input clk, rst, data_ready, empty_buffer, Done, input [7:0] Bus_in,
                          output [15:0] D_16b, M_16b, output data_accepted, start);
    
    wire co, InzCnt, IncCnt, load_bus, load; 


    input_wrapper_dp INPUT_WRAPPER_DP (clk, rst, load_bus, load, InzCnt, IncCnt, Bus_in, co, D_16b, M_16b);
    
    input_wrapper_cu INPUT_WRAPPER_CU (clk, rst, data_ready, Done, empty_buffer, co, load_bus, load, start, data_accepted, InzCnt, IncCnt);

endmodule