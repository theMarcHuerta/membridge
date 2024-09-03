/* Machine-generated using Migen */
module DDR5_Memory_Controller(
	input clk,
	input rst,
	input [31:0] addr,
	input [63:0] data_in,
	input mem_write,
	input mem_read,
	input [63:0] data_out,
	input ready,
	input dst_clk,
	input dst_rst,
	input src_clk,
	input src_rst,
	input sys_clk,
	input sys_rst
);

reg timing_controller_rst = 1'd0;
reg [3:0] timing_controller_cmd_decoded = 4'd0;
reg timing_controller_ready = 1'd0;
reg [31:0] timing_controller_timer = 32'd0;
reg command_decoder_rst = 1'd0;
reg [31:0] command_decoder_addr = 32'd0;
reg command_decoder_mem_read = 1'd0;
reg command_decoder_mem_write = 1'd0;
reg command_decoder_activate = 1'd0;
reg command_decoder_precharge = 1'd0;
reg command_decoder_refresh = 1'd0;
reg [3:0] command_decoder_cmd_decoded = 4'd0;
reg [31:0] command_decoder_address = 32'd0;
reg data_buffer_rst = 1'd0;
reg data_buffer_ready = 1'd0;
reg data_buffer_mem_write = 1'd0;
reg data_buffer_mem_read = 1'd0;
reg [63:0] data_buffer_data_in = 64'd0;
reg [63:0] data_buffer_data_out = 64'd0;
reg data_buffer_write_fifo_syncfifo_we = 1'd0;
wire data_buffer_write_fifo_syncfifo_writable;
reg data_buffer_write_fifo_syncfifo_re = 1'd0;
wire data_buffer_write_fifo_syncfifo_readable;
reg [63:0] data_buffer_write_fifo_syncfifo_din = 64'd0;
wire [63:0] data_buffer_write_fifo_syncfifo_dout;
reg [3:0] data_buffer_write_fifo_level = 4'd0;
reg data_buffer_write_fifo_replace = 1'd0;
reg [2:0] data_buffer_write_fifo_produce = 3'd0;
reg [2:0] data_buffer_write_fifo_consume = 3'd0;
reg [2:0] data_buffer_write_fifo_wrport_adr;
wire [63:0] data_buffer_write_fifo_wrport_dat_r;
wire data_buffer_write_fifo_wrport_we;
wire [63:0] data_buffer_write_fifo_wrport_dat_w;
wire data_buffer_write_fifo_do_read;
wire [2:0] data_buffer_write_fifo_rdport_adr;
wire [63:0] data_buffer_write_fifo_rdport_dat_r;
reg data_buffer_read_fifo_syncfifo_we = 1'd0;
wire data_buffer_read_fifo_syncfifo_writable;
reg data_buffer_read_fifo_syncfifo_re = 1'd0;
wire data_buffer_read_fifo_syncfifo_readable;
reg [63:0] data_buffer_read_fifo_syncfifo_din = 64'd0;
wire [63:0] data_buffer_read_fifo_syncfifo_dout;
reg [3:0] data_buffer_read_fifo_level = 4'd0;
reg data_buffer_read_fifo_replace = 1'd0;
reg [2:0] data_buffer_read_fifo_produce = 3'd0;
reg [2:0] data_buffer_read_fifo_consume = 3'd0;
reg [2:0] data_buffer_read_fifo_wrport_adr;
wire [63:0] data_buffer_read_fifo_wrport_dat_r;
wire data_buffer_read_fifo_wrport_we;
wire [63:0] data_buffer_read_fifo_wrport_dat_w;
wire data_buffer_read_fifo_do_read;
wire [2:0] data_buffer_read_fifo_rdport_adr;
wire [63:0] data_buffer_read_fifo_rdport_dat_r;
reg powermanagement0_rst = 1'd0;
reg [3:0] powermanagement0_cmd_decoded = 4'd0;
reg [1:0] powermanagement0_power_state = 2'd0;
reg powermanagement0_enter_power_down = 1'd0;
reg powermanagement0_power_down_entered = 1'd0;
reg powermanagement0_power_down_ready = 1'd0;
reg [7:0] powermanagement0_temperature = 8'd0;
reg powermanagement0_low_power_mode = 1'd0;
reg [31:0] powermanagement0_idle_counter = 32'd0;
reg refreshmanager0_rst = 1'd0;
reg refreshmanager0_refresh_needed = 1'd0;
reg refreshmanager0_refresh_done = 1'd0;
reg [31:0] refreshmanager0_counter = 32'd0;
reg refreshmanager0_refresh_in_progress = 1'd0;
reg [31:0] refreshmanager00 = 32'd0;
reg [31:0] refreshmanager01 = 32'd0;
reg [31:0] refreshmanager02 = 32'd0;
reg [31:0] refreshmanager03 = 32'd0;
reg [31:0] refreshmanager04 = 32'd0;
reg [31:0] refreshmanager05 = 32'd0;
reg [31:0] refreshmanager06 = 32'd0;
reg [31:0] refreshmanager07 = 32'd0;
reg [31:0] refreshmanager08 = 32'd0;
reg [31:0] refreshmanager09 = 32'd0;
reg [31:0] refreshmanager010 = 32'd0;
reg [31:0] refreshmanager011 = 32'd0;
reg [31:0] refreshmanager012 = 32'd0;
reg [31:0] refreshmanager013 = 32'd0;
reg [31:0] refreshmanager014 = 32'd0;
reg [31:0] refreshmanager015 = 32'd0;
reg command_scheduler_rst = 1'd0;
reg command_scheduler_cmd_valid = 1'd0;
reg command_scheduler_cmd_ready = 1'd0;
reg command_scheduler_cmd_executed = 1'd0;
reg row_buffer_manager_rst = 1'd0;
reg row_buffer_manager_row_activate = 1'd0;
reg row_buffer_manager_row_precharge = 1'd0;
wire row_buffer_manager_row_hit;
reg [15:0] row_buffer_manager_current_row = 16'd0;
reg [15:0] row_buffer_manager_requested_row = 16'd0;
reg row_buffer_manager_row_open = 1'd0;
reg qosmanager0_rst = 1'd0;
wire [3:0] qosmanager0_grant;
reg [1:0] qosmanager0_current_priority = 2'd0;
reg qosmanager0_request_completed = 1'd0;
reg [31:0] qosmanager00 = 32'd0;
reg [31:0] qosmanager01 = 32'd0;
reg [31:0] qosmanager02 = 32'd0;
reg [31:0] qosmanager03 = 32'd0;
reg data_in_fifo_syncfifo_we = 1'd0;
wire data_in_fifo_syncfifo_writable;
reg data_in_fifo_syncfifo_re = 1'd0;
wire data_in_fifo_syncfifo_readable;
reg [63:0] data_in_fifo_syncfifo_din = 64'd0;
wire [63:0] data_in_fifo_syncfifo_dout;
reg [4:0] data_in_fifo_level = 5'd0;
reg data_in_fifo_replace = 1'd0;
reg [3:0] data_in_fifo_produce = 4'd0;
reg [3:0] data_in_fifo_consume = 4'd0;
reg [3:0] data_in_fifo_wrport_adr;
wire [63:0] data_in_fifo_wrport_dat_r;
wire data_in_fifo_wrport_we;
wire [63:0] data_in_fifo_wrport_dat_w;
wire data_in_fifo_do_read;
wire [3:0] data_in_fifo_rdport_adr;
wire [63:0] data_in_fifo_rdport_dat_r;
reg data_out_fifo_syncfifo_we = 1'd0;
wire data_out_fifo_syncfifo_writable;
reg data_out_fifo_syncfifo_re = 1'd0;
wire data_out_fifo_syncfifo_readable;
reg [63:0] data_out_fifo_syncfifo_din = 64'd0;
wire [63:0] data_out_fifo_syncfifo_dout;
reg [4:0] data_out_fifo_level = 5'd0;
reg data_out_fifo_replace = 1'd0;
reg [3:0] data_out_fifo_produce = 4'd0;
reg [3:0] data_out_fifo_consume = 4'd0;
reg [3:0] data_out_fifo_wrport_adr;
wire [63:0] data_out_fifo_wrport_dat_r;
wire data_out_fifo_wrport_we;
wire [63:0] data_out_fifo_wrport_dat_w;
wire data_out_fifo_do_read;
wire [3:0] data_out_fifo_rdport_adr;
wire [63:0] data_out_fifo_rdport_dat_r;
reg [31:0] addr_in = 32'd0;
wire [15:0] row_addr;
wire [9:0] col_addr;
wire [1:0] bank_group_addr;
wire [1:0] bank_addr;
reg [63:0] clockdomaincrossing_src_data = 64'd0;
reg clockdomaincrossing_dst_rst = 1'd0;
reg [63:0] clockdomaincrossing_dst_data = 64'd0;
reg [63:0] clockdomaincrossing_sync_ff1 = 64'd0;
reg [63:0] clockdomaincrossing_sync_ff2 = 64'd0;
reg [63:0] data_in_cdc_src_data = 64'd0;
reg data_in_cdc_dst_rst = 1'd0;
reg [63:0] data_in_cdc_dst_data = 64'd0;
reg [63:0] data_in_cdc_sync_ff1 = 64'd0;
reg [63:0] data_in_cdc_sync_ff2 = 64'd0;
reg [63:0] data_out_cdc_src_data = 64'd0;
reg data_out_cdc_dst_rst = 1'd0;
reg [63:0] data_out_cdc_dst_data = 64'd0;
reg [63:0] data_out_cdc_sync_ff1 = 64'd0;
reg [63:0] data_out_cdc_sync_ff2 = 64'd0;
reg qosmanager1_rst = 1'd0;
wire [3:0] qosmanager1_grant;
reg [1:0] qosmanager1_current_priority = 2'd0;
reg qosmanager1_request_completed = 1'd0;
reg [31:0] qosmanager10 = 32'd0;
reg [31:0] qosmanager11 = 32'd0;
reg [31:0] qosmanager12 = 32'd0;
reg [31:0] qosmanager13 = 32'd0;
reg refreshmanager1_rst = 1'd0;
reg refreshmanager1_refresh_needed = 1'd0;
reg refreshmanager1_refresh_done = 1'd0;
reg [31:0] refreshmanager1_counter = 32'd0;
reg refreshmanager1_refresh_in_progress = 1'd0;
reg [31:0] refreshmanager10 = 32'd0;
reg [31:0] refreshmanager11 = 32'd0;
reg [31:0] refreshmanager12 = 32'd0;
reg [31:0] refreshmanager13 = 32'd0;
reg [31:0] refreshmanager14 = 32'd0;
reg [31:0] refreshmanager15 = 32'd0;
reg [31:0] refreshmanager16 = 32'd0;
reg [31:0] refreshmanager17 = 32'd0;
reg [31:0] refreshmanager18 = 32'd0;
reg [31:0] refreshmanager19 = 32'd0;
reg [31:0] refreshmanager110 = 32'd0;
reg [31:0] refreshmanager111 = 32'd0;
reg [31:0] refreshmanager112 = 32'd0;
reg [31:0] refreshmanager113 = 32'd0;
reg [31:0] refreshmanager114 = 32'd0;
reg [31:0] refreshmanager115 = 32'd0;
reg powermanagement1_rst = 1'd0;
reg [3:0] powermanagement1_cmd_decoded = 4'd0;
reg [1:0] powermanagement1_power_state = 2'd0;
reg powermanagement1_enter_power_down = 1'd0;
reg powermanagement1_power_down_entered = 1'd0;
reg powermanagement1_power_down_ready = 1'd0;
reg [7:0] powermanagement1_temperature = 8'd0;
reg powermanagement1_low_power_mode = 1'd0;
reg [31:0] powermanagement1_idle_counter = 32'd0;
reg [63:0] ecc_encoder_data_in = 64'd0;
wire [71:0] ecc_encoder_data_out;
wire [7:0] ecc_encoder_parity;
reg [71:0] ecc_decoder_data_in = 72'd0;
wire [63:0] ecc_decoder_data_out;
wire ecc_decoder_error_detected;
wire [7:0] ecc_decoder_parity;

// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on


// synthesis translate_off
reg dummy_d;
// synthesis translate_on
always @(*) begin
	data_buffer_write_fifo_wrport_adr <= 3'd0;
	if (data_buffer_write_fifo_replace) begin
		data_buffer_write_fifo_wrport_adr <= (data_buffer_write_fifo_produce - 1'd1);
	end else begin
		data_buffer_write_fifo_wrport_adr <= data_buffer_write_fifo_produce;
	end
// synthesis translate_off
	dummy_d <= dummy_s;
// synthesis translate_on
end
assign data_buffer_write_fifo_wrport_dat_w = data_buffer_write_fifo_syncfifo_din;
assign data_buffer_write_fifo_wrport_we = (data_buffer_write_fifo_syncfifo_we & (data_buffer_write_fifo_syncfifo_writable | data_buffer_write_fifo_replace));
assign data_buffer_write_fifo_do_read = (data_buffer_write_fifo_syncfifo_readable & data_buffer_write_fifo_syncfifo_re);
assign data_buffer_write_fifo_rdport_adr = data_buffer_write_fifo_consume;
assign data_buffer_write_fifo_syncfifo_dout = data_buffer_write_fifo_rdport_dat_r;
assign data_buffer_write_fifo_syncfifo_writable = (data_buffer_write_fifo_level != 4'd8);
assign data_buffer_write_fifo_syncfifo_readable = (data_buffer_write_fifo_level != 1'd0);

// synthesis translate_off
reg dummy_d_1;
// synthesis translate_on
always @(*) begin
	data_buffer_read_fifo_wrport_adr <= 3'd0;
	if (data_buffer_read_fifo_replace) begin
		data_buffer_read_fifo_wrport_adr <= (data_buffer_read_fifo_produce - 1'd1);
	end else begin
		data_buffer_read_fifo_wrport_adr <= data_buffer_read_fifo_produce;
	end
// synthesis translate_off
	dummy_d_1 <= dummy_s;
// synthesis translate_on
end
assign data_buffer_read_fifo_wrport_dat_w = data_buffer_read_fifo_syncfifo_din;
assign data_buffer_read_fifo_wrport_we = (data_buffer_read_fifo_syncfifo_we & (data_buffer_read_fifo_syncfifo_writable | data_buffer_read_fifo_replace));
assign data_buffer_read_fifo_do_read = (data_buffer_read_fifo_syncfifo_readable & data_buffer_read_fifo_syncfifo_re);
assign data_buffer_read_fifo_rdport_adr = data_buffer_read_fifo_consume;
assign data_buffer_read_fifo_syncfifo_dout = data_buffer_read_fifo_rdport_dat_r;
assign data_buffer_read_fifo_syncfifo_writable = (data_buffer_read_fifo_level != 4'd8);
assign data_buffer_read_fifo_syncfifo_readable = (data_buffer_read_fifo_level != 1'd0);
assign row_buffer_manager_row_hit = (row_buffer_manager_row_open & (row_buffer_manager_current_row == row_buffer_manager_requested_row));
assign qosmanager0_grant = (1'd1 <<< qosmanager0_current_priority);

// synthesis translate_off
reg dummy_d_2;
// synthesis translate_on
always @(*) begin
	data_in_fifo_wrport_adr <= 4'd0;
	if (data_in_fifo_replace) begin
		data_in_fifo_wrport_adr <= (data_in_fifo_produce - 1'd1);
	end else begin
		data_in_fifo_wrport_adr <= data_in_fifo_produce;
	end
// synthesis translate_off
	dummy_d_2 <= dummy_s;
// synthesis translate_on
end
assign data_in_fifo_wrport_dat_w = data_in_fifo_syncfifo_din;
assign data_in_fifo_wrport_we = (data_in_fifo_syncfifo_we & (data_in_fifo_syncfifo_writable | data_in_fifo_replace));
assign data_in_fifo_do_read = (data_in_fifo_syncfifo_readable & data_in_fifo_syncfifo_re);
assign data_in_fifo_rdport_adr = data_in_fifo_consume;
assign data_in_fifo_syncfifo_dout = data_in_fifo_rdport_dat_r;
assign data_in_fifo_syncfifo_writable = (data_in_fifo_level != 5'd16);
assign data_in_fifo_syncfifo_readable = (data_in_fifo_level != 1'd0);

// synthesis translate_off
reg dummy_d_3;
// synthesis translate_on
always @(*) begin
	data_out_fifo_wrport_adr <= 4'd0;
	if (data_out_fifo_replace) begin
		data_out_fifo_wrport_adr <= (data_out_fifo_produce - 1'd1);
	end else begin
		data_out_fifo_wrport_adr <= data_out_fifo_produce;
	end
// synthesis translate_off
	dummy_d_3 <= dummy_s;
// synthesis translate_on
end
assign data_out_fifo_wrport_dat_w = data_out_fifo_syncfifo_din;
assign data_out_fifo_wrport_we = (data_out_fifo_syncfifo_we & (data_out_fifo_syncfifo_writable | data_out_fifo_replace));
assign data_out_fifo_do_read = (data_out_fifo_syncfifo_readable & data_out_fifo_syncfifo_re);
assign data_out_fifo_rdport_adr = data_out_fifo_consume;
assign data_out_fifo_syncfifo_dout = data_out_fifo_rdport_dat_r;
assign data_out_fifo_syncfifo_writable = (data_out_fifo_level != 5'd16);
assign data_out_fifo_syncfifo_readable = (data_out_fifo_level != 1'd0);
assign row_addr = {addr_in[4:2], addr_in[28:16]};
assign col_addr = addr_in[14:5];
assign bank_addr = addr_in[13:12];
assign bank_group_addr = addr_in[15:14];
assign qosmanager1_grant = (1'd1 <<< qosmanager1_current_priority);
assign ecc_encoder_parity = (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((ecc_encoder_data_in[0] ^ ecc_encoder_data_in[1]) ^ ecc_encoder_data_in[2]) ^ ecc_encoder_data_in[3]) ^ ecc_encoder_data_in[4]) ^ ecc_encoder_data_in[5]) ^ ecc_encoder_data_in[6]) ^ ecc_encoder_data_in[7]) ^ ecc_encoder_data_in[8]) ^ ecc_encoder_data_in[9]) ^ ecc_encoder_data_in[10]) ^ ecc_encoder_data_in[11]) ^ ecc_encoder_data_in[12]) ^ ecc_encoder_data_in[13]) ^ ecc_encoder_data_in[14]) ^ ecc_encoder_data_in[15]) ^ ecc_encoder_data_in[16]) ^ ecc_encoder_data_in[17]) ^ ecc_encoder_data_in[18]) ^ ecc_encoder_data_in[19]) ^ ecc_encoder_data_in[20]) ^ ecc_encoder_data_in[21]) ^ ecc_encoder_data_in[22]) ^ ecc_encoder_data_in[23]) ^ ecc_encoder_data_in[24]) ^ ecc_encoder_data_in[25]) ^ ecc_encoder_data_in[26]) ^ ecc_encoder_data_in[27]) ^ ecc_encoder_data_in[28]) ^ ecc_encoder_data_in[29]) ^ ecc_encoder_data_in[30]) ^ ecc_encoder_data_in[31]) ^ ecc_encoder_data_in[32]) ^ ecc_encoder_data_in[33]) ^ ecc_encoder_data_in[34]) ^ ecc_encoder_data_in[35]) ^ ecc_encoder_data_in[36]) ^ ecc_encoder_data_in[37]) ^ ecc_encoder_data_in[38]) ^ ecc_encoder_data_in[39]) ^ ecc_encoder_data_in[40]) ^ ecc_encoder_data_in[41]) ^ ecc_encoder_data_in[42]) ^ ecc_encoder_data_in[43]) ^ ecc_encoder_data_in[44]) ^ ecc_encoder_data_in[45]) ^ ecc_encoder_data_in[46]) ^ ecc_encoder_data_in[47]) ^ ecc_encoder_data_in[48]) ^ ecc_encoder_data_in[49]) ^ ecc_encoder_data_in[50]) ^ ecc_encoder_data_in[51]) ^ ecc_encoder_data_in[52]) ^ ecc_encoder_data_in[53]) ^ ecc_encoder_data_in[54]) ^ ecc_encoder_data_in[55]) ^ ecc_encoder_data_in[56]) ^ ecc_encoder_data_in[57]) ^ ecc_encoder_data_in[58]) ^ ecc_encoder_data_in[59]) ^ ecc_encoder_data_in[60]) ^ ecc_encoder_data_in[61]) ^ ecc_encoder_data_in[62]) ^ ecc_encoder_data_in[63]);
assign ecc_encoder_data_out = {ecc_encoder_parity, ecc_encoder_data_in};
assign ecc_decoder_data_out = ecc_decoder_data_in[63:0];
assign ecc_decoder_parity = (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((ecc_decoder_data_in[0] ^ ecc_decoder_data_in[1]) ^ ecc_decoder_data_in[2]) ^ ecc_decoder_data_in[3]) ^ ecc_decoder_data_in[4]) ^ ecc_decoder_data_in[5]) ^ ecc_decoder_data_in[6]) ^ ecc_decoder_data_in[7]) ^ ecc_decoder_data_in[8]) ^ ecc_decoder_data_in[9]) ^ ecc_decoder_data_in[10]) ^ ecc_decoder_data_in[11]) ^ ecc_decoder_data_in[12]) ^ ecc_decoder_data_in[13]) ^ ecc_decoder_data_in[14]) ^ ecc_decoder_data_in[15]) ^ ecc_decoder_data_in[16]) ^ ecc_decoder_data_in[17]) ^ ecc_decoder_data_in[18]) ^ ecc_decoder_data_in[19]) ^ ecc_decoder_data_in[20]) ^ ecc_decoder_data_in[21]) ^ ecc_decoder_data_in[22]) ^ ecc_decoder_data_in[23]) ^ ecc_decoder_data_in[24]) ^ ecc_decoder_data_in[25]) ^ ecc_decoder_data_in[26]) ^ ecc_decoder_data_in[27]) ^ ecc_decoder_data_in[28]) ^ ecc_decoder_data_in[29]) ^ ecc_decoder_data_in[30]) ^ ecc_decoder_data_in[31]) ^ ecc_decoder_data_in[32]) ^ ecc_decoder_data_in[33]) ^ ecc_decoder_data_in[34]) ^ ecc_decoder_data_in[35]) ^ ecc_decoder_data_in[36]) ^ ecc_decoder_data_in[37]) ^ ecc_decoder_data_in[38]) ^ ecc_decoder_data_in[39]) ^ ecc_decoder_data_in[40]) ^ ecc_decoder_data_in[41]) ^ ecc_decoder_data_in[42]) ^ ecc_decoder_data_in[43]) ^ ecc_decoder_data_in[44]) ^ ecc_decoder_data_in[45]) ^ ecc_decoder_data_in[46]) ^ ecc_decoder_data_in[47]) ^ ecc_decoder_data_in[48]) ^ ecc_decoder_data_in[49]) ^ ecc_decoder_data_in[50]) ^ ecc_decoder_data_in[51]) ^ ecc_decoder_data_in[52]) ^ ecc_decoder_data_in[53]) ^ ecc_decoder_data_in[54]) ^ ecc_decoder_data_in[55]) ^ ecc_decoder_data_in[56]) ^ ecc_decoder_data_in[57]) ^ ecc_decoder_data_in[58]) ^ ecc_decoder_data_in[59]) ^ ecc_decoder_data_in[60]) ^ ecc_decoder_data_in[61]) ^ ecc_decoder_data_in[62]) ^ ecc_decoder_data_in[63]);
assign ecc_decoder_error_detected = (ecc_decoder_parity != ecc_decoder_data_in[71:64]);

