/* Machine-generated using Migen */
module RefreshManager(
	input refresh,
	input [1:0] bank_group,
	input [1:0] bank,
	output reg refresh_needed,
	output reg refresh_done,
	input sys_clk,
	input sys_rst
);

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
