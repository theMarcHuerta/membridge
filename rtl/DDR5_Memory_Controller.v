/* Machine-generated using Migen */
module top(
	input clk,
	input rst,
	input [31:0] addr,
	input [63:0] data_in,
	input mem_write,
	input mem_read,
	input [63:0] data_out,
	input ready,
	input sys_clk,
	input sys_rst
);

reg mem_ctrl_data_in_fifo_syncfifo_we = 1'd0;
wire mem_ctrl_data_in_fifo_syncfifo_writable;
reg mem_ctrl_data_in_fifo_syncfifo_re = 1'd0;
wire mem_ctrl_data_in_fifo_syncfifo_readable;
reg [63:0] mem_ctrl_data_in_fifo_syncfifo_din = 64'd0;
wire [63:0] mem_ctrl_data_in_fifo_syncfifo_dout;
reg [4:0] mem_ctrl_data_in_fifo_level = 5'd0;
reg mem_ctrl_data_in_fifo_replace = 1'd0;
reg [3:0] mem_ctrl_data_in_fifo_produce = 4'd0;
reg [3:0] mem_ctrl_data_in_fifo_consume = 4'd0;
reg [3:0] mem_ctrl_data_in_fifo_wrport_adr;
wire [63:0] mem_ctrl_data_in_fifo_wrport_dat_r;
wire mem_ctrl_data_in_fifo_wrport_we;
wire [63:0] mem_ctrl_data_in_fifo_wrport_dat_w;
wire mem_ctrl_data_in_fifo_do_read;
wire [3:0] mem_ctrl_data_in_fifo_rdport_adr;
wire [63:0] mem_ctrl_data_in_fifo_rdport_dat_r;
reg mem_ctrl_data_out_fifo_syncfifo_we = 1'd0;
wire mem_ctrl_data_out_fifo_syncfifo_writable;
reg mem_ctrl_data_out_fifo_syncfifo_re = 1'd0;
wire mem_ctrl_data_out_fifo_syncfifo_readable;
reg [63:0] mem_ctrl_data_out_fifo_syncfifo_din = 64'd0;
wire [63:0] mem_ctrl_data_out_fifo_syncfifo_dout;
reg [4:0] mem_ctrl_data_out_fifo_level = 5'd0;
reg mem_ctrl_data_out_fifo_replace = 1'd0;
reg [3:0] mem_ctrl_data_out_fifo_produce = 4'd0;
reg [3:0] mem_ctrl_data_out_fifo_consume = 4'd0;
reg [3:0] mem_ctrl_data_out_fifo_wrport_adr;
wire [63:0] mem_ctrl_data_out_fifo_wrport_dat_r;
wire mem_ctrl_data_out_fifo_wrport_we;
wire [63:0] mem_ctrl_data_out_fifo_wrport_dat_w;
wire mem_ctrl_data_out_fifo_do_read;
wire [3:0] mem_ctrl_data_out_fifo_rdport_adr;
wire [63:0] mem_ctrl_data_out_fifo_rdport_dat_r;
reg [63:0] mem_ctrl_clockdomaincrossing_src_data = 64'd0;
reg mem_ctrl_clockdomaincrossing_dst_rst = 1'd0;
reg [63:0] mem_ctrl_clockdomaincrossing_dst_data = 64'd0;
reg [63:0] mem_ctrl_clockdomaincrossing_sync_ff1 = 64'd0;
reg [63:0] mem_ctrl_clockdomaincrossing_sync_ff2 = 64'd0;
reg [63:0] mem_ctrl_data_in_cdc_src_data = 64'd0;
reg mem_ctrl_data_in_cdc_dst_rst = 1'd0;
reg [63:0] mem_ctrl_data_in_cdc_dst_data = 64'd0;
reg [63:0] mem_ctrl_data_in_cdc_sync_ff1 = 64'd0;
reg [63:0] mem_ctrl_data_in_cdc_sync_ff2 = 64'd0;
reg [63:0] mem_ctrl_data_out_cdc_src_data = 64'd0;
reg mem_ctrl_data_out_cdc_dst_rst = 1'd0;
reg [63:0] mem_ctrl_data_out_cdc_dst_data = 64'd0;
reg [63:0] mem_ctrl_data_out_cdc_sync_ff1 = 64'd0;
reg [63:0] mem_ctrl_data_out_cdc_sync_ff2 = 64'd0;

// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on


