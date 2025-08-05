module wrapper_top (input clk, rst, data_ready, got_data, input[7:0] Bus_in,
                    output data_accepted, buffer_ready, ready_for_input, output[7:0] Bus_out);
    
    wire [15:0] D_16b, M_16b;
    wire [15:0] quotient_16b, remainder_16b;
    wire start, Done, empty_buffer; 


    input_wrapper_top INPUT_WRAPPER_TOP (clk, rst, data_ready, empty_buffer, Done, Bus_in,
                                         D_16b, M_16b, data_accepted, start);

    DIVTOP divition_module(clk, rst, start, D_16b, M_16b,
                           quotient_16b, remainder_16b, Done);

    output_wrapper_top OUTPUT_WRAPPER_TOP(clk, rst, got_data, Done, quotient_16b, remainder_16b,
                                          Bus_out, empty_buffer, buffer_ready, ready_for_input);

endmodule

