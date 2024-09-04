/* Machine-generated using Migen */
module QoSManager(
	input sys_clk,
	input sys_rst
);

reg qosmanager_request_completed = 1'd0;
reg qosmanager_rst = 1'd0;
reg [1:0] qosmanager_current_priority = 2'd0;
wire [3:0] qosmanager_grant;
wire [1:0] qosmanager_qos_priority;
reg [31:0] qosmanager0 = 32'd0;
reg [31:0] qosmanager1 = 32'd0;
reg [31:0] qosmanager2 = 32'd0;
reg [31:0] qosmanager3 = 32'd0;

// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on

assign qosmanager_grant = (1'd1 <<< qosmanager_current_priority);
assign qosmanager_qos_priority = qosmanager_current_priority;

always @(posedge sys_clk) begin
	if (qosmanager_rst) begin
		qosmanager_current_priority <= 1'd0;
		qosmanager0 <= 1'd0;
		qosmanager1 <= 1'd0;
		qosmanager2 <= 1'd0;
		qosmanager3 <= 1'd0;
	end else begin
		if (qosmanager_request_completed) begin
			if (1'd0) begin
				qosmanager_current_priority <= ((qosmanager_current_priority + 1'd1) & 2'd3);
			end else begin
				if (1'd1) begin
					qosmanager_current_priority <= ((qosmanager_current_priority + 1'd1) & 2'd3);
				end
			end
		end
	end
	if (sys_rst) begin
		qosmanager_current_priority <= 2'd0;
		qosmanager0 <= 32'd0;
		qosmanager1 <= 32'd0;
		qosmanager2 <= 32'd0;
		qosmanager3 <= 32'd0;
	end
end

endmodule
