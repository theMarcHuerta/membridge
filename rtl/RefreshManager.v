/* Machine-generated using Migen */
module RefreshManager(
	input sys_clk,
	input sys_rst
);

reg refreshmanager_rst = 1'd0;
reg refreshmanager_refresh_needed = 1'd0;
reg refreshmanager_refresh_done = 1'd0;
reg [31:0] refreshmanager_counter = 32'd0;
reg refreshmanager_refresh_in_progress = 1'd0;
reg [31:0] refreshmanager0 = 32'd0;
reg [31:0] refreshmanager1 = 32'd0;
reg [31:0] refreshmanager2 = 32'd0;
reg [31:0] refreshmanager3 = 32'd0;
reg [31:0] refreshmanager4 = 32'd0;
reg [31:0] refreshmanager5 = 32'd0;
reg [31:0] refreshmanager6 = 32'd0;
reg [31:0] refreshmanager7 = 32'd0;
reg [31:0] refreshmanager8 = 32'd0;
reg [31:0] refreshmanager9 = 32'd0;
reg [31:0] refreshmanager10 = 32'd0;
reg [31:0] refreshmanager11 = 32'd0;
reg [31:0] refreshmanager12 = 32'd0;
reg [31:0] refreshmanager13 = 32'd0;
reg [31:0] refreshmanager14 = 32'd0;
reg [31:0] refreshmanager15 = 32'd0;


always @(posedge sys_clk) begin
	if (refreshmanager_rst) begin
		refreshmanager_counter <= 1'd0;
		refreshmanager_refresh_needed <= 1'd0;
		refreshmanager_refresh_in_progress <= 1'd0;
		refreshmanager0 <= 1'd0;
		refreshmanager1 <= 1'd0;
		refreshmanager2 <= 1'd0;
		refreshmanager3 <= 1'd0;
		refreshmanager4 <= 1'd0;
		refreshmanager5 <= 1'd0;
		refreshmanager6 <= 1'd0;
		refreshmanager7 <= 1'd0;
		refreshmanager8 <= 1'd0;
		refreshmanager9 <= 1'd0;
		refreshmanager10 <= 1'd0;
		refreshmanager11 <= 1'd0;
		refreshmanager12 <= 1'd0;
		refreshmanager13 <= 1'd0;
		refreshmanager14 <= 1'd0;
		refreshmanager15 <= 1'd0;
	end else begin
		if (refreshmanager_refresh_in_progress) begin
			if ((refreshmanager_counter >= 9'd350)) begin
				refreshmanager_refresh_in_progress <= 1'd0;
				refreshmanager_counter <= 1'd0;
			end else begin
				refreshmanager_counter <= (refreshmanager_counter + 1'd1);
			end
		end else begin
			refreshmanager_counter <= (refreshmanager_counter + 1'd1);
			if ((refreshmanager_counter >= 26'd64000000)) begin
				refreshmanager_refresh_needed <= 1'd1;
			end
			if (refreshmanager_refresh_done) begin
				refreshmanager_refresh_needed <= 1'd0;
				refreshmanager_refresh_in_progress <= 1'd1;
				refreshmanager_counter <= 1'd0;
			end
		end
	end
	if (sys_rst) begin
		refreshmanager_refresh_needed <= 1'd0;
		refreshmanager_counter <= 32'd0;
		refreshmanager_refresh_in_progress <= 1'd0;
		refreshmanager0 <= 32'd0;
		refreshmanager1 <= 32'd0;
		refreshmanager2 <= 32'd0;
		refreshmanager3 <= 32'd0;
		refreshmanager4 <= 32'd0;
		refreshmanager5 <= 32'd0;
		refreshmanager6 <= 32'd0;
		refreshmanager7 <= 32'd0;
		refreshmanager8 <= 32'd0;
		refreshmanager9 <= 32'd0;
		refreshmanager10 <= 32'd0;
		refreshmanager11 <= 32'd0;
		refreshmanager12 <= 32'd0;
		refreshmanager13 <= 32'd0;
		refreshmanager14 <= 32'd0;
		refreshmanager15 <= 32'd0;
	end
end

endmodule
