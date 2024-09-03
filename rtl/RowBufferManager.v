/* Machine-generated using Migen */
module RowBufferManager(
	input sys_clk,
	input sys_rst
);

reg rowbuffermanager_rst = 1'd0;
reg rowbuffermanager_row_activate = 1'd0;
reg rowbuffermanager_row_precharge = 1'd0;
wire rowbuffermanager_row_hit;
reg [15:0] rowbuffermanager_current_row = 16'd0;
reg [15:0] rowbuffermanager_requested_row = 16'd0;
reg rowbuffermanager_row_open = 1'd0;

// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on

assign rowbuffermanager_row_hit = (rowbuffermanager_row_open & (rowbuffermanager_current_row == rowbuffermanager_requested_row));

always @(posedge sys_clk) begin
	if (rowbuffermanager_rst) begin
		rowbuffermanager_row_open <= 1'd0;
		rowbuffermanager_current_row <= 1'd0;
	end else begin
		if (rowbuffermanager_row_activate) begin
			rowbuffermanager_row_open <= 1'd1;
			rowbuffermanager_current_row <= rowbuffermanager_requested_row;
		end else begin
			if (rowbuffermanager_row_precharge) begin
				rowbuffermanager_row_open <= 1'd0;
			end
		end
	end
	if (sys_rst) begin
		rowbuffermanager_current_row <= 16'd0;
		rowbuffermanager_row_open <= 1'd0;
	end
end

endmodule
