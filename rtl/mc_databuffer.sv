module MC_DataBuffer #(
    parameter DATA_WIDTH = 64,
    parameter BUFFER_DEPTH = 16
)(
    input wire clk,
    input wire reset,
    input wire enable,
    input wire [DATA_WIDTH-1:0] data_in,
    input wire write_request,
    input wire read_request,
    output reg [DATA_WIDTH-1:0] data_out,
    output reg buffer_full,
    output reg buffer_empty
);

    reg [DATA_WIDTH-1:0] buffer[BUFFER_DEPTH-1:0];
    integer write_ptr = 0;
    integer read_ptr = 0;
    integer count = 0;

    always @(posedge clk) begin
        if (reset) begin
            write_ptr <= 0;
            read_ptr <= 0;
            count <= 0;
            buffer_full <= 0;
            buffer_empty <= 1;
        end else if (enable) begin
            if (write_request && !buffer_full) begin
                buffer[write_ptr] <= data_in;
                write_ptr <= (write_ptr + 1) % BUFFER_DEPTH;
                count <= count + 1;
                buffer_empty <= 0;
                if (count == BUFFER_DEPTH - 1) buffer_full <= 1;
            end
            if (read_request && !buffer_empty) begin
                data_out <= buffer[read_ptr];
                read_ptr <= (read_ptr + 1) % BUFFER_DEPTH;
                count <= count - 1;
                buffer_full <= 0;
                if (count == 1) buffer_empty <= 1;
            end
        end
    end
endmodule