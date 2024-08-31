module MC_CommandDecoder(
    input wire clk,
    input wire reset,
    input wire [31:0] cmd_input,
    output reg [3:0] cmd_decoded,
    output reg [31:0] address
);

    always @(posedge clk) begin
        if (reset) begin
            cmd_decoded <= 4'b0000;
            address <= 32'b0;
        end else begin
            address <= cmd_input[31:0];
            case (cmd_input[31:28])
                4'b0001: cmd_decoded <= 4'b0001; // ACTIVATE
                4'b0010: cmd_decoded <= 4'b0010; // READ
                4'b0011: cmd_decoded <= 4'b0011; // WRITE
                4'b0100: cmd_decoded <= 4'b0100; // PRECHARGE
                default: cmd_decoded <= 4'b0000; // NOP or INVALID
            endcase
        end
    end
endmodule