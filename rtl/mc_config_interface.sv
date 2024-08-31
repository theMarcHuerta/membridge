module MC_ConfigInterface(
    input wire clk,
    input wire reset,
    input wire [7:0] addr,
    input wire [31:0] data_in,
    input wire write_enable,
    output reg [31:0] data_out,
    output reg valid
);

    reg [31:0] config_regs[255:0];

    always @(posedge clk) begin
        if (reset) begin
            config_regs[0] <= 32'd3200; // Clock frequency
            config_regs[1] <= 32'd64;   // Data width
            valid <= 0;
        end else begin
            if (write_enable) begin
                config_regs[addr] <= data_in;
            end
            data_out <= config_regs[addr];
            valid <= 1;
        end
    end
endmodule