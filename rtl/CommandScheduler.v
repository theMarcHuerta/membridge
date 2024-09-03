/* Machine-generated using Migen */
module CommandScheduler(
	input sys_clk,
	input sys_rst
);

reg commandscheduler_rst = 1'd0;
reg commandscheduler_cmd_valid = 1'd0;
reg commandscheduler_cmd_ready = 1'd0;
reg commandscheduler_cmd_executed = 1'd0;


always @(posedge sys_clk) begin
	if (commandscheduler_rst) begin
		commandscheduler_cmd_ready <= 1'd0;
	end else begin
		if (commandscheduler_cmd_valid) begin
		end else begin
			if (commandscheduler_cmd_executed) begin
			end
		end
	end
	if (sys_rst) begin
		commandscheduler_cmd_ready <= 1'd0;
	end
end

endmodule