always @(posedge dst_clk) begin
	if (clockdomaincrossing_dst_rst) begin
		clockdomaincrossing_sync_ff2 <= 1'd0;
		clockdomaincrossing_dst_data <= 1'd0;
	end else begin
		clockdomaincrossing_sync_ff2 <= clockdomaincrossing_sync_ff1;
		clockdomaincrossing_dst_data <= clockdomaincrossing_sync_ff2;
	end
	if (data_in_cdc_dst_rst) begin
		data_in_cdc_sync_ff2 <= 1'd0;
		data_in_cdc_dst_data <= 1'd0;
	end else begin
		data_in_cdc_sync_ff2 <= data_in_cdc_sync_ff1;
		data_in_cdc_dst_data <= data_in_cdc_sync_ff2;
	end
	if (data_out_cdc_dst_rst) begin
		data_out_cdc_sync_ff2 <= 1'd0;
		data_out_cdc_dst_data <= 1'd0;
	end else begin
		data_out_cdc_sync_ff2 <= data_out_cdc_sync_ff1;
		data_out_cdc_dst_data <= data_out_cdc_sync_ff2;
	end
	if (dst_rst) begin
		clockdomaincrossing_dst_data <= 64'd0;
		clockdomaincrossing_sync_ff2 <= 64'd0;
		data_in_cdc_dst_data <= 64'd0;
		data_in_cdc_sync_ff2 <= 64'd0;
		data_out_cdc_dst_data <= 64'd0;
		data_out_cdc_sync_ff2 <= 64'd0;
	end
