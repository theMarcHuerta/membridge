/* Machine-generated using Migen */
module PowerManagement(
	input clk,
	input rst,
	input [3:0] cmd_decoded,
	output reg [1:0] power_state,
	input enter_power_down,
	output reg power_down_entered,
	output reg power_down_ready,
	input [7:0] temperature,
	output reg low_power_mode,
	input sys_clk,
	input sys_rst
);

reg [31:0] powermanagement_idle_counter = 32'd0;


always @(posedge sys_clk) begin
	if (rst) begin
		power_state <= 1'd0;
		powermanagement_idle_counter <= 1'd0;
		power_down_ready <= 1'd0;
		power_down_entered <= 1'd0;
		low_power_mode <= 1'd0;
	end else begin
		if ((cmd_decoded != 1'd0)) begin
			powermanagement_idle_counter <= 1'd0;
			power_down_ready <= 1'd0;
		end else begin
			if ((powermanagement_idle_counter < 10'd1000)) begin
				powermanagement_idle_counter <= (powermanagement_idle_counter + 1'd1);
			end else begin
				power_down_ready <= 1'd1;
			end
		end
	end
	if ((enter_power_down & power_down_ready)) begin
		power_state <= 1'd1;
		power_down_entered <= 1'd1;
	end else begin
		if ((cmd_decoded != 1'd0)) begin
			power_state <= 1'd0;
			power_down_entered <= 1'd0;
		end
	end
	if ((temperature >= 7'd70)) begin
		low_power_mode <= 1'd1;
	end else begin
		low_power_mode <= 1'd0;
	end
	if (sys_rst) begin
		power_state <= 2'd0;
		power_down_entered <= 1'd0;
		power_down_ready <= 1'd0;
		low_power_mode <= 1'd0;
		powermanagement_idle_counter <= 32'd0;
	end
end

endmodule
