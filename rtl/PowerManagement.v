/* Machine-generated using Migen */
module PowerManagement(
	input sys_clk,
	input sys_rst
);

reg powermanagement_rst = 1'd0;
reg [3:0] powermanagement_cmd_decoded = 4'd0;
reg [1:0] powermanagement_power_state = 2'd0;
reg powermanagement_enter_power_down = 1'd0;
reg powermanagement_power_down_entered = 1'd0;
reg powermanagement_power_down_ready = 1'd0;
reg [7:0] powermanagement_temperature = 8'd0;
reg powermanagement_low_power_mode = 1'd0;
reg [31:0] powermanagement_idle_counter = 32'd0;


always @(posedge sys_clk) begin
	if (powermanagement_rst) begin
		powermanagement_power_state <= 1'd0;
		powermanagement_idle_counter <= 1'd0;
		powermanagement_power_down_ready <= 1'd0;
		powermanagement_power_down_entered <= 1'd0;
		powermanagement_low_power_mode <= 1'd0;
	end else begin
		if ((powermanagement_cmd_decoded != 1'd0)) begin
			powermanagement_idle_counter <= 1'd0;
			powermanagement_power_down_ready <= 1'd0;
		end else begin
			if ((powermanagement_idle_counter < 10'd1000)) begin
				powermanagement_idle_counter <= (powermanagement_idle_counter + 1'd1);
			end else begin
				powermanagement_power_down_ready <= 1'd1;
			end
		end
	end
	if ((powermanagement_enter_power_down & powermanagement_power_down_ready)) begin
		powermanagement_power_state <= 1'd1;
		powermanagement_power_down_entered <= 1'd1;
	end else begin
		if ((powermanagement_cmd_decoded != 1'd0)) begin
			powermanagement_power_state <= 1'd0;
			powermanagement_power_down_entered <= 1'd0;
		end
	end
	if ((powermanagement_temperature >= 7'd70)) begin
		powermanagement_low_power_mode <= 1'd1;
	end else begin
		powermanagement_low_power_mode <= 1'd0;
	end
	if (sys_rst) begin
		powermanagement_power_state <= 2'd0;
		powermanagement_power_down_entered <= 1'd0;
		powermanagement_power_down_ready <= 1'd0;
		powermanagement_low_power_mode <= 1'd0;
		powermanagement_idle_counter <= 32'd0;
	end
end

endmodule