end

always @(posedge src_clk) begin
	clockdomaincrossing_sync_ff1 <= clockdomaincrossing_src_data;
	data_in_cdc_sync_ff1 <= data_in_cdc_src_data;
	data_out_cdc_sync_ff1 <= data_out_cdc_src_data;
	if (src_rst) begin
		clockdomaincrossing_sync_ff1 <= 64'd0;
		data_in_cdc_sync_ff1 <= 64'd0;
		data_out_cdc_sync_ff1 <= 64'd0;
	end
end

always @(posedge sys_clk) begin
	if (timing_controller_rst) begin
		timing_controller_timer <= 1'd0;
		timing_controller_ready <= 1'd1;
	end else begin
		if ((timing_controller_cmd_decoded != 1'd0)) begin
			timing_controller_timer <= 5'd18;
			timing_controller_ready <= 1'd0;
		end else begin
			if ((timing_controller_timer > 1'd0)) begin
				timing_controller_timer <= (timing_controller_timer - 1'd1);
			end else begin
				timing_controller_ready <= 1'd1;
			end
		end
	end
	if (command_decoder_rst) begin
		command_decoder_cmd_decoded <= 1'd0;
		command_decoder_address <= 1'd0;
	end else begin
		command_decoder_address <= command_decoder_addr;
		case ({command_decoder_refresh, command_decoder_precharge, command_decoder_activate, command_decoder_mem_write, command_decoder_mem_read})
			1'd1: begin
				command_decoder_cmd_decoded <= 1'd1;
			end
			2'd2: begin
				command_decoder_cmd_decoded <= 2'd2;
			end
			3'd4: begin
				command_decoder_cmd_decoded <= 2'd3;
			end
			4'd8: begin
				command_decoder_cmd_decoded <= 3'd4;
			end
			5'd16: begin
				command_decoder_cmd_decoded <= 3'd5;
			end
			default: begin
				command_decoder_cmd_decoded <= 1'd0;
			end
		endcase
	end
	if (data_buffer_rst) begin
		data_buffer_write_fifo_syncfifo_we <= 1'd0;
		data_buffer_read_fifo_syncfifo_re <= 1'd0;
	end else begin
		if (data_buffer_ready) begin
			if (data_buffer_mem_write) begin
				data_buffer_write_fifo_syncfifo_din <= data_buffer_data_in;
				data_buffer_write_fifo_syncfifo_we <= 1'd1;
			end else begin
				if (data_buffer_mem_read) begin
					data_buffer_data_out <= data_buffer_read_fifo_syncfifo_dout;
					data_buffer_read_fifo_syncfifo_re <= 1'd1;
				end else begin
					data_buffer_write_fifo_syncfifo_we <= 1'd0;
					data_buffer_read_fifo_syncfifo_re <= 1'd0;
				end
			end
		end
	end
	if (((data_buffer_write_fifo_syncfifo_we & data_buffer_write_fifo_syncfifo_writable) & (~data_buffer_write_fifo_replace))) begin
		data_buffer_write_fifo_produce <= (data_buffer_write_fifo_produce + 1'd1);
	end
	if (data_buffer_write_fifo_do_read) begin
		data_buffer_write_fifo_consume <= (data_buffer_write_fifo_consume + 1'd1);
	end
	if (((data_buffer_write_fifo_syncfifo_we & data_buffer_write_fifo_syncfifo_writable) & (~data_buffer_write_fifo_replace))) begin
		if ((~data_buffer_write_fifo_do_read)) begin
			data_buffer_write_fifo_level <= (data_buffer_write_fifo_level + 1'd1);
		end
	end else begin
		if (data_buffer_write_fifo_do_read) begin
			data_buffer_write_fifo_level <= (data_buffer_write_fifo_level - 1'd1);
		end
	end
	if (((data_buffer_read_fifo_syncfifo_we & data_buffer_read_fifo_syncfifo_writable) & (~data_buffer_read_fifo_replace))) begin
		data_buffer_read_fifo_produce <= (data_buffer_read_fifo_produce + 1'd1);
	end
	if (data_buffer_read_fifo_do_read) begin
		data_buffer_read_fifo_consume <= (data_buffer_read_fifo_consume + 1'd1);
	end
	if (((data_buffer_read_fifo_syncfifo_we & data_buffer_read_fifo_syncfifo_writable) & (~data_buffer_read_fifo_replace))) begin
		if ((~data_buffer_read_fifo_do_read)) begin
			data_buffer_read_fifo_level <= (data_buffer_read_fifo_level + 1'd1);
		end
	end else begin
		if (data_buffer_read_fifo_do_read) begin
			data_buffer_read_fifo_level <= (data_buffer_read_fifo_level - 1'd1);
		end
	end
	if (powermanagement0_rst) begin
		powermanagement0_power_state <= 1'd0;
		powermanagement0_idle_counter <= 1'd0;
		powermanagement0_power_down_ready <= 1'd0;
		powermanagement0_power_down_entered <= 1'd0;
		powermanagement0_low_power_mode <= 1'd0;
	end else begin
		if ((powermanagement0_cmd_decoded != 1'd0)) begin
			powermanagement0_idle_counter <= 1'd0;
			powermanagement0_power_down_ready <= 1'd0;
		end else begin
			if ((powermanagement0_idle_counter < 10'd1000)) begin
				powermanagement0_idle_counter <= (powermanagement0_idle_counter + 1'd1);
			end else begin
				powermanagement0_power_down_ready <= 1'd1;
			end
		end
	end
	if ((powermanagement0_enter_power_down & powermanagement0_power_down_ready)) begin
		powermanagement0_power_state <= 1'd1;
		powermanagement0_power_down_entered <= 1'd1;
	end else begin
		if ((powermanagement0_cmd_decoded != 1'd0)) begin
			powermanagement0_power_state <= 1'd0;
			powermanagement0_power_down_entered <= 1'd0;
		end
	end
	if ((powermanagement0_temperature >= 7'd70)) begin
		powermanagement0_low_power_mode <= 1'd1;
	end else begin
		powermanagement0_low_power_mode <= 1'd0;
	end
	if (refreshmanager0_rst) begin
		refreshmanager0_counter <= 1'd0;
		refreshmanager0_refresh_needed <= 1'd0;
		refreshmanager0_refresh_in_progress <= 1'd0;
		refreshmanager00 <= 1'd0;
		refreshmanager01 <= 1'd0;
		refreshmanager02 <= 1'd0;
		refreshmanager03 <= 1'd0;
		refreshmanager04 <= 1'd0;
		refreshmanager05 <= 1'd0;
		refreshmanager06 <= 1'd0;
		refreshmanager07 <= 1'd0;
		refreshmanager08 <= 1'd0;
		refreshmanager09 <= 1'd0;
		refreshmanager010 <= 1'd0;
		refreshmanager011 <= 1'd0;
		refreshmanager012 <= 1'd0;
		refreshmanager013 <= 1'd0;
		refreshmanager014 <= 1'd0;
		refreshmanager015 <= 1'd0;
	end else begin
		if (refreshmanager0_refresh_in_progress) begin
			if ((refreshmanager0_counter >= 9'd350)) begin
				refreshmanager0_refresh_in_progress <= 1'd0;
				refreshmanager0_counter <= 1'd0;
			end else begin
				refreshmanager0_counter <= (refreshmanager0_counter + 1'd1);
			end
		end else begin
			refreshmanager0_counter <= (refreshmanager0_counter + 1'd1);
			if ((refreshmanager0_counter >= 26'd64000000)) begin
				refreshmanager0_refresh_needed <= 1'd1;
			end
			if (refreshmanager0_refresh_done) begin
				refreshmanager0_refresh_needed <= 1'd0;
				refreshmanager0_refresh_in_progress <= 1'd1;
				refreshmanager0_counter <= 1'd0;
			end
		end
	end
	if (command_scheduler_rst) begin
		command_scheduler_cmd_ready <= 1'd0;
	end else begin
		if (command_scheduler_cmd_valid) begin
		end else begin
			if (command_scheduler_cmd_executed) begin
			end
		end
	end
	if (row_buffer_manager_rst) begin
		row_buffer_manager_row_open <= 1'd0;
		row_buffer_manager_current_row <= 1'd0;
	end else begin
		if (row_buffer_manager_row_activate) begin
			row_buffer_manager_row_open <= 1'd1;
			row_buffer_manager_current_row <= row_buffer_manager_requested_row;
		end else begin
			if (row_buffer_manager_row_precharge) begin
				row_buffer_manager_row_open <= 1'd0;
			end
		end
	end
	if (qosmanager0_rst) begin
		qosmanager0_current_priority <= 1'd0;
		qosmanager00 <= 1'd0;
		qosmanager01 <= 1'd0;
		qosmanager02 <= 1'd0;
		qosmanager03 <= 1'd0;
	end else begin
		if (qosmanager0_request_completed) begin
			if (1'd0) begin
				qosmanager0_current_priority <= ((qosmanager0_current_priority + 1'd1) & 2'd3);
			end else begin
				if (1'd1) begin
					qosmanager0_current_priority <= ((qosmanager0_current_priority + 1'd1) & 2'd3);
				end
			end
		end
	end
	if (((data_in_fifo_syncfifo_we & data_in_fifo_syncfifo_writable) & (~data_in_fifo_replace))) begin
		data_in_fifo_produce <= (data_in_fifo_produce + 1'd1);
	end
	if (data_in_fifo_do_read) begin
		data_in_fifo_consume <= (data_in_fifo_consume + 1'd1);
	end
	if (((data_in_fifo_syncfifo_we & data_in_fifo_syncfifo_writable) & (~data_in_fifo_replace))) begin
		if ((~data_in_fifo_do_read)) begin
			data_in_fifo_level <= (data_in_fifo_level + 1'd1);
		end
	end else begin
		if (data_in_fifo_do_read) begin
			data_in_fifo_level <= (data_in_fifo_level - 1'd1);
		end
	end
	if (((data_out_fifo_syncfifo_we & data_out_fifo_syncfifo_writable) & (~data_out_fifo_replace))) begin
		data_out_fifo_produce <= (data_out_fifo_produce + 1'd1);
	end
	if (data_out_fifo_do_read) begin
		data_out_fifo_consume <= (data_out_fifo_consume + 1'd1);
	end
	if (((data_out_fifo_syncfifo_we & data_out_fifo_syncfifo_writable) & (~data_out_fifo_replace))) begin
		if ((~data_out_fifo_do_read)) begin
			data_out_fifo_level <= (data_out_fifo_level + 1'd1);
		end
	end else begin
		if (data_out_fifo_do_read) begin
			data_out_fifo_level <= (data_out_fifo_level - 1'd1);
		end
	end
	if (qosmanager1_rst) begin
		qosmanager1_current_priority <= 1'd0;
		qosmanager10 <= 1'd0;
		qosmanager11 <= 1'd0;
		qosmanager12 <= 1'd0;
		qosmanager13 <= 1'd0;
	end else begin
		if (qosmanager1_request_completed) begin
			if (1'd0) begin
				qosmanager1_current_priority <= ((qosmanager1_current_priority + 1'd1) & 2'd3);
			end else begin
				if (1'd1) begin
					qosmanager1_current_priority <= ((qosmanager1_current_priority + 1'd1) & 2'd3);
				end
			end
		end
	end
	if (refreshmanager1_rst) begin
		refreshmanager1_counter <= 1'd0;
		refreshmanager1_refresh_needed <= 1'd0;
		refreshmanager1_refresh_in_progress <= 1'd0;
		refreshmanager10 <= 1'd0;
		refreshmanager11 <= 1'd0;
		refreshmanager12 <= 1'd0;
		refreshmanager13 <= 1'd0;
		refreshmanager14 <= 1'd0;
		refreshmanager15 <= 1'd0;
		refreshmanager16 <= 1'd0;
		refreshmanager17 <= 1'd0;
		refreshmanager18 <= 1'd0;
		refreshmanager19 <= 1'd0;
		refreshmanager110 <= 1'd0;
		refreshmanager111 <= 1'd0;
		refreshmanager112 <= 1'd0;
		refreshmanager113 <= 1'd0;
		refreshmanager114 <= 1'd0;
		refreshmanager115 <= 1'd0;
	end else begin
		if (refreshmanager1_refresh_in_progress) begin
			if ((refreshmanager1_counter >= 9'd350)) begin
				refreshmanager1_refresh_in_progress <= 1'd0;
				refreshmanager1_counter <= 1'd0;
			end else begin
				refreshmanager1_counter <= (refreshmanager1_counter + 1'd1);
			end
		end else begin
			refreshmanager1_counter <= (refreshmanager1_counter + 1'd1);
			if ((refreshmanager1_counter >= 26'd64000000)) begin
				refreshmanager1_refresh_needed <= 1'd1;
			end
			if (refreshmanager1_refresh_done) begin
				refreshmanager1_refresh_needed <= 1'd0;
				refreshmanager1_refresh_in_progress <= 1'd1;
				refreshmanager1_counter <= 1'd0;
			end
		end
	end
	if (powermanagement1_rst) begin
		powermanagement1_power_state <= 1'd0;
		powermanagement1_idle_counter <= 1'd0;
		powermanagement1_power_down_ready <= 1'd0;
		powermanagement1_power_down_entered <= 1'd0;
		powermanagement1_low_power_mode <= 1'd0;
	end else begin
		if ((powermanagement1_cmd_decoded != 1'd0)) begin
			powermanagement1_idle_counter <= 1'd0;
			powermanagement1_power_down_ready <= 1'd0;
		end else begin
			if ((powermanagement1_idle_counter < 10'd1000)) begin
				powermanagement1_idle_counter <= (powermanagement1_idle_counter + 1'd1);
			end else begin
				powermanagement1_power_down_ready <= 1'd1;
			end
		end
	end
	if ((powermanagement1_enter_power_down & powermanagement1_power_down_ready)) begin
		powermanagement1_power_state <= 1'd1;
		powermanagement1_power_down_entered <= 1'd1;
	end else begin
		if ((powermanagement1_cmd_decoded != 1'd0)) begin
			powermanagement1_power_state <= 1'd0;
			powermanagement1_power_down_entered <= 1'd0;
		end
	end
	if ((powermanagement1_temperature >= 7'd70)) begin
		powermanagement1_low_power_mode <= 1'd1;
	end else begin
		powermanagement1_low_power_mode <= 1'd0;
	end
	if (sys_rst) begin
		timing_controller_ready <= 1'd0;
		timing_controller_timer <= 32'd0;
		command_decoder_cmd_decoded <= 4'd0;
		command_decoder_address <= 32'd0;
		data_buffer_data_out <= 64'd0;
		data_buffer_write_fifo_syncfifo_we <= 1'd0;
		data_buffer_write_fifo_level <= 4'd0;
		data_buffer_write_fifo_produce <= 3'd0;
		data_buffer_write_fifo_consume <= 3'd0;
		data_buffer_read_fifo_syncfifo_re <= 1'd0;
		data_buffer_read_fifo_level <= 4'd0;
		data_buffer_read_fifo_produce <= 3'd0;
		data_buffer_read_fifo_consume <= 3'd0;
		powermanagement0_power_state <= 2'd0;
		powermanagement0_power_down_entered <= 1'd0;
		powermanagement0_power_down_ready <= 1'd0;
		powermanagement0_low_power_mode <= 1'd0;
		powermanagement0_idle_counter <= 32'd0;
		refreshmanager0_refresh_needed <= 1'd0;
		refreshmanager0_counter <= 32'd0;
		refreshmanager0_refresh_in_progress <= 1'd0;
		refreshmanager00 <= 32'd0;
		refreshmanager01 <= 32'd0;
		refreshmanager02 <= 32'd0;
		refreshmanager03 <= 32'd0;
		refreshmanager04 <= 32'd0;
		refreshmanager05 <= 32'd0;
		refreshmanager06 <= 32'd0;
		refreshmanager07 <= 32'd0;
		refreshmanager08 <= 32'd0;
		refreshmanager09 <= 32'd0;
		refreshmanager010 <= 32'd0;
		refreshmanager011 <= 32'd0;
		refreshmanager012 <= 32'd0;
		refreshmanager013 <= 32'd0;
		refreshmanager014 <= 32'd0;
		refreshmanager015 <= 32'd0;
		command_scheduler_cmd_ready <= 1'd0;
		row_buffer_manager_current_row <= 16'd0;
		row_buffer_manager_row_open <= 1'd0;
		qosmanager0_current_priority <= 2'd0;
		qosmanager00 <= 32'd0;
		qosmanager01 <= 32'd0;
		qosmanager02 <= 32'd0;
		qosmanager03 <= 32'd0;
		data_in_fifo_level <= 5'd0;
		data_in_fifo_produce <= 4'd0;
		data_in_fifo_consume <= 4'd0;
		data_out_fifo_level <= 5'd0;
		data_out_fifo_produce <= 4'd0;
		data_out_fifo_consume <= 4'd0;
		qosmanager1_current_priority <= 2'd0;
		qosmanager10 <= 32'd0;
		qosmanager11 <= 32'd0;
		qosmanager12 <= 32'd0;
		qosmanager13 <= 32'd0;
		refreshmanager1_refresh_needed <= 1'd0;
		refreshmanager1_counter <= 32'd0;
		refreshmanager1_refresh_in_progress <= 1'd0;
		refreshmanager10 <= 32'd0;
		refreshmanager11 <= 32'd0;
		refreshmanager12 <= 32'd0;
		refreshmanager13 <= 32'd0;
		refreshmanager14 <= 32'd0;
		refreshmanager15 <= 32'd0;
		refreshmanager16 <= 32'd0;
		refreshmanager17 <= 32'd0;
		refreshmanager18 <= 32'd0;
		refreshmanager19 <= 32'd0;
		refreshmanager110 <= 32'd0;
		refreshmanager111 <= 32'd0;
		refreshmanager112 <= 32'd0;
		refreshmanager113 <= 32'd0;
		refreshmanager114 <= 32'd0;
		refreshmanager115 <= 32'd0;
		powermanagement1_power_state <= 2'd0;
		powermanagement1_power_down_entered <= 1'd0;
		powermanagement1_power_down_ready <= 1'd0;
		powermanagement1_low_power_mode <= 1'd0;
		powermanagement1_idle_counter <= 32'd0;
	end
end

reg [63:0] storage[0:7];
reg [63:0] memdat;
always @(posedge sys_clk) begin
	if (data_buffer_write_fifo_wrport_we)
		storage[data_buffer_write_fifo_wrport_adr] <= data_buffer_write_fifo_wrport_dat_w;
	memdat <= storage[data_buffer_write_fifo_wrport_adr];
end

always @(posedge sys_clk) begin
end

assign data_buffer_write_fifo_wrport_dat_r = memdat;
assign data_buffer_write_fifo_rdport_dat_r = storage[data_buffer_write_fifo_rdport_adr];

reg [63:0] storage_1[0:7];
reg [63:0] memdat_1;
always @(posedge sys_clk) begin
	if (data_buffer_read_fifo_wrport_we)
		storage_1[data_buffer_read_fifo_wrport_adr] <= data_buffer_read_fifo_wrport_dat_w;
	memdat_1 <= storage_1[data_buffer_read_fifo_wrport_adr];
end

always @(posedge sys_clk) begin
end

assign data_buffer_read_fifo_wrport_dat_r = memdat_1;
assign data_buffer_read_fifo_rdport_dat_r = storage_1[data_buffer_read_fifo_rdport_adr];

reg [63:0] storage_2[0:15];
reg [63:0] memdat_2;
always @(posedge sys_clk) begin
	if (data_in_fifo_wrport_we)
		storage_2[data_in_fifo_wrport_adr] <= data_in_fifo_wrport_dat_w;
	memdat_2 <= storage_2[data_in_fifo_wrport_adr];
end

always @(posedge sys_clk) begin
end

assign data_in_fifo_wrport_dat_r = memdat_2;
assign data_in_fifo_rdport_dat_r = storage_2[data_in_fifo_rdport_adr];

reg [63:0] storage_3[0:15];
reg [63:0] memdat_3;
always @(posedge sys_clk) begin
	if (data_out_fifo_wrport_we)
		storage_3[data_out_fifo_wrport_adr] <= data_out_fifo_wrport_dat_w;
	memdat_3 <= storage_3[data_out_fifo_wrport_adr];
end

always @(posedge sys_clk) begin
end

assign data_out_fifo_wrport_dat_r = memdat_3;
assign data_out_fifo_rdport_dat_r = storage_3[data_out_fifo_rdport_adr];

endmodule
