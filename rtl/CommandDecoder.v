/* Machine-generated using Migen */
module CommandDecoder(
	input sys_clk,
	input sys_rst
);

reg commanddecoder_rst = 1'd0;
reg [31:0] commanddecoder_addr = 32'd0;
reg commanddecoder_mem_read = 1'd0;
reg commanddecoder_mem_write = 1'd0;
reg commanddecoder_activate = 1'd0;
reg commanddecoder_precharge = 1'd0;
reg commanddecoder_refresh = 1'd0;
reg [3:0] commanddecoder_cmd_decoded = 4'd0;
reg [31:0] commanddecoder_address = 32'd0;


always @(posedge sys_clk) begin
	if (commanddecoder_rst) begin
		commanddecoder_cmd_decoded <= 1'd0;
		commanddecoder_address <= 1'd0;
	end else begin
		commanddecoder_address <= commanddecoder_addr;
		case ({commanddecoder_refresh, commanddecoder_precharge, commanddecoder_activate, commanddecoder_mem_write, commanddecoder_mem_read})
			1'd1: begin
				commanddecoder_cmd_decoded <= 1'd1;
			end
			2'd2: begin
				commanddecoder_cmd_decoded <= 2'd2;
			end
			3'd4: begin
				commanddecoder_cmd_decoded <= 2'd3;
			end
			4'd8: begin
				commanddecoder_cmd_decoded <= 3'd4;
			end
			5'd16: begin
				commanddecoder_cmd_decoded <= 3'd5;
			end
			default: begin
				commanddecoder_cmd_decoded <= 1'd0;
			end
		endcase
	end
	if (sys_rst) begin
		commanddecoder_cmd_decoded <= 4'd0;
		commanddecoder_address <= 32'd0;
	end
end

endmodule
