/* Machine-generated using Migen */
module TimingController(
	input sys_clk,
	input sys_rst
);

reg timingcontroller_rst = 1'd0;
reg [3:0] timingcontroller_cmd_decoded = 4'd0;
reg timingcontroller_ready = 1'd0;
reg [31:0] timingcontroller_timer = 32'd0;


always @(posedge sys_clk) begin
	if (timingcontroller_rst) begin
		timingcontroller_timer <= 1'd0;
		timingcontroller_ready <= 1'd1;
	end else begin
		if ((timingcontroller_cmd_decoded != 1'd0)) begin
			timingcontroller_timer <= 5'd18;
			timingcontroller_ready <= 1'd0;
		end else begin
			if ((timingcontroller_timer > 1'd0)) begin
				timingcontroller_timer <= (timingcontroller_timer - 1'd1);
			end else begin
				timingcontroller_ready <= 1'd1;
			end
		end
	end
	if (sys_rst) begin
		timingcontroller_ready <= 1'd0;
		timingcontroller_timer <= 32'd0;
	end
end

endmodule
