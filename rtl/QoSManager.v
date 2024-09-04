/* Machine-generated using Migen */
module QoSManager(
	input cmd_executed,
	input request_completed,
	input rst,
	output reg [1:0] current_priority,
	output [3:0] grant,
	output [1:0] qos_priority,
	input sys_clk,
	input sys_rst
);

reg [31:0] qosmanager0 = 32'd0;
reg [31:0] qosmanager1 = 32'd0;
reg [31:0] qosmanager2 = 32'd0;
reg [31:0] qosmanager3 = 32'd0;

// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on

assign grant = (1'd1 <<< current_priority);
assign qos_priority = current_priority;

always @(posedge sys_clk) begin
	if (rst) begin
		current_priority <= 1'd0;
		qosmanager0 <= 1'd0;
		qosmanager1 <= 1'd0;
		qosmanager2 <= 1'd0;
		qosmanager3 <= 1'd0;
	end else begin
		if (request_completed) begin
			if (1'd0) begin
				current_priority <= ((current_priority + 1'd1) & 2'd3);
			end else begin
				if (1'd1) begin
					current_priority <= ((current_priority + 1'd1) & 2'd3);
				end
			end
		end
	end
	if (sys_rst) begin
		current_priority <= 2'd0;
		qosmanager0 <= 32'd0;
		qosmanager1 <= 32'd0;
		qosmanager2 <= 32'd0;
		qosmanager3 <= 32'd0;
	end
end

endmodule
