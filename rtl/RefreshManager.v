/* Machine-generated using Migen */
module RefreshManager(
	input sys_clk,
	input sys_rst
);

reg refresh = 1'd0;
reg refresh_needed = 1'd0;
reg refresh_done = 1'd0;
reg [31:0] counter = 32'd0;
reg refresh_in_progress = 1'd0;


always @(posedge sys_clk) begin
	if (refresh) begin
		refresh_in_progress <= 1'd1;
		counter <= 1'd0;
	end else begin
		if (refresh_in_progress) begin
			if ((counter >= 9'd350)) begin
				refresh_in_progress <= 1'd0;
				refresh_done <= 1'd1;
			end else begin
				counter <= (counter + 1'd1);
			end
		end else begin
			counter <= (counter + 1'd1);
			if ((counter >= 26'd64000000)) begin
				refresh_needed <= 1'd1;
			end
			if (refresh_done) begin
				refresh_needed <= 1'd0;
				refresh_done <= 1'd0;
			end
		end
	end
	if (sys_rst) begin
		refresh_needed <= 1'd0;
		refresh_done <= 1'd0;
		counter <= 32'd0;
		refresh_in_progress <= 1'd0;
	end
end

endmodule