// synthesis translate_off
reg dummy_d;
// synthesis translate_on
always @(*) begin
	mem_ctrl_data_in_fifo_wrport_adr <= 4'd0;
	if (mem_ctrl_data_in_fifo_replace) begin
		mem_ctrl_data_in_fifo_wrport_adr <= (mem_ctrl_data_in_fifo_produce - 1'd1);
	end else begin
		mem_ctrl_data_in_fifo_wrport_adr <= mem_ctrl_data_in_fifo_produce;
	end
// synthesis translate_off
	dummy_d <= dummy_s;
// synthesis translate_on
end
assign mem_ctrl_data_in_fifo_wrport_dat_w = mem_ctrl_data_in_fifo_syncfifo_din;
assign mem_ctrl_data_in_fifo_wrport_we = (mem_ctrl_data_in_fifo_syncfifo_we & (mem_ctrl_data_in_fifo_syncfifo_writable | mem_ctrl_data_in_fifo_replace));
assign mem_ctrl_data_in_fifo_do_read = (mem_ctrl_data_in_fifo_syncfifo_readable & mem_ctrl_data_in_fifo_syncfifo_re);
assign mem_ctrl_data_in_fifo_rdport_adr = mem_ctrl_data_in_fifo_consume;
assign mem_ctrl_data_in_fifo_syncfifo_dout = mem_ctrl_data_in_fifo_rdport_dat_r;
assign mem_ctrl_data_in_fifo_syncfifo_writable = (mem_ctrl_data_in_fifo_level != 5'd16);
assign mem_ctrl_data_in_fifo_syncfifo_readable = (mem_ctrl_data_in_fifo_level != 1'd0);

// synthesis translate_off
reg dummy_d_1;
// synthesis translate_on
always @(*) begin
	mem_ctrl_data_out_fifo_wrport_adr <= 4'd0;
	if (mem_ctrl_data_out_fifo_replace) begin
		mem_ctrl_data_out_fifo_wrport_adr <= (mem_ctrl_data_out_fifo_produce - 1'd1);
	end else begin
		mem_ctrl_data_out_fifo_wrport_adr <= mem_ctrl_data_out_fifo_produce;
	end
// synthesis translate_off
	dummy_d_1 <= dummy_s;
// synthesis translate_on
end
assign mem_ctrl_data_out_fifo_wrport_dat_w = mem_ctrl_data_out_fifo_syncfifo_din;
assign mem_ctrl_data_out_fifo_wrport_we = (mem_ctrl_data_out_fifo_syncfifo_we & (mem_ctrl_data_out_fifo_syncfifo_writable | mem_ctrl_data_out_fifo_replace));
assign mem_ctrl_data_out_fifo_do_read = (mem_ctrl_data_out_fifo_syncfifo_readable & mem_ctrl_data_out_fifo_syncfifo_re);
assign mem_ctrl_data_out_fifo_rdport_adr = mem_ctrl_data_out_fifo_consume;
assign mem_ctrl_data_out_fifo_syncfifo_dout = mem_ctrl_data_out_fifo_rdport_dat_r;
assign mem_ctrl_data_out_fifo_syncfifo_writable = (mem_ctrl_data_out_fifo_level != 5'd16);
assign mem_ctrl_data_out_fifo_syncfifo_readable = (mem_ctrl_data_out_fifo_level != 1'd0);

always @(posedge sys_clk) begin
	if (((mem_ctrl_data_in_fifo_syncfifo_we & mem_ctrl_data_in_fifo_syncfifo_writable) & (~mem_ctrl_data_in_fifo_replace))) begin
		mem_ctrl_data_in_fifo_produce <= (mem_ctrl_data_in_fifo_produce + 1'd1);
	end
	if (mem_ctrl_data_in_fifo_do_read) begin
		mem_ctrl_data_in_fifo_consume <= (mem_ctrl_data_in_fifo_consume + 1'd1);
	end
	if (((mem_ctrl_data_in_fifo_syncfifo_we & mem_ctrl_data_in_fifo_syncfifo_writable) & (~mem_ctrl_data_in_fifo_replace))) begin
		if ((~mem_ctrl_data_in_fifo_do_read)) begin
			mem_ctrl_data_in_fifo_level <= (mem_ctrl_data_in_fifo_level + 1'd1);
		end
	end else begin
		if (mem_ctrl_data_in_fifo_do_read) begin
			mem_ctrl_data_in_fifo_level <= (mem_ctrl_data_in_fifo_level - 1'd1);
		end
	end
	if (((mem_ctrl_data_out_fifo_syncfifo_we & mem_ctrl_data_out_fifo_syncfifo_writable) & (~mem_ctrl_data_out_fifo_replace))) begin
		mem_ctrl_data_out_fifo_produce <= (mem_ctrl_data_out_fifo_produce + 1'd1);
	end
	if (mem_ctrl_data_out_fifo_do_read) begin
		mem_ctrl_data_out_fifo_consume <= (mem_ctrl_data_out_fifo_consume + 1'd1);
	end
	if (((mem_ctrl_data_out_fifo_syncfifo_we & mem_ctrl_data_out_fifo_syncfifo_writable) & (~mem_ctrl_data_out_fifo_replace))) begin
		if ((~mem_ctrl_data_out_fifo_do_read)) begin
			mem_ctrl_data_out_fifo_level <= (mem_ctrl_data_out_fifo_level + 1'd1);
		end
	end else begin
		if (mem_ctrl_data_out_fifo_do_read) begin
			mem_ctrl_data_out_fifo_level <= (mem_ctrl_data_out_fifo_level - 1'd1);
		end
	end
	if (mem_ctrl_clockdomaincrossing_dst_rst) begin
		mem_ctrl_clockdomaincrossing_sync_ff1 <= 1'd0;
		mem_ctrl_clockdomaincrossing_sync_ff2 <= 1'd0;
		mem_ctrl_clockdomaincrossing_dst_data <= 1'd0;
	end else begin
		mem_ctrl_clockdomaincrossing_sync_ff1 <= mem_ctrl_clockdomaincrossing_src_data;
		mem_ctrl_clockdomaincrossing_sync_ff2 <= mem_ctrl_clockdomaincrossing_sync_ff1;
		mem_ctrl_clockdomaincrossing_dst_data <= mem_ctrl_clockdomaincrossing_sync_ff2;
	end
	if (mem_ctrl_data_in_cdc_dst_rst) begin
		mem_ctrl_data_in_cdc_sync_ff1 <= 1'd0;
		mem_ctrl_data_in_cdc_sync_ff2 <= 1'd0;
		mem_ctrl_data_in_cdc_dst_data <= 1'd0;
	end else begin
		mem_ctrl_data_in_cdc_sync_ff1 <= mem_ctrl_data_in_cdc_src_data;
		mem_ctrl_data_in_cdc_sync_ff2 <= mem_ctrl_data_in_cdc_sync_ff1;
		mem_ctrl_data_in_cdc_dst_data <= mem_ctrl_data_in_cdc_sync_ff2;
	end
	if (mem_ctrl_data_out_cdc_dst_rst) begin
		mem_ctrl_data_out_cdc_sync_ff1 <= 1'd0;
		mem_ctrl_data_out_cdc_sync_ff2 <= 1'd0;
		mem_ctrl_data_out_cdc_dst_data <= 1'd0;
	end else begin
		mem_ctrl_data_out_cdc_sync_ff1 <= mem_ctrl_data_out_cdc_src_data;
		mem_ctrl_data_out_cdc_sync_ff2 <= mem_ctrl_data_out_cdc_sync_ff1;
		mem_ctrl_data_out_cdc_dst_data <= mem_ctrl_data_out_cdc_sync_ff2;
	end
	if (sys_rst) begin
		mem_ctrl_data_in_fifo_level <= 5'd0;
		mem_ctrl_data_in_fifo_produce <= 4'd0;
		mem_ctrl_data_in_fifo_consume <= 4'd0;
		mem_ctrl_data_out_fifo_level <= 5'd0;
		mem_ctrl_data_out_fifo_produce <= 4'd0;
		mem_ctrl_data_out_fifo_consume <= 4'd0;
		mem_ctrl_clockdomaincrossing_dst_data <= 64'd0;
		mem_ctrl_clockdomaincrossing_sync_ff1 <= 64'd0;
		mem_ctrl_clockdomaincrossing_sync_ff2 <= 64'd0;
		mem_ctrl_data_in_cdc_dst_data <= 64'd0;
		mem_ctrl_data_in_cdc_sync_ff1 <= 64'd0;
		mem_ctrl_data_in_cdc_sync_ff2 <= 64'd0;
		mem_ctrl_data_out_cdc_dst_data <= 64'd0;
		mem_ctrl_data_out_cdc_sync_ff1 <= 64'd0;
		mem_ctrl_data_out_cdc_sync_ff2 <= 64'd0;
	end
end

reg [63:0] storage[0:15];
reg [63:0] memdat;
always @(posedge sys_clk) begin
	if (mem_ctrl_data_in_fifo_wrport_we)
		storage[mem_ctrl_data_in_fifo_wrport_adr] <= mem_ctrl_data_in_fifo_wrport_dat_w;
	memdat <= storage[mem_ctrl_data_in_fifo_wrport_adr];
end

always @(posedge sys_clk) begin
end

assign mem_ctrl_data_in_fifo_wrport_dat_r = memdat;
assign mem_ctrl_data_in_fifo_rdport_dat_r = storage[mem_ctrl_data_in_fifo_rdport_adr];

reg [63:0] storage_1[0:15];
reg [63:0] memdat_1;
always @(posedge sys_clk) begin
	if (mem_ctrl_data_out_fifo_wrport_we)
		storage_1[mem_ctrl_data_out_fifo_wrport_adr] <= mem_ctrl_data_out_fifo_wrport_dat_w;
	memdat_1 <= storage_1[mem_ctrl_data_out_fifo_wrport_adr];
end

always @(posedge sys_clk) begin
end

assign mem_ctrl_data_out_fifo_wrport_dat_r = memdat_1;
assign mem_ctrl_data_out_fifo_rdport_dat_r = storage_1[mem_ctrl_data_out_fifo_rdport_adr];

endmodule
