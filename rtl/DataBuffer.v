/* Machine-generated using Migen */
module DataBuffer(
	input sys_clk,
	input sys_rst
);

reg databuffer_rst = 1'd0;
reg databuffer_ready = 1'd0;
reg databuffer_mem_write = 1'd0;
reg databuffer_mem_read = 1'd0;
reg [63:0] databuffer_data_in = 64'd0;
reg [63:0] databuffer_data_out = 64'd0;
reg databuffer_write_fifo_syncfifo_we = 1'd0;
wire databuffer_write_fifo_syncfifo_writable;
reg databuffer_write_fifo_syncfifo_re = 1'd0;
wire databuffer_write_fifo_syncfifo_readable;
reg [63:0] databuffer_write_fifo_syncfifo_din = 64'd0;
wire [63:0] databuffer_write_fifo_syncfifo_dout;
reg [3:0] databuffer_write_fifo_level = 4'd0;
reg databuffer_write_fifo_replace = 1'd0;
reg [2:0] databuffer_write_fifo_produce = 3'd0;
reg [2:0] databuffer_write_fifo_consume = 3'd0;
reg [2:0] databuffer_write_fifo_wrport_adr;
wire [63:0] databuffer_write_fifo_wrport_dat_r;
wire databuffer_write_fifo_wrport_we;
wire [63:0] databuffer_write_fifo_wrport_dat_w;
wire databuffer_write_fifo_do_read;
wire [2:0] databuffer_write_fifo_rdport_adr;
wire [63:0] databuffer_write_fifo_rdport_dat_r;
reg databuffer_read_fifo_syncfifo_we = 1'd0;
wire databuffer_read_fifo_syncfifo_writable;
reg databuffer_read_fifo_syncfifo_re = 1'd0;
wire databuffer_read_fifo_syncfifo_readable;
reg [63:0] databuffer_read_fifo_syncfifo_din = 64'd0;
wire [63:0] databuffer_read_fifo_syncfifo_dout;
reg [3:0] databuffer_read_fifo_level = 4'd0;
reg databuffer_read_fifo_replace = 1'd0;
reg [2:0] databuffer_read_fifo_produce = 3'd0;
reg [2:0] databuffer_read_fifo_consume = 3'd0;
reg [2:0] databuffer_read_fifo_wrport_adr;
wire [63:0] databuffer_read_fifo_wrport_dat_r;
wire databuffer_read_fifo_wrport_we;
wire [63:0] databuffer_read_fifo_wrport_dat_w;
wire databuffer_read_fifo_do_read;
wire [2:0] databuffer_read_fifo_rdport_adr;
wire [63:0] databuffer_read_fifo_rdport_dat_r;

// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on


