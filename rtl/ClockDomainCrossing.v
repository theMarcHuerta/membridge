/* Machine-generated using Migen */
module ClockDomainCrossing(
	input src_clk,
	input src_rst,
	input [63:0] src_data,
	input dst_clk,
	input dst_rst,
	output reg [63:0] dst_data,
	input dst_clk_1,
	input dst_rst_1,
	input src_clk_1,
	input src_rst_1
);

reg [63:0] sync_ff1 = 64'd0;
reg [63:0] sync_ff2 = 64'd0;


always @(posedge dst_clk_1) begin
	if (dst_rst) begin
		sync_ff2 <= 1'd0;
		dst_data <= 1'd0;
	end else begin
		sync_ff2 <= sync_ff1;
		dst_data <= sync_ff2;
	end
	if (dst_rst_1) begin
		dst_data <= 64'd0;
		sync_ff2 <= 64'd0;
	end
end

always @(posedge src_clk_1) begin
	sync_ff1 <= src_data;
	if (src_rst_1) begin
		sync_ff1 <= 64'd0;
	end
end

endmodule