// synthesis translate_off
reg dummy_d;
// synthesis translate_on
always @(*) begin
	databuffer_write_fifo_wrport_adr <= 3'd0;
	if (databuffer_write_fifo_replace) begin
		databuffer_write_fifo_wrport_adr <= (databuffer_write_fifo_produce - 1'd1);
	end else begin
		databuffer_write_fifo_wrport_adr <= databuffer_write_fifo_produce;
	end
// synthesis translate_off
	dummy_d <= dummy_s;
// synthesis translate_on
end
assign databuffer_write_fifo_wrport_dat_w = databuffer_write_fifo_syncfifo_din;
assign databuffer_write_fifo_wrport_we = (databuffer_write_fifo_syncfifo_we & (databuffer_write_fifo_syncfifo_writable | databuffer_write_fifo_replace));
assign databuffer_write_fifo_do_read = (databuffer_write_fifo_syncfifo_readable & databuffer_write_fifo_syncfifo_re);
assign databuffer_write_fifo_rdport_adr = databuffer_write_fifo_consume;
assign databuffer_write_fifo_syncfifo_dout = databuffer_write_fifo_rdport_dat_r;
assign databuffer_write_fifo_syncfifo_writable = (databuffer_write_fifo_level != 4'd8);
assign databuffer_write_fifo_syncfifo_readable = (databuffer_write_fifo_level != 1'd0);

// synthesis translate_off
reg dummy_d_1;
// synthesis translate_on
always @(*) begin
	databuffer_read_fifo_wrport_adr <= 3'd0;
	if (databuffer_read_fifo_replace) begin
		databuffer_read_fifo_wrport_adr <= (databuffer_read_fifo_produce - 1'd1);
	end else begin
		databuffer_read_fifo_wrport_adr <= databuffer_read_fifo_produce;
	end
// synthesis translate_off
	dummy_d_1 <= dummy_s;
// synthesis translate_on
end
assign databuffer_read_fifo_wrport_dat_w = databuffer_read_fifo_syncfifo_din;
assign databuffer_read_fifo_wrport_we = (databuffer_read_fifo_syncfifo_we & (databuffer_read_fifo_syncfifo_writable | databuffer_read_fifo_replace));
assign databuffer_read_fifo_do_read = (databuffer_read_fifo_syncfifo_readable & databuffer_read_fifo_syncfifo_re);
assign databuffer_read_fifo_rdport_adr = databuffer_read_fifo_consume;
assign databuffer_read_fifo_syncfifo_dout = databuffer_read_fifo_rdport_dat_r;
assign databuffer_read_fifo_syncfifo_writable = (databuffer_read_fifo_level != 4'd8);
assign databuffer_read_fifo_syncfifo_readable = (databuffer_read_fifo_level != 1'd0);

always @(posedge sys_clk) begin
	if (databuffer_rst) begin
		databuffer_write_fifo_syncfifo_we <= 1'd0;
		databuffer_read_fifo_syncfifo_re <= 1'd0;
	end else begin
		if (databuffer_ready) begin
			if (databuffer_mem_write) begin
				databuffer_write_fifo_syncfifo_din <= databuffer_data_in;
				databuffer_write_fifo_syncfifo_we <= 1'd1;
			end else begin
				if (databuffer_mem_read) begin
					databuffer_data_out <= databuffer_read_fifo_syncfifo_dout;
					databuffer_read_fifo_syncfifo_re <= 1'd1;
				end else begin
					databuffer_write_fifo_syncfifo_we <= 1'd0;
					databuffer_read_fifo_syncfifo_re <= 1'd0;
				end
			end
		end
	end
	if (((databuffer_write_fifo_syncfifo_we & databuffer_write_fifo_syncfifo_writable) & (~databuffer_write_fifo_replace))) begin
		databuffer_write_fifo_produce <= (databuffer_write_fifo_produce + 1'd1);
	end
	if (databuffer_write_fifo_do_read) begin
		databuffer_write_fifo_consume <= (databuffer_write_fifo_consume + 1'd1);
	end
	if (((databuffer_write_fifo_syncfifo_we & databuffer_write_fifo_syncfifo_writable) & (~databuffer_write_fifo_replace))) begin
		if ((~databuffer_write_fifo_do_read)) begin
			databuffer_write_fifo_level <= (databuffer_write_fifo_level + 1'd1);
		end
	end else begin
		if (databuffer_write_fifo_do_read) begin
			databuffer_write_fifo_level <= (databuffer_write_fifo_level - 1'd1);
		end
	end
	if (((databuffer_read_fifo_syncfifo_we & databuffer_read_fifo_syncfifo_writable) & (~databuffer_read_fifo_replace))) begin
		databuffer_read_fifo_produce <= (databuffer_read_fifo_produce + 1'd1);
	end
	if (databuffer_read_fifo_do_read) begin
		databuffer_read_fifo_consume <= (databuffer_read_fifo_consume + 1'd1);
	end
	if (((databuffer_read_fifo_syncfifo_we & databuffer_read_fifo_syncfifo_writable) & (~databuffer_read_fifo_replace))) begin
		if ((~databuffer_read_fifo_do_read)) begin
			databuffer_read_fifo_level <= (databuffer_read_fifo_level + 1'd1);
		end
	end else begin
		if (databuffer_read_fifo_do_read) begin
			databuffer_read_fifo_level <= (databuffer_read_fifo_level - 1'd1);
		end
	end
	if (sys_rst) begin
		databuffer_data_out <= 64'd0;
		databuffer_write_fifo_syncfifo_we <= 1'd0;
		databuffer_write_fifo_level <= 4'd0;
		databuffer_write_fifo_produce <= 3'd0;
		databuffer_write_fifo_consume <= 3'd0;
		databuffer_read_fifo_syncfifo_re <= 1'd0;
		databuffer_read_fifo_level <= 4'd0;
		databuffer_read_fifo_produce <= 3'd0;
		databuffer_read_fifo_consume <= 3'd0;
	end
end

reg [63:0] storage[0:7];
reg [63:0] memdat;
always @(posedge sys_clk) begin
	if (databuffer_write_fifo_wrport_we)
		storage[databuffer_write_fifo_wrport_adr] <= databuffer_write_fifo_wrport_dat_w;
	memdat <= storage[databuffer_write_fifo_wrport_adr];
end

always @(posedge sys_clk) begin
end

assign databuffer_write_fifo_wrport_dat_r = memdat;
assign databuffer_write_fifo_rdport_dat_r = storage[databuffer_write_fifo_rdport_adr];

reg [63:0] storage_1[0:7];
reg [63:0] memdat_1;
always @(posedge sys_clk) begin
	if (databuffer_read_fifo_wrport_we)
		storage_1[databuffer_read_fifo_wrport_adr] <= databuffer_read_fifo_wrport_dat_w;
	memdat_1 <= storage_1[databuffer_read_fifo_wrport_adr];
end

always @(posedge sys_clk) begin
end

assign databuffer_read_fifo_wrport_dat_r = memdat_1;
assign databuffer_read_fifo_rdport_dat_r = storage_1[databuffer_read_fifo_rdport_adr];

endmodule
