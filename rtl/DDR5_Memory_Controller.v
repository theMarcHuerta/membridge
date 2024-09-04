/* Machine-generated using Migen */
module DDR5_Memory_Controller(
	input clk,
	input rst,
	input [31:0] addr,
	input [63:0] data_in,
	input mem_write,
	input mem_read,
	output [63:0] data_out,
	output ready,
	input dst_clk,
	input dst_rst,
	input src_clk,
	input src_rst,
	input sys_clk,
	input sys_rst
);

wire [3:0] timingcontroller_cmd_decoded;
wire [1:0] timingcontroller_bank_group;
wire [1:0] timingcontroller_bank;
reg timingcontroller_ready = 1'd0;
reg [31:0] timingcontroller0 = 32'd0;
reg [31:0] timingcontroller1 = 32'd0;
reg [31:0] timingcontroller2 = 32'd0;
reg [31:0] timingcontroller3 = 32'd0;
reg [31:0] timingcontroller4 = 32'd0;
reg [31:0] timingcontroller5 = 32'd0;
reg [31:0] timingcontroller6 = 32'd0;
reg [31:0] timingcontroller7 = 32'd0;
reg [31:0] timingcontroller8 = 32'd0;
reg [31:0] timingcontroller9 = 32'd0;
reg [31:0] timingcontroller10 = 32'd0;
reg [31:0] timingcontroller11 = 32'd0;
reg [31:0] timingcontroller12 = 32'd0;
reg [31:0] timingcontroller13 = 32'd0;
reg [31:0] timingcontroller14 = 32'd0;
reg [31:0] timingcontroller15 = 32'd0;
wire [31:0] command_decoder_addr;
wire command_decoder_mem_read;
wire command_decoder_mem_write;
wire command_decoder_refresh;
wire command_decoder_chip_select;
wire command_decoder_ras;
wire command_decoder_cas;
wire command_decoder_we;
reg [3:0] command_decoder_cmd_decoded;
wire command_decoder_cmd_valid;
wire [15:0] command_decoder_row_addr;
wire [9:0] command_decoder_col_addr;
wire [2:0] command_decoder_bank_addr;
wire [3:0] bankstatetracker_cmd_decoded;
wire [1:0] bankstatetracker_bank_group;
wire [1:0] bankstatetracker_bank;
wire [15:0] bankstatetracker_row;
wire [1:0] bankstatetracker_bank_state;
wire [15:0] bankstatetracker_active_row;
reg [1:0] bankstatetracker0 = 2'd0;
reg [1:0] bankstatetracker1 = 2'd0;
reg [1:0] bankstatetracker2 = 2'd0;
reg [1:0] bankstatetracker3 = 2'd0;
reg [1:0] bankstatetracker4 = 2'd0;
reg [1:0] bankstatetracker5 = 2'd0;
reg [1:0] bankstatetracker6 = 2'd0;
reg [1:0] bankstatetracker7 = 2'd0;
reg [1:0] bankstatetracker8 = 2'd0;
reg [1:0] bankstatetracker9 = 2'd0;
reg [1:0] bankstatetracker10 = 2'd0;
reg [1:0] bankstatetracker11 = 2'd0;
reg [1:0] bankstatetracker12 = 2'd0;
reg [1:0] bankstatetracker13 = 2'd0;
reg [1:0] bankstatetracker14 = 2'd0;
reg [1:0] bankstatetracker15 = 2'd0;
reg [15:0] bankstatetracker16 = 16'd0;
reg [15:0] bankstatetracker17 = 16'd0;
reg [15:0] bankstatetracker18 = 16'd0;
reg [15:0] bankstatetracker19 = 16'd0;
reg [15:0] bankstatetracker20 = 16'd0;
reg [15:0] bankstatetracker21 = 16'd0;
reg [15:0] bankstatetracker22 = 16'd0;
reg [15:0] bankstatetracker23 = 16'd0;
reg [15:0] bankstatetracker24 = 16'd0;
reg [15:0] bankstatetracker25 = 16'd0;
reg [15:0] bankstatetracker26 = 16'd0;
reg [15:0] bankstatetracker27 = 16'd0;
reg [15:0] bankstatetracker28 = 16'd0;
reg [15:0] bankstatetracker29 = 16'd0;
reg [15:0] bankstatetracker30 = 16'd0;
reg [15:0] bankstatetracker31 = 16'd0;
reg data_buffer_rst = 1'd0;
reg data_buffer_ready = 1'd0;
wire data_buffer_mem_write;
wire data_buffer_mem_read;
wire [63:0] data_buffer_data_in;
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
reg refreshmanager0_refresh = 1'd0;
reg refreshmanager0_refresh_needed = 1'd0;
reg refreshmanager0_refresh_done = 1'd0;
reg [31:0] refreshmanager0_counter = 32'd0;
reg refreshmanager0_refresh_in_progress = 1'd0;
wire commandscheduler_cmd_valid;
wire [3:0] commandscheduler_cmd_type;
wire [1:0] commandscheduler_bank_group;
wire [1:0] commandscheduler_bank;
wire [15:0] commandscheduler_row;
wire [9:0] commandscheduler_col;
wire commandscheduler_row_buffer_hit;
reg commandscheduler_cmd_ready = 1'd0;
reg commandscheduler_cmd_executed = 1'd0;
reg [3:0] commandscheduler_scheduled_cmd_type = 4'd0;
reg [1:0] commandscheduler_scheduled_bank_group = 2'd0;
reg [1:0] commandscheduler_scheduled_bank = 2'd0;
reg [15:0] commandscheduler_scheduled_row = 16'd0;
reg [9:0] commandscheduler_scheduled_col = 10'd0;
reg [29:0] commandscheduler0 = 30'd0;
reg [29:0] commandscheduler1 = 30'd0;
reg [29:0] commandscheduler2 = 30'd0;
reg [29:0] commandscheduler3 = 30'd0;
reg [29:0] commandscheduler4 = 30'd0;
reg [29:0] commandscheduler5 = 30'd0;
reg [29:0] commandscheduler6 = 30'd0;
reg [29:0] commandscheduler7 = 30'd0;
reg [29:0] commandscheduler8 = 30'd0;
reg [29:0] commandscheduler9 = 30'd0;
reg [29:0] commandscheduler10 = 30'd0;
reg [29:0] commandscheduler11 = 30'd0;
reg [29:0] commandscheduler12 = 30'd0;
reg [29:0] commandscheduler13 = 30'd0;
reg [29:0] commandscheduler14 = 30'd0;
reg [29:0] commandscheduler15 = 30'd0;
reg [29:0] commandscheduler16 = 30'd0;
reg [29:0] commandscheduler17 = 30'd0;
reg [29:0] commandscheduler18 = 30'd0;
reg [29:0] commandscheduler19 = 30'd0;
reg [29:0] commandscheduler20 = 30'd0;
reg [29:0] commandscheduler21 = 30'd0;
reg [29:0] commandscheduler22 = 30'd0;
reg [29:0] commandscheduler23 = 30'd0;
reg [29:0] commandscheduler24 = 30'd0;
reg [29:0] commandscheduler25 = 30'd0;
reg [29:0] commandscheduler26 = 30'd0;
reg [29:0] commandscheduler27 = 30'd0;
reg [29:0] commandscheduler28 = 30'd0;
reg [29:0] commandscheduler29 = 30'd0;
reg [29:0] commandscheduler30 = 30'd0;
reg [29:0] commandscheduler31 = 30'd0;
reg [29:0] commandscheduler32 = 30'd0;
reg [29:0] commandscheduler33 = 30'd0;
reg [29:0] commandscheduler34 = 30'd0;
reg [29:0] commandscheduler35 = 30'd0;
reg [29:0] commandscheduler36 = 30'd0;
reg [29:0] commandscheduler37 = 30'd0;
reg [29:0] commandscheduler38 = 30'd0;
reg [29:0] commandscheduler39 = 30'd0;
reg [29:0] commandscheduler40 = 30'd0;
reg [29:0] commandscheduler41 = 30'd0;
reg [29:0] commandscheduler42 = 30'd0;
reg [29:0] commandscheduler43 = 30'd0;
reg [29:0] commandscheduler44 = 30'd0;
reg [29:0] commandscheduler45 = 30'd0;
reg [29:0] commandscheduler46 = 30'd0;
reg [29:0] commandscheduler47 = 30'd0;
reg [29:0] commandscheduler48 = 30'd0;
reg [29:0] commandscheduler49 = 30'd0;
reg [29:0] commandscheduler50 = 30'd0;
reg [29:0] commandscheduler51 = 30'd0;
reg [29:0] commandscheduler52 = 30'd0;
reg [29:0] commandscheduler53 = 30'd0;
reg [29:0] commandscheduler54 = 30'd0;
reg [29:0] commandscheduler55 = 30'd0;
reg [29:0] commandscheduler56 = 30'd0;
reg [29:0] commandscheduler57 = 30'd0;
reg [29:0] commandscheduler58 = 30'd0;
reg [29:0] commandscheduler59 = 30'd0;
reg [29:0] commandscheduler60 = 30'd0;
reg [29:0] commandscheduler61 = 30'd0;
reg [29:0] commandscheduler62 = 30'd0;
reg [29:0] commandscheduler63 = 30'd0;
reg [29:0] commandscheduler64 = 30'd0;
reg [29:0] commandscheduler65 = 30'd0;
reg [29:0] commandscheduler66 = 30'd0;
reg [29:0] commandscheduler67 = 30'd0;
reg [29:0] commandscheduler68 = 30'd0;
reg [29:0] commandscheduler69 = 30'd0;
reg [29:0] commandscheduler70 = 30'd0;
reg [29:0] commandscheduler71 = 30'd0;
reg [29:0] commandscheduler72 = 30'd0;
reg [29:0] commandscheduler73 = 30'd0;
reg [29:0] commandscheduler74 = 30'd0;
reg [29:0] commandscheduler75 = 30'd0;
reg [29:0] commandscheduler76 = 30'd0;
reg [29:0] commandscheduler77 = 30'd0;
reg [29:0] commandscheduler78 = 30'd0;
reg [29:0] commandscheduler79 = 30'd0;
reg [29:0] commandscheduler80 = 30'd0;
reg [29:0] commandscheduler81 = 30'd0;
reg [29:0] commandscheduler82 = 30'd0;
reg [29:0] commandscheduler83 = 30'd0;
reg [29:0] commandscheduler84 = 30'd0;
reg [29:0] commandscheduler85 = 30'd0;
reg [29:0] commandscheduler86 = 30'd0;
reg [29:0] commandscheduler87 = 30'd0;
reg [29:0] commandscheduler88 = 30'd0;
reg [29:0] commandscheduler89 = 30'd0;
reg [29:0] commandscheduler90 = 30'd0;
reg [29:0] commandscheduler91 = 30'd0;
reg [29:0] commandscheduler92 = 30'd0;
reg [29:0] commandscheduler93 = 30'd0;
reg [29:0] commandscheduler94 = 30'd0;
reg [29:0] commandscheduler95 = 30'd0;
reg [29:0] commandscheduler96 = 30'd0;
reg [29:0] commandscheduler97 = 30'd0;
reg [29:0] commandscheduler98 = 30'd0;
reg [29:0] commandscheduler99 = 30'd0;
reg [29:0] commandscheduler100 = 30'd0;
reg [29:0] commandscheduler101 = 30'd0;
reg [29:0] commandscheduler102 = 30'd0;
reg [29:0] commandscheduler103 = 30'd0;
reg [29:0] commandscheduler104 = 30'd0;
reg [29:0] commandscheduler105 = 30'd0;
reg [29:0] commandscheduler106 = 30'd0;
reg [29:0] commandscheduler107 = 30'd0;
reg [29:0] commandscheduler108 = 30'd0;
reg [29:0] commandscheduler109 = 30'd0;
reg [29:0] commandscheduler110 = 30'd0;
reg [29:0] commandscheduler111 = 30'd0;
reg [29:0] commandscheduler112 = 30'd0;
reg [29:0] commandscheduler113 = 30'd0;
reg [29:0] commandscheduler114 = 30'd0;
reg [29:0] commandscheduler115 = 30'd0;
reg [29:0] commandscheduler116 = 30'd0;
reg [29:0] commandscheduler117 = 30'd0;
reg [29:0] commandscheduler118 = 30'd0;
reg [29:0] commandscheduler119 = 30'd0;
reg [29:0] commandscheduler120 = 30'd0;
reg [29:0] commandscheduler121 = 30'd0;
reg [29:0] commandscheduler122 = 30'd0;
reg [29:0] commandscheduler123 = 30'd0;
reg [29:0] commandscheduler124 = 30'd0;
reg [29:0] commandscheduler125 = 30'd0;
reg [29:0] commandscheduler126 = 30'd0;
reg [29:0] commandscheduler127 = 30'd0;
reg [29:0] commandscheduler128 = 30'd0;
reg [29:0] commandscheduler129 = 30'd0;
reg [29:0] commandscheduler130 = 30'd0;
reg [29:0] commandscheduler131 = 30'd0;
reg [29:0] commandscheduler132 = 30'd0;
reg [29:0] commandscheduler133 = 30'd0;
reg [29:0] commandscheduler134 = 30'd0;
reg [29:0] commandscheduler135 = 30'd0;
reg [29:0] commandscheduler136 = 30'd0;
reg [29:0] commandscheduler137 = 30'd0;
reg [29:0] commandscheduler138 = 30'd0;
reg [29:0] commandscheduler139 = 30'd0;
reg [29:0] commandscheduler140 = 30'd0;
reg [29:0] commandscheduler141 = 30'd0;
reg [29:0] commandscheduler142 = 30'd0;
reg [29:0] commandscheduler143 = 30'd0;
reg [29:0] commandscheduler144 = 30'd0;
reg [29:0] commandscheduler145 = 30'd0;
reg [29:0] commandscheduler146 = 30'd0;
reg [29:0] commandscheduler147 = 30'd0;
reg [29:0] commandscheduler148 = 30'd0;
reg [29:0] commandscheduler149 = 30'd0;
reg [29:0] commandscheduler150 = 30'd0;
reg [29:0] commandscheduler151 = 30'd0;
reg [29:0] commandscheduler152 = 30'd0;
reg [29:0] commandscheduler153 = 30'd0;
reg [29:0] commandscheduler154 = 30'd0;
reg [29:0] commandscheduler155 = 30'd0;
reg [29:0] commandscheduler156 = 30'd0;
reg [29:0] commandscheduler157 = 30'd0;
reg [29:0] commandscheduler158 = 30'd0;
reg [29:0] commandscheduler159 = 30'd0;
reg [29:0] commandscheduler160 = 30'd0;
reg [29:0] commandscheduler161 = 30'd0;
reg [29:0] commandscheduler162 = 30'd0;
reg [29:0] commandscheduler163 = 30'd0;
reg [29:0] commandscheduler164 = 30'd0;
reg [29:0] commandscheduler165 = 30'd0;
reg [29:0] commandscheduler166 = 30'd0;
reg [29:0] commandscheduler167 = 30'd0;
reg [29:0] commandscheduler168 = 30'd0;
reg [29:0] commandscheduler169 = 30'd0;
reg [29:0] commandscheduler170 = 30'd0;
reg [29:0] commandscheduler171 = 30'd0;
reg [29:0] commandscheduler172 = 30'd0;
reg [29:0] commandscheduler173 = 30'd0;
reg [29:0] commandscheduler174 = 30'd0;
reg [29:0] commandscheduler175 = 30'd0;
reg [29:0] commandscheduler176 = 30'd0;
reg [29:0] commandscheduler177 = 30'd0;
reg [29:0] commandscheduler178 = 30'd0;
reg [29:0] commandscheduler179 = 30'd0;
reg [29:0] commandscheduler180 = 30'd0;
reg [29:0] commandscheduler181 = 30'd0;
reg [29:0] commandscheduler182 = 30'd0;
reg [29:0] commandscheduler183 = 30'd0;
reg [29:0] commandscheduler184 = 30'd0;
reg [29:0] commandscheduler185 = 30'd0;
reg [29:0] commandscheduler186 = 30'd0;
reg [29:0] commandscheduler187 = 30'd0;
reg [29:0] commandscheduler188 = 30'd0;
reg [29:0] commandscheduler189 = 30'd0;
reg [29:0] commandscheduler190 = 30'd0;
reg [29:0] commandscheduler191 = 30'd0;
reg [29:0] commandscheduler192 = 30'd0;
reg [29:0] commandscheduler193 = 30'd0;
reg [29:0] commandscheduler194 = 30'd0;
reg [29:0] commandscheduler195 = 30'd0;
reg [29:0] commandscheduler196 = 30'd0;
reg [29:0] commandscheduler197 = 30'd0;
reg [29:0] commandscheduler198 = 30'd0;
reg [29:0] commandscheduler199 = 30'd0;
reg [29:0] commandscheduler200 = 30'd0;
reg [29:0] commandscheduler201 = 30'd0;
reg [29:0] commandscheduler202 = 30'd0;
reg [29:0] commandscheduler203 = 30'd0;
reg [29:0] commandscheduler204 = 30'd0;
reg [29:0] commandscheduler205 = 30'd0;
reg [29:0] commandscheduler206 = 30'd0;
reg [29:0] commandscheduler207 = 30'd0;
reg [29:0] commandscheduler208 = 30'd0;
reg [29:0] commandscheduler209 = 30'd0;
reg [29:0] commandscheduler210 = 30'd0;
reg [29:0] commandscheduler211 = 30'd0;
reg [29:0] commandscheduler212 = 30'd0;
reg [29:0] commandscheduler213 = 30'd0;
reg [29:0] commandscheduler214 = 30'd0;
reg [29:0] commandscheduler215 = 30'd0;
reg [29:0] commandscheduler216 = 30'd0;
reg [29:0] commandscheduler217 = 30'd0;
reg [29:0] commandscheduler218 = 30'd0;
reg [29:0] commandscheduler219 = 30'd0;
reg [29:0] commandscheduler220 = 30'd0;
reg [29:0] commandscheduler221 = 30'd0;
reg [29:0] commandscheduler222 = 30'd0;
reg [29:0] commandscheduler223 = 30'd0;
reg [29:0] commandscheduler224 = 30'd0;
reg [29:0] commandscheduler225 = 30'd0;
reg [29:0] commandscheduler226 = 30'd0;
reg [29:0] commandscheduler227 = 30'd0;
reg [29:0] commandscheduler228 = 30'd0;
reg [29:0] commandscheduler229 = 30'd0;
reg [29:0] commandscheduler230 = 30'd0;
reg [29:0] commandscheduler231 = 30'd0;
reg [29:0] commandscheduler232 = 30'd0;
reg [29:0] commandscheduler233 = 30'd0;
reg [29:0] commandscheduler234 = 30'd0;
reg [29:0] commandscheduler235 = 30'd0;
reg [29:0] commandscheduler236 = 30'd0;
reg [29:0] commandscheduler237 = 30'd0;
reg [29:0] commandscheduler238 = 30'd0;
reg [29:0] commandscheduler239 = 30'd0;
reg [29:0] commandscheduler240 = 30'd0;
reg [29:0] commandscheduler241 = 30'd0;
reg [29:0] commandscheduler242 = 30'd0;
reg [29:0] commandscheduler243 = 30'd0;
reg [29:0] commandscheduler244 = 30'd0;
reg [29:0] commandscheduler245 = 30'd0;
reg [29:0] commandscheduler246 = 30'd0;
reg [29:0] commandscheduler247 = 30'd0;
reg [29:0] commandscheduler248 = 30'd0;
reg [29:0] commandscheduler249 = 30'd0;
reg [29:0] commandscheduler250 = 30'd0;
reg [29:0] commandscheduler251 = 30'd0;
reg [29:0] commandscheduler252 = 30'd0;
reg [29:0] commandscheduler253 = 30'd0;
reg [29:0] commandscheduler254 = 30'd0;
reg [29:0] commandscheduler255 = 30'd0;
reg [29:0] commandscheduler256 = 30'd0;
reg [29:0] commandscheduler257 = 30'd0;
reg [29:0] commandscheduler258 = 30'd0;
reg [29:0] commandscheduler259 = 30'd0;
reg [29:0] commandscheduler260 = 30'd0;
reg [29:0] commandscheduler261 = 30'd0;
reg [29:0] commandscheduler262 = 30'd0;
reg [29:0] commandscheduler263 = 30'd0;
reg [29:0] commandscheduler264 = 30'd0;
reg [29:0] commandscheduler265 = 30'd0;
reg [29:0] commandscheduler266 = 30'd0;
reg [29:0] commandscheduler267 = 30'd0;
reg [29:0] commandscheduler268 = 30'd0;
reg [29:0] commandscheduler269 = 30'd0;
reg [29:0] commandscheduler270 = 30'd0;
reg [29:0] commandscheduler271 = 30'd0;
reg [29:0] commandscheduler272 = 30'd0;
reg [29:0] commandscheduler273 = 30'd0;
reg [29:0] commandscheduler274 = 30'd0;
reg [29:0] commandscheduler275 = 30'd0;
reg [29:0] commandscheduler276 = 30'd0;
reg [29:0] commandscheduler277 = 30'd0;
reg [29:0] commandscheduler278 = 30'd0;
reg [29:0] commandscheduler279 = 30'd0;
reg [29:0] commandscheduler280 = 30'd0;
reg [29:0] commandscheduler281 = 30'd0;
reg [29:0] commandscheduler282 = 30'd0;
reg [29:0] commandscheduler283 = 30'd0;
reg [29:0] commandscheduler284 = 30'd0;
reg [29:0] commandscheduler285 = 30'd0;
reg [29:0] commandscheduler286 = 30'd0;
reg [29:0] commandscheduler287 = 30'd0;
reg [29:0] commandscheduler288 = 30'd0;
reg [29:0] commandscheduler289 = 30'd0;
reg [29:0] commandscheduler290 = 30'd0;
reg [29:0] commandscheduler291 = 30'd0;
reg [29:0] commandscheduler292 = 30'd0;
reg [29:0] commandscheduler293 = 30'd0;
reg [29:0] commandscheduler294 = 30'd0;
reg [29:0] commandscheduler295 = 30'd0;
reg [29:0] commandscheduler296 = 30'd0;
reg [29:0] commandscheduler297 = 30'd0;
reg [29:0] commandscheduler298 = 30'd0;
reg [29:0] commandscheduler299 = 30'd0;
reg [29:0] commandscheduler300 = 30'd0;
reg [29:0] commandscheduler301 = 30'd0;
reg [29:0] commandscheduler302 = 30'd0;
reg [29:0] commandscheduler303 = 30'd0;
reg [29:0] commandscheduler304 = 30'd0;
reg [29:0] commandscheduler305 = 30'd0;
reg [29:0] commandscheduler306 = 30'd0;
reg [29:0] commandscheduler307 = 30'd0;
reg [29:0] commandscheduler308 = 30'd0;
reg [29:0] commandscheduler309 = 30'd0;
reg [29:0] commandscheduler310 = 30'd0;
reg [29:0] commandscheduler311 = 30'd0;
reg [29:0] commandscheduler312 = 30'd0;
reg [29:0] commandscheduler313 = 30'd0;
reg [29:0] commandscheduler314 = 30'd0;
reg [29:0] commandscheduler315 = 30'd0;
reg [29:0] commandscheduler316 = 30'd0;
reg [29:0] commandscheduler317 = 30'd0;
reg [29:0] commandscheduler318 = 30'd0;
reg [29:0] commandscheduler319 = 30'd0;
reg [29:0] commandscheduler320 = 30'd0;
reg [29:0] commandscheduler321 = 30'd0;
reg [29:0] commandscheduler322 = 30'd0;
reg [29:0] commandscheduler323 = 30'd0;
reg [29:0] commandscheduler324 = 30'd0;
reg [29:0] commandscheduler325 = 30'd0;
reg [29:0] commandscheduler326 = 30'd0;
reg [29:0] commandscheduler327 = 30'd0;
reg [29:0] commandscheduler328 = 30'd0;
reg [29:0] commandscheduler329 = 30'd0;
reg [29:0] commandscheduler330 = 30'd0;
reg [29:0] commandscheduler331 = 30'd0;
reg [29:0] commandscheduler332 = 30'd0;
reg [29:0] commandscheduler333 = 30'd0;
reg [29:0] commandscheduler334 = 30'd0;
reg [29:0] commandscheduler335 = 30'd0;
reg [29:0] commandscheduler336 = 30'd0;
reg [29:0] commandscheduler337 = 30'd0;
reg [29:0] commandscheduler338 = 30'd0;
reg [29:0] commandscheduler339 = 30'd0;
reg [29:0] commandscheduler340 = 30'd0;
reg [29:0] commandscheduler341 = 30'd0;
reg [29:0] commandscheduler342 = 30'd0;
reg [29:0] commandscheduler343 = 30'd0;
reg [29:0] commandscheduler344 = 30'd0;
reg [29:0] commandscheduler345 = 30'd0;
reg [29:0] commandscheduler346 = 30'd0;
reg [29:0] commandscheduler347 = 30'd0;
reg [29:0] commandscheduler348 = 30'd0;
reg [29:0] commandscheduler349 = 30'd0;
reg [29:0] commandscheduler350 = 30'd0;
reg [29:0] commandscheduler351 = 30'd0;
reg [29:0] commandscheduler352 = 30'd0;
reg [29:0] commandscheduler353 = 30'd0;
reg [29:0] commandscheduler354 = 30'd0;
reg [29:0] commandscheduler355 = 30'd0;
reg [29:0] commandscheduler356 = 30'd0;
reg [29:0] commandscheduler357 = 30'd0;
reg [29:0] commandscheduler358 = 30'd0;
reg [29:0] commandscheduler359 = 30'd0;
reg [29:0] commandscheduler360 = 30'd0;
reg [29:0] commandscheduler361 = 30'd0;
reg [29:0] commandscheduler362 = 30'd0;
reg [29:0] commandscheduler363 = 30'd0;
reg [29:0] commandscheduler364 = 30'd0;
reg [29:0] commandscheduler365 = 30'd0;
reg [29:0] commandscheduler366 = 30'd0;
reg [29:0] commandscheduler367 = 30'd0;
reg [29:0] commandscheduler368 = 30'd0;
reg [29:0] commandscheduler369 = 30'd0;
reg [29:0] commandscheduler370 = 30'd0;
reg [29:0] commandscheduler371 = 30'd0;
reg [29:0] commandscheduler372 = 30'd0;
reg [29:0] commandscheduler373 = 30'd0;
reg [29:0] commandscheduler374 = 30'd0;
reg [29:0] commandscheduler375 = 30'd0;
reg [29:0] commandscheduler376 = 30'd0;
reg [29:0] commandscheduler377 = 30'd0;
reg [29:0] commandscheduler378 = 30'd0;
reg [29:0] commandscheduler379 = 30'd0;
reg [29:0] commandscheduler380 = 30'd0;
reg [29:0] commandscheduler381 = 30'd0;
reg [29:0] commandscheduler382 = 30'd0;
reg [29:0] commandscheduler383 = 30'd0;
reg [29:0] commandscheduler384 = 30'd0;
reg [29:0] commandscheduler385 = 30'd0;
reg [29:0] commandscheduler386 = 30'd0;
reg [29:0] commandscheduler387 = 30'd0;
reg [29:0] commandscheduler388 = 30'd0;
reg [29:0] commandscheduler389 = 30'd0;
reg [29:0] commandscheduler390 = 30'd0;
reg [29:0] commandscheduler391 = 30'd0;
reg [29:0] commandscheduler392 = 30'd0;
reg [29:0] commandscheduler393 = 30'd0;
reg [29:0] commandscheduler394 = 30'd0;
reg [29:0] commandscheduler395 = 30'd0;
reg [29:0] commandscheduler396 = 30'd0;
reg [29:0] commandscheduler397 = 30'd0;
reg [29:0] commandscheduler398 = 30'd0;
reg [29:0] commandscheduler399 = 30'd0;
reg [29:0] commandscheduler400 = 30'd0;
reg [29:0] commandscheduler401 = 30'd0;
reg [29:0] commandscheduler402 = 30'd0;
reg [29:0] commandscheduler403 = 30'd0;
reg [29:0] commandscheduler404 = 30'd0;
reg [29:0] commandscheduler405 = 30'd0;
reg [29:0] commandscheduler406 = 30'd0;
reg [29:0] commandscheduler407 = 30'd0;
reg [29:0] commandscheduler408 = 30'd0;
reg [29:0] commandscheduler409 = 30'd0;
reg [29:0] commandscheduler410 = 30'd0;
reg [29:0] commandscheduler411 = 30'd0;
reg [29:0] commandscheduler412 = 30'd0;
reg [29:0] commandscheduler413 = 30'd0;
reg [29:0] commandscheduler414 = 30'd0;
reg [29:0] commandscheduler415 = 30'd0;
reg [29:0] commandscheduler416 = 30'd0;
reg [29:0] commandscheduler417 = 30'd0;
reg [29:0] commandscheduler418 = 30'd0;
reg [29:0] commandscheduler419 = 30'd0;
reg [29:0] commandscheduler420 = 30'd0;
reg [29:0] commandscheduler421 = 30'd0;
reg [29:0] commandscheduler422 = 30'd0;
reg [29:0] commandscheduler423 = 30'd0;
reg [29:0] commandscheduler424 = 30'd0;
reg [29:0] commandscheduler425 = 30'd0;
reg [29:0] commandscheduler426 = 30'd0;
reg [29:0] commandscheduler427 = 30'd0;
reg [29:0] commandscheduler428 = 30'd0;
reg [29:0] commandscheduler429 = 30'd0;
reg [29:0] commandscheduler430 = 30'd0;
reg [29:0] commandscheduler431 = 30'd0;
reg [29:0] commandscheduler432 = 30'd0;
reg [29:0] commandscheduler433 = 30'd0;
reg [29:0] commandscheduler434 = 30'd0;
reg [29:0] commandscheduler435 = 30'd0;
reg [29:0] commandscheduler436 = 30'd0;
reg [29:0] commandscheduler437 = 30'd0;
reg [29:0] commandscheduler438 = 30'd0;
reg [29:0] commandscheduler439 = 30'd0;
reg [29:0] commandscheduler440 = 30'd0;
reg [29:0] commandscheduler441 = 30'd0;
reg [29:0] commandscheduler442 = 30'd0;
reg [29:0] commandscheduler443 = 30'd0;
reg [29:0] commandscheduler444 = 30'd0;
reg [29:0] commandscheduler445 = 30'd0;
reg [29:0] commandscheduler446 = 30'd0;
reg [29:0] commandscheduler447 = 30'd0;
reg [29:0] commandscheduler448 = 30'd0;
reg [29:0] commandscheduler449 = 30'd0;
reg [29:0] commandscheduler450 = 30'd0;
reg [29:0] commandscheduler451 = 30'd0;
reg [29:0] commandscheduler452 = 30'd0;
reg [29:0] commandscheduler453 = 30'd0;
reg [29:0] commandscheduler454 = 30'd0;
reg [29:0] commandscheduler455 = 30'd0;
reg [29:0] commandscheduler456 = 30'd0;
reg [29:0] commandscheduler457 = 30'd0;
reg [29:0] commandscheduler458 = 30'd0;
reg [29:0] commandscheduler459 = 30'd0;
reg [29:0] commandscheduler460 = 30'd0;
reg [29:0] commandscheduler461 = 30'd0;
reg [29:0] commandscheduler462 = 30'd0;
reg [29:0] commandscheduler463 = 30'd0;
reg [29:0] commandscheduler464 = 30'd0;
reg [29:0] commandscheduler465 = 30'd0;
reg [29:0] commandscheduler466 = 30'd0;
reg [29:0] commandscheduler467 = 30'd0;
reg [29:0] commandscheduler468 = 30'd0;
reg [29:0] commandscheduler469 = 30'd0;
reg [29:0] commandscheduler470 = 30'd0;
reg [29:0] commandscheduler471 = 30'd0;
reg [29:0] commandscheduler472 = 30'd0;
reg [29:0] commandscheduler473 = 30'd0;
reg [29:0] commandscheduler474 = 30'd0;
reg [29:0] commandscheduler475 = 30'd0;
reg [29:0] commandscheduler476 = 30'd0;
reg [29:0] commandscheduler477 = 30'd0;
reg [29:0] commandscheduler478 = 30'd0;
reg [29:0] commandscheduler479 = 30'd0;
reg [29:0] commandscheduler480 = 30'd0;
reg [29:0] commandscheduler481 = 30'd0;
reg [29:0] commandscheduler482 = 30'd0;
reg [29:0] commandscheduler483 = 30'd0;
reg [29:0] commandscheduler484 = 30'd0;
reg [29:0] commandscheduler485 = 30'd0;
reg [29:0] commandscheduler486 = 30'd0;
reg [29:0] commandscheduler487 = 30'd0;
reg [29:0] commandscheduler488 = 30'd0;
reg [29:0] commandscheduler489 = 30'd0;
reg [29:0] commandscheduler490 = 30'd0;
reg [29:0] commandscheduler491 = 30'd0;
reg [29:0] commandscheduler492 = 30'd0;
reg [29:0] commandscheduler493 = 30'd0;
reg [29:0] commandscheduler494 = 30'd0;
reg [29:0] commandscheduler495 = 30'd0;
reg [29:0] commandscheduler496 = 30'd0;
reg [29:0] commandscheduler497 = 30'd0;
reg [29:0] commandscheduler498 = 30'd0;
reg [29:0] commandscheduler499 = 30'd0;
reg [29:0] commandscheduler500 = 30'd0;
reg [29:0] commandscheduler501 = 30'd0;
reg [29:0] commandscheduler502 = 30'd0;
reg [29:0] commandscheduler503 = 30'd0;
reg [29:0] commandscheduler504 = 30'd0;
reg [29:0] commandscheduler505 = 30'd0;
reg [29:0] commandscheduler506 = 30'd0;
reg [29:0] commandscheduler507 = 30'd0;
reg [29:0] commandscheduler508 = 30'd0;
reg [29:0] commandscheduler509 = 30'd0;
reg [29:0] commandscheduler510 = 30'd0;
reg [29:0] commandscheduler511 = 30'd0;
reg [4:0] commandscheduler512 = 5'd0;
reg [4:0] commandscheduler513 = 5'd0;
reg [4:0] commandscheduler514 = 5'd0;
reg [4:0] commandscheduler515 = 5'd0;
reg [4:0] commandscheduler516 = 5'd0;
reg [4:0] commandscheduler517 = 5'd0;
reg [4:0] commandscheduler518 = 5'd0;
reg [4:0] commandscheduler519 = 5'd0;
reg [4:0] commandscheduler520 = 5'd0;
reg [4:0] commandscheduler521 = 5'd0;
reg [4:0] commandscheduler522 = 5'd0;
reg [4:0] commandscheduler523 = 5'd0;
reg [4:0] commandscheduler524 = 5'd0;
reg [4:0] commandscheduler525 = 5'd0;
reg [4:0] commandscheduler526 = 5'd0;
reg [4:0] commandscheduler527 = 5'd0;
reg [4:0] commandscheduler528 = 5'd0;
reg [4:0] commandscheduler529 = 5'd0;
reg [4:0] commandscheduler530 = 5'd0;
reg [4:0] commandscheduler531 = 5'd0;
reg [4:0] commandscheduler532 = 5'd0;
reg [4:0] commandscheduler533 = 5'd0;
reg [4:0] commandscheduler534 = 5'd0;
reg [4:0] commandscheduler535 = 5'd0;
reg [4:0] commandscheduler536 = 5'd0;
reg [4:0] commandscheduler537 = 5'd0;
reg [4:0] commandscheduler538 = 5'd0;
reg [4:0] commandscheduler539 = 5'd0;
reg [4:0] commandscheduler540 = 5'd0;
reg [4:0] commandscheduler541 = 5'd0;
reg [4:0] commandscheduler542 = 5'd0;
reg [4:0] commandscheduler543 = 5'd0;
wire [3:0] rowbuffermanager_cmd_decoded;
wire [1:0] rowbuffermanager_bank_group;
wire [1:0] rowbuffermanager_bank;
wire [15:0] rowbuffermanager_row;
wire rowbuffermanager_row_buffer_hit;
wire [15:0] rowbuffermanager_current_row;
wire rowbuffermanager_row_open;
reg rowbuffermanager0 = 1'd0;
reg rowbuffermanager1 = 1'd0;
reg rowbuffermanager2 = 1'd0;
reg rowbuffermanager3 = 1'd0;
reg rowbuffermanager4 = 1'd0;
reg rowbuffermanager5 = 1'd0;
reg rowbuffermanager6 = 1'd0;
reg rowbuffermanager7 = 1'd0;
reg rowbuffermanager8 = 1'd0;
reg rowbuffermanager9 = 1'd0;
reg rowbuffermanager10 = 1'd0;
reg rowbuffermanager11 = 1'd0;
reg rowbuffermanager12 = 1'd0;
reg rowbuffermanager13 = 1'd0;
reg rowbuffermanager14 = 1'd0;
reg rowbuffermanager15 = 1'd0;
reg [15:0] rowbuffermanager16 = 16'd0;
reg [15:0] rowbuffermanager17 = 16'd0;
reg [15:0] rowbuffermanager18 = 16'd0;
reg [15:0] rowbuffermanager19 = 16'd0;
reg [15:0] rowbuffermanager20 = 16'd0;
reg [15:0] rowbuffermanager21 = 16'd0;
reg [15:0] rowbuffermanager22 = 16'd0;
reg [15:0] rowbuffermanager23 = 16'd0;
reg [15:0] rowbuffermanager24 = 16'd0;
reg [15:0] rowbuffermanager25 = 16'd0;
reg [15:0] rowbuffermanager26 = 16'd0;
reg [15:0] rowbuffermanager27 = 16'd0;
reg [15:0] rowbuffermanager28 = 16'd0;
reg [15:0] rowbuffermanager29 = 16'd0;
reg [15:0] rowbuffermanager30 = 16'd0;
reg [15:0] rowbuffermanager31 = 16'd0;
reg qosmanager0_request_completed = 1'd0;
reg qosmanager0_rst = 1'd0;
reg [1:0] qosmanager0_current_priority = 2'd0;
wire [3:0] qosmanager0_grant;
wire [1:0] qosmanager0_qos_priority;
reg [31:0] qosmanager00 = 32'd0;
reg [31:0] qosmanager01 = 32'd0;
reg [31:0] qosmanager02 = 32'd0;
reg [31:0] qosmanager03 = 32'd0;
wire [31:0] address_mapper_addr_in;
wire [15:0] address_mapper_row_addr;
wire [9:0] address_mapper_col_addr;
wire [1:0] address_mapper_bank_group_addr;
wire [1:0] address_mapper_bank_addr;
wire [3:0] requests;
wire [3:0] grant0;
wire [3:0] request;
reg [1:0] grant1 = 2'd0;
wire [63:0] clock_domain_crossing_src_data;
reg clock_domain_crossing_dst_rst = 1'd0;
reg [63:0] clock_domain_crossing_dst_data = 64'd0;
reg [63:0] clock_domain_crossing_sync_ff1 = 64'd0;
reg [63:0] clock_domain_crossing_sync_ff2 = 64'd0;
reg [63:0] eccencoder0_data_in = 64'd0;
wire [71:0] eccencoder0_data_out;
wire [7:0] eccencoder0_parity;
reg [71:0] eccdecoder0_data_in = 72'd0;
wire [63:0] eccdecoder0_data_out;
wire eccdecoder0_error_detected;
wire [7:0] eccdecoder0_parity;
reg refresh = 1'd0;
reg chip_select = 1'd0;
reg ras = 1'd0;
reg cas = 1'd0;
reg we = 1'd0;
wire [3:0] cmd_decoded;
wire cmd_valid;
wire cmd_ready;
wire cmd_executed;
wire [1:0] bank_state;
wire row_buffer_state;
wire [1:0] qos_priority;
reg [15:0] row_addr;
reg [9:0] col_addr;
reg [2:0] bank_addr;
wire cmd_grant;
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
wire [63:0] data_out_sync;
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
wire qosmanager1_cmd_executed;
reg qosmanager1_request_completed = 1'd0;
reg qosmanager1_rst = 1'd0;
reg [1:0] qosmanager1_current_priority = 2'd0;
wire [3:0] qosmanager1_grant;
wire [1:0] qosmanager1_qos_priority;
reg [31:0] qosmanager10 = 32'd0;
reg [31:0] qosmanager11 = 32'd0;
reg [31:0] qosmanager12 = 32'd0;
reg [31:0] qosmanager13 = 32'd0;
wire refreshmanager1_refresh;
reg refreshmanager1_refresh_needed = 1'd0;
reg refreshmanager1_refresh_done = 1'd0;
reg [31:0] refreshmanager1_counter = 32'd0;
reg refreshmanager1_refresh_in_progress = 1'd0;
reg powermanagement1_rst = 1'd0;
wire [3:0] powermanagement1_cmd_decoded;
reg [1:0] powermanagement1_power_state = 2'd0;
reg powermanagement1_enter_power_down = 1'd0;
reg powermanagement1_power_down_entered = 1'd0;
reg powermanagement1_power_down_ready = 1'd0;
reg [7:0] powermanagement1_temperature = 8'd0;
reg powermanagement1_low_power_mode = 1'd0;
reg [31:0] powermanagement1_idle_counter = 32'd0;
wire [63:0] eccencoder1_data_in;
wire [71:0] eccencoder1_data_out;
wire [7:0] eccencoder1_parity;
wire [71:0] eccdecoder1_data_in;
wire [63:0] eccdecoder1_data_out;
wire eccdecoder1_error_detected;
wire [7:0] eccdecoder1_parity;
reg [1:0] array_muxed0;
reg [1:0] array_muxed1;
reg [1:0] array_muxed2;
reg [1:0] array_muxed3;
reg [1:0] array_muxed4;
reg [15:0] array_muxed5;
reg [15:0] array_muxed6;
reg [15:0] array_muxed7;
reg [15:0] array_muxed8;
reg [15:0] array_muxed9;
reg array_muxed10;
reg array_muxed11;
reg array_muxed12;
reg array_muxed13;
reg array_muxed14;
reg [15:0] array_muxed15;
reg [15:0] array_muxed16;
reg [15:0] array_muxed17;
reg [15:0] array_muxed18;
reg [15:0] array_muxed19;
reg [31:0] t_cases_array_muxed0;
reg [31:0] t_cases_lhs_array_muxed0 = 32'd0;
reg [31:0] t_cases_array_muxed1;
reg [31:0] t_cases_lhs_array_muxed1 = 32'd0;
reg [31:0] t_cases_array_muxed2;
reg [31:0] t_cases_lhs_array_muxed2 = 32'd0;
reg [31:0] t_cases_array_muxed3;
reg [31:0] t_cases_lhs_array_muxed3 = 32'd0;
reg [1:0] cases_lhs_array_muxed0 = 2'd0;
reg [1:0] cases_lhs_array_muxed1 = 2'd0;
reg [1:0] cases_lhs_array_muxed2 = 2'd0;
reg [1:0] cases_lhs_array_muxed3 = 2'd0;
reg [1:0] cases_lhs_array_muxed4 = 2'd0;
reg [15:0] cases_lhs_array_muxed5 = 16'd0;
reg [15:0] cases_lhs_array_muxed6 = 16'd0;
reg [15:0] cases_lhs_array_muxed7 = 16'd0;
reg [15:0] cases_lhs_array_muxed8 = 16'd0;
reg [15:0] cases_lhs_array_muxed9 = 16'd0;
reg [1:0] cases_lhs_array_muxed10 = 2'd0;
reg [1:0] cases_lhs_array_muxed11 = 2'd0;
reg [1:0] cases_lhs_array_muxed12 = 2'd0;
reg [1:0] cases_lhs_array_muxed13 = 2'd0;
reg [1:0] cases_lhs_array_muxed14 = 2'd0;
reg [1:0] cases_lhs_array_muxed15 = 2'd0;
reg [1:0] cases_lhs_array_muxed16 = 2'd0;
reg [1:0] cases_lhs_array_muxed17 = 2'd0;
reg [1:0] cases_lhs_array_muxed18 = 2'd0;
reg [1:0] cases_lhs_array_muxed19 = 2'd0;
reg [1:0] cases_lhs_array_muxed20 = 2'd0;
reg [1:0] cases_lhs_array_muxed21 = 2'd0;
reg [1:0] cases_lhs_array_muxed22 = 2'd0;
reg [1:0] cases_lhs_array_muxed23 = 2'd0;
reg [1:0] cases_lhs_array_muxed24 = 2'd0;
reg [4:0] t_basiclowerer_array_muxed0;
reg [4:0] t_basiclowerer_array_muxed1;
reg [29:0] t_basiclowerer_lhs_array_muxed0 = 30'd0;
reg [29:0] t_basiclowerer_lhs_array_muxed1 = 30'd0;
reg [4:0] t_basiclowerer_lhs_array_muxed2 = 5'd0;
reg [29:0] t_basiclowerer_lhs_array_muxed3 = 30'd0;
reg [4:0] t_basiclowerer_lhs_array_muxed4 = 5'd0;
reg [29:0] t_basiclowerer_lhs_array_muxed5 = 30'd0;
reg [4:0] t_basiclowerer_lhs_array_muxed6 = 5'd0;
reg [29:0] t_basiclowerer_lhs_array_muxed7 = 30'd0;
reg [4:0] t_basiclowerer_lhs_array_muxed8 = 5'd0;
reg [29:0] t_basiclowerer_lhs_array_muxed9 = 30'd0;
reg [4:0] t_basiclowerer_lhs_array_muxed10 = 5'd0;
reg [29:0] t_basiclowerer_lhs_array_muxed11 = 30'd0;
reg [4:0] t_basiclowerer_lhs_array_muxed12 = 5'd0;
reg [29:0] t_basiclowerer_lhs_array_muxed13 = 30'd0;
reg [4:0] t_basiclowerer_lhs_array_muxed14 = 5'd0;
reg [29:0] t_basiclowerer_lhs_array_muxed15 = 30'd0;
reg [4:0] t_basiclowerer_lhs_array_muxed16 = 5'd0;
reg [29:0] t_basiclowerer_lhs_array_muxed17 = 30'd0;
reg [4:0] t_basiclowerer_lhs_array_muxed18 = 5'd0;
reg [29:0] t_basiclowerer_lhs_array_muxed19 = 30'd0;
reg [4:0] t_basiclowerer_lhs_array_muxed20 = 5'd0;
reg [29:0] t_basiclowerer_lhs_array_muxed21 = 30'd0;
reg [4:0] t_basiclowerer_lhs_array_muxed22 = 5'd0;
reg [29:0] t_basiclowerer_lhs_array_muxed23 = 30'd0;
reg [4:0] t_basiclowerer_lhs_array_muxed24 = 5'd0;
reg [29:0] t_basiclowerer_lhs_array_muxed25 = 30'd0;
reg [4:0] t_basiclowerer_lhs_array_muxed26 = 5'd0;
reg [29:0] t_basiclowerer_lhs_array_muxed27 = 30'd0;
reg [4:0] t_basiclowerer_lhs_array_muxed28 = 5'd0;
reg [29:0] t_basiclowerer_lhs_array_muxed29 = 30'd0;
reg [4:0] t_basiclowerer_lhs_array_muxed30 = 5'd0;
reg [29:0] t_basiclowerer_lhs_array_muxed31 = 30'd0;
reg [4:0] t_basiclowerer_lhs_array_muxed32 = 5'd0;
reg [4:0] t_basiclowerer_basiclowerer_array_muxed;
reg [4:0] t_basiclowerer_t_array_muxed = 5'd0;
reg [4:0] t_basiclowerer_lhs_array_muxed33 = 5'd0;
reg [4:0] t_basiclowerer_rhs_array_muxed;
reg [3:0] t_cases_rhs_array_muxed0;
reg [15:0] t_cases_rhs_array_muxed1;
reg [9:0] t_cases_rhs_array_muxed2;
reg [3:0] t_cases_rhs_array_muxed3;
reg [15:0] t_cases_rhs_array_muxed4;
reg [9:0] t_cases_rhs_array_muxed5;
reg [3:0] t_cases_rhs_array_muxed6;
reg [15:0] t_cases_rhs_array_muxed7;
reg [9:0] t_cases_rhs_array_muxed8;
reg [3:0] t_cases_rhs_array_muxed9;
reg [15:0] t_cases_rhs_array_muxed10;
reg [9:0] t_cases_rhs_array_muxed11;
reg [3:0] t_cases_rhs_array_muxed12;
reg [15:0] t_cases_rhs_array_muxed13;
reg [9:0] t_cases_rhs_array_muxed14;
reg [3:0] t_cases_rhs_array_muxed15;
reg [15:0] t_cases_rhs_array_muxed16;
reg [9:0] t_cases_rhs_array_muxed17;
reg [3:0] t_cases_rhs_array_muxed18;
reg [15:0] t_cases_rhs_array_muxed19;
reg [9:0] t_cases_rhs_array_muxed20;
reg [3:0] t_cases_rhs_array_muxed21;
reg [15:0] t_cases_rhs_array_muxed22;
reg [9:0] t_cases_rhs_array_muxed23;
reg [3:0] t_cases_rhs_array_muxed24;
reg [15:0] t_cases_rhs_array_muxed25;
reg [9:0] t_cases_rhs_array_muxed26;
reg [3:0] t_cases_rhs_array_muxed27;
reg [15:0] t_cases_rhs_array_muxed28;
reg [9:0] t_cases_rhs_array_muxed29;
reg [3:0] t_cases_rhs_array_muxed30;
reg [15:0] t_cases_rhs_array_muxed31;
reg [9:0] t_cases_rhs_array_muxed32;
reg [3:0] t_cases_rhs_array_muxed33;
reg [15:0] t_cases_rhs_array_muxed34;
reg [9:0] t_cases_rhs_array_muxed35;
reg [3:0] t_cases_rhs_array_muxed36;
reg [15:0] t_cases_rhs_array_muxed37;
reg [9:0] t_cases_rhs_array_muxed38;
reg [3:0] t_cases_rhs_array_muxed39;
reg [15:0] t_cases_rhs_array_muxed40;
reg [9:0] t_cases_rhs_array_muxed41;
reg [3:0] t_cases_rhs_array_muxed42;
reg [15:0] t_cases_rhs_array_muxed43;
reg [9:0] t_cases_rhs_array_muxed44;
reg [3:0] t_cases_rhs_array_muxed45;
reg [15:0] t_cases_rhs_array_muxed46;
reg [9:0] t_cases_rhs_array_muxed47;
reg cases_lhs_array_muxed25 = 1'd0;
reg cases_lhs_array_muxed26 = 1'd0;
reg cases_lhs_array_muxed27 = 1'd0;
reg cases_lhs_array_muxed28 = 1'd0;
reg cases_lhs_array_muxed29 = 1'd0;
reg [15:0] cases_lhs_array_muxed30 = 16'd0;
reg [15:0] cases_lhs_array_muxed31 = 16'd0;
reg [15:0] cases_lhs_array_muxed32 = 16'd0;
reg [15:0] cases_lhs_array_muxed33 = 16'd0;
reg [15:0] cases_lhs_array_muxed34 = 16'd0;
reg cases_lhs_array_muxed35 = 1'd0;
reg cases_lhs_array_muxed36 = 1'd0;
reg cases_lhs_array_muxed37 = 1'd0;
reg cases_lhs_array_muxed38 = 1'd0;
reg cases_lhs_array_muxed39 = 1'd0;
reg [15:0] cases_basiclowerer_array_muxed0;
reg [15:0] cases_basiclowerer_array_muxed1;
reg [15:0] cases_basiclowerer_array_muxed2;
reg [15:0] cases_basiclowerer_array_muxed3;
reg [15:0] cases_basiclowerer_array_muxed4;
reg cases_lhs_array_muxed40 = 1'd0;
reg cases_lhs_array_muxed41 = 1'd0;
reg cases_lhs_array_muxed42 = 1'd0;
reg cases_lhs_array_muxed43 = 1'd0;
reg cases_lhs_array_muxed44 = 1'd0;
reg cases_basiclowerer_array_muxed5 = 1'd0;
reg cases_basiclowerer_array_muxed6 = 1'd0;
reg cases_basiclowerer_array_muxed7 = 1'd0;
reg cases_basiclowerer_array_muxed8 = 1'd0;
reg cases_basiclowerer_array_muxed9 = 1'd0;
reg [15:0] cases_basiclowerer_array_muxed10 = 16'd0;
reg [15:0] cases_basiclowerer_array_muxed11 = 16'd0;
reg [15:0] cases_basiclowerer_array_muxed12 = 16'd0;
reg [15:0] cases_basiclowerer_array_muxed13 = 16'd0;
reg [15:0] cases_basiclowerer_array_muxed14 = 16'd0;
reg [15:0] cases_basiclowerer_array_muxed15;
reg [15:0] cases_basiclowerer_array_muxed16;
reg [15:0] cases_basiclowerer_array_muxed17;
reg [15:0] cases_basiclowerer_array_muxed18;
reg [15:0] cases_basiclowerer_array_muxed19;
reg cases_lhs_array_muxed45 = 1'd0;
reg cases_lhs_array_muxed46 = 1'd0;
reg cases_lhs_array_muxed47 = 1'd0;
reg cases_lhs_array_muxed48 = 1'd0;
reg cases_lhs_array_muxed49 = 1'd0;
reg cases_basiclowerer_array_muxed20 = 1'd0;
reg cases_basiclowerer_array_muxed21 = 1'd0;
reg cases_basiclowerer_array_muxed22 = 1'd0;
reg cases_basiclowerer_array_muxed23 = 1'd0;
reg cases_basiclowerer_array_muxed24 = 1'd0;
reg [15:0] cases_basiclowerer_array_muxed25 = 16'd0;
reg [15:0] cases_basiclowerer_array_muxed26 = 16'd0;
reg [15:0] cases_basiclowerer_array_muxed27 = 16'd0;
reg [15:0] cases_basiclowerer_array_muxed28 = 16'd0;
reg [15:0] cases_basiclowerer_array_muxed29 = 16'd0;

// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on

assign command_decoder_addr = addr;
assign command_decoder_mem_read = mem_read;
assign command_decoder_mem_write = mem_write;
assign command_decoder_refresh = refresh;
assign command_decoder_chip_select = chip_select;
assign command_decoder_ras = ras;
assign command_decoder_cas = cas;
assign command_decoder_we = we;
assign cmd_decoded = command_decoder_cmd_decoded;
assign cmd_valid = command_decoder_cmd_valid;
assign timingcontroller_cmd_decoded = cmd_decoded;
assign timingcontroller_bank_group = bank_addr[2];
assign timingcontroller_bank = bank_addr[1:0];
assign ready = timingcontroller_ready;
assign data_buffer_data_in = eccdecoder1_data_out;
assign data_out = eccencoder1_data_out;
assign data_buffer_mem_write = command_decoder_mem_write;
assign data_buffer_mem_read = command_decoder_mem_read;
assign powermanagement1_cmd_decoded = cmd_decoded;
assign refreshmanager1_refresh = refresh;
assign bankstatetracker_cmd_decoded = cmd_decoded;
assign bankstatetracker_bank_group = bank_addr[2];
assign bankstatetracker_bank = bank_addr[1:0];
assign bankstatetracker_row = row_addr;
assign bank_state = bankstatetracker_bank_state;
assign commandscheduler_cmd_valid = cmd_valid;
assign commandscheduler_cmd_type = cmd_decoded;
assign commandscheduler_bank_group = bank_addr[2];
assign commandscheduler_bank = bank_addr[1:0];
assign commandscheduler_row = row_addr;
assign commandscheduler_col = col_addr;
assign commandscheduler_row_buffer_hit = rowbuffermanager_row_buffer_hit;
assign cmd_ready = commandscheduler_cmd_ready;
assign cmd_executed = commandscheduler_cmd_executed;
assign rowbuffermanager_cmd_decoded = cmd_decoded;
assign rowbuffermanager_bank_group = bank_addr[2];
assign rowbuffermanager_bank = bank_addr[1:0];
assign rowbuffermanager_row = row_addr;
assign row_buffer_state = rowbuffermanager_row_buffer_hit;
assign qosmanager1_cmd_executed = cmd_executed;
assign qos_priority = qosmanager1_qos_priority;
assign address_mapper_addr_in = addr;

// synthesis translate_off
reg dummy_d;
// synthesis translate_on
always @(*) begin
	row_addr <= 16'd0;
	row_addr <= command_decoder_row_addr;
	row_addr <= address_mapper_row_addr;
// synthesis translate_off
	dummy_d <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_1;
// synthesis translate_on
always @(*) begin
	col_addr <= 10'd0;
	col_addr <= command_decoder_col_addr;
	col_addr <= address_mapper_col_addr;
// synthesis translate_off
	dummy_d_1 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_2;
// synthesis translate_on
always @(*) begin
	bank_addr <= 3'd0;
	bank_addr <= command_decoder_bank_addr;
	bank_addr <= address_mapper_bank_addr;
// synthesis translate_off
	dummy_d_2 <= dummy_s;
// synthesis translate_on
end
assign requests = cmd_ready;
assign cmd_grant = grant0;
assign clock_domain_crossing_src_data = data_buffer_data_out;
assign data_out_sync = clock_domain_crossing_dst_data;
assign eccencoder1_data_in = data_buffer_data_out;
assign eccdecoder1_data_in = eccencoder1_data_out;
assign command_decoder_cmd_valid = (command_decoder_chip_select & (~((command_decoder_ras & command_decoder_cas) & command_decoder_we)));

// synthesis translate_off
reg dummy_d_3;
// synthesis translate_on
always @(*) begin
	command_decoder_cmd_decoded <= 4'd0;
	case ({command_decoder_we, command_decoder_cas, command_decoder_ras})
		1'd0: begin
			command_decoder_cmd_decoded <= 1'd1;
		end
		1'd1: begin
			command_decoder_cmd_decoded <= 2'd3;
		end
		2'd2: begin
			command_decoder_cmd_decoded <= 3'd4;
		end
		2'd3: begin
			command_decoder_cmd_decoded <= 3'd5;
		end
		3'd4: begin
			command_decoder_cmd_decoded <= 2'd2;
		end
		default: begin
			command_decoder_cmd_decoded <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_3 <= dummy_s;
// synthesis translate_on
end
assign command_decoder_row_addr = command_decoder_addr[31:16];
assign command_decoder_col_addr = command_decoder_addr[15:6];
assign command_decoder_bank_addr = command_decoder_addr[5:3];
assign bankstatetracker_bank_state = array_muxed0;
assign bankstatetracker_active_row = array_muxed5;

// synthesis translate_off
reg dummy_d_4;
// synthesis translate_on
always @(*) begin
	data_buffer_write_fifo_wrport_adr <= 3'd0;
	if (data_buffer_write_fifo_replace) begin
		data_buffer_write_fifo_wrport_adr <= (data_buffer_write_fifo_produce - 1'd1);
	end else begin
		data_buffer_write_fifo_wrport_adr <= data_buffer_write_fifo_produce;
	end
// synthesis translate_off
	dummy_d_4 <= dummy_s;
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
reg dummy_d_5;
// synthesis translate_on
always @(*) begin
	data_buffer_read_fifo_wrport_adr <= 3'd0;
	if (data_buffer_read_fifo_replace) begin
		data_buffer_read_fifo_wrport_adr <= (data_buffer_read_fifo_produce - 1'd1);
	end else begin
		data_buffer_read_fifo_wrport_adr <= data_buffer_read_fifo_produce;
	end
// synthesis translate_off
	dummy_d_5 <= dummy_s;
// synthesis translate_on
end
assign data_buffer_read_fifo_wrport_dat_w = data_buffer_read_fifo_syncfifo_din;
assign data_buffer_read_fifo_wrport_we = (data_buffer_read_fifo_syncfifo_we & (data_buffer_read_fifo_syncfifo_writable | data_buffer_read_fifo_replace));
assign data_buffer_read_fifo_do_read = (data_buffer_read_fifo_syncfifo_readable & data_buffer_read_fifo_syncfifo_re);
assign data_buffer_read_fifo_rdport_adr = data_buffer_read_fifo_consume;
assign data_buffer_read_fifo_syncfifo_dout = data_buffer_read_fifo_rdport_dat_r;
assign data_buffer_read_fifo_syncfifo_writable = (data_buffer_read_fifo_level != 4'd8);
assign data_buffer_read_fifo_syncfifo_readable = (data_buffer_read_fifo_level != 1'd0);
assign rowbuffermanager_row_buffer_hit = (rowbuffermanager_row_open & (rowbuffermanager_current_row == rowbuffermanager_row));
assign rowbuffermanager_row_open = array_muxed10;
assign rowbuffermanager_current_row = array_muxed15;
assign qosmanager0_grant = (1'd1 <<< qosmanager0_current_priority);
assign qosmanager0_qos_priority = qosmanager0_current_priority;
assign address_mapper_row_addr = {address_mapper_addr_in[4:2], address_mapper_addr_in[28:16]};
assign address_mapper_col_addr = address_mapper_addr_in[14:5];
assign address_mapper_bank_addr = address_mapper_addr_in[13:12];
assign address_mapper_bank_group_addr = address_mapper_addr_in[15:14];
assign request = requests;
assign grant0 = grant1;
assign eccencoder0_parity = (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((eccencoder0_data_in[0] ^ eccencoder0_data_in[1]) ^ eccencoder0_data_in[2]) ^ eccencoder0_data_in[3]) ^ eccencoder0_data_in[4]) ^ eccencoder0_data_in[5]) ^ eccencoder0_data_in[6]) ^ eccencoder0_data_in[7]) ^ eccencoder0_data_in[8]) ^ eccencoder0_data_in[9]) ^ eccencoder0_data_in[10]) ^ eccencoder0_data_in[11]) ^ eccencoder0_data_in[12]) ^ eccencoder0_data_in[13]) ^ eccencoder0_data_in[14]) ^ eccencoder0_data_in[15]) ^ eccencoder0_data_in[16]) ^ eccencoder0_data_in[17]) ^ eccencoder0_data_in[18]) ^ eccencoder0_data_in[19]) ^ eccencoder0_data_in[20]) ^ eccencoder0_data_in[21]) ^ eccencoder0_data_in[22]) ^ eccencoder0_data_in[23]) ^ eccencoder0_data_in[24]) ^ eccencoder0_data_in[25]) ^ eccencoder0_data_in[26]) ^ eccencoder0_data_in[27]) ^ eccencoder0_data_in[28]) ^ eccencoder0_data_in[29]) ^ eccencoder0_data_in[30]) ^ eccencoder0_data_in[31]) ^ eccencoder0_data_in[32]) ^ eccencoder0_data_in[33]) ^ eccencoder0_data_in[34]) ^ eccencoder0_data_in[35]) ^ eccencoder0_data_in[36]) ^ eccencoder0_data_in[37]) ^ eccencoder0_data_in[38]) ^ eccencoder0_data_in[39]) ^ eccencoder0_data_in[40]) ^ eccencoder0_data_in[41]) ^ eccencoder0_data_in[42]) ^ eccencoder0_data_in[43]) ^ eccencoder0_data_in[44]) ^ eccencoder0_data_in[45]) ^ eccencoder0_data_in[46]) ^ eccencoder0_data_in[47]) ^ eccencoder0_data_in[48]) ^ eccencoder0_data_in[49]) ^ eccencoder0_data_in[50]) ^ eccencoder0_data_in[51]) ^ eccencoder0_data_in[52]) ^ eccencoder0_data_in[53]) ^ eccencoder0_data_in[54]) ^ eccencoder0_data_in[55]) ^ eccencoder0_data_in[56]) ^ eccencoder0_data_in[57]) ^ eccencoder0_data_in[58]) ^ eccencoder0_data_in[59]) ^ eccencoder0_data_in[60]) ^ eccencoder0_data_in[61]) ^ eccencoder0_data_in[62]) ^ eccencoder0_data_in[63]);
assign eccencoder0_data_out = {eccencoder0_parity, eccencoder0_data_in};
assign eccdecoder0_data_out = eccdecoder0_data_in[63:0];
assign eccdecoder0_parity = (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((eccdecoder0_data_in[0] ^ eccdecoder0_data_in[1]) ^ eccdecoder0_data_in[2]) ^ eccdecoder0_data_in[3]) ^ eccdecoder0_data_in[4]) ^ eccdecoder0_data_in[5]) ^ eccdecoder0_data_in[6]) ^ eccdecoder0_data_in[7]) ^ eccdecoder0_data_in[8]) ^ eccdecoder0_data_in[9]) ^ eccdecoder0_data_in[10]) ^ eccdecoder0_data_in[11]) ^ eccdecoder0_data_in[12]) ^ eccdecoder0_data_in[13]) ^ eccdecoder0_data_in[14]) ^ eccdecoder0_data_in[15]) ^ eccdecoder0_data_in[16]) ^ eccdecoder0_data_in[17]) ^ eccdecoder0_data_in[18]) ^ eccdecoder0_data_in[19]) ^ eccdecoder0_data_in[20]) ^ eccdecoder0_data_in[21]) ^ eccdecoder0_data_in[22]) ^ eccdecoder0_data_in[23]) ^ eccdecoder0_data_in[24]) ^ eccdecoder0_data_in[25]) ^ eccdecoder0_data_in[26]) ^ eccdecoder0_data_in[27]) ^ eccdecoder0_data_in[28]) ^ eccdecoder0_data_in[29]) ^ eccdecoder0_data_in[30]) ^ eccdecoder0_data_in[31]) ^ eccdecoder0_data_in[32]) ^ eccdecoder0_data_in[33]) ^ eccdecoder0_data_in[34]) ^ eccdecoder0_data_in[35]) ^ eccdecoder0_data_in[36]) ^ eccdecoder0_data_in[37]) ^ eccdecoder0_data_in[38]) ^ eccdecoder0_data_in[39]) ^ eccdecoder0_data_in[40]) ^ eccdecoder0_data_in[41]) ^ eccdecoder0_data_in[42]) ^ eccdecoder0_data_in[43]) ^ eccdecoder0_data_in[44]) ^ eccdecoder0_data_in[45]) ^ eccdecoder0_data_in[46]) ^ eccdecoder0_data_in[47]) ^ eccdecoder0_data_in[48]) ^ eccdecoder0_data_in[49]) ^ eccdecoder0_data_in[50]) ^ eccdecoder0_data_in[51]) ^ eccdecoder0_data_in[52]) ^ eccdecoder0_data_in[53]) ^ eccdecoder0_data_in[54]) ^ eccdecoder0_data_in[55]) ^ eccdecoder0_data_in[56]) ^ eccdecoder0_data_in[57]) ^ eccdecoder0_data_in[58]) ^ eccdecoder0_data_in[59]) ^ eccdecoder0_data_in[60]) ^ eccdecoder0_data_in[61]) ^ eccdecoder0_data_in[62]) ^ eccdecoder0_data_in[63]);
assign eccdecoder0_error_detected = (eccdecoder0_parity != eccdecoder0_data_in[71:64]);

// synthesis translate_off
reg dummy_d_6;
// synthesis translate_on
always @(*) begin
	data_in_fifo_wrport_adr <= 4'd0;
	if (data_in_fifo_replace) begin
		data_in_fifo_wrport_adr <= (data_in_fifo_produce - 1'd1);
	end else begin
		data_in_fifo_wrport_adr <= data_in_fifo_produce;
	end
// synthesis translate_off
	dummy_d_6 <= dummy_s;
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
reg dummy_d_7;
// synthesis translate_on
always @(*) begin
	data_out_fifo_wrport_adr <= 4'd0;
	if (data_out_fifo_replace) begin
		data_out_fifo_wrport_adr <= (data_out_fifo_produce - 1'd1);
	end else begin
		data_out_fifo_wrport_adr <= data_out_fifo_produce;
	end
// synthesis translate_off
	dummy_d_7 <= dummy_s;
// synthesis translate_on
end
assign data_out_fifo_wrport_dat_w = data_out_fifo_syncfifo_din;
assign data_out_fifo_wrport_we = (data_out_fifo_syncfifo_we & (data_out_fifo_syncfifo_writable | data_out_fifo_replace));
assign data_out_fifo_do_read = (data_out_fifo_syncfifo_readable & data_out_fifo_syncfifo_re);
assign data_out_fifo_rdport_adr = data_out_fifo_consume;
assign data_out_fifo_syncfifo_dout = data_out_fifo_rdport_dat_r;
assign data_out_fifo_syncfifo_writable = (data_out_fifo_level != 5'd16);
assign data_out_fifo_syncfifo_readable = (data_out_fifo_level != 1'd0);
assign qosmanager1_grant = (1'd1 <<< qosmanager1_current_priority);
assign qosmanager1_qos_priority = qosmanager1_current_priority;
assign eccencoder1_parity = (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((eccencoder1_data_in[0] ^ eccencoder1_data_in[1]) ^ eccencoder1_data_in[2]) ^ eccencoder1_data_in[3]) ^ eccencoder1_data_in[4]) ^ eccencoder1_data_in[5]) ^ eccencoder1_data_in[6]) ^ eccencoder1_data_in[7]) ^ eccencoder1_data_in[8]) ^ eccencoder1_data_in[9]) ^ eccencoder1_data_in[10]) ^ eccencoder1_data_in[11]) ^ eccencoder1_data_in[12]) ^ eccencoder1_data_in[13]) ^ eccencoder1_data_in[14]) ^ eccencoder1_data_in[15]) ^ eccencoder1_data_in[16]) ^ eccencoder1_data_in[17]) ^ eccencoder1_data_in[18]) ^ eccencoder1_data_in[19]) ^ eccencoder1_data_in[20]) ^ eccencoder1_data_in[21]) ^ eccencoder1_data_in[22]) ^ eccencoder1_data_in[23]) ^ eccencoder1_data_in[24]) ^ eccencoder1_data_in[25]) ^ eccencoder1_data_in[26]) ^ eccencoder1_data_in[27]) ^ eccencoder1_data_in[28]) ^ eccencoder1_data_in[29]) ^ eccencoder1_data_in[30]) ^ eccencoder1_data_in[31]) ^ eccencoder1_data_in[32]) ^ eccencoder1_data_in[33]) ^ eccencoder1_data_in[34]) ^ eccencoder1_data_in[35]) ^ eccencoder1_data_in[36]) ^ eccencoder1_data_in[37]) ^ eccencoder1_data_in[38]) ^ eccencoder1_data_in[39]) ^ eccencoder1_data_in[40]) ^ eccencoder1_data_in[41]) ^ eccencoder1_data_in[42]) ^ eccencoder1_data_in[43]) ^ eccencoder1_data_in[44]) ^ eccencoder1_data_in[45]) ^ eccencoder1_data_in[46]) ^ eccencoder1_data_in[47]) ^ eccencoder1_data_in[48]) ^ eccencoder1_data_in[49]) ^ eccencoder1_data_in[50]) ^ eccencoder1_data_in[51]) ^ eccencoder1_data_in[52]) ^ eccencoder1_data_in[53]) ^ eccencoder1_data_in[54]) ^ eccencoder1_data_in[55]) ^ eccencoder1_data_in[56]) ^ eccencoder1_data_in[57]) ^ eccencoder1_data_in[58]) ^ eccencoder1_data_in[59]) ^ eccencoder1_data_in[60]) ^ eccencoder1_data_in[61]) ^ eccencoder1_data_in[62]) ^ eccencoder1_data_in[63]);
assign eccencoder1_data_out = {eccencoder1_parity, eccencoder1_data_in};
assign eccdecoder1_data_out = eccdecoder1_data_in[63:0];
assign eccdecoder1_parity = (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((eccdecoder1_data_in[0] ^ eccdecoder1_data_in[1]) ^ eccdecoder1_data_in[2]) ^ eccdecoder1_data_in[3]) ^ eccdecoder1_data_in[4]) ^ eccdecoder1_data_in[5]) ^ eccdecoder1_data_in[6]) ^ eccdecoder1_data_in[7]) ^ eccdecoder1_data_in[8]) ^ eccdecoder1_data_in[9]) ^ eccdecoder1_data_in[10]) ^ eccdecoder1_data_in[11]) ^ eccdecoder1_data_in[12]) ^ eccdecoder1_data_in[13]) ^ eccdecoder1_data_in[14]) ^ eccdecoder1_data_in[15]) ^ eccdecoder1_data_in[16]) ^ eccdecoder1_data_in[17]) ^ eccdecoder1_data_in[18]) ^ eccdecoder1_data_in[19]) ^ eccdecoder1_data_in[20]) ^ eccdecoder1_data_in[21]) ^ eccdecoder1_data_in[22]) ^ eccdecoder1_data_in[23]) ^ eccdecoder1_data_in[24]) ^ eccdecoder1_data_in[25]) ^ eccdecoder1_data_in[26]) ^ eccdecoder1_data_in[27]) ^ eccdecoder1_data_in[28]) ^ eccdecoder1_data_in[29]) ^ eccdecoder1_data_in[30]) ^ eccdecoder1_data_in[31]) ^ eccdecoder1_data_in[32]) ^ eccdecoder1_data_in[33]) ^ eccdecoder1_data_in[34]) ^ eccdecoder1_data_in[35]) ^ eccdecoder1_data_in[36]) ^ eccdecoder1_data_in[37]) ^ eccdecoder1_data_in[38]) ^ eccdecoder1_data_in[39]) ^ eccdecoder1_data_in[40]) ^ eccdecoder1_data_in[41]) ^ eccdecoder1_data_in[42]) ^ eccdecoder1_data_in[43]) ^ eccdecoder1_data_in[44]) ^ eccdecoder1_data_in[45]) ^ eccdecoder1_data_in[46]) ^ eccdecoder1_data_in[47]) ^ eccdecoder1_data_in[48]) ^ eccdecoder1_data_in[49]) ^ eccdecoder1_data_in[50]) ^ eccdecoder1_data_in[51]) ^ eccdecoder1_data_in[52]) ^ eccdecoder1_data_in[53]) ^ eccdecoder1_data_in[54]) ^ eccdecoder1_data_in[55]) ^ eccdecoder1_data_in[56]) ^ eccdecoder1_data_in[57]) ^ eccdecoder1_data_in[58]) ^ eccdecoder1_data_in[59]) ^ eccdecoder1_data_in[60]) ^ eccdecoder1_data_in[61]) ^ eccdecoder1_data_in[62]) ^ eccdecoder1_data_in[63]);
assign eccdecoder1_error_detected = (eccdecoder1_parity != eccdecoder1_data_in[71:64]);

// synthesis translate_off
reg dummy_d_8;
// synthesis translate_on
always @(*) begin
	array_muxed1 <= 2'd0;
	case (bankstatetracker_bank)
		1'd0: begin
			array_muxed1 <= bankstatetracker0;
		end
		1'd1: begin
			array_muxed1 <= bankstatetracker1;
		end
		2'd2: begin
			array_muxed1 <= bankstatetracker2;
		end
		default: begin
			array_muxed1 <= bankstatetracker3;
		end
	endcase
// synthesis translate_off
	dummy_d_8 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_9;
// synthesis translate_on
always @(*) begin
	array_muxed2 <= 2'd0;
	case (bankstatetracker_bank)
		1'd0: begin
			array_muxed2 <= bankstatetracker4;
		end
		1'd1: begin
			array_muxed2 <= bankstatetracker5;
		end
		2'd2: begin
			array_muxed2 <= bankstatetracker6;
		end
		default: begin
			array_muxed2 <= bankstatetracker7;
		end
	endcase
// synthesis translate_off
	dummy_d_9 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_10;
// synthesis translate_on
always @(*) begin
	array_muxed3 <= 2'd0;
	case (bankstatetracker_bank)
		1'd0: begin
			array_muxed3 <= bankstatetracker8;
		end
		1'd1: begin
			array_muxed3 <= bankstatetracker9;
		end
		2'd2: begin
			array_muxed3 <= bankstatetracker10;
		end
		default: begin
			array_muxed3 <= bankstatetracker11;
		end
	endcase
// synthesis translate_off
	dummy_d_10 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_11;
// synthesis translate_on
always @(*) begin
	array_muxed4 <= 2'd0;
	case (bankstatetracker_bank)
		1'd0: begin
			array_muxed4 <= bankstatetracker12;
		end
		1'd1: begin
			array_muxed4 <= bankstatetracker13;
		end
		2'd2: begin
			array_muxed4 <= bankstatetracker14;
		end
		default: begin
			array_muxed4 <= bankstatetracker15;
		end
	endcase
// synthesis translate_off
	dummy_d_11 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_12;
// synthesis translate_on
always @(*) begin
	array_muxed0 <= 2'd0;
	case (bankstatetracker_bank_group)
		1'd0: begin
			array_muxed0 <= array_muxed1;
		end
		1'd1: begin
			array_muxed0 <= array_muxed2;
		end
		2'd2: begin
			array_muxed0 <= array_muxed3;
		end
		default: begin
			array_muxed0 <= array_muxed4;
		end
	endcase
// synthesis translate_off
	dummy_d_12 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_13;
// synthesis translate_on
always @(*) begin
	array_muxed6 <= 16'd0;
	case (bankstatetracker_bank)
		1'd0: begin
			array_muxed6 <= bankstatetracker16;
		end
		1'd1: begin
			array_muxed6 <= bankstatetracker17;
		end
		2'd2: begin
			array_muxed6 <= bankstatetracker18;
		end
		default: begin
			array_muxed6 <= bankstatetracker19;
		end
	endcase
// synthesis translate_off
	dummy_d_13 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_14;
// synthesis translate_on
always @(*) begin
	array_muxed7 <= 16'd0;
	case (bankstatetracker_bank)
		1'd0: begin
			array_muxed7 <= bankstatetracker20;
		end
		1'd1: begin
			array_muxed7 <= bankstatetracker21;
		end
		2'd2: begin
			array_muxed7 <= bankstatetracker22;
		end
		default: begin
			array_muxed7 <= bankstatetracker23;
		end
	endcase
// synthesis translate_off
	dummy_d_14 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_15;
// synthesis translate_on
always @(*) begin
	array_muxed8 <= 16'd0;
	case (bankstatetracker_bank)
		1'd0: begin
			array_muxed8 <= bankstatetracker24;
		end
		1'd1: begin
			array_muxed8 <= bankstatetracker25;
		end
		2'd2: begin
			array_muxed8 <= bankstatetracker26;
		end
		default: begin
			array_muxed8 <= bankstatetracker27;
		end
	endcase
// synthesis translate_off
	dummy_d_15 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_16;
// synthesis translate_on
always @(*) begin
	array_muxed9 <= 16'd0;
	case (bankstatetracker_bank)
		1'd0: begin
			array_muxed9 <= bankstatetracker28;
		end
		1'd1: begin
			array_muxed9 <= bankstatetracker29;
		end
		2'd2: begin
			array_muxed9 <= bankstatetracker30;
		end
		default: begin
			array_muxed9 <= bankstatetracker31;
		end
	endcase
// synthesis translate_off
	dummy_d_16 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_17;
// synthesis translate_on
always @(*) begin
	array_muxed5 <= 16'd0;
	case (bankstatetracker_bank_group)
		1'd0: begin
			array_muxed5 <= array_muxed6;
		end
		1'd1: begin
			array_muxed5 <= array_muxed7;
		end
		2'd2: begin
			array_muxed5 <= array_muxed8;
		end
		default: begin
			array_muxed5 <= array_muxed9;
		end
	endcase
// synthesis translate_off
	dummy_d_17 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_18;
// synthesis translate_on
always @(*) begin
	array_muxed11 <= 1'd0;
	case (rowbuffermanager_bank)
		1'd0: begin
			array_muxed11 <= rowbuffermanager0;
		end
		1'd1: begin
			array_muxed11 <= rowbuffermanager1;
		end
		2'd2: begin
			array_muxed11 <= rowbuffermanager2;
		end
		default: begin
			array_muxed11 <= rowbuffermanager3;
		end
	endcase
// synthesis translate_off
	dummy_d_18 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_19;
// synthesis translate_on
always @(*) begin
	array_muxed12 <= 1'd0;
	case (rowbuffermanager_bank)
		1'd0: begin
			array_muxed12 <= rowbuffermanager4;
		end
		1'd1: begin
			array_muxed12 <= rowbuffermanager5;
		end
		2'd2: begin
			array_muxed12 <= rowbuffermanager6;
		end
		default: begin
			array_muxed12 <= rowbuffermanager7;
		end
	endcase
// synthesis translate_off
	dummy_d_19 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_20;
// synthesis translate_on
always @(*) begin
	array_muxed13 <= 1'd0;
	case (rowbuffermanager_bank)
		1'd0: begin
			array_muxed13 <= rowbuffermanager8;
		end
		1'd1: begin
			array_muxed13 <= rowbuffermanager9;
		end
		2'd2: begin
			array_muxed13 <= rowbuffermanager10;
		end
		default: begin
			array_muxed13 <= rowbuffermanager11;
		end
	endcase
// synthesis translate_off
	dummy_d_20 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_21;
// synthesis translate_on
always @(*) begin
	array_muxed14 <= 1'd0;
	case (rowbuffermanager_bank)
		1'd0: begin
			array_muxed14 <= rowbuffermanager12;
		end
		1'd1: begin
			array_muxed14 <= rowbuffermanager13;
		end
		2'd2: begin
			array_muxed14 <= rowbuffermanager14;
		end
		default: begin
			array_muxed14 <= rowbuffermanager15;
		end
	endcase
// synthesis translate_off
	dummy_d_21 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_22;
// synthesis translate_on
always @(*) begin
	array_muxed10 <= 1'd0;
	case (rowbuffermanager_bank_group)
		1'd0: begin
			array_muxed10 <= array_muxed11;
		end
		1'd1: begin
			array_muxed10 <= array_muxed12;
		end
		2'd2: begin
			array_muxed10 <= array_muxed13;
		end
		default: begin
			array_muxed10 <= array_muxed14;
		end
	endcase
// synthesis translate_off
	dummy_d_22 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_23;
// synthesis translate_on
always @(*) begin
	array_muxed16 <= 16'd0;
	case (rowbuffermanager_bank)
		1'd0: begin
			array_muxed16 <= rowbuffermanager16;
		end
		1'd1: begin
			array_muxed16 <= rowbuffermanager17;
		end
		2'd2: begin
			array_muxed16 <= rowbuffermanager18;
		end
		default: begin
			array_muxed16 <= rowbuffermanager19;
		end
	endcase
// synthesis translate_off
	dummy_d_23 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_24;
// synthesis translate_on
always @(*) begin
	array_muxed17 <= 16'd0;
	case (rowbuffermanager_bank)
		1'd0: begin
			array_muxed17 <= rowbuffermanager20;
		end
		1'd1: begin
			array_muxed17 <= rowbuffermanager21;
		end
		2'd2: begin
			array_muxed17 <= rowbuffermanager22;
		end
		default: begin
			array_muxed17 <= rowbuffermanager23;
		end
	endcase
// synthesis translate_off
	dummy_d_24 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_25;
// synthesis translate_on
always @(*) begin
	array_muxed18 <= 16'd0;
	case (rowbuffermanager_bank)
		1'd0: begin
			array_muxed18 <= rowbuffermanager24;
		end
		1'd1: begin
			array_muxed18 <= rowbuffermanager25;
		end
		2'd2: begin
			array_muxed18 <= rowbuffermanager26;
		end
		default: begin
			array_muxed18 <= rowbuffermanager27;
		end
	endcase
// synthesis translate_off
	dummy_d_25 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_26;
// synthesis translate_on
always @(*) begin
	array_muxed19 <= 16'd0;
	case (rowbuffermanager_bank)
		1'd0: begin
			array_muxed19 <= rowbuffermanager28;
		end
		1'd1: begin
			array_muxed19 <= rowbuffermanager29;
		end
		2'd2: begin
			array_muxed19 <= rowbuffermanager30;
		end
		default: begin
			array_muxed19 <= rowbuffermanager31;
		end
	endcase
// synthesis translate_off
	dummy_d_26 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_27;
// synthesis translate_on
always @(*) begin
	array_muxed15 <= 16'd0;
	case (rowbuffermanager_bank_group)
		1'd0: begin
			array_muxed15 <= array_muxed16;
		end
		1'd1: begin
			array_muxed15 <= array_muxed17;
		end
		2'd2: begin
			array_muxed15 <= array_muxed18;
		end
		default: begin
			array_muxed15 <= array_muxed19;
		end
	endcase
// synthesis translate_off
	dummy_d_27 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_28;
// synthesis translate_on
always @(*) begin
	t_cases_array_muxed0 <= 32'd0;
	case (((timingcontroller_bank_group * 2'd2) + timingcontroller_bank))
		1'd0: begin
			t_cases_array_muxed0 <= timingcontroller0;
		end
		1'd1: begin
			t_cases_array_muxed0 <= timingcontroller1;
		end
		2'd2: begin
			t_cases_array_muxed0 <= timingcontroller2;
		end
		2'd3: begin
			t_cases_array_muxed0 <= timingcontroller3;
		end
		3'd4: begin
			t_cases_array_muxed0 <= timingcontroller4;
		end
		3'd5: begin
			t_cases_array_muxed0 <= timingcontroller5;
		end
		3'd6: begin
			t_cases_array_muxed0 <= timingcontroller6;
		end
		3'd7: begin
			t_cases_array_muxed0 <= timingcontroller7;
		end
		4'd8: begin
			t_cases_array_muxed0 <= timingcontroller8;
		end
		4'd9: begin
			t_cases_array_muxed0 <= timingcontroller9;
		end
		4'd10: begin
			t_cases_array_muxed0 <= timingcontroller10;
		end
		4'd11: begin
			t_cases_array_muxed0 <= timingcontroller11;
		end
		4'd12: begin
			t_cases_array_muxed0 <= timingcontroller12;
		end
		4'd13: begin
			t_cases_array_muxed0 <= timingcontroller13;
		end
		4'd14: begin
			t_cases_array_muxed0 <= timingcontroller14;
		end
		default: begin
			t_cases_array_muxed0 <= timingcontroller15;
		end
	endcase
// synthesis translate_off
	dummy_d_28 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_29;
// synthesis translate_on
always @(*) begin
	t_cases_array_muxed1 <= 32'd0;
	case (((timingcontroller_bank_group * 2'd2) + timingcontroller_bank))
		1'd0: begin
			t_cases_array_muxed1 <= timingcontroller0;
		end
		1'd1: begin
			t_cases_array_muxed1 <= timingcontroller1;
		end
		2'd2: begin
			t_cases_array_muxed1 <= timingcontroller2;
		end
		2'd3: begin
			t_cases_array_muxed1 <= timingcontroller3;
		end
		3'd4: begin
			t_cases_array_muxed1 <= timingcontroller4;
		end
		3'd5: begin
			t_cases_array_muxed1 <= timingcontroller5;
		end
		3'd6: begin
			t_cases_array_muxed1 <= timingcontroller6;
		end
		3'd7: begin
			t_cases_array_muxed1 <= timingcontroller7;
		end
		4'd8: begin
			t_cases_array_muxed1 <= timingcontroller8;
		end
		4'd9: begin
			t_cases_array_muxed1 <= timingcontroller9;
		end
		4'd10: begin
			t_cases_array_muxed1 <= timingcontroller10;
		end
		4'd11: begin
			t_cases_array_muxed1 <= timingcontroller11;
		end
		4'd12: begin
			t_cases_array_muxed1 <= timingcontroller12;
		end
		4'd13: begin
			t_cases_array_muxed1 <= timingcontroller13;
		end
		4'd14: begin
			t_cases_array_muxed1 <= timingcontroller14;
		end
		default: begin
			t_cases_array_muxed1 <= timingcontroller15;
		end
	endcase
// synthesis translate_off
	dummy_d_29 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_30;
// synthesis translate_on
always @(*) begin
	t_cases_array_muxed2 <= 32'd0;
	case (((timingcontroller_bank_group * 2'd2) + timingcontroller_bank))
		1'd0: begin
			t_cases_array_muxed2 <= timingcontroller0;
		end
		1'd1: begin
			t_cases_array_muxed2 <= timingcontroller1;
		end
		2'd2: begin
			t_cases_array_muxed2 <= timingcontroller2;
		end
		2'd3: begin
			t_cases_array_muxed2 <= timingcontroller3;
		end
		3'd4: begin
			t_cases_array_muxed2 <= timingcontroller4;
		end
		3'd5: begin
			t_cases_array_muxed2 <= timingcontroller5;
		end
		3'd6: begin
			t_cases_array_muxed2 <= timingcontroller6;
		end
		3'd7: begin
			t_cases_array_muxed2 <= timingcontroller7;
		end
		4'd8: begin
			t_cases_array_muxed2 <= timingcontroller8;
		end
		4'd9: begin
			t_cases_array_muxed2 <= timingcontroller9;
		end
		4'd10: begin
			t_cases_array_muxed2 <= timingcontroller10;
		end
		4'd11: begin
			t_cases_array_muxed2 <= timingcontroller11;
		end
		4'd12: begin
			t_cases_array_muxed2 <= timingcontroller12;
		end
		4'd13: begin
			t_cases_array_muxed2 <= timingcontroller13;
		end
		4'd14: begin
			t_cases_array_muxed2 <= timingcontroller14;
		end
		default: begin
			t_cases_array_muxed2 <= timingcontroller15;
		end
	endcase
// synthesis translate_off
	dummy_d_30 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_31;
// synthesis translate_on
always @(*) begin
	t_cases_array_muxed3 <= 32'd0;
	case (((timingcontroller_bank_group * 2'd2) + timingcontroller_bank))
		1'd0: begin
			t_cases_array_muxed3 <= timingcontroller0;
		end
		1'd1: begin
			t_cases_array_muxed3 <= timingcontroller1;
		end
		2'd2: begin
			t_cases_array_muxed3 <= timingcontroller2;
		end
		2'd3: begin
			t_cases_array_muxed3 <= timingcontroller3;
		end
		3'd4: begin
			t_cases_array_muxed3 <= timingcontroller4;
		end
		3'd5: begin
			t_cases_array_muxed3 <= timingcontroller5;
		end
		3'd6: begin
			t_cases_array_muxed3 <= timingcontroller6;
		end
		3'd7: begin
			t_cases_array_muxed3 <= timingcontroller7;
		end
		4'd8: begin
			t_cases_array_muxed3 <= timingcontroller8;
		end
		4'd9: begin
			t_cases_array_muxed3 <= timingcontroller9;
		end
		4'd10: begin
			t_cases_array_muxed3 <= timingcontroller10;
		end
		4'd11: begin
			t_cases_array_muxed3 <= timingcontroller11;
		end
		4'd12: begin
			t_cases_array_muxed3 <= timingcontroller12;
		end
		4'd13: begin
			t_cases_array_muxed3 <= timingcontroller13;
		end
		4'd14: begin
			t_cases_array_muxed3 <= timingcontroller14;
		end
		default: begin
			t_cases_array_muxed3 <= timingcontroller15;
		end
	endcase
// synthesis translate_off
	dummy_d_31 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_32;
// synthesis translate_on
always @(*) begin
	t_basiclowerer_array_muxed0 <= 5'd0;
	case (((commandscheduler_bank_group * 3'd4) + commandscheduler_bank))
		1'd0: begin
			t_basiclowerer_array_muxed0 <= commandscheduler528;
		end
		1'd1: begin
			t_basiclowerer_array_muxed0 <= commandscheduler529;
		end
		2'd2: begin
			t_basiclowerer_array_muxed0 <= commandscheduler530;
		end
		2'd3: begin
			t_basiclowerer_array_muxed0 <= commandscheduler531;
		end
		3'd4: begin
			t_basiclowerer_array_muxed0 <= commandscheduler532;
		end
		3'd5: begin
			t_basiclowerer_array_muxed0 <= commandscheduler533;
		end
		3'd6: begin
			t_basiclowerer_array_muxed0 <= commandscheduler534;
		end
		3'd7: begin
			t_basiclowerer_array_muxed0 <= commandscheduler535;
		end
		4'd8: begin
			t_basiclowerer_array_muxed0 <= commandscheduler536;
		end
		4'd9: begin
			t_basiclowerer_array_muxed0 <= commandscheduler537;
		end
		4'd10: begin
			t_basiclowerer_array_muxed0 <= commandscheduler538;
		end
		4'd11: begin
			t_basiclowerer_array_muxed0 <= commandscheduler539;
		end
		4'd12: begin
			t_basiclowerer_array_muxed0 <= commandscheduler540;
		end
		4'd13: begin
			t_basiclowerer_array_muxed0 <= commandscheduler541;
		end
		4'd14: begin
			t_basiclowerer_array_muxed0 <= commandscheduler542;
		end
		default: begin
			t_basiclowerer_array_muxed0 <= commandscheduler543;
		end
	endcase
// synthesis translate_off
	dummy_d_32 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_33;
// synthesis translate_on
always @(*) begin
	t_basiclowerer_array_muxed1 <= 5'd0;
	case (((commandscheduler_bank_group * 3'd4) + commandscheduler_bank))
		1'd0: begin
			t_basiclowerer_array_muxed1 <= commandscheduler512;
		end
		1'd1: begin
			t_basiclowerer_array_muxed1 <= commandscheduler513;
		end
		2'd2: begin
			t_basiclowerer_array_muxed1 <= commandscheduler514;
		end
		2'd3: begin
			t_basiclowerer_array_muxed1 <= commandscheduler515;
		end
		3'd4: begin
			t_basiclowerer_array_muxed1 <= commandscheduler516;
		end
		3'd5: begin
			t_basiclowerer_array_muxed1 <= commandscheduler517;
		end
		3'd6: begin
			t_basiclowerer_array_muxed1 <= commandscheduler518;
		end
		3'd7: begin
			t_basiclowerer_array_muxed1 <= commandscheduler519;
		end
		4'd8: begin
			t_basiclowerer_array_muxed1 <= commandscheduler520;
		end
		4'd9: begin
			t_basiclowerer_array_muxed1 <= commandscheduler521;
		end
		4'd10: begin
			t_basiclowerer_array_muxed1 <= commandscheduler522;
		end
		4'd11: begin
			t_basiclowerer_array_muxed1 <= commandscheduler523;
		end
		4'd12: begin
			t_basiclowerer_array_muxed1 <= commandscheduler524;
		end
		4'd13: begin
			t_basiclowerer_array_muxed1 <= commandscheduler525;
		end
		4'd14: begin
			t_basiclowerer_array_muxed1 <= commandscheduler526;
		end
		default: begin
			t_basiclowerer_array_muxed1 <= commandscheduler527;
		end
	endcase
// synthesis translate_off
	dummy_d_33 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_34;
// synthesis translate_on
always @(*) begin
	t_basiclowerer_basiclowerer_array_muxed <= 5'd0;
	case (((commandscheduler_bank_group * 3'd4) + commandscheduler_bank))
		1'd0: begin
			t_basiclowerer_basiclowerer_array_muxed <= commandscheduler528;
		end
		1'd1: begin
			t_basiclowerer_basiclowerer_array_muxed <= commandscheduler529;
		end
		2'd2: begin
			t_basiclowerer_basiclowerer_array_muxed <= commandscheduler530;
		end
		2'd3: begin
			t_basiclowerer_basiclowerer_array_muxed <= commandscheduler531;
		end
		3'd4: begin
			t_basiclowerer_basiclowerer_array_muxed <= commandscheduler532;
		end
		3'd5: begin
			t_basiclowerer_basiclowerer_array_muxed <= commandscheduler533;
		end
		3'd6: begin
			t_basiclowerer_basiclowerer_array_muxed <= commandscheduler534;
		end
		3'd7: begin
			t_basiclowerer_basiclowerer_array_muxed <= commandscheduler535;
		end
		4'd8: begin
			t_basiclowerer_basiclowerer_array_muxed <= commandscheduler536;
		end
		4'd9: begin
			t_basiclowerer_basiclowerer_array_muxed <= commandscheduler537;
		end
		4'd10: begin
			t_basiclowerer_basiclowerer_array_muxed <= commandscheduler538;
		end
		4'd11: begin
			t_basiclowerer_basiclowerer_array_muxed <= commandscheduler539;
		end
		4'd12: begin
			t_basiclowerer_basiclowerer_array_muxed <= commandscheduler540;
		end
		4'd13: begin
			t_basiclowerer_basiclowerer_array_muxed <= commandscheduler541;
		end
		4'd14: begin
			t_basiclowerer_basiclowerer_array_muxed <= commandscheduler542;
		end
		default: begin
			t_basiclowerer_basiclowerer_array_muxed <= commandscheduler543;
		end
	endcase
// synthesis translate_off
	dummy_d_34 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_35;
// synthesis translate_on
always @(*) begin
	t_basiclowerer_rhs_array_muxed <= 5'd0;
	case (((commandscheduler_bank_group * 3'd4) + commandscheduler_bank))
		1'd0: begin
			t_basiclowerer_rhs_array_muxed <= commandscheduler528;
		end
		1'd1: begin
			t_basiclowerer_rhs_array_muxed <= commandscheduler529;
		end
		2'd2: begin
			t_basiclowerer_rhs_array_muxed <= commandscheduler530;
		end
		2'd3: begin
			t_basiclowerer_rhs_array_muxed <= commandscheduler531;
		end
		3'd4: begin
			t_basiclowerer_rhs_array_muxed <= commandscheduler532;
		end
		3'd5: begin
			t_basiclowerer_rhs_array_muxed <= commandscheduler533;
		end
		3'd6: begin
			t_basiclowerer_rhs_array_muxed <= commandscheduler534;
		end
		3'd7: begin
			t_basiclowerer_rhs_array_muxed <= commandscheduler535;
		end
		4'd8: begin
			t_basiclowerer_rhs_array_muxed <= commandscheduler536;
		end
		4'd9: begin
			t_basiclowerer_rhs_array_muxed <= commandscheduler537;
		end
		4'd10: begin
			t_basiclowerer_rhs_array_muxed <= commandscheduler538;
		end
		4'd11: begin
			t_basiclowerer_rhs_array_muxed <= commandscheduler539;
		end
		4'd12: begin
			t_basiclowerer_rhs_array_muxed <= commandscheduler540;
		end
		4'd13: begin
			t_basiclowerer_rhs_array_muxed <= commandscheduler541;
		end
		4'd14: begin
			t_basiclowerer_rhs_array_muxed <= commandscheduler542;
		end
		default: begin
			t_basiclowerer_rhs_array_muxed <= commandscheduler543;
		end
	endcase
// synthesis translate_off
	dummy_d_35 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_36;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed0 <= 4'd0;
	case (commandscheduler512)
		1'd0: begin
			t_cases_rhs_array_muxed0 <= commandscheduler0[3:0];
		end
		1'd1: begin
			t_cases_rhs_array_muxed0 <= commandscheduler1[3:0];
		end
		2'd2: begin
			t_cases_rhs_array_muxed0 <= commandscheduler2[3:0];
		end
		2'd3: begin
			t_cases_rhs_array_muxed0 <= commandscheduler3[3:0];
		end
		3'd4: begin
			t_cases_rhs_array_muxed0 <= commandscheduler4[3:0];
		end
		3'd5: begin
			t_cases_rhs_array_muxed0 <= commandscheduler5[3:0];
		end
		3'd6: begin
			t_cases_rhs_array_muxed0 <= commandscheduler6[3:0];
		end
		3'd7: begin
			t_cases_rhs_array_muxed0 <= commandscheduler7[3:0];
		end
		4'd8: begin
			t_cases_rhs_array_muxed0 <= commandscheduler8[3:0];
		end
		4'd9: begin
			t_cases_rhs_array_muxed0 <= commandscheduler9[3:0];
		end
		4'd10: begin
			t_cases_rhs_array_muxed0 <= commandscheduler10[3:0];
		end
		4'd11: begin
			t_cases_rhs_array_muxed0 <= commandscheduler11[3:0];
		end
		4'd12: begin
			t_cases_rhs_array_muxed0 <= commandscheduler12[3:0];
		end
		4'd13: begin
			t_cases_rhs_array_muxed0 <= commandscheduler13[3:0];
		end
		4'd14: begin
			t_cases_rhs_array_muxed0 <= commandscheduler14[3:0];
		end
		4'd15: begin
			t_cases_rhs_array_muxed0 <= commandscheduler15[3:0];
		end
		5'd16: begin
			t_cases_rhs_array_muxed0 <= commandscheduler16[3:0];
		end
		5'd17: begin
			t_cases_rhs_array_muxed0 <= commandscheduler17[3:0];
		end
		5'd18: begin
			t_cases_rhs_array_muxed0 <= commandscheduler18[3:0];
		end
		5'd19: begin
			t_cases_rhs_array_muxed0 <= commandscheduler19[3:0];
		end
		5'd20: begin
			t_cases_rhs_array_muxed0 <= commandscheduler20[3:0];
		end
		5'd21: begin
			t_cases_rhs_array_muxed0 <= commandscheduler21[3:0];
		end
		5'd22: begin
			t_cases_rhs_array_muxed0 <= commandscheduler22[3:0];
		end
		5'd23: begin
			t_cases_rhs_array_muxed0 <= commandscheduler23[3:0];
		end
		5'd24: begin
			t_cases_rhs_array_muxed0 <= commandscheduler24[3:0];
		end
		5'd25: begin
			t_cases_rhs_array_muxed0 <= commandscheduler25[3:0];
		end
		5'd26: begin
			t_cases_rhs_array_muxed0 <= commandscheduler26[3:0];
		end
		5'd27: begin
			t_cases_rhs_array_muxed0 <= commandscheduler27[3:0];
		end
		5'd28: begin
			t_cases_rhs_array_muxed0 <= commandscheduler28[3:0];
		end
		5'd29: begin
			t_cases_rhs_array_muxed0 <= commandscheduler29[3:0];
		end
		5'd30: begin
			t_cases_rhs_array_muxed0 <= commandscheduler30[3:0];
		end
		default: begin
			t_cases_rhs_array_muxed0 <= commandscheduler31[3:0];
		end
	endcase
// synthesis translate_off
	dummy_d_36 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_37;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed1 <= 16'd0;
	case (commandscheduler512)
		1'd0: begin
			t_cases_rhs_array_muxed1 <= commandscheduler0[19:4];
		end
		1'd1: begin
			t_cases_rhs_array_muxed1 <= commandscheduler1[19:4];
		end
		2'd2: begin
			t_cases_rhs_array_muxed1 <= commandscheduler2[19:4];
		end
		2'd3: begin
			t_cases_rhs_array_muxed1 <= commandscheduler3[19:4];
		end
		3'd4: begin
			t_cases_rhs_array_muxed1 <= commandscheduler4[19:4];
		end
		3'd5: begin
			t_cases_rhs_array_muxed1 <= commandscheduler5[19:4];
		end
		3'd6: begin
			t_cases_rhs_array_muxed1 <= commandscheduler6[19:4];
		end
		3'd7: begin
			t_cases_rhs_array_muxed1 <= commandscheduler7[19:4];
		end
		4'd8: begin
			t_cases_rhs_array_muxed1 <= commandscheduler8[19:4];
		end
		4'd9: begin
			t_cases_rhs_array_muxed1 <= commandscheduler9[19:4];
		end
		4'd10: begin
			t_cases_rhs_array_muxed1 <= commandscheduler10[19:4];
		end
		4'd11: begin
			t_cases_rhs_array_muxed1 <= commandscheduler11[19:4];
		end
		4'd12: begin
			t_cases_rhs_array_muxed1 <= commandscheduler12[19:4];
		end
		4'd13: begin
			t_cases_rhs_array_muxed1 <= commandscheduler13[19:4];
		end
		4'd14: begin
			t_cases_rhs_array_muxed1 <= commandscheduler14[19:4];
		end
		4'd15: begin
			t_cases_rhs_array_muxed1 <= commandscheduler15[19:4];
		end
		5'd16: begin
			t_cases_rhs_array_muxed1 <= commandscheduler16[19:4];
		end
		5'd17: begin
			t_cases_rhs_array_muxed1 <= commandscheduler17[19:4];
		end
		5'd18: begin
			t_cases_rhs_array_muxed1 <= commandscheduler18[19:4];
		end
		5'd19: begin
			t_cases_rhs_array_muxed1 <= commandscheduler19[19:4];
		end
		5'd20: begin
			t_cases_rhs_array_muxed1 <= commandscheduler20[19:4];
		end
		5'd21: begin
			t_cases_rhs_array_muxed1 <= commandscheduler21[19:4];
		end
		5'd22: begin
			t_cases_rhs_array_muxed1 <= commandscheduler22[19:4];
		end
		5'd23: begin
			t_cases_rhs_array_muxed1 <= commandscheduler23[19:4];
		end
		5'd24: begin
			t_cases_rhs_array_muxed1 <= commandscheduler24[19:4];
		end
		5'd25: begin
			t_cases_rhs_array_muxed1 <= commandscheduler25[19:4];
		end
		5'd26: begin
			t_cases_rhs_array_muxed1 <= commandscheduler26[19:4];
		end
		5'd27: begin
			t_cases_rhs_array_muxed1 <= commandscheduler27[19:4];
		end
		5'd28: begin
			t_cases_rhs_array_muxed1 <= commandscheduler28[19:4];
		end
		5'd29: begin
			t_cases_rhs_array_muxed1 <= commandscheduler29[19:4];
		end
		5'd30: begin
			t_cases_rhs_array_muxed1 <= commandscheduler30[19:4];
		end
		default: begin
			t_cases_rhs_array_muxed1 <= commandscheduler31[19:4];
		end
	endcase
// synthesis translate_off
	dummy_d_37 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_38;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed2 <= 10'd0;
	case (commandscheduler512)
		1'd0: begin
			t_cases_rhs_array_muxed2 <= commandscheduler0[29:20];
		end
		1'd1: begin
			t_cases_rhs_array_muxed2 <= commandscheduler1[29:20];
		end
		2'd2: begin
			t_cases_rhs_array_muxed2 <= commandscheduler2[29:20];
		end
		2'd3: begin
			t_cases_rhs_array_muxed2 <= commandscheduler3[29:20];
		end
		3'd4: begin
			t_cases_rhs_array_muxed2 <= commandscheduler4[29:20];
		end
		3'd5: begin
			t_cases_rhs_array_muxed2 <= commandscheduler5[29:20];
		end
		3'd6: begin
			t_cases_rhs_array_muxed2 <= commandscheduler6[29:20];
		end
		3'd7: begin
			t_cases_rhs_array_muxed2 <= commandscheduler7[29:20];
		end
		4'd8: begin
			t_cases_rhs_array_muxed2 <= commandscheduler8[29:20];
		end
		4'd9: begin
			t_cases_rhs_array_muxed2 <= commandscheduler9[29:20];
		end
		4'd10: begin
			t_cases_rhs_array_muxed2 <= commandscheduler10[29:20];
		end
		4'd11: begin
			t_cases_rhs_array_muxed2 <= commandscheduler11[29:20];
		end
		4'd12: begin
			t_cases_rhs_array_muxed2 <= commandscheduler12[29:20];
		end
		4'd13: begin
			t_cases_rhs_array_muxed2 <= commandscheduler13[29:20];
		end
		4'd14: begin
			t_cases_rhs_array_muxed2 <= commandscheduler14[29:20];
		end
		4'd15: begin
			t_cases_rhs_array_muxed2 <= commandscheduler15[29:20];
		end
		5'd16: begin
			t_cases_rhs_array_muxed2 <= commandscheduler16[29:20];
		end
		5'd17: begin
			t_cases_rhs_array_muxed2 <= commandscheduler17[29:20];
		end
		5'd18: begin
			t_cases_rhs_array_muxed2 <= commandscheduler18[29:20];
		end
		5'd19: begin
			t_cases_rhs_array_muxed2 <= commandscheduler19[29:20];
		end
		5'd20: begin
			t_cases_rhs_array_muxed2 <= commandscheduler20[29:20];
		end
		5'd21: begin
			t_cases_rhs_array_muxed2 <= commandscheduler21[29:20];
		end
		5'd22: begin
			t_cases_rhs_array_muxed2 <= commandscheduler22[29:20];
		end
		5'd23: begin
			t_cases_rhs_array_muxed2 <= commandscheduler23[29:20];
		end
		5'd24: begin
			t_cases_rhs_array_muxed2 <= commandscheduler24[29:20];
		end
		5'd25: begin
			t_cases_rhs_array_muxed2 <= commandscheduler25[29:20];
		end
		5'd26: begin
			t_cases_rhs_array_muxed2 <= commandscheduler26[29:20];
		end
		5'd27: begin
			t_cases_rhs_array_muxed2 <= commandscheduler27[29:20];
		end
		5'd28: begin
			t_cases_rhs_array_muxed2 <= commandscheduler28[29:20];
		end
		5'd29: begin
			t_cases_rhs_array_muxed2 <= commandscheduler29[29:20];
		end
		5'd30: begin
			t_cases_rhs_array_muxed2 <= commandscheduler30[29:20];
		end
		default: begin
			t_cases_rhs_array_muxed2 <= commandscheduler31[29:20];
		end
	endcase
// synthesis translate_off
	dummy_d_38 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_39;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed3 <= 4'd0;
	case (commandscheduler513)
		1'd0: begin
			t_cases_rhs_array_muxed3 <= commandscheduler32[3:0];
		end
		1'd1: begin
			t_cases_rhs_array_muxed3 <= commandscheduler33[3:0];
		end
		2'd2: begin
			t_cases_rhs_array_muxed3 <= commandscheduler34[3:0];
		end
		2'd3: begin
			t_cases_rhs_array_muxed3 <= commandscheduler35[3:0];
		end
		3'd4: begin
			t_cases_rhs_array_muxed3 <= commandscheduler36[3:0];
		end
		3'd5: begin
			t_cases_rhs_array_muxed3 <= commandscheduler37[3:0];
		end
		3'd6: begin
			t_cases_rhs_array_muxed3 <= commandscheduler38[3:0];
		end
		3'd7: begin
			t_cases_rhs_array_muxed3 <= commandscheduler39[3:0];
		end
		4'd8: begin
			t_cases_rhs_array_muxed3 <= commandscheduler40[3:0];
		end
		4'd9: begin
			t_cases_rhs_array_muxed3 <= commandscheduler41[3:0];
		end
		4'd10: begin
			t_cases_rhs_array_muxed3 <= commandscheduler42[3:0];
		end
		4'd11: begin
			t_cases_rhs_array_muxed3 <= commandscheduler43[3:0];
		end
		4'd12: begin
			t_cases_rhs_array_muxed3 <= commandscheduler44[3:0];
		end
		4'd13: begin
			t_cases_rhs_array_muxed3 <= commandscheduler45[3:0];
		end
		4'd14: begin
			t_cases_rhs_array_muxed3 <= commandscheduler46[3:0];
		end
		4'd15: begin
			t_cases_rhs_array_muxed3 <= commandscheduler47[3:0];
		end
		5'd16: begin
			t_cases_rhs_array_muxed3 <= commandscheduler48[3:0];
		end
		5'd17: begin
			t_cases_rhs_array_muxed3 <= commandscheduler49[3:0];
		end
		5'd18: begin
			t_cases_rhs_array_muxed3 <= commandscheduler50[3:0];
		end
		5'd19: begin
			t_cases_rhs_array_muxed3 <= commandscheduler51[3:0];
		end
		5'd20: begin
			t_cases_rhs_array_muxed3 <= commandscheduler52[3:0];
		end
		5'd21: begin
			t_cases_rhs_array_muxed3 <= commandscheduler53[3:0];
		end
		5'd22: begin
			t_cases_rhs_array_muxed3 <= commandscheduler54[3:0];
		end
		5'd23: begin
			t_cases_rhs_array_muxed3 <= commandscheduler55[3:0];
		end
		5'd24: begin
			t_cases_rhs_array_muxed3 <= commandscheduler56[3:0];
		end
		5'd25: begin
			t_cases_rhs_array_muxed3 <= commandscheduler57[3:0];
		end
		5'd26: begin
			t_cases_rhs_array_muxed3 <= commandscheduler58[3:0];
		end
		5'd27: begin
			t_cases_rhs_array_muxed3 <= commandscheduler59[3:0];
		end
		5'd28: begin
			t_cases_rhs_array_muxed3 <= commandscheduler60[3:0];
		end
		5'd29: begin
			t_cases_rhs_array_muxed3 <= commandscheduler61[3:0];
		end
		5'd30: begin
			t_cases_rhs_array_muxed3 <= commandscheduler62[3:0];
		end
		default: begin
			t_cases_rhs_array_muxed3 <= commandscheduler63[3:0];
		end
	endcase
// synthesis translate_off
	dummy_d_39 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_40;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed4 <= 16'd0;
	case (commandscheduler513)
		1'd0: begin
			t_cases_rhs_array_muxed4 <= commandscheduler32[19:4];
		end
		1'd1: begin
			t_cases_rhs_array_muxed4 <= commandscheduler33[19:4];
		end
		2'd2: begin
			t_cases_rhs_array_muxed4 <= commandscheduler34[19:4];
		end
		2'd3: begin
			t_cases_rhs_array_muxed4 <= commandscheduler35[19:4];
		end
		3'd4: begin
			t_cases_rhs_array_muxed4 <= commandscheduler36[19:4];
		end
		3'd5: begin
			t_cases_rhs_array_muxed4 <= commandscheduler37[19:4];
		end
		3'd6: begin
			t_cases_rhs_array_muxed4 <= commandscheduler38[19:4];
		end
		3'd7: begin
			t_cases_rhs_array_muxed4 <= commandscheduler39[19:4];
		end
		4'd8: begin
			t_cases_rhs_array_muxed4 <= commandscheduler40[19:4];
		end
		4'd9: begin
			t_cases_rhs_array_muxed4 <= commandscheduler41[19:4];
		end
		4'd10: begin
			t_cases_rhs_array_muxed4 <= commandscheduler42[19:4];
		end
		4'd11: begin
			t_cases_rhs_array_muxed4 <= commandscheduler43[19:4];
		end
		4'd12: begin
			t_cases_rhs_array_muxed4 <= commandscheduler44[19:4];
		end
		4'd13: begin
			t_cases_rhs_array_muxed4 <= commandscheduler45[19:4];
		end
		4'd14: begin
			t_cases_rhs_array_muxed4 <= commandscheduler46[19:4];
		end
		4'd15: begin
			t_cases_rhs_array_muxed4 <= commandscheduler47[19:4];
		end
		5'd16: begin
			t_cases_rhs_array_muxed4 <= commandscheduler48[19:4];
		end
		5'd17: begin
			t_cases_rhs_array_muxed4 <= commandscheduler49[19:4];
		end
		5'd18: begin
			t_cases_rhs_array_muxed4 <= commandscheduler50[19:4];
		end
		5'd19: begin
			t_cases_rhs_array_muxed4 <= commandscheduler51[19:4];
		end
		5'd20: begin
			t_cases_rhs_array_muxed4 <= commandscheduler52[19:4];
		end
		5'd21: begin
			t_cases_rhs_array_muxed4 <= commandscheduler53[19:4];
		end
		5'd22: begin
			t_cases_rhs_array_muxed4 <= commandscheduler54[19:4];
		end
		5'd23: begin
			t_cases_rhs_array_muxed4 <= commandscheduler55[19:4];
		end
		5'd24: begin
			t_cases_rhs_array_muxed4 <= commandscheduler56[19:4];
		end
		5'd25: begin
			t_cases_rhs_array_muxed4 <= commandscheduler57[19:4];
		end
		5'd26: begin
			t_cases_rhs_array_muxed4 <= commandscheduler58[19:4];
		end
		5'd27: begin
			t_cases_rhs_array_muxed4 <= commandscheduler59[19:4];
		end
		5'd28: begin
			t_cases_rhs_array_muxed4 <= commandscheduler60[19:4];
		end
		5'd29: begin
			t_cases_rhs_array_muxed4 <= commandscheduler61[19:4];
		end
		5'd30: begin
			t_cases_rhs_array_muxed4 <= commandscheduler62[19:4];
		end
		default: begin
			t_cases_rhs_array_muxed4 <= commandscheduler63[19:4];
		end
	endcase
// synthesis translate_off
	dummy_d_40 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_41;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed5 <= 10'd0;
	case (commandscheduler513)
		1'd0: begin
			t_cases_rhs_array_muxed5 <= commandscheduler32[29:20];
		end
		1'd1: begin
			t_cases_rhs_array_muxed5 <= commandscheduler33[29:20];
		end
		2'd2: begin
			t_cases_rhs_array_muxed5 <= commandscheduler34[29:20];
		end
		2'd3: begin
			t_cases_rhs_array_muxed5 <= commandscheduler35[29:20];
		end
		3'd4: begin
			t_cases_rhs_array_muxed5 <= commandscheduler36[29:20];
		end
		3'd5: begin
			t_cases_rhs_array_muxed5 <= commandscheduler37[29:20];
		end
		3'd6: begin
			t_cases_rhs_array_muxed5 <= commandscheduler38[29:20];
		end
		3'd7: begin
			t_cases_rhs_array_muxed5 <= commandscheduler39[29:20];
		end
		4'd8: begin
			t_cases_rhs_array_muxed5 <= commandscheduler40[29:20];
		end
		4'd9: begin
			t_cases_rhs_array_muxed5 <= commandscheduler41[29:20];
		end
		4'd10: begin
			t_cases_rhs_array_muxed5 <= commandscheduler42[29:20];
		end
		4'd11: begin
			t_cases_rhs_array_muxed5 <= commandscheduler43[29:20];
		end
		4'd12: begin
			t_cases_rhs_array_muxed5 <= commandscheduler44[29:20];
		end
		4'd13: begin
			t_cases_rhs_array_muxed5 <= commandscheduler45[29:20];
		end
		4'd14: begin
			t_cases_rhs_array_muxed5 <= commandscheduler46[29:20];
		end
		4'd15: begin
			t_cases_rhs_array_muxed5 <= commandscheduler47[29:20];
		end
		5'd16: begin
			t_cases_rhs_array_muxed5 <= commandscheduler48[29:20];
		end
		5'd17: begin
			t_cases_rhs_array_muxed5 <= commandscheduler49[29:20];
		end
		5'd18: begin
			t_cases_rhs_array_muxed5 <= commandscheduler50[29:20];
		end
		5'd19: begin
			t_cases_rhs_array_muxed5 <= commandscheduler51[29:20];
		end
		5'd20: begin
			t_cases_rhs_array_muxed5 <= commandscheduler52[29:20];
		end
		5'd21: begin
			t_cases_rhs_array_muxed5 <= commandscheduler53[29:20];
		end
		5'd22: begin
			t_cases_rhs_array_muxed5 <= commandscheduler54[29:20];
		end
		5'd23: begin
			t_cases_rhs_array_muxed5 <= commandscheduler55[29:20];
		end
		5'd24: begin
			t_cases_rhs_array_muxed5 <= commandscheduler56[29:20];
		end
		5'd25: begin
			t_cases_rhs_array_muxed5 <= commandscheduler57[29:20];
		end
		5'd26: begin
			t_cases_rhs_array_muxed5 <= commandscheduler58[29:20];
		end
		5'd27: begin
			t_cases_rhs_array_muxed5 <= commandscheduler59[29:20];
		end
		5'd28: begin
			t_cases_rhs_array_muxed5 <= commandscheduler60[29:20];
		end
		5'd29: begin
			t_cases_rhs_array_muxed5 <= commandscheduler61[29:20];
		end
		5'd30: begin
			t_cases_rhs_array_muxed5 <= commandscheduler62[29:20];
		end
		default: begin
			t_cases_rhs_array_muxed5 <= commandscheduler63[29:20];
		end
	endcase
// synthesis translate_off
	dummy_d_41 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_42;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed6 <= 4'd0;
	case (commandscheduler514)
		1'd0: begin
			t_cases_rhs_array_muxed6 <= commandscheduler64[3:0];
		end
		1'd1: begin
			t_cases_rhs_array_muxed6 <= commandscheduler65[3:0];
		end
		2'd2: begin
			t_cases_rhs_array_muxed6 <= commandscheduler66[3:0];
		end
		2'd3: begin
			t_cases_rhs_array_muxed6 <= commandscheduler67[3:0];
		end
		3'd4: begin
			t_cases_rhs_array_muxed6 <= commandscheduler68[3:0];
		end
		3'd5: begin
			t_cases_rhs_array_muxed6 <= commandscheduler69[3:0];
		end
		3'd6: begin
			t_cases_rhs_array_muxed6 <= commandscheduler70[3:0];
		end
		3'd7: begin
			t_cases_rhs_array_muxed6 <= commandscheduler71[3:0];
		end
		4'd8: begin
			t_cases_rhs_array_muxed6 <= commandscheduler72[3:0];
		end
		4'd9: begin
			t_cases_rhs_array_muxed6 <= commandscheduler73[3:0];
		end
		4'd10: begin
			t_cases_rhs_array_muxed6 <= commandscheduler74[3:0];
		end
		4'd11: begin
			t_cases_rhs_array_muxed6 <= commandscheduler75[3:0];
		end
		4'd12: begin
			t_cases_rhs_array_muxed6 <= commandscheduler76[3:0];
		end
		4'd13: begin
			t_cases_rhs_array_muxed6 <= commandscheduler77[3:0];
		end
		4'd14: begin
			t_cases_rhs_array_muxed6 <= commandscheduler78[3:0];
		end
		4'd15: begin
			t_cases_rhs_array_muxed6 <= commandscheduler79[3:0];
		end
		5'd16: begin
			t_cases_rhs_array_muxed6 <= commandscheduler80[3:0];
		end
		5'd17: begin
			t_cases_rhs_array_muxed6 <= commandscheduler81[3:0];
		end
		5'd18: begin
			t_cases_rhs_array_muxed6 <= commandscheduler82[3:0];
		end
		5'd19: begin
			t_cases_rhs_array_muxed6 <= commandscheduler83[3:0];
		end
		5'd20: begin
			t_cases_rhs_array_muxed6 <= commandscheduler84[3:0];
		end
		5'd21: begin
			t_cases_rhs_array_muxed6 <= commandscheduler85[3:0];
		end
		5'd22: begin
			t_cases_rhs_array_muxed6 <= commandscheduler86[3:0];
		end
		5'd23: begin
			t_cases_rhs_array_muxed6 <= commandscheduler87[3:0];
		end
		5'd24: begin
			t_cases_rhs_array_muxed6 <= commandscheduler88[3:0];
		end
		5'd25: begin
			t_cases_rhs_array_muxed6 <= commandscheduler89[3:0];
		end
		5'd26: begin
			t_cases_rhs_array_muxed6 <= commandscheduler90[3:0];
		end
		5'd27: begin
			t_cases_rhs_array_muxed6 <= commandscheduler91[3:0];
		end
		5'd28: begin
			t_cases_rhs_array_muxed6 <= commandscheduler92[3:0];
		end
		5'd29: begin
			t_cases_rhs_array_muxed6 <= commandscheduler93[3:0];
		end
		5'd30: begin
			t_cases_rhs_array_muxed6 <= commandscheduler94[3:0];
		end
		default: begin
			t_cases_rhs_array_muxed6 <= commandscheduler95[3:0];
		end
	endcase
// synthesis translate_off
	dummy_d_42 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_43;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed7 <= 16'd0;
	case (commandscheduler514)
		1'd0: begin
			t_cases_rhs_array_muxed7 <= commandscheduler64[19:4];
		end
		1'd1: begin
			t_cases_rhs_array_muxed7 <= commandscheduler65[19:4];
		end
		2'd2: begin
			t_cases_rhs_array_muxed7 <= commandscheduler66[19:4];
		end
		2'd3: begin
			t_cases_rhs_array_muxed7 <= commandscheduler67[19:4];
		end
		3'd4: begin
			t_cases_rhs_array_muxed7 <= commandscheduler68[19:4];
		end
		3'd5: begin
			t_cases_rhs_array_muxed7 <= commandscheduler69[19:4];
		end
		3'd6: begin
			t_cases_rhs_array_muxed7 <= commandscheduler70[19:4];
		end
		3'd7: begin
			t_cases_rhs_array_muxed7 <= commandscheduler71[19:4];
		end
		4'd8: begin
			t_cases_rhs_array_muxed7 <= commandscheduler72[19:4];
		end
		4'd9: begin
			t_cases_rhs_array_muxed7 <= commandscheduler73[19:4];
		end
		4'd10: begin
			t_cases_rhs_array_muxed7 <= commandscheduler74[19:4];
		end
		4'd11: begin
			t_cases_rhs_array_muxed7 <= commandscheduler75[19:4];
		end
		4'd12: begin
			t_cases_rhs_array_muxed7 <= commandscheduler76[19:4];
		end
		4'd13: begin
			t_cases_rhs_array_muxed7 <= commandscheduler77[19:4];
		end
		4'd14: begin
			t_cases_rhs_array_muxed7 <= commandscheduler78[19:4];
		end
		4'd15: begin
			t_cases_rhs_array_muxed7 <= commandscheduler79[19:4];
		end
		5'd16: begin
			t_cases_rhs_array_muxed7 <= commandscheduler80[19:4];
		end
		5'd17: begin
			t_cases_rhs_array_muxed7 <= commandscheduler81[19:4];
		end
		5'd18: begin
			t_cases_rhs_array_muxed7 <= commandscheduler82[19:4];
		end
		5'd19: begin
			t_cases_rhs_array_muxed7 <= commandscheduler83[19:4];
		end
		5'd20: begin
			t_cases_rhs_array_muxed7 <= commandscheduler84[19:4];
		end
		5'd21: begin
			t_cases_rhs_array_muxed7 <= commandscheduler85[19:4];
		end
		5'd22: begin
			t_cases_rhs_array_muxed7 <= commandscheduler86[19:4];
		end
		5'd23: begin
			t_cases_rhs_array_muxed7 <= commandscheduler87[19:4];
		end
		5'd24: begin
			t_cases_rhs_array_muxed7 <= commandscheduler88[19:4];
		end
		5'd25: begin
			t_cases_rhs_array_muxed7 <= commandscheduler89[19:4];
		end
		5'd26: begin
			t_cases_rhs_array_muxed7 <= commandscheduler90[19:4];
		end
		5'd27: begin
			t_cases_rhs_array_muxed7 <= commandscheduler91[19:4];
		end
		5'd28: begin
			t_cases_rhs_array_muxed7 <= commandscheduler92[19:4];
		end
		5'd29: begin
			t_cases_rhs_array_muxed7 <= commandscheduler93[19:4];
		end
		5'd30: begin
			t_cases_rhs_array_muxed7 <= commandscheduler94[19:4];
		end
		default: begin
			t_cases_rhs_array_muxed7 <= commandscheduler95[19:4];
		end
	endcase
// synthesis translate_off
	dummy_d_43 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_44;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed8 <= 10'd0;
	case (commandscheduler514)
		1'd0: begin
			t_cases_rhs_array_muxed8 <= commandscheduler64[29:20];
		end
		1'd1: begin
			t_cases_rhs_array_muxed8 <= commandscheduler65[29:20];
		end
		2'd2: begin
			t_cases_rhs_array_muxed8 <= commandscheduler66[29:20];
		end
		2'd3: begin
			t_cases_rhs_array_muxed8 <= commandscheduler67[29:20];
		end
		3'd4: begin
			t_cases_rhs_array_muxed8 <= commandscheduler68[29:20];
		end
		3'd5: begin
			t_cases_rhs_array_muxed8 <= commandscheduler69[29:20];
		end
		3'd6: begin
			t_cases_rhs_array_muxed8 <= commandscheduler70[29:20];
		end
		3'd7: begin
			t_cases_rhs_array_muxed8 <= commandscheduler71[29:20];
		end
		4'd8: begin
			t_cases_rhs_array_muxed8 <= commandscheduler72[29:20];
		end
		4'd9: begin
			t_cases_rhs_array_muxed8 <= commandscheduler73[29:20];
		end
		4'd10: begin
			t_cases_rhs_array_muxed8 <= commandscheduler74[29:20];
		end
		4'd11: begin
			t_cases_rhs_array_muxed8 <= commandscheduler75[29:20];
		end
		4'd12: begin
			t_cases_rhs_array_muxed8 <= commandscheduler76[29:20];
		end
		4'd13: begin
			t_cases_rhs_array_muxed8 <= commandscheduler77[29:20];
		end
		4'd14: begin
			t_cases_rhs_array_muxed8 <= commandscheduler78[29:20];
		end
		4'd15: begin
			t_cases_rhs_array_muxed8 <= commandscheduler79[29:20];
		end
		5'd16: begin
			t_cases_rhs_array_muxed8 <= commandscheduler80[29:20];
		end
		5'd17: begin
			t_cases_rhs_array_muxed8 <= commandscheduler81[29:20];
		end
		5'd18: begin
			t_cases_rhs_array_muxed8 <= commandscheduler82[29:20];
		end
		5'd19: begin
			t_cases_rhs_array_muxed8 <= commandscheduler83[29:20];
		end
		5'd20: begin
			t_cases_rhs_array_muxed8 <= commandscheduler84[29:20];
		end
		5'd21: begin
			t_cases_rhs_array_muxed8 <= commandscheduler85[29:20];
		end
		5'd22: begin
			t_cases_rhs_array_muxed8 <= commandscheduler86[29:20];
		end
		5'd23: begin
			t_cases_rhs_array_muxed8 <= commandscheduler87[29:20];
		end
		5'd24: begin
			t_cases_rhs_array_muxed8 <= commandscheduler88[29:20];
		end
		5'd25: begin
			t_cases_rhs_array_muxed8 <= commandscheduler89[29:20];
		end
		5'd26: begin
			t_cases_rhs_array_muxed8 <= commandscheduler90[29:20];
		end
		5'd27: begin
			t_cases_rhs_array_muxed8 <= commandscheduler91[29:20];
		end
		5'd28: begin
			t_cases_rhs_array_muxed8 <= commandscheduler92[29:20];
		end
		5'd29: begin
			t_cases_rhs_array_muxed8 <= commandscheduler93[29:20];
		end
		5'd30: begin
			t_cases_rhs_array_muxed8 <= commandscheduler94[29:20];
		end
		default: begin
			t_cases_rhs_array_muxed8 <= commandscheduler95[29:20];
		end
	endcase
// synthesis translate_off
	dummy_d_44 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_45;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed9 <= 4'd0;
	case (commandscheduler515)
		1'd0: begin
			t_cases_rhs_array_muxed9 <= commandscheduler96[3:0];
		end
		1'd1: begin
			t_cases_rhs_array_muxed9 <= commandscheduler97[3:0];
		end
		2'd2: begin
			t_cases_rhs_array_muxed9 <= commandscheduler98[3:0];
		end
		2'd3: begin
			t_cases_rhs_array_muxed9 <= commandscheduler99[3:0];
		end
		3'd4: begin
			t_cases_rhs_array_muxed9 <= commandscheduler100[3:0];
		end
		3'd5: begin
			t_cases_rhs_array_muxed9 <= commandscheduler101[3:0];
		end
		3'd6: begin
			t_cases_rhs_array_muxed9 <= commandscheduler102[3:0];
		end
		3'd7: begin
			t_cases_rhs_array_muxed9 <= commandscheduler103[3:0];
		end
		4'd8: begin
			t_cases_rhs_array_muxed9 <= commandscheduler104[3:0];
		end
		4'd9: begin
			t_cases_rhs_array_muxed9 <= commandscheduler105[3:0];
		end
		4'd10: begin
			t_cases_rhs_array_muxed9 <= commandscheduler106[3:0];
		end
		4'd11: begin
			t_cases_rhs_array_muxed9 <= commandscheduler107[3:0];
		end
		4'd12: begin
			t_cases_rhs_array_muxed9 <= commandscheduler108[3:0];
		end
		4'd13: begin
			t_cases_rhs_array_muxed9 <= commandscheduler109[3:0];
		end
		4'd14: begin
			t_cases_rhs_array_muxed9 <= commandscheduler110[3:0];
		end
		4'd15: begin
			t_cases_rhs_array_muxed9 <= commandscheduler111[3:0];
		end
		5'd16: begin
			t_cases_rhs_array_muxed9 <= commandscheduler112[3:0];
		end
		5'd17: begin
			t_cases_rhs_array_muxed9 <= commandscheduler113[3:0];
		end
		5'd18: begin
			t_cases_rhs_array_muxed9 <= commandscheduler114[3:0];
		end
		5'd19: begin
			t_cases_rhs_array_muxed9 <= commandscheduler115[3:0];
		end
		5'd20: begin
			t_cases_rhs_array_muxed9 <= commandscheduler116[3:0];
		end
		5'd21: begin
			t_cases_rhs_array_muxed9 <= commandscheduler117[3:0];
		end
		5'd22: begin
			t_cases_rhs_array_muxed9 <= commandscheduler118[3:0];
		end
		5'd23: begin
			t_cases_rhs_array_muxed9 <= commandscheduler119[3:0];
		end
		5'd24: begin
			t_cases_rhs_array_muxed9 <= commandscheduler120[3:0];
		end
		5'd25: begin
			t_cases_rhs_array_muxed9 <= commandscheduler121[3:0];
		end
		5'd26: begin
			t_cases_rhs_array_muxed9 <= commandscheduler122[3:0];
		end
		5'd27: begin
			t_cases_rhs_array_muxed9 <= commandscheduler123[3:0];
		end
		5'd28: begin
			t_cases_rhs_array_muxed9 <= commandscheduler124[3:0];
		end
		5'd29: begin
			t_cases_rhs_array_muxed9 <= commandscheduler125[3:0];
		end
		5'd30: begin
			t_cases_rhs_array_muxed9 <= commandscheduler126[3:0];
		end
		default: begin
			t_cases_rhs_array_muxed9 <= commandscheduler127[3:0];
		end
	endcase
// synthesis translate_off
	dummy_d_45 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_46;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed10 <= 16'd0;
	case (commandscheduler515)
		1'd0: begin
			t_cases_rhs_array_muxed10 <= commandscheduler96[19:4];
		end
		1'd1: begin
			t_cases_rhs_array_muxed10 <= commandscheduler97[19:4];
		end
		2'd2: begin
			t_cases_rhs_array_muxed10 <= commandscheduler98[19:4];
		end
		2'd3: begin
			t_cases_rhs_array_muxed10 <= commandscheduler99[19:4];
		end
		3'd4: begin
			t_cases_rhs_array_muxed10 <= commandscheduler100[19:4];
		end
		3'd5: begin
			t_cases_rhs_array_muxed10 <= commandscheduler101[19:4];
		end
		3'd6: begin
			t_cases_rhs_array_muxed10 <= commandscheduler102[19:4];
		end
		3'd7: begin
			t_cases_rhs_array_muxed10 <= commandscheduler103[19:4];
		end
		4'd8: begin
			t_cases_rhs_array_muxed10 <= commandscheduler104[19:4];
		end
		4'd9: begin
			t_cases_rhs_array_muxed10 <= commandscheduler105[19:4];
		end
		4'd10: begin
			t_cases_rhs_array_muxed10 <= commandscheduler106[19:4];
		end
		4'd11: begin
			t_cases_rhs_array_muxed10 <= commandscheduler107[19:4];
		end
		4'd12: begin
			t_cases_rhs_array_muxed10 <= commandscheduler108[19:4];
		end
		4'd13: begin
			t_cases_rhs_array_muxed10 <= commandscheduler109[19:4];
		end
		4'd14: begin
			t_cases_rhs_array_muxed10 <= commandscheduler110[19:4];
		end
		4'd15: begin
			t_cases_rhs_array_muxed10 <= commandscheduler111[19:4];
		end
		5'd16: begin
			t_cases_rhs_array_muxed10 <= commandscheduler112[19:4];
		end
		5'd17: begin
			t_cases_rhs_array_muxed10 <= commandscheduler113[19:4];
		end
		5'd18: begin
			t_cases_rhs_array_muxed10 <= commandscheduler114[19:4];
		end
		5'd19: begin
			t_cases_rhs_array_muxed10 <= commandscheduler115[19:4];
		end
		5'd20: begin
			t_cases_rhs_array_muxed10 <= commandscheduler116[19:4];
		end
		5'd21: begin
			t_cases_rhs_array_muxed10 <= commandscheduler117[19:4];
		end
		5'd22: begin
			t_cases_rhs_array_muxed10 <= commandscheduler118[19:4];
		end
		5'd23: begin
			t_cases_rhs_array_muxed10 <= commandscheduler119[19:4];
		end
		5'd24: begin
			t_cases_rhs_array_muxed10 <= commandscheduler120[19:4];
		end
		5'd25: begin
			t_cases_rhs_array_muxed10 <= commandscheduler121[19:4];
		end
		5'd26: begin
			t_cases_rhs_array_muxed10 <= commandscheduler122[19:4];
		end
		5'd27: begin
			t_cases_rhs_array_muxed10 <= commandscheduler123[19:4];
		end
		5'd28: begin
			t_cases_rhs_array_muxed10 <= commandscheduler124[19:4];
		end
		5'd29: begin
			t_cases_rhs_array_muxed10 <= commandscheduler125[19:4];
		end
		5'd30: begin
			t_cases_rhs_array_muxed10 <= commandscheduler126[19:4];
		end
		default: begin
			t_cases_rhs_array_muxed10 <= commandscheduler127[19:4];
		end
	endcase
// synthesis translate_off
	dummy_d_46 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_47;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed11 <= 10'd0;
	case (commandscheduler515)
		1'd0: begin
			t_cases_rhs_array_muxed11 <= commandscheduler96[29:20];
		end
		1'd1: begin
			t_cases_rhs_array_muxed11 <= commandscheduler97[29:20];
		end
		2'd2: begin
			t_cases_rhs_array_muxed11 <= commandscheduler98[29:20];
		end
		2'd3: begin
			t_cases_rhs_array_muxed11 <= commandscheduler99[29:20];
		end
		3'd4: begin
			t_cases_rhs_array_muxed11 <= commandscheduler100[29:20];
		end
		3'd5: begin
			t_cases_rhs_array_muxed11 <= commandscheduler101[29:20];
		end
		3'd6: begin
			t_cases_rhs_array_muxed11 <= commandscheduler102[29:20];
		end
		3'd7: begin
			t_cases_rhs_array_muxed11 <= commandscheduler103[29:20];
		end
		4'd8: begin
			t_cases_rhs_array_muxed11 <= commandscheduler104[29:20];
		end
		4'd9: begin
			t_cases_rhs_array_muxed11 <= commandscheduler105[29:20];
		end
		4'd10: begin
			t_cases_rhs_array_muxed11 <= commandscheduler106[29:20];
		end
		4'd11: begin
			t_cases_rhs_array_muxed11 <= commandscheduler107[29:20];
		end
		4'd12: begin
			t_cases_rhs_array_muxed11 <= commandscheduler108[29:20];
		end
		4'd13: begin
			t_cases_rhs_array_muxed11 <= commandscheduler109[29:20];
		end
		4'd14: begin
			t_cases_rhs_array_muxed11 <= commandscheduler110[29:20];
		end
		4'd15: begin
			t_cases_rhs_array_muxed11 <= commandscheduler111[29:20];
		end
		5'd16: begin
			t_cases_rhs_array_muxed11 <= commandscheduler112[29:20];
		end
		5'd17: begin
			t_cases_rhs_array_muxed11 <= commandscheduler113[29:20];
		end
		5'd18: begin
			t_cases_rhs_array_muxed11 <= commandscheduler114[29:20];
		end
		5'd19: begin
			t_cases_rhs_array_muxed11 <= commandscheduler115[29:20];
		end
		5'd20: begin
			t_cases_rhs_array_muxed11 <= commandscheduler116[29:20];
		end
		5'd21: begin
			t_cases_rhs_array_muxed11 <= commandscheduler117[29:20];
		end
		5'd22: begin
			t_cases_rhs_array_muxed11 <= commandscheduler118[29:20];
		end
		5'd23: begin
			t_cases_rhs_array_muxed11 <= commandscheduler119[29:20];
		end
		5'd24: begin
			t_cases_rhs_array_muxed11 <= commandscheduler120[29:20];
		end
		5'd25: begin
			t_cases_rhs_array_muxed11 <= commandscheduler121[29:20];
		end
		5'd26: begin
			t_cases_rhs_array_muxed11 <= commandscheduler122[29:20];
		end
		5'd27: begin
			t_cases_rhs_array_muxed11 <= commandscheduler123[29:20];
		end
		5'd28: begin
			t_cases_rhs_array_muxed11 <= commandscheduler124[29:20];
		end
		5'd29: begin
			t_cases_rhs_array_muxed11 <= commandscheduler125[29:20];
		end
		5'd30: begin
			t_cases_rhs_array_muxed11 <= commandscheduler126[29:20];
		end
		default: begin
			t_cases_rhs_array_muxed11 <= commandscheduler127[29:20];
		end
	endcase
// synthesis translate_off
	dummy_d_47 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_48;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed12 <= 4'd0;
	case (commandscheduler516)
		1'd0: begin
			t_cases_rhs_array_muxed12 <= commandscheduler128[3:0];
		end
		1'd1: begin
			t_cases_rhs_array_muxed12 <= commandscheduler129[3:0];
		end
		2'd2: begin
			t_cases_rhs_array_muxed12 <= commandscheduler130[3:0];
		end
		2'd3: begin
			t_cases_rhs_array_muxed12 <= commandscheduler131[3:0];
		end
		3'd4: begin
			t_cases_rhs_array_muxed12 <= commandscheduler132[3:0];
		end
		3'd5: begin
			t_cases_rhs_array_muxed12 <= commandscheduler133[3:0];
		end
		3'd6: begin
			t_cases_rhs_array_muxed12 <= commandscheduler134[3:0];
		end
		3'd7: begin
			t_cases_rhs_array_muxed12 <= commandscheduler135[3:0];
		end
		4'd8: begin
			t_cases_rhs_array_muxed12 <= commandscheduler136[3:0];
		end
		4'd9: begin
			t_cases_rhs_array_muxed12 <= commandscheduler137[3:0];
		end
		4'd10: begin
			t_cases_rhs_array_muxed12 <= commandscheduler138[3:0];
		end
		4'd11: begin
			t_cases_rhs_array_muxed12 <= commandscheduler139[3:0];
		end
		4'd12: begin
			t_cases_rhs_array_muxed12 <= commandscheduler140[3:0];
		end
		4'd13: begin
			t_cases_rhs_array_muxed12 <= commandscheduler141[3:0];
		end
		4'd14: begin
			t_cases_rhs_array_muxed12 <= commandscheduler142[3:0];
		end
		4'd15: begin
			t_cases_rhs_array_muxed12 <= commandscheduler143[3:0];
		end
		5'd16: begin
			t_cases_rhs_array_muxed12 <= commandscheduler144[3:0];
		end
		5'd17: begin
			t_cases_rhs_array_muxed12 <= commandscheduler145[3:0];
		end
		5'd18: begin
			t_cases_rhs_array_muxed12 <= commandscheduler146[3:0];
		end
		5'd19: begin
			t_cases_rhs_array_muxed12 <= commandscheduler147[3:0];
		end
		5'd20: begin
			t_cases_rhs_array_muxed12 <= commandscheduler148[3:0];
		end
		5'd21: begin
			t_cases_rhs_array_muxed12 <= commandscheduler149[3:0];
		end
		5'd22: begin
			t_cases_rhs_array_muxed12 <= commandscheduler150[3:0];
		end
		5'd23: begin
			t_cases_rhs_array_muxed12 <= commandscheduler151[3:0];
		end
		5'd24: begin
			t_cases_rhs_array_muxed12 <= commandscheduler152[3:0];
		end
		5'd25: begin
			t_cases_rhs_array_muxed12 <= commandscheduler153[3:0];
		end
		5'd26: begin
			t_cases_rhs_array_muxed12 <= commandscheduler154[3:0];
		end
		5'd27: begin
			t_cases_rhs_array_muxed12 <= commandscheduler155[3:0];
		end
		5'd28: begin
			t_cases_rhs_array_muxed12 <= commandscheduler156[3:0];
		end
		5'd29: begin
			t_cases_rhs_array_muxed12 <= commandscheduler157[3:0];
		end
		5'd30: begin
			t_cases_rhs_array_muxed12 <= commandscheduler158[3:0];
		end
		default: begin
			t_cases_rhs_array_muxed12 <= commandscheduler159[3:0];
		end
	endcase
// synthesis translate_off
	dummy_d_48 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_49;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed13 <= 16'd0;
	case (commandscheduler516)
		1'd0: begin
			t_cases_rhs_array_muxed13 <= commandscheduler128[19:4];
		end
		1'd1: begin
			t_cases_rhs_array_muxed13 <= commandscheduler129[19:4];
		end
		2'd2: begin
			t_cases_rhs_array_muxed13 <= commandscheduler130[19:4];
		end
		2'd3: begin
			t_cases_rhs_array_muxed13 <= commandscheduler131[19:4];
		end
		3'd4: begin
			t_cases_rhs_array_muxed13 <= commandscheduler132[19:4];
		end
		3'd5: begin
			t_cases_rhs_array_muxed13 <= commandscheduler133[19:4];
		end
		3'd6: begin
			t_cases_rhs_array_muxed13 <= commandscheduler134[19:4];
		end
		3'd7: begin
			t_cases_rhs_array_muxed13 <= commandscheduler135[19:4];
		end
		4'd8: begin
			t_cases_rhs_array_muxed13 <= commandscheduler136[19:4];
		end
		4'd9: begin
			t_cases_rhs_array_muxed13 <= commandscheduler137[19:4];
		end
		4'd10: begin
			t_cases_rhs_array_muxed13 <= commandscheduler138[19:4];
		end
		4'd11: begin
			t_cases_rhs_array_muxed13 <= commandscheduler139[19:4];
		end
		4'd12: begin
			t_cases_rhs_array_muxed13 <= commandscheduler140[19:4];
		end
		4'd13: begin
			t_cases_rhs_array_muxed13 <= commandscheduler141[19:4];
		end
		4'd14: begin
			t_cases_rhs_array_muxed13 <= commandscheduler142[19:4];
		end
		4'd15: begin
			t_cases_rhs_array_muxed13 <= commandscheduler143[19:4];
		end
		5'd16: begin
			t_cases_rhs_array_muxed13 <= commandscheduler144[19:4];
		end
		5'd17: begin
			t_cases_rhs_array_muxed13 <= commandscheduler145[19:4];
		end
		5'd18: begin
			t_cases_rhs_array_muxed13 <= commandscheduler146[19:4];
		end
		5'd19: begin
			t_cases_rhs_array_muxed13 <= commandscheduler147[19:4];
		end
		5'd20: begin
			t_cases_rhs_array_muxed13 <= commandscheduler148[19:4];
		end
		5'd21: begin
			t_cases_rhs_array_muxed13 <= commandscheduler149[19:4];
		end
		5'd22: begin
			t_cases_rhs_array_muxed13 <= commandscheduler150[19:4];
		end
		5'd23: begin
			t_cases_rhs_array_muxed13 <= commandscheduler151[19:4];
		end
		5'd24: begin
			t_cases_rhs_array_muxed13 <= commandscheduler152[19:4];
		end
		5'd25: begin
			t_cases_rhs_array_muxed13 <= commandscheduler153[19:4];
		end
		5'd26: begin
			t_cases_rhs_array_muxed13 <= commandscheduler154[19:4];
		end
		5'd27: begin
			t_cases_rhs_array_muxed13 <= commandscheduler155[19:4];
		end
		5'd28: begin
			t_cases_rhs_array_muxed13 <= commandscheduler156[19:4];
		end
		5'd29: begin
			t_cases_rhs_array_muxed13 <= commandscheduler157[19:4];
		end
		5'd30: begin
			t_cases_rhs_array_muxed13 <= commandscheduler158[19:4];
		end
		default: begin
			t_cases_rhs_array_muxed13 <= commandscheduler159[19:4];
		end
	endcase
// synthesis translate_off
	dummy_d_49 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_50;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed14 <= 10'd0;
	case (commandscheduler516)
		1'd0: begin
			t_cases_rhs_array_muxed14 <= commandscheduler128[29:20];
		end
		1'd1: begin
			t_cases_rhs_array_muxed14 <= commandscheduler129[29:20];
		end
		2'd2: begin
			t_cases_rhs_array_muxed14 <= commandscheduler130[29:20];
		end
		2'd3: begin
			t_cases_rhs_array_muxed14 <= commandscheduler131[29:20];
		end
		3'd4: begin
			t_cases_rhs_array_muxed14 <= commandscheduler132[29:20];
		end
		3'd5: begin
			t_cases_rhs_array_muxed14 <= commandscheduler133[29:20];
		end
		3'd6: begin
			t_cases_rhs_array_muxed14 <= commandscheduler134[29:20];
		end
		3'd7: begin
			t_cases_rhs_array_muxed14 <= commandscheduler135[29:20];
		end
		4'd8: begin
			t_cases_rhs_array_muxed14 <= commandscheduler136[29:20];
		end
		4'd9: begin
			t_cases_rhs_array_muxed14 <= commandscheduler137[29:20];
		end
		4'd10: begin
			t_cases_rhs_array_muxed14 <= commandscheduler138[29:20];
		end
		4'd11: begin
			t_cases_rhs_array_muxed14 <= commandscheduler139[29:20];
		end
		4'd12: begin
			t_cases_rhs_array_muxed14 <= commandscheduler140[29:20];
		end
		4'd13: begin
			t_cases_rhs_array_muxed14 <= commandscheduler141[29:20];
		end
		4'd14: begin
			t_cases_rhs_array_muxed14 <= commandscheduler142[29:20];
		end
		4'd15: begin
			t_cases_rhs_array_muxed14 <= commandscheduler143[29:20];
		end
		5'd16: begin
			t_cases_rhs_array_muxed14 <= commandscheduler144[29:20];
		end
		5'd17: begin
			t_cases_rhs_array_muxed14 <= commandscheduler145[29:20];
		end
		5'd18: begin
			t_cases_rhs_array_muxed14 <= commandscheduler146[29:20];
		end
		5'd19: begin
			t_cases_rhs_array_muxed14 <= commandscheduler147[29:20];
		end
		5'd20: begin
			t_cases_rhs_array_muxed14 <= commandscheduler148[29:20];
		end
		5'd21: begin
			t_cases_rhs_array_muxed14 <= commandscheduler149[29:20];
		end
		5'd22: begin
			t_cases_rhs_array_muxed14 <= commandscheduler150[29:20];
		end
		5'd23: begin
			t_cases_rhs_array_muxed14 <= commandscheduler151[29:20];
		end
		5'd24: begin
			t_cases_rhs_array_muxed14 <= commandscheduler152[29:20];
		end
		5'd25: begin
			t_cases_rhs_array_muxed14 <= commandscheduler153[29:20];
		end
		5'd26: begin
			t_cases_rhs_array_muxed14 <= commandscheduler154[29:20];
		end
		5'd27: begin
			t_cases_rhs_array_muxed14 <= commandscheduler155[29:20];
		end
		5'd28: begin
			t_cases_rhs_array_muxed14 <= commandscheduler156[29:20];
		end
		5'd29: begin
			t_cases_rhs_array_muxed14 <= commandscheduler157[29:20];
		end
		5'd30: begin
			t_cases_rhs_array_muxed14 <= commandscheduler158[29:20];
		end
		default: begin
			t_cases_rhs_array_muxed14 <= commandscheduler159[29:20];
		end
	endcase
// synthesis translate_off
	dummy_d_50 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_51;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed15 <= 4'd0;
	case (commandscheduler517)
		1'd0: begin
			t_cases_rhs_array_muxed15 <= commandscheduler160[3:0];
		end
		1'd1: begin
			t_cases_rhs_array_muxed15 <= commandscheduler161[3:0];
		end
		2'd2: begin
			t_cases_rhs_array_muxed15 <= commandscheduler162[3:0];
		end
		2'd3: begin
			t_cases_rhs_array_muxed15 <= commandscheduler163[3:0];
		end
		3'd4: begin
			t_cases_rhs_array_muxed15 <= commandscheduler164[3:0];
		end
		3'd5: begin
			t_cases_rhs_array_muxed15 <= commandscheduler165[3:0];
		end
		3'd6: begin
			t_cases_rhs_array_muxed15 <= commandscheduler166[3:0];
		end
		3'd7: begin
			t_cases_rhs_array_muxed15 <= commandscheduler167[3:0];
		end
		4'd8: begin
			t_cases_rhs_array_muxed15 <= commandscheduler168[3:0];
		end
		4'd9: begin
			t_cases_rhs_array_muxed15 <= commandscheduler169[3:0];
		end
		4'd10: begin
			t_cases_rhs_array_muxed15 <= commandscheduler170[3:0];
		end
		4'd11: begin
			t_cases_rhs_array_muxed15 <= commandscheduler171[3:0];
		end
		4'd12: begin
			t_cases_rhs_array_muxed15 <= commandscheduler172[3:0];
		end
		4'd13: begin
			t_cases_rhs_array_muxed15 <= commandscheduler173[3:0];
		end
		4'd14: begin
			t_cases_rhs_array_muxed15 <= commandscheduler174[3:0];
		end
		4'd15: begin
			t_cases_rhs_array_muxed15 <= commandscheduler175[3:0];
		end
		5'd16: begin
			t_cases_rhs_array_muxed15 <= commandscheduler176[3:0];
		end
		5'd17: begin
			t_cases_rhs_array_muxed15 <= commandscheduler177[3:0];
		end
		5'd18: begin
			t_cases_rhs_array_muxed15 <= commandscheduler178[3:0];
		end
		5'd19: begin
			t_cases_rhs_array_muxed15 <= commandscheduler179[3:0];
		end
		5'd20: begin
			t_cases_rhs_array_muxed15 <= commandscheduler180[3:0];
		end
		5'd21: begin
			t_cases_rhs_array_muxed15 <= commandscheduler181[3:0];
		end
		5'd22: begin
			t_cases_rhs_array_muxed15 <= commandscheduler182[3:0];
		end
		5'd23: begin
			t_cases_rhs_array_muxed15 <= commandscheduler183[3:0];
		end
		5'd24: begin
			t_cases_rhs_array_muxed15 <= commandscheduler184[3:0];
		end
		5'd25: begin
			t_cases_rhs_array_muxed15 <= commandscheduler185[3:0];
		end
		5'd26: begin
			t_cases_rhs_array_muxed15 <= commandscheduler186[3:0];
		end
		5'd27: begin
			t_cases_rhs_array_muxed15 <= commandscheduler187[3:0];
		end
		5'd28: begin
			t_cases_rhs_array_muxed15 <= commandscheduler188[3:0];
		end
		5'd29: begin
			t_cases_rhs_array_muxed15 <= commandscheduler189[3:0];
		end
		5'd30: begin
			t_cases_rhs_array_muxed15 <= commandscheduler190[3:0];
		end
		default: begin
			t_cases_rhs_array_muxed15 <= commandscheduler191[3:0];
		end
	endcase
// synthesis translate_off
	dummy_d_51 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_52;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed16 <= 16'd0;
	case (commandscheduler517)
		1'd0: begin
			t_cases_rhs_array_muxed16 <= commandscheduler160[19:4];
		end
		1'd1: begin
			t_cases_rhs_array_muxed16 <= commandscheduler161[19:4];
		end
		2'd2: begin
			t_cases_rhs_array_muxed16 <= commandscheduler162[19:4];
		end
		2'd3: begin
			t_cases_rhs_array_muxed16 <= commandscheduler163[19:4];
		end
		3'd4: begin
			t_cases_rhs_array_muxed16 <= commandscheduler164[19:4];
		end
		3'd5: begin
			t_cases_rhs_array_muxed16 <= commandscheduler165[19:4];
		end
		3'd6: begin
			t_cases_rhs_array_muxed16 <= commandscheduler166[19:4];
		end
		3'd7: begin
			t_cases_rhs_array_muxed16 <= commandscheduler167[19:4];
		end
		4'd8: begin
			t_cases_rhs_array_muxed16 <= commandscheduler168[19:4];
		end
		4'd9: begin
			t_cases_rhs_array_muxed16 <= commandscheduler169[19:4];
		end
		4'd10: begin
			t_cases_rhs_array_muxed16 <= commandscheduler170[19:4];
		end
		4'd11: begin
			t_cases_rhs_array_muxed16 <= commandscheduler171[19:4];
		end
		4'd12: begin
			t_cases_rhs_array_muxed16 <= commandscheduler172[19:4];
		end
		4'd13: begin
			t_cases_rhs_array_muxed16 <= commandscheduler173[19:4];
		end
		4'd14: begin
			t_cases_rhs_array_muxed16 <= commandscheduler174[19:4];
		end
		4'd15: begin
			t_cases_rhs_array_muxed16 <= commandscheduler175[19:4];
		end
		5'd16: begin
			t_cases_rhs_array_muxed16 <= commandscheduler176[19:4];
		end
		5'd17: begin
			t_cases_rhs_array_muxed16 <= commandscheduler177[19:4];
		end
		5'd18: begin
			t_cases_rhs_array_muxed16 <= commandscheduler178[19:4];
		end
		5'd19: begin
			t_cases_rhs_array_muxed16 <= commandscheduler179[19:4];
		end
		5'd20: begin
			t_cases_rhs_array_muxed16 <= commandscheduler180[19:4];
		end
		5'd21: begin
			t_cases_rhs_array_muxed16 <= commandscheduler181[19:4];
		end
		5'd22: begin
			t_cases_rhs_array_muxed16 <= commandscheduler182[19:4];
		end
		5'd23: begin
			t_cases_rhs_array_muxed16 <= commandscheduler183[19:4];
		end
		5'd24: begin
			t_cases_rhs_array_muxed16 <= commandscheduler184[19:4];
		end
		5'd25: begin
			t_cases_rhs_array_muxed16 <= commandscheduler185[19:4];
		end
		5'd26: begin
			t_cases_rhs_array_muxed16 <= commandscheduler186[19:4];
		end
		5'd27: begin
			t_cases_rhs_array_muxed16 <= commandscheduler187[19:4];
		end
		5'd28: begin
			t_cases_rhs_array_muxed16 <= commandscheduler188[19:4];
		end
		5'd29: begin
			t_cases_rhs_array_muxed16 <= commandscheduler189[19:4];
		end
		5'd30: begin
			t_cases_rhs_array_muxed16 <= commandscheduler190[19:4];
		end
		default: begin
			t_cases_rhs_array_muxed16 <= commandscheduler191[19:4];
		end
	endcase
// synthesis translate_off
	dummy_d_52 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_53;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed17 <= 10'd0;
	case (commandscheduler517)
		1'd0: begin
			t_cases_rhs_array_muxed17 <= commandscheduler160[29:20];
		end
		1'd1: begin
			t_cases_rhs_array_muxed17 <= commandscheduler161[29:20];
		end
		2'd2: begin
			t_cases_rhs_array_muxed17 <= commandscheduler162[29:20];
		end
		2'd3: begin
			t_cases_rhs_array_muxed17 <= commandscheduler163[29:20];
		end
		3'd4: begin
			t_cases_rhs_array_muxed17 <= commandscheduler164[29:20];
		end
		3'd5: begin
			t_cases_rhs_array_muxed17 <= commandscheduler165[29:20];
		end
		3'd6: begin
			t_cases_rhs_array_muxed17 <= commandscheduler166[29:20];
		end
		3'd7: begin
			t_cases_rhs_array_muxed17 <= commandscheduler167[29:20];
		end
		4'd8: begin
			t_cases_rhs_array_muxed17 <= commandscheduler168[29:20];
		end
		4'd9: begin
			t_cases_rhs_array_muxed17 <= commandscheduler169[29:20];
		end
		4'd10: begin
			t_cases_rhs_array_muxed17 <= commandscheduler170[29:20];
		end
		4'd11: begin
			t_cases_rhs_array_muxed17 <= commandscheduler171[29:20];
		end
		4'd12: begin
			t_cases_rhs_array_muxed17 <= commandscheduler172[29:20];
		end
		4'd13: begin
			t_cases_rhs_array_muxed17 <= commandscheduler173[29:20];
		end
		4'd14: begin
			t_cases_rhs_array_muxed17 <= commandscheduler174[29:20];
		end
		4'd15: begin
			t_cases_rhs_array_muxed17 <= commandscheduler175[29:20];
		end
		5'd16: begin
			t_cases_rhs_array_muxed17 <= commandscheduler176[29:20];
		end
		5'd17: begin
			t_cases_rhs_array_muxed17 <= commandscheduler177[29:20];
		end
		5'd18: begin
			t_cases_rhs_array_muxed17 <= commandscheduler178[29:20];
		end
		5'd19: begin
			t_cases_rhs_array_muxed17 <= commandscheduler179[29:20];
		end
		5'd20: begin
			t_cases_rhs_array_muxed17 <= commandscheduler180[29:20];
		end
		5'd21: begin
			t_cases_rhs_array_muxed17 <= commandscheduler181[29:20];
		end
		5'd22: begin
			t_cases_rhs_array_muxed17 <= commandscheduler182[29:20];
		end
		5'd23: begin
			t_cases_rhs_array_muxed17 <= commandscheduler183[29:20];
		end
		5'd24: begin
			t_cases_rhs_array_muxed17 <= commandscheduler184[29:20];
		end
		5'd25: begin
			t_cases_rhs_array_muxed17 <= commandscheduler185[29:20];
		end
		5'd26: begin
			t_cases_rhs_array_muxed17 <= commandscheduler186[29:20];
		end
		5'd27: begin
			t_cases_rhs_array_muxed17 <= commandscheduler187[29:20];
		end
		5'd28: begin
			t_cases_rhs_array_muxed17 <= commandscheduler188[29:20];
		end
		5'd29: begin
			t_cases_rhs_array_muxed17 <= commandscheduler189[29:20];
		end
		5'd30: begin
			t_cases_rhs_array_muxed17 <= commandscheduler190[29:20];
		end
		default: begin
			t_cases_rhs_array_muxed17 <= commandscheduler191[29:20];
		end
	endcase
// synthesis translate_off
	dummy_d_53 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_54;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed18 <= 4'd0;
	case (commandscheduler518)
		1'd0: begin
			t_cases_rhs_array_muxed18 <= commandscheduler192[3:0];
		end
		1'd1: begin
			t_cases_rhs_array_muxed18 <= commandscheduler193[3:0];
		end
		2'd2: begin
			t_cases_rhs_array_muxed18 <= commandscheduler194[3:0];
		end
		2'd3: begin
			t_cases_rhs_array_muxed18 <= commandscheduler195[3:0];
		end
		3'd4: begin
			t_cases_rhs_array_muxed18 <= commandscheduler196[3:0];
		end
		3'd5: begin
			t_cases_rhs_array_muxed18 <= commandscheduler197[3:0];
		end
		3'd6: begin
			t_cases_rhs_array_muxed18 <= commandscheduler198[3:0];
		end
		3'd7: begin
			t_cases_rhs_array_muxed18 <= commandscheduler199[3:0];
		end
		4'd8: begin
			t_cases_rhs_array_muxed18 <= commandscheduler200[3:0];
		end
		4'd9: begin
			t_cases_rhs_array_muxed18 <= commandscheduler201[3:0];
		end
		4'd10: begin
			t_cases_rhs_array_muxed18 <= commandscheduler202[3:0];
		end
		4'd11: begin
			t_cases_rhs_array_muxed18 <= commandscheduler203[3:0];
		end
		4'd12: begin
			t_cases_rhs_array_muxed18 <= commandscheduler204[3:0];
		end
		4'd13: begin
			t_cases_rhs_array_muxed18 <= commandscheduler205[3:0];
		end
		4'd14: begin
			t_cases_rhs_array_muxed18 <= commandscheduler206[3:0];
		end
		4'd15: begin
			t_cases_rhs_array_muxed18 <= commandscheduler207[3:0];
		end
		5'd16: begin
			t_cases_rhs_array_muxed18 <= commandscheduler208[3:0];
		end
		5'd17: begin
			t_cases_rhs_array_muxed18 <= commandscheduler209[3:0];
		end
		5'd18: begin
			t_cases_rhs_array_muxed18 <= commandscheduler210[3:0];
		end
		5'd19: begin
			t_cases_rhs_array_muxed18 <= commandscheduler211[3:0];
		end
		5'd20: begin
			t_cases_rhs_array_muxed18 <= commandscheduler212[3:0];
		end
		5'd21: begin
			t_cases_rhs_array_muxed18 <= commandscheduler213[3:0];
		end
		5'd22: begin
			t_cases_rhs_array_muxed18 <= commandscheduler214[3:0];
		end
		5'd23: begin
			t_cases_rhs_array_muxed18 <= commandscheduler215[3:0];
		end
		5'd24: begin
			t_cases_rhs_array_muxed18 <= commandscheduler216[3:0];
		end
		5'd25: begin
			t_cases_rhs_array_muxed18 <= commandscheduler217[3:0];
		end
		5'd26: begin
			t_cases_rhs_array_muxed18 <= commandscheduler218[3:0];
		end
		5'd27: begin
			t_cases_rhs_array_muxed18 <= commandscheduler219[3:0];
		end
		5'd28: begin
			t_cases_rhs_array_muxed18 <= commandscheduler220[3:0];
		end
		5'd29: begin
			t_cases_rhs_array_muxed18 <= commandscheduler221[3:0];
		end
		5'd30: begin
			t_cases_rhs_array_muxed18 <= commandscheduler222[3:0];
		end
		default: begin
			t_cases_rhs_array_muxed18 <= commandscheduler223[3:0];
		end
	endcase
// synthesis translate_off
	dummy_d_54 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_55;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed19 <= 16'd0;
	case (commandscheduler518)
		1'd0: begin
			t_cases_rhs_array_muxed19 <= commandscheduler192[19:4];
		end
		1'd1: begin
			t_cases_rhs_array_muxed19 <= commandscheduler193[19:4];
		end
		2'd2: begin
			t_cases_rhs_array_muxed19 <= commandscheduler194[19:4];
		end
		2'd3: begin
			t_cases_rhs_array_muxed19 <= commandscheduler195[19:4];
		end
		3'd4: begin
			t_cases_rhs_array_muxed19 <= commandscheduler196[19:4];
		end
		3'd5: begin
			t_cases_rhs_array_muxed19 <= commandscheduler197[19:4];
		end
		3'd6: begin
			t_cases_rhs_array_muxed19 <= commandscheduler198[19:4];
		end
		3'd7: begin
			t_cases_rhs_array_muxed19 <= commandscheduler199[19:4];
		end
		4'd8: begin
			t_cases_rhs_array_muxed19 <= commandscheduler200[19:4];
		end
		4'd9: begin
			t_cases_rhs_array_muxed19 <= commandscheduler201[19:4];
		end
		4'd10: begin
			t_cases_rhs_array_muxed19 <= commandscheduler202[19:4];
		end
		4'd11: begin
			t_cases_rhs_array_muxed19 <= commandscheduler203[19:4];
		end
		4'd12: begin
			t_cases_rhs_array_muxed19 <= commandscheduler204[19:4];
		end
		4'd13: begin
			t_cases_rhs_array_muxed19 <= commandscheduler205[19:4];
		end
		4'd14: begin
			t_cases_rhs_array_muxed19 <= commandscheduler206[19:4];
		end
		4'd15: begin
			t_cases_rhs_array_muxed19 <= commandscheduler207[19:4];
		end
		5'd16: begin
			t_cases_rhs_array_muxed19 <= commandscheduler208[19:4];
		end
		5'd17: begin
			t_cases_rhs_array_muxed19 <= commandscheduler209[19:4];
		end
		5'd18: begin
			t_cases_rhs_array_muxed19 <= commandscheduler210[19:4];
		end
		5'd19: begin
			t_cases_rhs_array_muxed19 <= commandscheduler211[19:4];
		end
		5'd20: begin
			t_cases_rhs_array_muxed19 <= commandscheduler212[19:4];
		end
		5'd21: begin
			t_cases_rhs_array_muxed19 <= commandscheduler213[19:4];
		end
		5'd22: begin
			t_cases_rhs_array_muxed19 <= commandscheduler214[19:4];
		end
		5'd23: begin
			t_cases_rhs_array_muxed19 <= commandscheduler215[19:4];
		end
		5'd24: begin
			t_cases_rhs_array_muxed19 <= commandscheduler216[19:4];
		end
		5'd25: begin
			t_cases_rhs_array_muxed19 <= commandscheduler217[19:4];
		end
		5'd26: begin
			t_cases_rhs_array_muxed19 <= commandscheduler218[19:4];
		end
		5'd27: begin
			t_cases_rhs_array_muxed19 <= commandscheduler219[19:4];
		end
		5'd28: begin
			t_cases_rhs_array_muxed19 <= commandscheduler220[19:4];
		end
		5'd29: begin
			t_cases_rhs_array_muxed19 <= commandscheduler221[19:4];
		end
		5'd30: begin
			t_cases_rhs_array_muxed19 <= commandscheduler222[19:4];
		end
		default: begin
			t_cases_rhs_array_muxed19 <= commandscheduler223[19:4];
		end
	endcase
// synthesis translate_off
	dummy_d_55 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_56;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed20 <= 10'd0;
	case (commandscheduler518)
		1'd0: begin
			t_cases_rhs_array_muxed20 <= commandscheduler192[29:20];
		end
		1'd1: begin
			t_cases_rhs_array_muxed20 <= commandscheduler193[29:20];
		end
		2'd2: begin
			t_cases_rhs_array_muxed20 <= commandscheduler194[29:20];
		end
		2'd3: begin
			t_cases_rhs_array_muxed20 <= commandscheduler195[29:20];
		end
		3'd4: begin
			t_cases_rhs_array_muxed20 <= commandscheduler196[29:20];
		end
		3'd5: begin
			t_cases_rhs_array_muxed20 <= commandscheduler197[29:20];
		end
		3'd6: begin
			t_cases_rhs_array_muxed20 <= commandscheduler198[29:20];
		end
		3'd7: begin
			t_cases_rhs_array_muxed20 <= commandscheduler199[29:20];
		end
		4'd8: begin
			t_cases_rhs_array_muxed20 <= commandscheduler200[29:20];
		end
		4'd9: begin
			t_cases_rhs_array_muxed20 <= commandscheduler201[29:20];
		end
		4'd10: begin
			t_cases_rhs_array_muxed20 <= commandscheduler202[29:20];
		end
		4'd11: begin
			t_cases_rhs_array_muxed20 <= commandscheduler203[29:20];
		end
		4'd12: begin
			t_cases_rhs_array_muxed20 <= commandscheduler204[29:20];
		end
		4'd13: begin
			t_cases_rhs_array_muxed20 <= commandscheduler205[29:20];
		end
		4'd14: begin
			t_cases_rhs_array_muxed20 <= commandscheduler206[29:20];
		end
		4'd15: begin
			t_cases_rhs_array_muxed20 <= commandscheduler207[29:20];
		end
		5'd16: begin
			t_cases_rhs_array_muxed20 <= commandscheduler208[29:20];
		end
		5'd17: begin
			t_cases_rhs_array_muxed20 <= commandscheduler209[29:20];
		end
		5'd18: begin
			t_cases_rhs_array_muxed20 <= commandscheduler210[29:20];
		end
		5'd19: begin
			t_cases_rhs_array_muxed20 <= commandscheduler211[29:20];
		end
		5'd20: begin
			t_cases_rhs_array_muxed20 <= commandscheduler212[29:20];
		end
		5'd21: begin
			t_cases_rhs_array_muxed20 <= commandscheduler213[29:20];
		end
		5'd22: begin
			t_cases_rhs_array_muxed20 <= commandscheduler214[29:20];
		end
		5'd23: begin
			t_cases_rhs_array_muxed20 <= commandscheduler215[29:20];
		end
		5'd24: begin
			t_cases_rhs_array_muxed20 <= commandscheduler216[29:20];
		end
		5'd25: begin
			t_cases_rhs_array_muxed20 <= commandscheduler217[29:20];
		end
		5'd26: begin
			t_cases_rhs_array_muxed20 <= commandscheduler218[29:20];
		end
		5'd27: begin
			t_cases_rhs_array_muxed20 <= commandscheduler219[29:20];
		end
		5'd28: begin
			t_cases_rhs_array_muxed20 <= commandscheduler220[29:20];
		end
		5'd29: begin
			t_cases_rhs_array_muxed20 <= commandscheduler221[29:20];
		end
		5'd30: begin
			t_cases_rhs_array_muxed20 <= commandscheduler222[29:20];
		end
		default: begin
			t_cases_rhs_array_muxed20 <= commandscheduler223[29:20];
		end
	endcase
// synthesis translate_off
	dummy_d_56 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_57;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed21 <= 4'd0;
	case (commandscheduler519)
		1'd0: begin
			t_cases_rhs_array_muxed21 <= commandscheduler224[3:0];
		end
		1'd1: begin
			t_cases_rhs_array_muxed21 <= commandscheduler225[3:0];
		end
		2'd2: begin
			t_cases_rhs_array_muxed21 <= commandscheduler226[3:0];
		end
		2'd3: begin
			t_cases_rhs_array_muxed21 <= commandscheduler227[3:0];
		end
		3'd4: begin
			t_cases_rhs_array_muxed21 <= commandscheduler228[3:0];
		end
		3'd5: begin
			t_cases_rhs_array_muxed21 <= commandscheduler229[3:0];
		end
		3'd6: begin
			t_cases_rhs_array_muxed21 <= commandscheduler230[3:0];
		end
		3'd7: begin
			t_cases_rhs_array_muxed21 <= commandscheduler231[3:0];
		end
		4'd8: begin
			t_cases_rhs_array_muxed21 <= commandscheduler232[3:0];
		end
		4'd9: begin
			t_cases_rhs_array_muxed21 <= commandscheduler233[3:0];
		end
		4'd10: begin
			t_cases_rhs_array_muxed21 <= commandscheduler234[3:0];
		end
		4'd11: begin
			t_cases_rhs_array_muxed21 <= commandscheduler235[3:0];
		end
		4'd12: begin
			t_cases_rhs_array_muxed21 <= commandscheduler236[3:0];
		end
		4'd13: begin
			t_cases_rhs_array_muxed21 <= commandscheduler237[3:0];
		end
		4'd14: begin
			t_cases_rhs_array_muxed21 <= commandscheduler238[3:0];
		end
		4'd15: begin
			t_cases_rhs_array_muxed21 <= commandscheduler239[3:0];
		end
		5'd16: begin
			t_cases_rhs_array_muxed21 <= commandscheduler240[3:0];
		end
		5'd17: begin
			t_cases_rhs_array_muxed21 <= commandscheduler241[3:0];
		end
		5'd18: begin
			t_cases_rhs_array_muxed21 <= commandscheduler242[3:0];
		end
		5'd19: begin
			t_cases_rhs_array_muxed21 <= commandscheduler243[3:0];
		end
		5'd20: begin
			t_cases_rhs_array_muxed21 <= commandscheduler244[3:0];
		end
		5'd21: begin
			t_cases_rhs_array_muxed21 <= commandscheduler245[3:0];
		end
		5'd22: begin
			t_cases_rhs_array_muxed21 <= commandscheduler246[3:0];
		end
		5'd23: begin
			t_cases_rhs_array_muxed21 <= commandscheduler247[3:0];
		end
		5'd24: begin
			t_cases_rhs_array_muxed21 <= commandscheduler248[3:0];
		end
		5'd25: begin
			t_cases_rhs_array_muxed21 <= commandscheduler249[3:0];
		end
		5'd26: begin
			t_cases_rhs_array_muxed21 <= commandscheduler250[3:0];
		end
		5'd27: begin
			t_cases_rhs_array_muxed21 <= commandscheduler251[3:0];
		end
		5'd28: begin
			t_cases_rhs_array_muxed21 <= commandscheduler252[3:0];
		end
		5'd29: begin
			t_cases_rhs_array_muxed21 <= commandscheduler253[3:0];
		end
		5'd30: begin
			t_cases_rhs_array_muxed21 <= commandscheduler254[3:0];
		end
		default: begin
			t_cases_rhs_array_muxed21 <= commandscheduler255[3:0];
		end
	endcase
// synthesis translate_off
	dummy_d_57 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_58;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed22 <= 16'd0;
	case (commandscheduler519)
		1'd0: begin
			t_cases_rhs_array_muxed22 <= commandscheduler224[19:4];
		end
		1'd1: begin
			t_cases_rhs_array_muxed22 <= commandscheduler225[19:4];
		end
		2'd2: begin
			t_cases_rhs_array_muxed22 <= commandscheduler226[19:4];
		end
		2'd3: begin
			t_cases_rhs_array_muxed22 <= commandscheduler227[19:4];
		end
		3'd4: begin
			t_cases_rhs_array_muxed22 <= commandscheduler228[19:4];
		end
		3'd5: begin
			t_cases_rhs_array_muxed22 <= commandscheduler229[19:4];
		end
		3'd6: begin
			t_cases_rhs_array_muxed22 <= commandscheduler230[19:4];
		end
		3'd7: begin
			t_cases_rhs_array_muxed22 <= commandscheduler231[19:4];
		end
		4'd8: begin
			t_cases_rhs_array_muxed22 <= commandscheduler232[19:4];
		end
		4'd9: begin
			t_cases_rhs_array_muxed22 <= commandscheduler233[19:4];
		end
		4'd10: begin
			t_cases_rhs_array_muxed22 <= commandscheduler234[19:4];
		end
		4'd11: begin
			t_cases_rhs_array_muxed22 <= commandscheduler235[19:4];
		end
		4'd12: begin
			t_cases_rhs_array_muxed22 <= commandscheduler236[19:4];
		end
		4'd13: begin
			t_cases_rhs_array_muxed22 <= commandscheduler237[19:4];
		end
		4'd14: begin
			t_cases_rhs_array_muxed22 <= commandscheduler238[19:4];
		end
		4'd15: begin
			t_cases_rhs_array_muxed22 <= commandscheduler239[19:4];
		end
		5'd16: begin
			t_cases_rhs_array_muxed22 <= commandscheduler240[19:4];
		end
		5'd17: begin
			t_cases_rhs_array_muxed22 <= commandscheduler241[19:4];
		end
		5'd18: begin
			t_cases_rhs_array_muxed22 <= commandscheduler242[19:4];
		end
		5'd19: begin
			t_cases_rhs_array_muxed22 <= commandscheduler243[19:4];
		end
		5'd20: begin
			t_cases_rhs_array_muxed22 <= commandscheduler244[19:4];
		end
		5'd21: begin
			t_cases_rhs_array_muxed22 <= commandscheduler245[19:4];
		end
		5'd22: begin
			t_cases_rhs_array_muxed22 <= commandscheduler246[19:4];
		end
		5'd23: begin
			t_cases_rhs_array_muxed22 <= commandscheduler247[19:4];
		end
		5'd24: begin
			t_cases_rhs_array_muxed22 <= commandscheduler248[19:4];
		end
		5'd25: begin
			t_cases_rhs_array_muxed22 <= commandscheduler249[19:4];
		end
		5'd26: begin
			t_cases_rhs_array_muxed22 <= commandscheduler250[19:4];
		end
		5'd27: begin
			t_cases_rhs_array_muxed22 <= commandscheduler251[19:4];
		end
		5'd28: begin
			t_cases_rhs_array_muxed22 <= commandscheduler252[19:4];
		end
		5'd29: begin
			t_cases_rhs_array_muxed22 <= commandscheduler253[19:4];
		end
		5'd30: begin
			t_cases_rhs_array_muxed22 <= commandscheduler254[19:4];
		end
		default: begin
			t_cases_rhs_array_muxed22 <= commandscheduler255[19:4];
		end
	endcase
// synthesis translate_off
	dummy_d_58 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_59;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed23 <= 10'd0;
	case (commandscheduler519)
		1'd0: begin
			t_cases_rhs_array_muxed23 <= commandscheduler224[29:20];
		end
		1'd1: begin
			t_cases_rhs_array_muxed23 <= commandscheduler225[29:20];
		end
		2'd2: begin
			t_cases_rhs_array_muxed23 <= commandscheduler226[29:20];
		end
		2'd3: begin
			t_cases_rhs_array_muxed23 <= commandscheduler227[29:20];
		end
		3'd4: begin
			t_cases_rhs_array_muxed23 <= commandscheduler228[29:20];
		end
		3'd5: begin
			t_cases_rhs_array_muxed23 <= commandscheduler229[29:20];
		end
		3'd6: begin
			t_cases_rhs_array_muxed23 <= commandscheduler230[29:20];
		end
		3'd7: begin
			t_cases_rhs_array_muxed23 <= commandscheduler231[29:20];
		end
		4'd8: begin
			t_cases_rhs_array_muxed23 <= commandscheduler232[29:20];
		end
		4'd9: begin
			t_cases_rhs_array_muxed23 <= commandscheduler233[29:20];
		end
		4'd10: begin
			t_cases_rhs_array_muxed23 <= commandscheduler234[29:20];
		end
		4'd11: begin
			t_cases_rhs_array_muxed23 <= commandscheduler235[29:20];
		end
		4'd12: begin
			t_cases_rhs_array_muxed23 <= commandscheduler236[29:20];
		end
		4'd13: begin
			t_cases_rhs_array_muxed23 <= commandscheduler237[29:20];
		end
		4'd14: begin
			t_cases_rhs_array_muxed23 <= commandscheduler238[29:20];
		end
		4'd15: begin
			t_cases_rhs_array_muxed23 <= commandscheduler239[29:20];
		end
		5'd16: begin
			t_cases_rhs_array_muxed23 <= commandscheduler240[29:20];
		end
		5'd17: begin
			t_cases_rhs_array_muxed23 <= commandscheduler241[29:20];
		end
		5'd18: begin
			t_cases_rhs_array_muxed23 <= commandscheduler242[29:20];
		end
		5'd19: begin
			t_cases_rhs_array_muxed23 <= commandscheduler243[29:20];
		end
		5'd20: begin
			t_cases_rhs_array_muxed23 <= commandscheduler244[29:20];
		end
		5'd21: begin
			t_cases_rhs_array_muxed23 <= commandscheduler245[29:20];
		end
		5'd22: begin
			t_cases_rhs_array_muxed23 <= commandscheduler246[29:20];
		end
		5'd23: begin
			t_cases_rhs_array_muxed23 <= commandscheduler247[29:20];
		end
		5'd24: begin
			t_cases_rhs_array_muxed23 <= commandscheduler248[29:20];
		end
		5'd25: begin
			t_cases_rhs_array_muxed23 <= commandscheduler249[29:20];
		end
		5'd26: begin
			t_cases_rhs_array_muxed23 <= commandscheduler250[29:20];
		end
		5'd27: begin
			t_cases_rhs_array_muxed23 <= commandscheduler251[29:20];
		end
		5'd28: begin
			t_cases_rhs_array_muxed23 <= commandscheduler252[29:20];
		end
		5'd29: begin
			t_cases_rhs_array_muxed23 <= commandscheduler253[29:20];
		end
		5'd30: begin
			t_cases_rhs_array_muxed23 <= commandscheduler254[29:20];
		end
		default: begin
			t_cases_rhs_array_muxed23 <= commandscheduler255[29:20];
		end
	endcase
// synthesis translate_off
	dummy_d_59 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_60;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed24 <= 4'd0;
	case (commandscheduler520)
		1'd0: begin
			t_cases_rhs_array_muxed24 <= commandscheduler256[3:0];
		end
		1'd1: begin
			t_cases_rhs_array_muxed24 <= commandscheduler257[3:0];
		end
		2'd2: begin
			t_cases_rhs_array_muxed24 <= commandscheduler258[3:0];
		end
		2'd3: begin
			t_cases_rhs_array_muxed24 <= commandscheduler259[3:0];
		end
		3'd4: begin
			t_cases_rhs_array_muxed24 <= commandscheduler260[3:0];
		end
		3'd5: begin
			t_cases_rhs_array_muxed24 <= commandscheduler261[3:0];
		end
		3'd6: begin
			t_cases_rhs_array_muxed24 <= commandscheduler262[3:0];
		end
		3'd7: begin
			t_cases_rhs_array_muxed24 <= commandscheduler263[3:0];
		end
		4'd8: begin
			t_cases_rhs_array_muxed24 <= commandscheduler264[3:0];
		end
		4'd9: begin
			t_cases_rhs_array_muxed24 <= commandscheduler265[3:0];
		end
		4'd10: begin
			t_cases_rhs_array_muxed24 <= commandscheduler266[3:0];
		end
		4'd11: begin
			t_cases_rhs_array_muxed24 <= commandscheduler267[3:0];
		end
		4'd12: begin
			t_cases_rhs_array_muxed24 <= commandscheduler268[3:0];
		end
		4'd13: begin
			t_cases_rhs_array_muxed24 <= commandscheduler269[3:0];
		end
		4'd14: begin
			t_cases_rhs_array_muxed24 <= commandscheduler270[3:0];
		end
		4'd15: begin
			t_cases_rhs_array_muxed24 <= commandscheduler271[3:0];
		end
		5'd16: begin
			t_cases_rhs_array_muxed24 <= commandscheduler272[3:0];
		end
		5'd17: begin
			t_cases_rhs_array_muxed24 <= commandscheduler273[3:0];
		end
		5'd18: begin
			t_cases_rhs_array_muxed24 <= commandscheduler274[3:0];
		end
		5'd19: begin
			t_cases_rhs_array_muxed24 <= commandscheduler275[3:0];
		end
		5'd20: begin
			t_cases_rhs_array_muxed24 <= commandscheduler276[3:0];
		end
		5'd21: begin
			t_cases_rhs_array_muxed24 <= commandscheduler277[3:0];
		end
		5'd22: begin
			t_cases_rhs_array_muxed24 <= commandscheduler278[3:0];
		end
		5'd23: begin
			t_cases_rhs_array_muxed24 <= commandscheduler279[3:0];
		end
		5'd24: begin
			t_cases_rhs_array_muxed24 <= commandscheduler280[3:0];
		end
		5'd25: begin
			t_cases_rhs_array_muxed24 <= commandscheduler281[3:0];
		end
		5'd26: begin
			t_cases_rhs_array_muxed24 <= commandscheduler282[3:0];
		end
		5'd27: begin
			t_cases_rhs_array_muxed24 <= commandscheduler283[3:0];
		end
		5'd28: begin
			t_cases_rhs_array_muxed24 <= commandscheduler284[3:0];
		end
		5'd29: begin
			t_cases_rhs_array_muxed24 <= commandscheduler285[3:0];
		end
		5'd30: begin
			t_cases_rhs_array_muxed24 <= commandscheduler286[3:0];
		end
		default: begin
			t_cases_rhs_array_muxed24 <= commandscheduler287[3:0];
		end
	endcase
// synthesis translate_off
	dummy_d_60 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_61;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed25 <= 16'd0;
	case (commandscheduler520)
		1'd0: begin
			t_cases_rhs_array_muxed25 <= commandscheduler256[19:4];
		end
		1'd1: begin
			t_cases_rhs_array_muxed25 <= commandscheduler257[19:4];
		end
		2'd2: begin
			t_cases_rhs_array_muxed25 <= commandscheduler258[19:4];
		end
		2'd3: begin
			t_cases_rhs_array_muxed25 <= commandscheduler259[19:4];
		end
		3'd4: begin
			t_cases_rhs_array_muxed25 <= commandscheduler260[19:4];
		end
		3'd5: begin
			t_cases_rhs_array_muxed25 <= commandscheduler261[19:4];
		end
		3'd6: begin
			t_cases_rhs_array_muxed25 <= commandscheduler262[19:4];
		end
		3'd7: begin
			t_cases_rhs_array_muxed25 <= commandscheduler263[19:4];
		end
		4'd8: begin
			t_cases_rhs_array_muxed25 <= commandscheduler264[19:4];
		end
		4'd9: begin
			t_cases_rhs_array_muxed25 <= commandscheduler265[19:4];
		end
		4'd10: begin
			t_cases_rhs_array_muxed25 <= commandscheduler266[19:4];
		end
		4'd11: begin
			t_cases_rhs_array_muxed25 <= commandscheduler267[19:4];
		end
		4'd12: begin
			t_cases_rhs_array_muxed25 <= commandscheduler268[19:4];
		end
		4'd13: begin
			t_cases_rhs_array_muxed25 <= commandscheduler269[19:4];
		end
		4'd14: begin
			t_cases_rhs_array_muxed25 <= commandscheduler270[19:4];
		end
		4'd15: begin
			t_cases_rhs_array_muxed25 <= commandscheduler271[19:4];
		end
		5'd16: begin
			t_cases_rhs_array_muxed25 <= commandscheduler272[19:4];
		end
		5'd17: begin
			t_cases_rhs_array_muxed25 <= commandscheduler273[19:4];
		end
		5'd18: begin
			t_cases_rhs_array_muxed25 <= commandscheduler274[19:4];
		end
		5'd19: begin
			t_cases_rhs_array_muxed25 <= commandscheduler275[19:4];
		end
		5'd20: begin
			t_cases_rhs_array_muxed25 <= commandscheduler276[19:4];
		end
		5'd21: begin
			t_cases_rhs_array_muxed25 <= commandscheduler277[19:4];
		end
		5'd22: begin
			t_cases_rhs_array_muxed25 <= commandscheduler278[19:4];
		end
		5'd23: begin
			t_cases_rhs_array_muxed25 <= commandscheduler279[19:4];
		end
		5'd24: begin
			t_cases_rhs_array_muxed25 <= commandscheduler280[19:4];
		end
		5'd25: begin
			t_cases_rhs_array_muxed25 <= commandscheduler281[19:4];
		end
		5'd26: begin
			t_cases_rhs_array_muxed25 <= commandscheduler282[19:4];
		end
		5'd27: begin
			t_cases_rhs_array_muxed25 <= commandscheduler283[19:4];
		end
		5'd28: begin
			t_cases_rhs_array_muxed25 <= commandscheduler284[19:4];
		end
		5'd29: begin
			t_cases_rhs_array_muxed25 <= commandscheduler285[19:4];
		end
		5'd30: begin
			t_cases_rhs_array_muxed25 <= commandscheduler286[19:4];
		end
		default: begin
			t_cases_rhs_array_muxed25 <= commandscheduler287[19:4];
		end
	endcase
// synthesis translate_off
	dummy_d_61 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_62;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed26 <= 10'd0;
	case (commandscheduler520)
		1'd0: begin
			t_cases_rhs_array_muxed26 <= commandscheduler256[29:20];
		end
		1'd1: begin
			t_cases_rhs_array_muxed26 <= commandscheduler257[29:20];
		end
		2'd2: begin
			t_cases_rhs_array_muxed26 <= commandscheduler258[29:20];
		end
		2'd3: begin
			t_cases_rhs_array_muxed26 <= commandscheduler259[29:20];
		end
		3'd4: begin
			t_cases_rhs_array_muxed26 <= commandscheduler260[29:20];
		end
		3'd5: begin
			t_cases_rhs_array_muxed26 <= commandscheduler261[29:20];
		end
		3'd6: begin
			t_cases_rhs_array_muxed26 <= commandscheduler262[29:20];
		end
		3'd7: begin
			t_cases_rhs_array_muxed26 <= commandscheduler263[29:20];
		end
		4'd8: begin
			t_cases_rhs_array_muxed26 <= commandscheduler264[29:20];
		end
		4'd9: begin
			t_cases_rhs_array_muxed26 <= commandscheduler265[29:20];
		end
		4'd10: begin
			t_cases_rhs_array_muxed26 <= commandscheduler266[29:20];
		end
		4'd11: begin
			t_cases_rhs_array_muxed26 <= commandscheduler267[29:20];
		end
		4'd12: begin
			t_cases_rhs_array_muxed26 <= commandscheduler268[29:20];
		end
		4'd13: begin
			t_cases_rhs_array_muxed26 <= commandscheduler269[29:20];
		end
		4'd14: begin
			t_cases_rhs_array_muxed26 <= commandscheduler270[29:20];
		end
		4'd15: begin
			t_cases_rhs_array_muxed26 <= commandscheduler271[29:20];
		end
		5'd16: begin
			t_cases_rhs_array_muxed26 <= commandscheduler272[29:20];
		end
		5'd17: begin
			t_cases_rhs_array_muxed26 <= commandscheduler273[29:20];
		end
		5'd18: begin
			t_cases_rhs_array_muxed26 <= commandscheduler274[29:20];
		end
		5'd19: begin
			t_cases_rhs_array_muxed26 <= commandscheduler275[29:20];
		end
		5'd20: begin
			t_cases_rhs_array_muxed26 <= commandscheduler276[29:20];
		end
		5'd21: begin
			t_cases_rhs_array_muxed26 <= commandscheduler277[29:20];
		end
		5'd22: begin
			t_cases_rhs_array_muxed26 <= commandscheduler278[29:20];
		end
		5'd23: begin
			t_cases_rhs_array_muxed26 <= commandscheduler279[29:20];
		end
		5'd24: begin
			t_cases_rhs_array_muxed26 <= commandscheduler280[29:20];
		end
		5'd25: begin
			t_cases_rhs_array_muxed26 <= commandscheduler281[29:20];
		end
		5'd26: begin
			t_cases_rhs_array_muxed26 <= commandscheduler282[29:20];
		end
		5'd27: begin
			t_cases_rhs_array_muxed26 <= commandscheduler283[29:20];
		end
		5'd28: begin
			t_cases_rhs_array_muxed26 <= commandscheduler284[29:20];
		end
		5'd29: begin
			t_cases_rhs_array_muxed26 <= commandscheduler285[29:20];
		end
		5'd30: begin
			t_cases_rhs_array_muxed26 <= commandscheduler286[29:20];
		end
		default: begin
			t_cases_rhs_array_muxed26 <= commandscheduler287[29:20];
		end
	endcase
// synthesis translate_off
	dummy_d_62 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_63;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed27 <= 4'd0;
	case (commandscheduler521)
		1'd0: begin
			t_cases_rhs_array_muxed27 <= commandscheduler288[3:0];
		end
		1'd1: begin
			t_cases_rhs_array_muxed27 <= commandscheduler289[3:0];
		end
		2'd2: begin
			t_cases_rhs_array_muxed27 <= commandscheduler290[3:0];
		end
		2'd3: begin
			t_cases_rhs_array_muxed27 <= commandscheduler291[3:0];
		end
		3'd4: begin
			t_cases_rhs_array_muxed27 <= commandscheduler292[3:0];
		end
		3'd5: begin
			t_cases_rhs_array_muxed27 <= commandscheduler293[3:0];
		end
		3'd6: begin
			t_cases_rhs_array_muxed27 <= commandscheduler294[3:0];
		end
		3'd7: begin
			t_cases_rhs_array_muxed27 <= commandscheduler295[3:0];
		end
		4'd8: begin
			t_cases_rhs_array_muxed27 <= commandscheduler296[3:0];
		end
		4'd9: begin
			t_cases_rhs_array_muxed27 <= commandscheduler297[3:0];
		end
		4'd10: begin
			t_cases_rhs_array_muxed27 <= commandscheduler298[3:0];
		end
		4'd11: begin
			t_cases_rhs_array_muxed27 <= commandscheduler299[3:0];
		end
		4'd12: begin
			t_cases_rhs_array_muxed27 <= commandscheduler300[3:0];
		end
		4'd13: begin
			t_cases_rhs_array_muxed27 <= commandscheduler301[3:0];
		end
		4'd14: begin
			t_cases_rhs_array_muxed27 <= commandscheduler302[3:0];
		end
		4'd15: begin
			t_cases_rhs_array_muxed27 <= commandscheduler303[3:0];
		end
		5'd16: begin
			t_cases_rhs_array_muxed27 <= commandscheduler304[3:0];
		end
		5'd17: begin
			t_cases_rhs_array_muxed27 <= commandscheduler305[3:0];
		end
		5'd18: begin
			t_cases_rhs_array_muxed27 <= commandscheduler306[3:0];
		end
		5'd19: begin
			t_cases_rhs_array_muxed27 <= commandscheduler307[3:0];
		end
		5'd20: begin
			t_cases_rhs_array_muxed27 <= commandscheduler308[3:0];
		end
		5'd21: begin
			t_cases_rhs_array_muxed27 <= commandscheduler309[3:0];
		end
		5'd22: begin
			t_cases_rhs_array_muxed27 <= commandscheduler310[3:0];
		end
		5'd23: begin
			t_cases_rhs_array_muxed27 <= commandscheduler311[3:0];
		end
		5'd24: begin
			t_cases_rhs_array_muxed27 <= commandscheduler312[3:0];
		end
		5'd25: begin
			t_cases_rhs_array_muxed27 <= commandscheduler313[3:0];
		end
		5'd26: begin
			t_cases_rhs_array_muxed27 <= commandscheduler314[3:0];
		end
		5'd27: begin
			t_cases_rhs_array_muxed27 <= commandscheduler315[3:0];
		end
		5'd28: begin
			t_cases_rhs_array_muxed27 <= commandscheduler316[3:0];
		end
		5'd29: begin
			t_cases_rhs_array_muxed27 <= commandscheduler317[3:0];
		end
		5'd30: begin
			t_cases_rhs_array_muxed27 <= commandscheduler318[3:0];
		end
		default: begin
			t_cases_rhs_array_muxed27 <= commandscheduler319[3:0];
		end
	endcase
// synthesis translate_off
	dummy_d_63 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_64;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed28 <= 16'd0;
	case (commandscheduler521)
		1'd0: begin
			t_cases_rhs_array_muxed28 <= commandscheduler288[19:4];
		end
		1'd1: begin
			t_cases_rhs_array_muxed28 <= commandscheduler289[19:4];
		end
		2'd2: begin
			t_cases_rhs_array_muxed28 <= commandscheduler290[19:4];
		end
		2'd3: begin
			t_cases_rhs_array_muxed28 <= commandscheduler291[19:4];
		end
		3'd4: begin
			t_cases_rhs_array_muxed28 <= commandscheduler292[19:4];
		end
		3'd5: begin
			t_cases_rhs_array_muxed28 <= commandscheduler293[19:4];
		end
		3'd6: begin
			t_cases_rhs_array_muxed28 <= commandscheduler294[19:4];
		end
		3'd7: begin
			t_cases_rhs_array_muxed28 <= commandscheduler295[19:4];
		end
		4'd8: begin
			t_cases_rhs_array_muxed28 <= commandscheduler296[19:4];
		end
		4'd9: begin
			t_cases_rhs_array_muxed28 <= commandscheduler297[19:4];
		end
		4'd10: begin
			t_cases_rhs_array_muxed28 <= commandscheduler298[19:4];
		end
		4'd11: begin
			t_cases_rhs_array_muxed28 <= commandscheduler299[19:4];
		end
		4'd12: begin
			t_cases_rhs_array_muxed28 <= commandscheduler300[19:4];
		end
		4'd13: begin
			t_cases_rhs_array_muxed28 <= commandscheduler301[19:4];
		end
		4'd14: begin
			t_cases_rhs_array_muxed28 <= commandscheduler302[19:4];
		end
		4'd15: begin
			t_cases_rhs_array_muxed28 <= commandscheduler303[19:4];
		end
		5'd16: begin
			t_cases_rhs_array_muxed28 <= commandscheduler304[19:4];
		end
		5'd17: begin
			t_cases_rhs_array_muxed28 <= commandscheduler305[19:4];
		end
		5'd18: begin
			t_cases_rhs_array_muxed28 <= commandscheduler306[19:4];
		end
		5'd19: begin
			t_cases_rhs_array_muxed28 <= commandscheduler307[19:4];
		end
		5'd20: begin
			t_cases_rhs_array_muxed28 <= commandscheduler308[19:4];
		end
		5'd21: begin
			t_cases_rhs_array_muxed28 <= commandscheduler309[19:4];
		end
		5'd22: begin
			t_cases_rhs_array_muxed28 <= commandscheduler310[19:4];
		end
		5'd23: begin
			t_cases_rhs_array_muxed28 <= commandscheduler311[19:4];
		end
		5'd24: begin
			t_cases_rhs_array_muxed28 <= commandscheduler312[19:4];
		end
		5'd25: begin
			t_cases_rhs_array_muxed28 <= commandscheduler313[19:4];
		end
		5'd26: begin
			t_cases_rhs_array_muxed28 <= commandscheduler314[19:4];
		end
		5'd27: begin
			t_cases_rhs_array_muxed28 <= commandscheduler315[19:4];
		end
		5'd28: begin
			t_cases_rhs_array_muxed28 <= commandscheduler316[19:4];
		end
		5'd29: begin
			t_cases_rhs_array_muxed28 <= commandscheduler317[19:4];
		end
		5'd30: begin
			t_cases_rhs_array_muxed28 <= commandscheduler318[19:4];
		end
		default: begin
			t_cases_rhs_array_muxed28 <= commandscheduler319[19:4];
		end
	endcase
// synthesis translate_off
	dummy_d_64 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_65;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed29 <= 10'd0;
	case (commandscheduler521)
		1'd0: begin
			t_cases_rhs_array_muxed29 <= commandscheduler288[29:20];
		end
		1'd1: begin
			t_cases_rhs_array_muxed29 <= commandscheduler289[29:20];
		end
		2'd2: begin
			t_cases_rhs_array_muxed29 <= commandscheduler290[29:20];
		end
		2'd3: begin
			t_cases_rhs_array_muxed29 <= commandscheduler291[29:20];
		end
		3'd4: begin
			t_cases_rhs_array_muxed29 <= commandscheduler292[29:20];
		end
		3'd5: begin
			t_cases_rhs_array_muxed29 <= commandscheduler293[29:20];
		end
		3'd6: begin
			t_cases_rhs_array_muxed29 <= commandscheduler294[29:20];
		end
		3'd7: begin
			t_cases_rhs_array_muxed29 <= commandscheduler295[29:20];
		end
		4'd8: begin
			t_cases_rhs_array_muxed29 <= commandscheduler296[29:20];
		end
		4'd9: begin
			t_cases_rhs_array_muxed29 <= commandscheduler297[29:20];
		end
		4'd10: begin
			t_cases_rhs_array_muxed29 <= commandscheduler298[29:20];
		end
		4'd11: begin
			t_cases_rhs_array_muxed29 <= commandscheduler299[29:20];
		end
		4'd12: begin
			t_cases_rhs_array_muxed29 <= commandscheduler300[29:20];
		end
		4'd13: begin
			t_cases_rhs_array_muxed29 <= commandscheduler301[29:20];
		end
		4'd14: begin
			t_cases_rhs_array_muxed29 <= commandscheduler302[29:20];
		end
		4'd15: begin
			t_cases_rhs_array_muxed29 <= commandscheduler303[29:20];
		end
		5'd16: begin
			t_cases_rhs_array_muxed29 <= commandscheduler304[29:20];
		end
		5'd17: begin
			t_cases_rhs_array_muxed29 <= commandscheduler305[29:20];
		end
		5'd18: begin
			t_cases_rhs_array_muxed29 <= commandscheduler306[29:20];
		end
		5'd19: begin
			t_cases_rhs_array_muxed29 <= commandscheduler307[29:20];
		end
		5'd20: begin
			t_cases_rhs_array_muxed29 <= commandscheduler308[29:20];
		end
		5'd21: begin
			t_cases_rhs_array_muxed29 <= commandscheduler309[29:20];
		end
		5'd22: begin
			t_cases_rhs_array_muxed29 <= commandscheduler310[29:20];
		end
		5'd23: begin
			t_cases_rhs_array_muxed29 <= commandscheduler311[29:20];
		end
		5'd24: begin
			t_cases_rhs_array_muxed29 <= commandscheduler312[29:20];
		end
		5'd25: begin
			t_cases_rhs_array_muxed29 <= commandscheduler313[29:20];
		end
		5'd26: begin
			t_cases_rhs_array_muxed29 <= commandscheduler314[29:20];
		end
		5'd27: begin
			t_cases_rhs_array_muxed29 <= commandscheduler315[29:20];
		end
		5'd28: begin
			t_cases_rhs_array_muxed29 <= commandscheduler316[29:20];
		end
		5'd29: begin
			t_cases_rhs_array_muxed29 <= commandscheduler317[29:20];
		end
		5'd30: begin
			t_cases_rhs_array_muxed29 <= commandscheduler318[29:20];
		end
		default: begin
			t_cases_rhs_array_muxed29 <= commandscheduler319[29:20];
		end
	endcase
// synthesis translate_off
	dummy_d_65 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_66;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed30 <= 4'd0;
	case (commandscheduler522)
		1'd0: begin
			t_cases_rhs_array_muxed30 <= commandscheduler320[3:0];
		end
		1'd1: begin
			t_cases_rhs_array_muxed30 <= commandscheduler321[3:0];
		end
		2'd2: begin
			t_cases_rhs_array_muxed30 <= commandscheduler322[3:0];
		end
		2'd3: begin
			t_cases_rhs_array_muxed30 <= commandscheduler323[3:0];
		end
		3'd4: begin
			t_cases_rhs_array_muxed30 <= commandscheduler324[3:0];
		end
		3'd5: begin
			t_cases_rhs_array_muxed30 <= commandscheduler325[3:0];
		end
		3'd6: begin
			t_cases_rhs_array_muxed30 <= commandscheduler326[3:0];
		end
		3'd7: begin
			t_cases_rhs_array_muxed30 <= commandscheduler327[3:0];
		end
		4'd8: begin
			t_cases_rhs_array_muxed30 <= commandscheduler328[3:0];
		end
		4'd9: begin
			t_cases_rhs_array_muxed30 <= commandscheduler329[3:0];
		end
		4'd10: begin
			t_cases_rhs_array_muxed30 <= commandscheduler330[3:0];
		end
		4'd11: begin
			t_cases_rhs_array_muxed30 <= commandscheduler331[3:0];
		end
		4'd12: begin
			t_cases_rhs_array_muxed30 <= commandscheduler332[3:0];
		end
		4'd13: begin
			t_cases_rhs_array_muxed30 <= commandscheduler333[3:0];
		end
		4'd14: begin
			t_cases_rhs_array_muxed30 <= commandscheduler334[3:0];
		end
		4'd15: begin
			t_cases_rhs_array_muxed30 <= commandscheduler335[3:0];
		end
		5'd16: begin
			t_cases_rhs_array_muxed30 <= commandscheduler336[3:0];
		end
		5'd17: begin
			t_cases_rhs_array_muxed30 <= commandscheduler337[3:0];
		end
		5'd18: begin
			t_cases_rhs_array_muxed30 <= commandscheduler338[3:0];
		end
		5'd19: begin
			t_cases_rhs_array_muxed30 <= commandscheduler339[3:0];
		end
		5'd20: begin
			t_cases_rhs_array_muxed30 <= commandscheduler340[3:0];
		end
		5'd21: begin
			t_cases_rhs_array_muxed30 <= commandscheduler341[3:0];
		end
		5'd22: begin
			t_cases_rhs_array_muxed30 <= commandscheduler342[3:0];
		end
		5'd23: begin
			t_cases_rhs_array_muxed30 <= commandscheduler343[3:0];
		end
		5'd24: begin
			t_cases_rhs_array_muxed30 <= commandscheduler344[3:0];
		end
		5'd25: begin
			t_cases_rhs_array_muxed30 <= commandscheduler345[3:0];
		end
		5'd26: begin
			t_cases_rhs_array_muxed30 <= commandscheduler346[3:0];
		end
		5'd27: begin
			t_cases_rhs_array_muxed30 <= commandscheduler347[3:0];
		end
		5'd28: begin
			t_cases_rhs_array_muxed30 <= commandscheduler348[3:0];
		end
		5'd29: begin
			t_cases_rhs_array_muxed30 <= commandscheduler349[3:0];
		end
		5'd30: begin
			t_cases_rhs_array_muxed30 <= commandscheduler350[3:0];
		end
		default: begin
			t_cases_rhs_array_muxed30 <= commandscheduler351[3:0];
		end
	endcase
// synthesis translate_off
	dummy_d_66 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_67;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed31 <= 16'd0;
	case (commandscheduler522)
		1'd0: begin
			t_cases_rhs_array_muxed31 <= commandscheduler320[19:4];
		end
		1'd1: begin
			t_cases_rhs_array_muxed31 <= commandscheduler321[19:4];
		end
		2'd2: begin
			t_cases_rhs_array_muxed31 <= commandscheduler322[19:4];
		end
		2'd3: begin
			t_cases_rhs_array_muxed31 <= commandscheduler323[19:4];
		end
		3'd4: begin
			t_cases_rhs_array_muxed31 <= commandscheduler324[19:4];
		end
		3'd5: begin
			t_cases_rhs_array_muxed31 <= commandscheduler325[19:4];
		end
		3'd6: begin
			t_cases_rhs_array_muxed31 <= commandscheduler326[19:4];
		end
		3'd7: begin
			t_cases_rhs_array_muxed31 <= commandscheduler327[19:4];
		end
		4'd8: begin
			t_cases_rhs_array_muxed31 <= commandscheduler328[19:4];
		end
		4'd9: begin
			t_cases_rhs_array_muxed31 <= commandscheduler329[19:4];
		end
		4'd10: begin
			t_cases_rhs_array_muxed31 <= commandscheduler330[19:4];
		end
		4'd11: begin
			t_cases_rhs_array_muxed31 <= commandscheduler331[19:4];
		end
		4'd12: begin
			t_cases_rhs_array_muxed31 <= commandscheduler332[19:4];
		end
		4'd13: begin
			t_cases_rhs_array_muxed31 <= commandscheduler333[19:4];
		end
		4'd14: begin
			t_cases_rhs_array_muxed31 <= commandscheduler334[19:4];
		end
		4'd15: begin
			t_cases_rhs_array_muxed31 <= commandscheduler335[19:4];
		end
		5'd16: begin
			t_cases_rhs_array_muxed31 <= commandscheduler336[19:4];
		end
		5'd17: begin
			t_cases_rhs_array_muxed31 <= commandscheduler337[19:4];
		end
		5'd18: begin
			t_cases_rhs_array_muxed31 <= commandscheduler338[19:4];
		end
		5'd19: begin
			t_cases_rhs_array_muxed31 <= commandscheduler339[19:4];
		end
		5'd20: begin
			t_cases_rhs_array_muxed31 <= commandscheduler340[19:4];
		end
		5'd21: begin
			t_cases_rhs_array_muxed31 <= commandscheduler341[19:4];
		end
		5'd22: begin
			t_cases_rhs_array_muxed31 <= commandscheduler342[19:4];
		end
		5'd23: begin
			t_cases_rhs_array_muxed31 <= commandscheduler343[19:4];
		end
		5'd24: begin
			t_cases_rhs_array_muxed31 <= commandscheduler344[19:4];
		end
		5'd25: begin
			t_cases_rhs_array_muxed31 <= commandscheduler345[19:4];
		end
		5'd26: begin
			t_cases_rhs_array_muxed31 <= commandscheduler346[19:4];
		end
		5'd27: begin
			t_cases_rhs_array_muxed31 <= commandscheduler347[19:4];
		end
		5'd28: begin
			t_cases_rhs_array_muxed31 <= commandscheduler348[19:4];
		end
		5'd29: begin
			t_cases_rhs_array_muxed31 <= commandscheduler349[19:4];
		end
		5'd30: begin
			t_cases_rhs_array_muxed31 <= commandscheduler350[19:4];
		end
		default: begin
			t_cases_rhs_array_muxed31 <= commandscheduler351[19:4];
		end
	endcase
// synthesis translate_off
	dummy_d_67 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_68;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed32 <= 10'd0;
	case (commandscheduler522)
		1'd0: begin
			t_cases_rhs_array_muxed32 <= commandscheduler320[29:20];
		end
		1'd1: begin
			t_cases_rhs_array_muxed32 <= commandscheduler321[29:20];
		end
		2'd2: begin
			t_cases_rhs_array_muxed32 <= commandscheduler322[29:20];
		end
		2'd3: begin
			t_cases_rhs_array_muxed32 <= commandscheduler323[29:20];
		end
		3'd4: begin
			t_cases_rhs_array_muxed32 <= commandscheduler324[29:20];
		end
		3'd5: begin
			t_cases_rhs_array_muxed32 <= commandscheduler325[29:20];
		end
		3'd6: begin
			t_cases_rhs_array_muxed32 <= commandscheduler326[29:20];
		end
		3'd7: begin
			t_cases_rhs_array_muxed32 <= commandscheduler327[29:20];
		end
		4'd8: begin
			t_cases_rhs_array_muxed32 <= commandscheduler328[29:20];
		end
		4'd9: begin
			t_cases_rhs_array_muxed32 <= commandscheduler329[29:20];
		end
		4'd10: begin
			t_cases_rhs_array_muxed32 <= commandscheduler330[29:20];
		end
		4'd11: begin
			t_cases_rhs_array_muxed32 <= commandscheduler331[29:20];
		end
		4'd12: begin
			t_cases_rhs_array_muxed32 <= commandscheduler332[29:20];
		end
		4'd13: begin
			t_cases_rhs_array_muxed32 <= commandscheduler333[29:20];
		end
		4'd14: begin
			t_cases_rhs_array_muxed32 <= commandscheduler334[29:20];
		end
		4'd15: begin
			t_cases_rhs_array_muxed32 <= commandscheduler335[29:20];
		end
		5'd16: begin
			t_cases_rhs_array_muxed32 <= commandscheduler336[29:20];
		end
		5'd17: begin
			t_cases_rhs_array_muxed32 <= commandscheduler337[29:20];
		end
		5'd18: begin
			t_cases_rhs_array_muxed32 <= commandscheduler338[29:20];
		end
		5'd19: begin
			t_cases_rhs_array_muxed32 <= commandscheduler339[29:20];
		end
		5'd20: begin
			t_cases_rhs_array_muxed32 <= commandscheduler340[29:20];
		end
		5'd21: begin
			t_cases_rhs_array_muxed32 <= commandscheduler341[29:20];
		end
		5'd22: begin
			t_cases_rhs_array_muxed32 <= commandscheduler342[29:20];
		end
		5'd23: begin
			t_cases_rhs_array_muxed32 <= commandscheduler343[29:20];
		end
		5'd24: begin
			t_cases_rhs_array_muxed32 <= commandscheduler344[29:20];
		end
		5'd25: begin
			t_cases_rhs_array_muxed32 <= commandscheduler345[29:20];
		end
		5'd26: begin
			t_cases_rhs_array_muxed32 <= commandscheduler346[29:20];
		end
		5'd27: begin
			t_cases_rhs_array_muxed32 <= commandscheduler347[29:20];
		end
		5'd28: begin
			t_cases_rhs_array_muxed32 <= commandscheduler348[29:20];
		end
		5'd29: begin
			t_cases_rhs_array_muxed32 <= commandscheduler349[29:20];
		end
		5'd30: begin
			t_cases_rhs_array_muxed32 <= commandscheduler350[29:20];
		end
		default: begin
			t_cases_rhs_array_muxed32 <= commandscheduler351[29:20];
		end
	endcase
// synthesis translate_off
	dummy_d_68 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_69;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed33 <= 4'd0;
	case (commandscheduler523)
		1'd0: begin
			t_cases_rhs_array_muxed33 <= commandscheduler352[3:0];
		end
		1'd1: begin
			t_cases_rhs_array_muxed33 <= commandscheduler353[3:0];
		end
		2'd2: begin
			t_cases_rhs_array_muxed33 <= commandscheduler354[3:0];
		end
		2'd3: begin
			t_cases_rhs_array_muxed33 <= commandscheduler355[3:0];
		end
		3'd4: begin
			t_cases_rhs_array_muxed33 <= commandscheduler356[3:0];
		end
		3'd5: begin
			t_cases_rhs_array_muxed33 <= commandscheduler357[3:0];
		end
		3'd6: begin
			t_cases_rhs_array_muxed33 <= commandscheduler358[3:0];
		end
		3'd7: begin
			t_cases_rhs_array_muxed33 <= commandscheduler359[3:0];
		end
		4'd8: begin
			t_cases_rhs_array_muxed33 <= commandscheduler360[3:0];
		end
		4'd9: begin
			t_cases_rhs_array_muxed33 <= commandscheduler361[3:0];
		end
		4'd10: begin
			t_cases_rhs_array_muxed33 <= commandscheduler362[3:0];
		end
		4'd11: begin
			t_cases_rhs_array_muxed33 <= commandscheduler363[3:0];
		end
		4'd12: begin
			t_cases_rhs_array_muxed33 <= commandscheduler364[3:0];
		end
		4'd13: begin
			t_cases_rhs_array_muxed33 <= commandscheduler365[3:0];
		end
		4'd14: begin
			t_cases_rhs_array_muxed33 <= commandscheduler366[3:0];
		end
		4'd15: begin
			t_cases_rhs_array_muxed33 <= commandscheduler367[3:0];
		end
		5'd16: begin
			t_cases_rhs_array_muxed33 <= commandscheduler368[3:0];
		end
		5'd17: begin
			t_cases_rhs_array_muxed33 <= commandscheduler369[3:0];
		end
		5'd18: begin
			t_cases_rhs_array_muxed33 <= commandscheduler370[3:0];
		end
		5'd19: begin
			t_cases_rhs_array_muxed33 <= commandscheduler371[3:0];
		end
		5'd20: begin
			t_cases_rhs_array_muxed33 <= commandscheduler372[3:0];
		end
		5'd21: begin
			t_cases_rhs_array_muxed33 <= commandscheduler373[3:0];
		end
		5'd22: begin
			t_cases_rhs_array_muxed33 <= commandscheduler374[3:0];
		end
		5'd23: begin
			t_cases_rhs_array_muxed33 <= commandscheduler375[3:0];
		end
		5'd24: begin
			t_cases_rhs_array_muxed33 <= commandscheduler376[3:0];
		end
		5'd25: begin
			t_cases_rhs_array_muxed33 <= commandscheduler377[3:0];
		end
		5'd26: begin
			t_cases_rhs_array_muxed33 <= commandscheduler378[3:0];
		end
		5'd27: begin
			t_cases_rhs_array_muxed33 <= commandscheduler379[3:0];
		end
		5'd28: begin
			t_cases_rhs_array_muxed33 <= commandscheduler380[3:0];
		end
		5'd29: begin
			t_cases_rhs_array_muxed33 <= commandscheduler381[3:0];
		end
		5'd30: begin
			t_cases_rhs_array_muxed33 <= commandscheduler382[3:0];
		end
		default: begin
			t_cases_rhs_array_muxed33 <= commandscheduler383[3:0];
		end
	endcase
// synthesis translate_off
	dummy_d_69 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_70;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed34 <= 16'd0;
	case (commandscheduler523)
		1'd0: begin
			t_cases_rhs_array_muxed34 <= commandscheduler352[19:4];
		end
		1'd1: begin
			t_cases_rhs_array_muxed34 <= commandscheduler353[19:4];
		end
		2'd2: begin
			t_cases_rhs_array_muxed34 <= commandscheduler354[19:4];
		end
		2'd3: begin
			t_cases_rhs_array_muxed34 <= commandscheduler355[19:4];
		end
		3'd4: begin
			t_cases_rhs_array_muxed34 <= commandscheduler356[19:4];
		end
		3'd5: begin
			t_cases_rhs_array_muxed34 <= commandscheduler357[19:4];
		end
		3'd6: begin
			t_cases_rhs_array_muxed34 <= commandscheduler358[19:4];
		end
		3'd7: begin
			t_cases_rhs_array_muxed34 <= commandscheduler359[19:4];
		end
		4'd8: begin
			t_cases_rhs_array_muxed34 <= commandscheduler360[19:4];
		end
		4'd9: begin
			t_cases_rhs_array_muxed34 <= commandscheduler361[19:4];
		end
		4'd10: begin
			t_cases_rhs_array_muxed34 <= commandscheduler362[19:4];
		end
		4'd11: begin
			t_cases_rhs_array_muxed34 <= commandscheduler363[19:4];
		end
		4'd12: begin
			t_cases_rhs_array_muxed34 <= commandscheduler364[19:4];
		end
		4'd13: begin
			t_cases_rhs_array_muxed34 <= commandscheduler365[19:4];
		end
		4'd14: begin
			t_cases_rhs_array_muxed34 <= commandscheduler366[19:4];
		end
		4'd15: begin
			t_cases_rhs_array_muxed34 <= commandscheduler367[19:4];
		end
		5'd16: begin
			t_cases_rhs_array_muxed34 <= commandscheduler368[19:4];
		end
		5'd17: begin
			t_cases_rhs_array_muxed34 <= commandscheduler369[19:4];
		end
		5'd18: begin
			t_cases_rhs_array_muxed34 <= commandscheduler370[19:4];
		end
		5'd19: begin
			t_cases_rhs_array_muxed34 <= commandscheduler371[19:4];
		end
		5'd20: begin
			t_cases_rhs_array_muxed34 <= commandscheduler372[19:4];
		end
		5'd21: begin
			t_cases_rhs_array_muxed34 <= commandscheduler373[19:4];
		end
		5'd22: begin
			t_cases_rhs_array_muxed34 <= commandscheduler374[19:4];
		end
		5'd23: begin
			t_cases_rhs_array_muxed34 <= commandscheduler375[19:4];
		end
		5'd24: begin
			t_cases_rhs_array_muxed34 <= commandscheduler376[19:4];
		end
		5'd25: begin
			t_cases_rhs_array_muxed34 <= commandscheduler377[19:4];
		end
		5'd26: begin
			t_cases_rhs_array_muxed34 <= commandscheduler378[19:4];
		end
		5'd27: begin
			t_cases_rhs_array_muxed34 <= commandscheduler379[19:4];
		end
		5'd28: begin
			t_cases_rhs_array_muxed34 <= commandscheduler380[19:4];
		end
		5'd29: begin
			t_cases_rhs_array_muxed34 <= commandscheduler381[19:4];
		end
		5'd30: begin
			t_cases_rhs_array_muxed34 <= commandscheduler382[19:4];
		end
		default: begin
			t_cases_rhs_array_muxed34 <= commandscheduler383[19:4];
		end
	endcase
// synthesis translate_off
	dummy_d_70 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_71;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed35 <= 10'd0;
	case (commandscheduler523)
		1'd0: begin
			t_cases_rhs_array_muxed35 <= commandscheduler352[29:20];
		end
		1'd1: begin
			t_cases_rhs_array_muxed35 <= commandscheduler353[29:20];
		end
		2'd2: begin
			t_cases_rhs_array_muxed35 <= commandscheduler354[29:20];
		end
		2'd3: begin
			t_cases_rhs_array_muxed35 <= commandscheduler355[29:20];
		end
		3'd4: begin
			t_cases_rhs_array_muxed35 <= commandscheduler356[29:20];
		end
		3'd5: begin
			t_cases_rhs_array_muxed35 <= commandscheduler357[29:20];
		end
		3'd6: begin
			t_cases_rhs_array_muxed35 <= commandscheduler358[29:20];
		end
		3'd7: begin
			t_cases_rhs_array_muxed35 <= commandscheduler359[29:20];
		end
		4'd8: begin
			t_cases_rhs_array_muxed35 <= commandscheduler360[29:20];
		end
		4'd9: begin
			t_cases_rhs_array_muxed35 <= commandscheduler361[29:20];
		end
		4'd10: begin
			t_cases_rhs_array_muxed35 <= commandscheduler362[29:20];
		end
		4'd11: begin
			t_cases_rhs_array_muxed35 <= commandscheduler363[29:20];
		end
		4'd12: begin
			t_cases_rhs_array_muxed35 <= commandscheduler364[29:20];
		end
		4'd13: begin
			t_cases_rhs_array_muxed35 <= commandscheduler365[29:20];
		end
		4'd14: begin
			t_cases_rhs_array_muxed35 <= commandscheduler366[29:20];
		end
		4'd15: begin
			t_cases_rhs_array_muxed35 <= commandscheduler367[29:20];
		end
		5'd16: begin
			t_cases_rhs_array_muxed35 <= commandscheduler368[29:20];
		end
		5'd17: begin
			t_cases_rhs_array_muxed35 <= commandscheduler369[29:20];
		end
		5'd18: begin
			t_cases_rhs_array_muxed35 <= commandscheduler370[29:20];
		end
		5'd19: begin
			t_cases_rhs_array_muxed35 <= commandscheduler371[29:20];
		end
		5'd20: begin
			t_cases_rhs_array_muxed35 <= commandscheduler372[29:20];
		end
		5'd21: begin
			t_cases_rhs_array_muxed35 <= commandscheduler373[29:20];
		end
		5'd22: begin
			t_cases_rhs_array_muxed35 <= commandscheduler374[29:20];
		end
		5'd23: begin
			t_cases_rhs_array_muxed35 <= commandscheduler375[29:20];
		end
		5'd24: begin
			t_cases_rhs_array_muxed35 <= commandscheduler376[29:20];
		end
		5'd25: begin
			t_cases_rhs_array_muxed35 <= commandscheduler377[29:20];
		end
		5'd26: begin
			t_cases_rhs_array_muxed35 <= commandscheduler378[29:20];
		end
		5'd27: begin
			t_cases_rhs_array_muxed35 <= commandscheduler379[29:20];
		end
		5'd28: begin
			t_cases_rhs_array_muxed35 <= commandscheduler380[29:20];
		end
		5'd29: begin
			t_cases_rhs_array_muxed35 <= commandscheduler381[29:20];
		end
		5'd30: begin
			t_cases_rhs_array_muxed35 <= commandscheduler382[29:20];
		end
		default: begin
			t_cases_rhs_array_muxed35 <= commandscheduler383[29:20];
		end
	endcase
// synthesis translate_off
	dummy_d_71 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_72;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed36 <= 4'd0;
	case (commandscheduler524)
		1'd0: begin
			t_cases_rhs_array_muxed36 <= commandscheduler384[3:0];
		end
		1'd1: begin
			t_cases_rhs_array_muxed36 <= commandscheduler385[3:0];
		end
		2'd2: begin
			t_cases_rhs_array_muxed36 <= commandscheduler386[3:0];
		end
		2'd3: begin
			t_cases_rhs_array_muxed36 <= commandscheduler387[3:0];
		end
		3'd4: begin
			t_cases_rhs_array_muxed36 <= commandscheduler388[3:0];
		end
		3'd5: begin
			t_cases_rhs_array_muxed36 <= commandscheduler389[3:0];
		end
		3'd6: begin
			t_cases_rhs_array_muxed36 <= commandscheduler390[3:0];
		end
		3'd7: begin
			t_cases_rhs_array_muxed36 <= commandscheduler391[3:0];
		end
		4'd8: begin
			t_cases_rhs_array_muxed36 <= commandscheduler392[3:0];
		end
		4'd9: begin
			t_cases_rhs_array_muxed36 <= commandscheduler393[3:0];
		end
		4'd10: begin
			t_cases_rhs_array_muxed36 <= commandscheduler394[3:0];
		end
		4'd11: begin
			t_cases_rhs_array_muxed36 <= commandscheduler395[3:0];
		end
		4'd12: begin
			t_cases_rhs_array_muxed36 <= commandscheduler396[3:0];
		end
		4'd13: begin
			t_cases_rhs_array_muxed36 <= commandscheduler397[3:0];
		end
		4'd14: begin
			t_cases_rhs_array_muxed36 <= commandscheduler398[3:0];
		end
		4'd15: begin
			t_cases_rhs_array_muxed36 <= commandscheduler399[3:0];
		end
		5'd16: begin
			t_cases_rhs_array_muxed36 <= commandscheduler400[3:0];
		end
		5'd17: begin
			t_cases_rhs_array_muxed36 <= commandscheduler401[3:0];
		end
		5'd18: begin
			t_cases_rhs_array_muxed36 <= commandscheduler402[3:0];
		end
		5'd19: begin
			t_cases_rhs_array_muxed36 <= commandscheduler403[3:0];
		end
		5'd20: begin
			t_cases_rhs_array_muxed36 <= commandscheduler404[3:0];
		end
		5'd21: begin
			t_cases_rhs_array_muxed36 <= commandscheduler405[3:0];
		end
		5'd22: begin
			t_cases_rhs_array_muxed36 <= commandscheduler406[3:0];
		end
		5'd23: begin
			t_cases_rhs_array_muxed36 <= commandscheduler407[3:0];
		end
		5'd24: begin
			t_cases_rhs_array_muxed36 <= commandscheduler408[3:0];
		end
		5'd25: begin
			t_cases_rhs_array_muxed36 <= commandscheduler409[3:0];
		end
		5'd26: begin
			t_cases_rhs_array_muxed36 <= commandscheduler410[3:0];
		end
		5'd27: begin
			t_cases_rhs_array_muxed36 <= commandscheduler411[3:0];
		end
		5'd28: begin
			t_cases_rhs_array_muxed36 <= commandscheduler412[3:0];
		end
		5'd29: begin
			t_cases_rhs_array_muxed36 <= commandscheduler413[3:0];
		end
		5'd30: begin
			t_cases_rhs_array_muxed36 <= commandscheduler414[3:0];
		end
		default: begin
			t_cases_rhs_array_muxed36 <= commandscheduler415[3:0];
		end
	endcase
// synthesis translate_off
	dummy_d_72 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_73;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed37 <= 16'd0;
	case (commandscheduler524)
		1'd0: begin
			t_cases_rhs_array_muxed37 <= commandscheduler384[19:4];
		end
		1'd1: begin
			t_cases_rhs_array_muxed37 <= commandscheduler385[19:4];
		end
		2'd2: begin
			t_cases_rhs_array_muxed37 <= commandscheduler386[19:4];
		end
		2'd3: begin
			t_cases_rhs_array_muxed37 <= commandscheduler387[19:4];
		end
		3'd4: begin
			t_cases_rhs_array_muxed37 <= commandscheduler388[19:4];
		end
		3'd5: begin
			t_cases_rhs_array_muxed37 <= commandscheduler389[19:4];
		end
		3'd6: begin
			t_cases_rhs_array_muxed37 <= commandscheduler390[19:4];
		end
		3'd7: begin
			t_cases_rhs_array_muxed37 <= commandscheduler391[19:4];
		end
		4'd8: begin
			t_cases_rhs_array_muxed37 <= commandscheduler392[19:4];
		end
		4'd9: begin
			t_cases_rhs_array_muxed37 <= commandscheduler393[19:4];
		end
		4'd10: begin
			t_cases_rhs_array_muxed37 <= commandscheduler394[19:4];
		end
		4'd11: begin
			t_cases_rhs_array_muxed37 <= commandscheduler395[19:4];
		end
		4'd12: begin
			t_cases_rhs_array_muxed37 <= commandscheduler396[19:4];
		end
		4'd13: begin
			t_cases_rhs_array_muxed37 <= commandscheduler397[19:4];
		end
		4'd14: begin
			t_cases_rhs_array_muxed37 <= commandscheduler398[19:4];
		end
		4'd15: begin
			t_cases_rhs_array_muxed37 <= commandscheduler399[19:4];
		end
		5'd16: begin
			t_cases_rhs_array_muxed37 <= commandscheduler400[19:4];
		end
		5'd17: begin
			t_cases_rhs_array_muxed37 <= commandscheduler401[19:4];
		end
		5'd18: begin
			t_cases_rhs_array_muxed37 <= commandscheduler402[19:4];
		end
		5'd19: begin
			t_cases_rhs_array_muxed37 <= commandscheduler403[19:4];
		end
		5'd20: begin
			t_cases_rhs_array_muxed37 <= commandscheduler404[19:4];
		end
		5'd21: begin
			t_cases_rhs_array_muxed37 <= commandscheduler405[19:4];
		end
		5'd22: begin
			t_cases_rhs_array_muxed37 <= commandscheduler406[19:4];
		end
		5'd23: begin
			t_cases_rhs_array_muxed37 <= commandscheduler407[19:4];
		end
		5'd24: begin
			t_cases_rhs_array_muxed37 <= commandscheduler408[19:4];
		end
		5'd25: begin
			t_cases_rhs_array_muxed37 <= commandscheduler409[19:4];
		end
		5'd26: begin
			t_cases_rhs_array_muxed37 <= commandscheduler410[19:4];
		end
		5'd27: begin
			t_cases_rhs_array_muxed37 <= commandscheduler411[19:4];
		end
		5'd28: begin
			t_cases_rhs_array_muxed37 <= commandscheduler412[19:4];
		end
		5'd29: begin
			t_cases_rhs_array_muxed37 <= commandscheduler413[19:4];
		end
		5'd30: begin
			t_cases_rhs_array_muxed37 <= commandscheduler414[19:4];
		end
		default: begin
			t_cases_rhs_array_muxed37 <= commandscheduler415[19:4];
		end
	endcase
// synthesis translate_off
	dummy_d_73 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_74;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed38 <= 10'd0;
	case (commandscheduler524)
		1'd0: begin
			t_cases_rhs_array_muxed38 <= commandscheduler384[29:20];
		end
		1'd1: begin
			t_cases_rhs_array_muxed38 <= commandscheduler385[29:20];
		end
		2'd2: begin
			t_cases_rhs_array_muxed38 <= commandscheduler386[29:20];
		end
		2'd3: begin
			t_cases_rhs_array_muxed38 <= commandscheduler387[29:20];
		end
		3'd4: begin
			t_cases_rhs_array_muxed38 <= commandscheduler388[29:20];
		end
		3'd5: begin
			t_cases_rhs_array_muxed38 <= commandscheduler389[29:20];
		end
		3'd6: begin
			t_cases_rhs_array_muxed38 <= commandscheduler390[29:20];
		end
		3'd7: begin
			t_cases_rhs_array_muxed38 <= commandscheduler391[29:20];
		end
		4'd8: begin
			t_cases_rhs_array_muxed38 <= commandscheduler392[29:20];
		end
		4'd9: begin
			t_cases_rhs_array_muxed38 <= commandscheduler393[29:20];
		end
		4'd10: begin
			t_cases_rhs_array_muxed38 <= commandscheduler394[29:20];
		end
		4'd11: begin
			t_cases_rhs_array_muxed38 <= commandscheduler395[29:20];
		end
		4'd12: begin
			t_cases_rhs_array_muxed38 <= commandscheduler396[29:20];
		end
		4'd13: begin
			t_cases_rhs_array_muxed38 <= commandscheduler397[29:20];
		end
		4'd14: begin
			t_cases_rhs_array_muxed38 <= commandscheduler398[29:20];
		end
		4'd15: begin
			t_cases_rhs_array_muxed38 <= commandscheduler399[29:20];
		end
		5'd16: begin
			t_cases_rhs_array_muxed38 <= commandscheduler400[29:20];
		end
		5'd17: begin
			t_cases_rhs_array_muxed38 <= commandscheduler401[29:20];
		end
		5'd18: begin
			t_cases_rhs_array_muxed38 <= commandscheduler402[29:20];
		end
		5'd19: begin
			t_cases_rhs_array_muxed38 <= commandscheduler403[29:20];
		end
		5'd20: begin
			t_cases_rhs_array_muxed38 <= commandscheduler404[29:20];
		end
		5'd21: begin
			t_cases_rhs_array_muxed38 <= commandscheduler405[29:20];
		end
		5'd22: begin
			t_cases_rhs_array_muxed38 <= commandscheduler406[29:20];
		end
		5'd23: begin
			t_cases_rhs_array_muxed38 <= commandscheduler407[29:20];
		end
		5'd24: begin
			t_cases_rhs_array_muxed38 <= commandscheduler408[29:20];
		end
		5'd25: begin
			t_cases_rhs_array_muxed38 <= commandscheduler409[29:20];
		end
		5'd26: begin
			t_cases_rhs_array_muxed38 <= commandscheduler410[29:20];
		end
		5'd27: begin
			t_cases_rhs_array_muxed38 <= commandscheduler411[29:20];
		end
		5'd28: begin
			t_cases_rhs_array_muxed38 <= commandscheduler412[29:20];
		end
		5'd29: begin
			t_cases_rhs_array_muxed38 <= commandscheduler413[29:20];
		end
		5'd30: begin
			t_cases_rhs_array_muxed38 <= commandscheduler414[29:20];
		end
		default: begin
			t_cases_rhs_array_muxed38 <= commandscheduler415[29:20];
		end
	endcase
// synthesis translate_off
	dummy_d_74 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_75;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed39 <= 4'd0;
	case (commandscheduler525)
		1'd0: begin
			t_cases_rhs_array_muxed39 <= commandscheduler416[3:0];
		end
		1'd1: begin
			t_cases_rhs_array_muxed39 <= commandscheduler417[3:0];
		end
		2'd2: begin
			t_cases_rhs_array_muxed39 <= commandscheduler418[3:0];
		end
		2'd3: begin
			t_cases_rhs_array_muxed39 <= commandscheduler419[3:0];
		end
		3'd4: begin
			t_cases_rhs_array_muxed39 <= commandscheduler420[3:0];
		end
		3'd5: begin
			t_cases_rhs_array_muxed39 <= commandscheduler421[3:0];
		end
		3'd6: begin
			t_cases_rhs_array_muxed39 <= commandscheduler422[3:0];
		end
		3'd7: begin
			t_cases_rhs_array_muxed39 <= commandscheduler423[3:0];
		end
		4'd8: begin
			t_cases_rhs_array_muxed39 <= commandscheduler424[3:0];
		end
		4'd9: begin
			t_cases_rhs_array_muxed39 <= commandscheduler425[3:0];
		end
		4'd10: begin
			t_cases_rhs_array_muxed39 <= commandscheduler426[3:0];
		end
		4'd11: begin
			t_cases_rhs_array_muxed39 <= commandscheduler427[3:0];
		end
		4'd12: begin
			t_cases_rhs_array_muxed39 <= commandscheduler428[3:0];
		end
		4'd13: begin
			t_cases_rhs_array_muxed39 <= commandscheduler429[3:0];
		end
		4'd14: begin
			t_cases_rhs_array_muxed39 <= commandscheduler430[3:0];
		end
		4'd15: begin
			t_cases_rhs_array_muxed39 <= commandscheduler431[3:0];
		end
		5'd16: begin
			t_cases_rhs_array_muxed39 <= commandscheduler432[3:0];
		end
		5'd17: begin
			t_cases_rhs_array_muxed39 <= commandscheduler433[3:0];
		end
		5'd18: begin
			t_cases_rhs_array_muxed39 <= commandscheduler434[3:0];
		end
		5'd19: begin
			t_cases_rhs_array_muxed39 <= commandscheduler435[3:0];
		end
		5'd20: begin
			t_cases_rhs_array_muxed39 <= commandscheduler436[3:0];
		end
		5'd21: begin
			t_cases_rhs_array_muxed39 <= commandscheduler437[3:0];
		end
		5'd22: begin
			t_cases_rhs_array_muxed39 <= commandscheduler438[3:0];
		end
		5'd23: begin
			t_cases_rhs_array_muxed39 <= commandscheduler439[3:0];
		end
		5'd24: begin
			t_cases_rhs_array_muxed39 <= commandscheduler440[3:0];
		end
		5'd25: begin
			t_cases_rhs_array_muxed39 <= commandscheduler441[3:0];
		end
		5'd26: begin
			t_cases_rhs_array_muxed39 <= commandscheduler442[3:0];
		end
		5'd27: begin
			t_cases_rhs_array_muxed39 <= commandscheduler443[3:0];
		end
		5'd28: begin
			t_cases_rhs_array_muxed39 <= commandscheduler444[3:0];
		end
		5'd29: begin
			t_cases_rhs_array_muxed39 <= commandscheduler445[3:0];
		end
		5'd30: begin
			t_cases_rhs_array_muxed39 <= commandscheduler446[3:0];
		end
		default: begin
			t_cases_rhs_array_muxed39 <= commandscheduler447[3:0];
		end
	endcase
// synthesis translate_off
	dummy_d_75 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_76;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed40 <= 16'd0;
	case (commandscheduler525)
		1'd0: begin
			t_cases_rhs_array_muxed40 <= commandscheduler416[19:4];
		end
		1'd1: begin
			t_cases_rhs_array_muxed40 <= commandscheduler417[19:4];
		end
		2'd2: begin
			t_cases_rhs_array_muxed40 <= commandscheduler418[19:4];
		end
		2'd3: begin
			t_cases_rhs_array_muxed40 <= commandscheduler419[19:4];
		end
		3'd4: begin
			t_cases_rhs_array_muxed40 <= commandscheduler420[19:4];
		end
		3'd5: begin
			t_cases_rhs_array_muxed40 <= commandscheduler421[19:4];
		end
		3'd6: begin
			t_cases_rhs_array_muxed40 <= commandscheduler422[19:4];
		end
		3'd7: begin
			t_cases_rhs_array_muxed40 <= commandscheduler423[19:4];
		end
		4'd8: begin
			t_cases_rhs_array_muxed40 <= commandscheduler424[19:4];
		end
		4'd9: begin
			t_cases_rhs_array_muxed40 <= commandscheduler425[19:4];
		end
		4'd10: begin
			t_cases_rhs_array_muxed40 <= commandscheduler426[19:4];
		end
		4'd11: begin
			t_cases_rhs_array_muxed40 <= commandscheduler427[19:4];
		end
		4'd12: begin
			t_cases_rhs_array_muxed40 <= commandscheduler428[19:4];
		end
		4'd13: begin
			t_cases_rhs_array_muxed40 <= commandscheduler429[19:4];
		end
		4'd14: begin
			t_cases_rhs_array_muxed40 <= commandscheduler430[19:4];
		end
		4'd15: begin
			t_cases_rhs_array_muxed40 <= commandscheduler431[19:4];
		end
		5'd16: begin
			t_cases_rhs_array_muxed40 <= commandscheduler432[19:4];
		end
		5'd17: begin
			t_cases_rhs_array_muxed40 <= commandscheduler433[19:4];
		end
		5'd18: begin
			t_cases_rhs_array_muxed40 <= commandscheduler434[19:4];
		end
		5'd19: begin
			t_cases_rhs_array_muxed40 <= commandscheduler435[19:4];
		end
		5'd20: begin
			t_cases_rhs_array_muxed40 <= commandscheduler436[19:4];
		end
		5'd21: begin
			t_cases_rhs_array_muxed40 <= commandscheduler437[19:4];
		end
		5'd22: begin
			t_cases_rhs_array_muxed40 <= commandscheduler438[19:4];
		end
		5'd23: begin
			t_cases_rhs_array_muxed40 <= commandscheduler439[19:4];
		end
		5'd24: begin
			t_cases_rhs_array_muxed40 <= commandscheduler440[19:4];
		end
		5'd25: begin
			t_cases_rhs_array_muxed40 <= commandscheduler441[19:4];
		end
		5'd26: begin
			t_cases_rhs_array_muxed40 <= commandscheduler442[19:4];
		end
		5'd27: begin
			t_cases_rhs_array_muxed40 <= commandscheduler443[19:4];
		end
		5'd28: begin
			t_cases_rhs_array_muxed40 <= commandscheduler444[19:4];
		end
		5'd29: begin
			t_cases_rhs_array_muxed40 <= commandscheduler445[19:4];
		end
		5'd30: begin
			t_cases_rhs_array_muxed40 <= commandscheduler446[19:4];
		end
		default: begin
			t_cases_rhs_array_muxed40 <= commandscheduler447[19:4];
		end
	endcase
// synthesis translate_off
	dummy_d_76 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_77;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed41 <= 10'd0;
	case (commandscheduler525)
		1'd0: begin
			t_cases_rhs_array_muxed41 <= commandscheduler416[29:20];
		end
		1'd1: begin
			t_cases_rhs_array_muxed41 <= commandscheduler417[29:20];
		end
		2'd2: begin
			t_cases_rhs_array_muxed41 <= commandscheduler418[29:20];
		end
		2'd3: begin
			t_cases_rhs_array_muxed41 <= commandscheduler419[29:20];
		end
		3'd4: begin
			t_cases_rhs_array_muxed41 <= commandscheduler420[29:20];
		end
		3'd5: begin
			t_cases_rhs_array_muxed41 <= commandscheduler421[29:20];
		end
		3'd6: begin
			t_cases_rhs_array_muxed41 <= commandscheduler422[29:20];
		end
		3'd7: begin
			t_cases_rhs_array_muxed41 <= commandscheduler423[29:20];
		end
		4'd8: begin
			t_cases_rhs_array_muxed41 <= commandscheduler424[29:20];
		end
		4'd9: begin
			t_cases_rhs_array_muxed41 <= commandscheduler425[29:20];
		end
		4'd10: begin
			t_cases_rhs_array_muxed41 <= commandscheduler426[29:20];
		end
		4'd11: begin
			t_cases_rhs_array_muxed41 <= commandscheduler427[29:20];
		end
		4'd12: begin
			t_cases_rhs_array_muxed41 <= commandscheduler428[29:20];
		end
		4'd13: begin
			t_cases_rhs_array_muxed41 <= commandscheduler429[29:20];
		end
		4'd14: begin
			t_cases_rhs_array_muxed41 <= commandscheduler430[29:20];
		end
		4'd15: begin
			t_cases_rhs_array_muxed41 <= commandscheduler431[29:20];
		end
		5'd16: begin
			t_cases_rhs_array_muxed41 <= commandscheduler432[29:20];
		end
		5'd17: begin
			t_cases_rhs_array_muxed41 <= commandscheduler433[29:20];
		end
		5'd18: begin
			t_cases_rhs_array_muxed41 <= commandscheduler434[29:20];
		end
		5'd19: begin
			t_cases_rhs_array_muxed41 <= commandscheduler435[29:20];
		end
		5'd20: begin
			t_cases_rhs_array_muxed41 <= commandscheduler436[29:20];
		end
		5'd21: begin
			t_cases_rhs_array_muxed41 <= commandscheduler437[29:20];
		end
		5'd22: begin
			t_cases_rhs_array_muxed41 <= commandscheduler438[29:20];
		end
		5'd23: begin
			t_cases_rhs_array_muxed41 <= commandscheduler439[29:20];
		end
		5'd24: begin
			t_cases_rhs_array_muxed41 <= commandscheduler440[29:20];
		end
		5'd25: begin
			t_cases_rhs_array_muxed41 <= commandscheduler441[29:20];
		end
		5'd26: begin
			t_cases_rhs_array_muxed41 <= commandscheduler442[29:20];
		end
		5'd27: begin
			t_cases_rhs_array_muxed41 <= commandscheduler443[29:20];
		end
		5'd28: begin
			t_cases_rhs_array_muxed41 <= commandscheduler444[29:20];
		end
		5'd29: begin
			t_cases_rhs_array_muxed41 <= commandscheduler445[29:20];
		end
		5'd30: begin
			t_cases_rhs_array_muxed41 <= commandscheduler446[29:20];
		end
		default: begin
			t_cases_rhs_array_muxed41 <= commandscheduler447[29:20];
		end
	endcase
// synthesis translate_off
	dummy_d_77 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_78;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed42 <= 4'd0;
	case (commandscheduler526)
		1'd0: begin
			t_cases_rhs_array_muxed42 <= commandscheduler448[3:0];
		end
		1'd1: begin
			t_cases_rhs_array_muxed42 <= commandscheduler449[3:0];
		end
		2'd2: begin
			t_cases_rhs_array_muxed42 <= commandscheduler450[3:0];
		end
		2'd3: begin
			t_cases_rhs_array_muxed42 <= commandscheduler451[3:0];
		end
		3'd4: begin
			t_cases_rhs_array_muxed42 <= commandscheduler452[3:0];
		end
		3'd5: begin
			t_cases_rhs_array_muxed42 <= commandscheduler453[3:0];
		end
		3'd6: begin
			t_cases_rhs_array_muxed42 <= commandscheduler454[3:0];
		end
		3'd7: begin
			t_cases_rhs_array_muxed42 <= commandscheduler455[3:0];
		end
		4'd8: begin
			t_cases_rhs_array_muxed42 <= commandscheduler456[3:0];
		end
		4'd9: begin
			t_cases_rhs_array_muxed42 <= commandscheduler457[3:0];
		end
		4'd10: begin
			t_cases_rhs_array_muxed42 <= commandscheduler458[3:0];
		end
		4'd11: begin
			t_cases_rhs_array_muxed42 <= commandscheduler459[3:0];
		end
		4'd12: begin
			t_cases_rhs_array_muxed42 <= commandscheduler460[3:0];
		end
		4'd13: begin
			t_cases_rhs_array_muxed42 <= commandscheduler461[3:0];
		end
		4'd14: begin
			t_cases_rhs_array_muxed42 <= commandscheduler462[3:0];
		end
		4'd15: begin
			t_cases_rhs_array_muxed42 <= commandscheduler463[3:0];
		end
		5'd16: begin
			t_cases_rhs_array_muxed42 <= commandscheduler464[3:0];
		end
		5'd17: begin
			t_cases_rhs_array_muxed42 <= commandscheduler465[3:0];
		end
		5'd18: begin
			t_cases_rhs_array_muxed42 <= commandscheduler466[3:0];
		end
		5'd19: begin
			t_cases_rhs_array_muxed42 <= commandscheduler467[3:0];
		end
		5'd20: begin
			t_cases_rhs_array_muxed42 <= commandscheduler468[3:0];
		end
		5'd21: begin
			t_cases_rhs_array_muxed42 <= commandscheduler469[3:0];
		end
		5'd22: begin
			t_cases_rhs_array_muxed42 <= commandscheduler470[3:0];
		end
		5'd23: begin
			t_cases_rhs_array_muxed42 <= commandscheduler471[3:0];
		end
		5'd24: begin
			t_cases_rhs_array_muxed42 <= commandscheduler472[3:0];
		end
		5'd25: begin
			t_cases_rhs_array_muxed42 <= commandscheduler473[3:0];
		end
		5'd26: begin
			t_cases_rhs_array_muxed42 <= commandscheduler474[3:0];
		end
		5'd27: begin
			t_cases_rhs_array_muxed42 <= commandscheduler475[3:0];
		end
		5'd28: begin
			t_cases_rhs_array_muxed42 <= commandscheduler476[3:0];
		end
		5'd29: begin
			t_cases_rhs_array_muxed42 <= commandscheduler477[3:0];
		end
		5'd30: begin
			t_cases_rhs_array_muxed42 <= commandscheduler478[3:0];
		end
		default: begin
			t_cases_rhs_array_muxed42 <= commandscheduler479[3:0];
		end
	endcase
// synthesis translate_off
	dummy_d_78 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_79;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed43 <= 16'd0;
	case (commandscheduler526)
		1'd0: begin
			t_cases_rhs_array_muxed43 <= commandscheduler448[19:4];
		end
		1'd1: begin
			t_cases_rhs_array_muxed43 <= commandscheduler449[19:4];
		end
		2'd2: begin
			t_cases_rhs_array_muxed43 <= commandscheduler450[19:4];
		end
		2'd3: begin
			t_cases_rhs_array_muxed43 <= commandscheduler451[19:4];
		end
		3'd4: begin
			t_cases_rhs_array_muxed43 <= commandscheduler452[19:4];
		end
		3'd5: begin
			t_cases_rhs_array_muxed43 <= commandscheduler453[19:4];
		end
		3'd6: begin
			t_cases_rhs_array_muxed43 <= commandscheduler454[19:4];
		end
		3'd7: begin
			t_cases_rhs_array_muxed43 <= commandscheduler455[19:4];
		end
		4'd8: begin
			t_cases_rhs_array_muxed43 <= commandscheduler456[19:4];
		end
		4'd9: begin
			t_cases_rhs_array_muxed43 <= commandscheduler457[19:4];
		end
		4'd10: begin
			t_cases_rhs_array_muxed43 <= commandscheduler458[19:4];
		end
		4'd11: begin
			t_cases_rhs_array_muxed43 <= commandscheduler459[19:4];
		end
		4'd12: begin
			t_cases_rhs_array_muxed43 <= commandscheduler460[19:4];
		end
		4'd13: begin
			t_cases_rhs_array_muxed43 <= commandscheduler461[19:4];
		end
		4'd14: begin
			t_cases_rhs_array_muxed43 <= commandscheduler462[19:4];
		end
		4'd15: begin
			t_cases_rhs_array_muxed43 <= commandscheduler463[19:4];
		end
		5'd16: begin
			t_cases_rhs_array_muxed43 <= commandscheduler464[19:4];
		end
		5'd17: begin
			t_cases_rhs_array_muxed43 <= commandscheduler465[19:4];
		end
		5'd18: begin
			t_cases_rhs_array_muxed43 <= commandscheduler466[19:4];
		end
		5'd19: begin
			t_cases_rhs_array_muxed43 <= commandscheduler467[19:4];
		end
		5'd20: begin
			t_cases_rhs_array_muxed43 <= commandscheduler468[19:4];
		end
		5'd21: begin
			t_cases_rhs_array_muxed43 <= commandscheduler469[19:4];
		end
		5'd22: begin
			t_cases_rhs_array_muxed43 <= commandscheduler470[19:4];
		end
		5'd23: begin
			t_cases_rhs_array_muxed43 <= commandscheduler471[19:4];
		end
		5'd24: begin
			t_cases_rhs_array_muxed43 <= commandscheduler472[19:4];
		end
		5'd25: begin
			t_cases_rhs_array_muxed43 <= commandscheduler473[19:4];
		end
		5'd26: begin
			t_cases_rhs_array_muxed43 <= commandscheduler474[19:4];
		end
		5'd27: begin
			t_cases_rhs_array_muxed43 <= commandscheduler475[19:4];
		end
		5'd28: begin
			t_cases_rhs_array_muxed43 <= commandscheduler476[19:4];
		end
		5'd29: begin
			t_cases_rhs_array_muxed43 <= commandscheduler477[19:4];
		end
		5'd30: begin
			t_cases_rhs_array_muxed43 <= commandscheduler478[19:4];
		end
		default: begin
			t_cases_rhs_array_muxed43 <= commandscheduler479[19:4];
		end
	endcase
// synthesis translate_off
	dummy_d_79 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_80;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed44 <= 10'd0;
	case (commandscheduler526)
		1'd0: begin
			t_cases_rhs_array_muxed44 <= commandscheduler448[29:20];
		end
		1'd1: begin
			t_cases_rhs_array_muxed44 <= commandscheduler449[29:20];
		end
		2'd2: begin
			t_cases_rhs_array_muxed44 <= commandscheduler450[29:20];
		end
		2'd3: begin
			t_cases_rhs_array_muxed44 <= commandscheduler451[29:20];
		end
		3'd4: begin
			t_cases_rhs_array_muxed44 <= commandscheduler452[29:20];
		end
		3'd5: begin
			t_cases_rhs_array_muxed44 <= commandscheduler453[29:20];
		end
		3'd6: begin
			t_cases_rhs_array_muxed44 <= commandscheduler454[29:20];
		end
		3'd7: begin
			t_cases_rhs_array_muxed44 <= commandscheduler455[29:20];
		end
		4'd8: begin
			t_cases_rhs_array_muxed44 <= commandscheduler456[29:20];
		end
		4'd9: begin
			t_cases_rhs_array_muxed44 <= commandscheduler457[29:20];
		end
		4'd10: begin
			t_cases_rhs_array_muxed44 <= commandscheduler458[29:20];
		end
		4'd11: begin
			t_cases_rhs_array_muxed44 <= commandscheduler459[29:20];
		end
		4'd12: begin
			t_cases_rhs_array_muxed44 <= commandscheduler460[29:20];
		end
		4'd13: begin
			t_cases_rhs_array_muxed44 <= commandscheduler461[29:20];
		end
		4'd14: begin
			t_cases_rhs_array_muxed44 <= commandscheduler462[29:20];
		end
		4'd15: begin
			t_cases_rhs_array_muxed44 <= commandscheduler463[29:20];
		end
		5'd16: begin
			t_cases_rhs_array_muxed44 <= commandscheduler464[29:20];
		end
		5'd17: begin
			t_cases_rhs_array_muxed44 <= commandscheduler465[29:20];
		end
		5'd18: begin
			t_cases_rhs_array_muxed44 <= commandscheduler466[29:20];
		end
		5'd19: begin
			t_cases_rhs_array_muxed44 <= commandscheduler467[29:20];
		end
		5'd20: begin
			t_cases_rhs_array_muxed44 <= commandscheduler468[29:20];
		end
		5'd21: begin
			t_cases_rhs_array_muxed44 <= commandscheduler469[29:20];
		end
		5'd22: begin
			t_cases_rhs_array_muxed44 <= commandscheduler470[29:20];
		end
		5'd23: begin
			t_cases_rhs_array_muxed44 <= commandscheduler471[29:20];
		end
		5'd24: begin
			t_cases_rhs_array_muxed44 <= commandscheduler472[29:20];
		end
		5'd25: begin
			t_cases_rhs_array_muxed44 <= commandscheduler473[29:20];
		end
		5'd26: begin
			t_cases_rhs_array_muxed44 <= commandscheduler474[29:20];
		end
		5'd27: begin
			t_cases_rhs_array_muxed44 <= commandscheduler475[29:20];
		end
		5'd28: begin
			t_cases_rhs_array_muxed44 <= commandscheduler476[29:20];
		end
		5'd29: begin
			t_cases_rhs_array_muxed44 <= commandscheduler477[29:20];
		end
		5'd30: begin
			t_cases_rhs_array_muxed44 <= commandscheduler478[29:20];
		end
		default: begin
			t_cases_rhs_array_muxed44 <= commandscheduler479[29:20];
		end
	endcase
// synthesis translate_off
	dummy_d_80 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_81;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed45 <= 4'd0;
	case (commandscheduler527)
		1'd0: begin
			t_cases_rhs_array_muxed45 <= commandscheduler480[3:0];
		end
		1'd1: begin
			t_cases_rhs_array_muxed45 <= commandscheduler481[3:0];
		end
		2'd2: begin
			t_cases_rhs_array_muxed45 <= commandscheduler482[3:0];
		end
		2'd3: begin
			t_cases_rhs_array_muxed45 <= commandscheduler483[3:0];
		end
		3'd4: begin
			t_cases_rhs_array_muxed45 <= commandscheduler484[3:0];
		end
		3'd5: begin
			t_cases_rhs_array_muxed45 <= commandscheduler485[3:0];
		end
		3'd6: begin
			t_cases_rhs_array_muxed45 <= commandscheduler486[3:0];
		end
		3'd7: begin
			t_cases_rhs_array_muxed45 <= commandscheduler487[3:0];
		end
		4'd8: begin
			t_cases_rhs_array_muxed45 <= commandscheduler488[3:0];
		end
		4'd9: begin
			t_cases_rhs_array_muxed45 <= commandscheduler489[3:0];
		end
		4'd10: begin
			t_cases_rhs_array_muxed45 <= commandscheduler490[3:0];
		end
		4'd11: begin
			t_cases_rhs_array_muxed45 <= commandscheduler491[3:0];
		end
		4'd12: begin
			t_cases_rhs_array_muxed45 <= commandscheduler492[3:0];
		end
		4'd13: begin
			t_cases_rhs_array_muxed45 <= commandscheduler493[3:0];
		end
		4'd14: begin
			t_cases_rhs_array_muxed45 <= commandscheduler494[3:0];
		end
		4'd15: begin
			t_cases_rhs_array_muxed45 <= commandscheduler495[3:0];
		end
		5'd16: begin
			t_cases_rhs_array_muxed45 <= commandscheduler496[3:0];
		end
		5'd17: begin
			t_cases_rhs_array_muxed45 <= commandscheduler497[3:0];
		end
		5'd18: begin
			t_cases_rhs_array_muxed45 <= commandscheduler498[3:0];
		end
		5'd19: begin
			t_cases_rhs_array_muxed45 <= commandscheduler499[3:0];
		end
		5'd20: begin
			t_cases_rhs_array_muxed45 <= commandscheduler500[3:0];
		end
		5'd21: begin
			t_cases_rhs_array_muxed45 <= commandscheduler501[3:0];
		end
		5'd22: begin
			t_cases_rhs_array_muxed45 <= commandscheduler502[3:0];
		end
		5'd23: begin
			t_cases_rhs_array_muxed45 <= commandscheduler503[3:0];
		end
		5'd24: begin
			t_cases_rhs_array_muxed45 <= commandscheduler504[3:0];
		end
		5'd25: begin
			t_cases_rhs_array_muxed45 <= commandscheduler505[3:0];
		end
		5'd26: begin
			t_cases_rhs_array_muxed45 <= commandscheduler506[3:0];
		end
		5'd27: begin
			t_cases_rhs_array_muxed45 <= commandscheduler507[3:0];
		end
		5'd28: begin
			t_cases_rhs_array_muxed45 <= commandscheduler508[3:0];
		end
		5'd29: begin
			t_cases_rhs_array_muxed45 <= commandscheduler509[3:0];
		end
		5'd30: begin
			t_cases_rhs_array_muxed45 <= commandscheduler510[3:0];
		end
		default: begin
			t_cases_rhs_array_muxed45 <= commandscheduler511[3:0];
		end
	endcase
// synthesis translate_off
	dummy_d_81 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_82;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed46 <= 16'd0;
	case (commandscheduler527)
		1'd0: begin
			t_cases_rhs_array_muxed46 <= commandscheduler480[19:4];
		end
		1'd1: begin
			t_cases_rhs_array_muxed46 <= commandscheduler481[19:4];
		end
		2'd2: begin
			t_cases_rhs_array_muxed46 <= commandscheduler482[19:4];
		end
		2'd3: begin
			t_cases_rhs_array_muxed46 <= commandscheduler483[19:4];
		end
		3'd4: begin
			t_cases_rhs_array_muxed46 <= commandscheduler484[19:4];
		end
		3'd5: begin
			t_cases_rhs_array_muxed46 <= commandscheduler485[19:4];
		end
		3'd6: begin
			t_cases_rhs_array_muxed46 <= commandscheduler486[19:4];
		end
		3'd7: begin
			t_cases_rhs_array_muxed46 <= commandscheduler487[19:4];
		end
		4'd8: begin
			t_cases_rhs_array_muxed46 <= commandscheduler488[19:4];
		end
		4'd9: begin
			t_cases_rhs_array_muxed46 <= commandscheduler489[19:4];
		end
		4'd10: begin
			t_cases_rhs_array_muxed46 <= commandscheduler490[19:4];
		end
		4'd11: begin
			t_cases_rhs_array_muxed46 <= commandscheduler491[19:4];
		end
		4'd12: begin
			t_cases_rhs_array_muxed46 <= commandscheduler492[19:4];
		end
		4'd13: begin
			t_cases_rhs_array_muxed46 <= commandscheduler493[19:4];
		end
		4'd14: begin
			t_cases_rhs_array_muxed46 <= commandscheduler494[19:4];
		end
		4'd15: begin
			t_cases_rhs_array_muxed46 <= commandscheduler495[19:4];
		end
		5'd16: begin
			t_cases_rhs_array_muxed46 <= commandscheduler496[19:4];
		end
		5'd17: begin
			t_cases_rhs_array_muxed46 <= commandscheduler497[19:4];
		end
		5'd18: begin
			t_cases_rhs_array_muxed46 <= commandscheduler498[19:4];
		end
		5'd19: begin
			t_cases_rhs_array_muxed46 <= commandscheduler499[19:4];
		end
		5'd20: begin
			t_cases_rhs_array_muxed46 <= commandscheduler500[19:4];
		end
		5'd21: begin
			t_cases_rhs_array_muxed46 <= commandscheduler501[19:4];
		end
		5'd22: begin
			t_cases_rhs_array_muxed46 <= commandscheduler502[19:4];
		end
		5'd23: begin
			t_cases_rhs_array_muxed46 <= commandscheduler503[19:4];
		end
		5'd24: begin
			t_cases_rhs_array_muxed46 <= commandscheduler504[19:4];
		end
		5'd25: begin
			t_cases_rhs_array_muxed46 <= commandscheduler505[19:4];
		end
		5'd26: begin
			t_cases_rhs_array_muxed46 <= commandscheduler506[19:4];
		end
		5'd27: begin
			t_cases_rhs_array_muxed46 <= commandscheduler507[19:4];
		end
		5'd28: begin
			t_cases_rhs_array_muxed46 <= commandscheduler508[19:4];
		end
		5'd29: begin
			t_cases_rhs_array_muxed46 <= commandscheduler509[19:4];
		end
		5'd30: begin
			t_cases_rhs_array_muxed46 <= commandscheduler510[19:4];
		end
		default: begin
			t_cases_rhs_array_muxed46 <= commandscheduler511[19:4];
		end
	endcase
// synthesis translate_off
	dummy_d_82 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_83;
// synthesis translate_on
always @(*) begin
	t_cases_rhs_array_muxed47 <= 10'd0;
	case (commandscheduler527)
		1'd0: begin
			t_cases_rhs_array_muxed47 <= commandscheduler480[29:20];
		end
		1'd1: begin
			t_cases_rhs_array_muxed47 <= commandscheduler481[29:20];
		end
		2'd2: begin
			t_cases_rhs_array_muxed47 <= commandscheduler482[29:20];
		end
		2'd3: begin
			t_cases_rhs_array_muxed47 <= commandscheduler483[29:20];
		end
		3'd4: begin
			t_cases_rhs_array_muxed47 <= commandscheduler484[29:20];
		end
		3'd5: begin
			t_cases_rhs_array_muxed47 <= commandscheduler485[29:20];
		end
		3'd6: begin
			t_cases_rhs_array_muxed47 <= commandscheduler486[29:20];
		end
		3'd7: begin
			t_cases_rhs_array_muxed47 <= commandscheduler487[29:20];
		end
		4'd8: begin
			t_cases_rhs_array_muxed47 <= commandscheduler488[29:20];
		end
		4'd9: begin
			t_cases_rhs_array_muxed47 <= commandscheduler489[29:20];
		end
		4'd10: begin
			t_cases_rhs_array_muxed47 <= commandscheduler490[29:20];
		end
		4'd11: begin
			t_cases_rhs_array_muxed47 <= commandscheduler491[29:20];
		end
		4'd12: begin
			t_cases_rhs_array_muxed47 <= commandscheduler492[29:20];
		end
		4'd13: begin
			t_cases_rhs_array_muxed47 <= commandscheduler493[29:20];
		end
		4'd14: begin
			t_cases_rhs_array_muxed47 <= commandscheduler494[29:20];
		end
		4'd15: begin
			t_cases_rhs_array_muxed47 <= commandscheduler495[29:20];
		end
		5'd16: begin
			t_cases_rhs_array_muxed47 <= commandscheduler496[29:20];
		end
		5'd17: begin
			t_cases_rhs_array_muxed47 <= commandscheduler497[29:20];
		end
		5'd18: begin
			t_cases_rhs_array_muxed47 <= commandscheduler498[29:20];
		end
		5'd19: begin
			t_cases_rhs_array_muxed47 <= commandscheduler499[29:20];
		end
		5'd20: begin
			t_cases_rhs_array_muxed47 <= commandscheduler500[29:20];
		end
		5'd21: begin
			t_cases_rhs_array_muxed47 <= commandscheduler501[29:20];
		end
		5'd22: begin
			t_cases_rhs_array_muxed47 <= commandscheduler502[29:20];
		end
		5'd23: begin
			t_cases_rhs_array_muxed47 <= commandscheduler503[29:20];
		end
		5'd24: begin
			t_cases_rhs_array_muxed47 <= commandscheduler504[29:20];
		end
		5'd25: begin
			t_cases_rhs_array_muxed47 <= commandscheduler505[29:20];
		end
		5'd26: begin
			t_cases_rhs_array_muxed47 <= commandscheduler506[29:20];
		end
		5'd27: begin
			t_cases_rhs_array_muxed47 <= commandscheduler507[29:20];
		end
		5'd28: begin
			t_cases_rhs_array_muxed47 <= commandscheduler508[29:20];
		end
		5'd29: begin
			t_cases_rhs_array_muxed47 <= commandscheduler509[29:20];
		end
		5'd30: begin
			t_cases_rhs_array_muxed47 <= commandscheduler510[29:20];
		end
		default: begin
			t_cases_rhs_array_muxed47 <= commandscheduler511[29:20];
		end
	endcase
// synthesis translate_off
	dummy_d_83 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_84;
// synthesis translate_on
always @(*) begin
	cases_basiclowerer_array_muxed1 <= 16'd0;
	case (rowbuffermanager_bank)
		1'd0: begin
			cases_basiclowerer_array_muxed1 <= rowbuffermanager16;
		end
		1'd1: begin
			cases_basiclowerer_array_muxed1 <= rowbuffermanager17;
		end
		2'd2: begin
			cases_basiclowerer_array_muxed1 <= rowbuffermanager18;
		end
		default: begin
			cases_basiclowerer_array_muxed1 <= rowbuffermanager19;
		end
	endcase
// synthesis translate_off
	dummy_d_84 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_85;
// synthesis translate_on
always @(*) begin
	cases_basiclowerer_array_muxed2 <= 16'd0;
	case (rowbuffermanager_bank)
		1'd0: begin
			cases_basiclowerer_array_muxed2 <= rowbuffermanager20;
		end
		1'd1: begin
			cases_basiclowerer_array_muxed2 <= rowbuffermanager21;
		end
		2'd2: begin
			cases_basiclowerer_array_muxed2 <= rowbuffermanager22;
		end
		default: begin
			cases_basiclowerer_array_muxed2 <= rowbuffermanager23;
		end
	endcase
// synthesis translate_off
	dummy_d_85 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_86;
// synthesis translate_on
always @(*) begin
	cases_basiclowerer_array_muxed3 <= 16'd0;
	case (rowbuffermanager_bank)
		1'd0: begin
			cases_basiclowerer_array_muxed3 <= rowbuffermanager24;
		end
		1'd1: begin
			cases_basiclowerer_array_muxed3 <= rowbuffermanager25;
		end
		2'd2: begin
			cases_basiclowerer_array_muxed3 <= rowbuffermanager26;
		end
		default: begin
			cases_basiclowerer_array_muxed3 <= rowbuffermanager27;
		end
	endcase
// synthesis translate_off
	dummy_d_86 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_87;
// synthesis translate_on
always @(*) begin
	cases_basiclowerer_array_muxed4 <= 16'd0;
	case (rowbuffermanager_bank)
		1'd0: begin
			cases_basiclowerer_array_muxed4 <= rowbuffermanager28;
		end
		1'd1: begin
			cases_basiclowerer_array_muxed4 <= rowbuffermanager29;
		end
		2'd2: begin
			cases_basiclowerer_array_muxed4 <= rowbuffermanager30;
		end
		default: begin
			cases_basiclowerer_array_muxed4 <= rowbuffermanager31;
		end
	endcase
// synthesis translate_off
	dummy_d_87 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_88;
// synthesis translate_on
always @(*) begin
	cases_basiclowerer_array_muxed0 <= 16'd0;
	case (rowbuffermanager_bank_group)
		1'd0: begin
			cases_basiclowerer_array_muxed0 <= cases_basiclowerer_array_muxed1;
		end
		1'd1: begin
			cases_basiclowerer_array_muxed0 <= cases_basiclowerer_array_muxed2;
		end
		2'd2: begin
			cases_basiclowerer_array_muxed0 <= cases_basiclowerer_array_muxed3;
		end
		default: begin
			cases_basiclowerer_array_muxed0 <= cases_basiclowerer_array_muxed4;
		end
	endcase
// synthesis translate_off
	dummy_d_88 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_89;
// synthesis translate_on
always @(*) begin
	cases_basiclowerer_array_muxed16 <= 16'd0;
	case (rowbuffermanager_bank)
		1'd0: begin
			cases_basiclowerer_array_muxed16 <= rowbuffermanager16;
		end
		1'd1: begin
			cases_basiclowerer_array_muxed16 <= rowbuffermanager17;
		end
		2'd2: begin
			cases_basiclowerer_array_muxed16 <= rowbuffermanager18;
		end
		default: begin
			cases_basiclowerer_array_muxed16 <= rowbuffermanager19;
		end
	endcase
// synthesis translate_off
	dummy_d_89 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_90;
// synthesis translate_on
always @(*) begin
	cases_basiclowerer_array_muxed17 <= 16'd0;
	case (rowbuffermanager_bank)
		1'd0: begin
			cases_basiclowerer_array_muxed17 <= rowbuffermanager20;
		end
		1'd1: begin
			cases_basiclowerer_array_muxed17 <= rowbuffermanager21;
		end
		2'd2: begin
			cases_basiclowerer_array_muxed17 <= rowbuffermanager22;
		end
		default: begin
			cases_basiclowerer_array_muxed17 <= rowbuffermanager23;
		end
	endcase
// synthesis translate_off
	dummy_d_90 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_91;
// synthesis translate_on
always @(*) begin
	cases_basiclowerer_array_muxed18 <= 16'd0;
	case (rowbuffermanager_bank)
		1'd0: begin
			cases_basiclowerer_array_muxed18 <= rowbuffermanager24;
		end
		1'd1: begin
			cases_basiclowerer_array_muxed18 <= rowbuffermanager25;
		end
		2'd2: begin
			cases_basiclowerer_array_muxed18 <= rowbuffermanager26;
		end
		default: begin
			cases_basiclowerer_array_muxed18 <= rowbuffermanager27;
		end
	endcase
// synthesis translate_off
	dummy_d_91 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_92;
// synthesis translate_on
always @(*) begin
	cases_basiclowerer_array_muxed19 <= 16'd0;
	case (rowbuffermanager_bank)
		1'd0: begin
			cases_basiclowerer_array_muxed19 <= rowbuffermanager28;
		end
		1'd1: begin
			cases_basiclowerer_array_muxed19 <= rowbuffermanager29;
		end
		2'd2: begin
			cases_basiclowerer_array_muxed19 <= rowbuffermanager30;
		end
		default: begin
			cases_basiclowerer_array_muxed19 <= rowbuffermanager31;
		end
	endcase
// synthesis translate_off
	dummy_d_92 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_93;
// synthesis translate_on
always @(*) begin
	cases_basiclowerer_array_muxed15 <= 16'd0;
	case (rowbuffermanager_bank_group)
		1'd0: begin
			cases_basiclowerer_array_muxed15 <= cases_basiclowerer_array_muxed16;
		end
		1'd1: begin
			cases_basiclowerer_array_muxed15 <= cases_basiclowerer_array_muxed17;
		end
		2'd2: begin
			cases_basiclowerer_array_muxed15 <= cases_basiclowerer_array_muxed18;
		end
		default: begin
			cases_basiclowerer_array_muxed15 <= cases_basiclowerer_array_muxed19;
		end
	endcase
// synthesis translate_off
	dummy_d_93 <= dummy_s;
// synthesis translate_on
end

always @(posedge dst_clk) begin
	if (clock_domain_crossing_dst_rst) begin
		clock_domain_crossing_sync_ff2 <= 1'd0;
		clock_domain_crossing_dst_data <= 1'd0;
	end else begin
		clock_domain_crossing_sync_ff2 <= clock_domain_crossing_sync_ff1;
		clock_domain_crossing_dst_data <= clock_domain_crossing_sync_ff2;
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
		clock_domain_crossing_dst_data <= 64'd0;
		clock_domain_crossing_sync_ff2 <= 64'd0;
		data_in_cdc_dst_data <= 64'd0;
		data_in_cdc_sync_ff2 <= 64'd0;
		data_out_cdc_dst_data <= 64'd0;
		data_out_cdc_sync_ff2 <= 64'd0;
	end
end

always @(posedge src_clk) begin
	clock_domain_crossing_sync_ff1 <= clock_domain_crossing_src_data;
	data_in_cdc_sync_ff1 <= data_in_cdc_src_data;
	data_out_cdc_sync_ff1 <= data_out_cdc_src_data;
	if (src_rst) begin
		clock_domain_crossing_sync_ff1 <= 64'd0;
		data_in_cdc_sync_ff1 <= 64'd0;
		data_out_cdc_sync_ff1 <= 64'd0;
	end
end

always @(posedge sys_clk) begin
	if ((timingcontroller_cmd_decoded != 1'd0)) begin
		case (timingcontroller_cmd_decoded)
			1'd1: begin
				timingcontroller_ready <= 1'd0;
				timingcontroller0 <= 6'd50;
				timingcontroller1 <= 6'd50;
				timingcontroller2 <= 6'd50;
				timingcontroller3 <= 6'd50;
				timingcontroller4 <= 6'd50;
				timingcontroller5 <= 6'd50;
				timingcontroller6 <= 6'd50;
				timingcontroller7 <= 6'd50;
				timingcontroller8 <= 6'd50;
				timingcontroller9 <= 6'd50;
				timingcontroller10 <= 6'd50;
				timingcontroller11 <= 6'd50;
				timingcontroller12 <= 6'd50;
				timingcontroller13 <= 6'd50;
				timingcontroller14 <= 6'd50;
				timingcontroller15 <= 6'd50;
			end
			2'd2: begin
				if ((t_cases_array_muxed3 == 1'd0)) begin
					timingcontroller_ready <= 1'd1;
					t_cases_lhs_array_muxed3 = 5'd18;
					case (((timingcontroller_bank_group * 2'd2) + timingcontroller_bank))
						1'd0: begin
							timingcontroller0 <= t_cases_lhs_array_muxed3;
						end
						1'd1: begin
							timingcontroller1 <= t_cases_lhs_array_muxed3;
						end
						2'd2: begin
							timingcontroller2 <= t_cases_lhs_array_muxed3;
						end
						2'd3: begin
							timingcontroller3 <= t_cases_lhs_array_muxed3;
						end
						3'd4: begin
							timingcontroller4 <= t_cases_lhs_array_muxed3;
						end
						3'd5: begin
							timingcontroller5 <= t_cases_lhs_array_muxed3;
						end
						3'd6: begin
							timingcontroller6 <= t_cases_lhs_array_muxed3;
						end
						3'd7: begin
							timingcontroller7 <= t_cases_lhs_array_muxed3;
						end
						4'd8: begin
							timingcontroller8 <= t_cases_lhs_array_muxed3;
						end
						4'd9: begin
							timingcontroller9 <= t_cases_lhs_array_muxed3;
						end
						4'd10: begin
							timingcontroller10 <= t_cases_lhs_array_muxed3;
						end
						4'd11: begin
							timingcontroller11 <= t_cases_lhs_array_muxed3;
						end
						4'd12: begin
							timingcontroller12 <= t_cases_lhs_array_muxed3;
						end
						4'd13: begin
							timingcontroller13 <= t_cases_lhs_array_muxed3;
						end
						4'd14: begin
							timingcontroller14 <= t_cases_lhs_array_muxed3;
						end
						default: begin
							timingcontroller15 <= t_cases_lhs_array_muxed3;
						end
					endcase
				end else begin
					timingcontroller_ready <= 1'd0;
				end
			end
			2'd3: begin
				if ((t_cases_array_muxed2 == 1'd0)) begin
					timingcontroller_ready <= 1'd1;
					t_cases_lhs_array_muxed2 = 6'd32;
					case (((timingcontroller_bank_group * 2'd2) + timingcontroller_bank))
						1'd0: begin
							timingcontroller0 <= t_cases_lhs_array_muxed2;
						end
						1'd1: begin
							timingcontroller1 <= t_cases_lhs_array_muxed2;
						end
						2'd2: begin
							timingcontroller2 <= t_cases_lhs_array_muxed2;
						end
						2'd3: begin
							timingcontroller3 <= t_cases_lhs_array_muxed2;
						end
						3'd4: begin
							timingcontroller4 <= t_cases_lhs_array_muxed2;
						end
						3'd5: begin
							timingcontroller5 <= t_cases_lhs_array_muxed2;
						end
						3'd6: begin
							timingcontroller6 <= t_cases_lhs_array_muxed2;
						end
						3'd7: begin
							timingcontroller7 <= t_cases_lhs_array_muxed2;
						end
						4'd8: begin
							timingcontroller8 <= t_cases_lhs_array_muxed2;
						end
						4'd9: begin
							timingcontroller9 <= t_cases_lhs_array_muxed2;
						end
						4'd10: begin
							timingcontroller10 <= t_cases_lhs_array_muxed2;
						end
						4'd11: begin
							timingcontroller11 <= t_cases_lhs_array_muxed2;
						end
						4'd12: begin
							timingcontroller12 <= t_cases_lhs_array_muxed2;
						end
						4'd13: begin
							timingcontroller13 <= t_cases_lhs_array_muxed2;
						end
						4'd14: begin
							timingcontroller14 <= t_cases_lhs_array_muxed2;
						end
						default: begin
							timingcontroller15 <= t_cases_lhs_array_muxed2;
						end
					endcase
				end else begin
					timingcontroller_ready <= 1'd0;
				end
			end
			3'd4: begin
				if ((t_cases_array_muxed1 == 1'd0)) begin
					timingcontroller_ready <= 1'd1;
					t_cases_lhs_array_muxed1 = 5'd20;
					case (((timingcontroller_bank_group * 2'd2) + timingcontroller_bank))
						1'd0: begin
							timingcontroller0 <= t_cases_lhs_array_muxed1;
						end
						1'd1: begin
							timingcontroller1 <= t_cases_lhs_array_muxed1;
						end
						2'd2: begin
							timingcontroller2 <= t_cases_lhs_array_muxed1;
						end
						2'd3: begin
							timingcontroller3 <= t_cases_lhs_array_muxed1;
						end
						3'd4: begin
							timingcontroller4 <= t_cases_lhs_array_muxed1;
						end
						3'd5: begin
							timingcontroller5 <= t_cases_lhs_array_muxed1;
						end
						3'd6: begin
							timingcontroller6 <= t_cases_lhs_array_muxed1;
						end
						3'd7: begin
							timingcontroller7 <= t_cases_lhs_array_muxed1;
						end
						4'd8: begin
							timingcontroller8 <= t_cases_lhs_array_muxed1;
						end
						4'd9: begin
							timingcontroller9 <= t_cases_lhs_array_muxed1;
						end
						4'd10: begin
							timingcontroller10 <= t_cases_lhs_array_muxed1;
						end
						4'd11: begin
							timingcontroller11 <= t_cases_lhs_array_muxed1;
						end
						4'd12: begin
							timingcontroller12 <= t_cases_lhs_array_muxed1;
						end
						4'd13: begin
							timingcontroller13 <= t_cases_lhs_array_muxed1;
						end
						4'd14: begin
							timingcontroller14 <= t_cases_lhs_array_muxed1;
						end
						default: begin
							timingcontroller15 <= t_cases_lhs_array_muxed1;
						end
					endcase
				end else begin
					timingcontroller_ready <= 1'd0;
				end
			end
			3'd5: begin
				if ((t_cases_array_muxed0 == 1'd0)) begin
					timingcontroller_ready <= 1'd1;
					t_cases_lhs_array_muxed0 = 5'd18;
					case (((timingcontroller_bank_group * 2'd2) + timingcontroller_bank))
						1'd0: begin
							timingcontroller0 <= t_cases_lhs_array_muxed0;
						end
						1'd1: begin
							timingcontroller1 <= t_cases_lhs_array_muxed0;
						end
						2'd2: begin
							timingcontroller2 <= t_cases_lhs_array_muxed0;
						end
						2'd3: begin
							timingcontroller3 <= t_cases_lhs_array_muxed0;
						end
						3'd4: begin
							timingcontroller4 <= t_cases_lhs_array_muxed0;
						end
						3'd5: begin
							timingcontroller5 <= t_cases_lhs_array_muxed0;
						end
						3'd6: begin
							timingcontroller6 <= t_cases_lhs_array_muxed0;
						end
						3'd7: begin
							timingcontroller7 <= t_cases_lhs_array_muxed0;
						end
						4'd8: begin
							timingcontroller8 <= t_cases_lhs_array_muxed0;
						end
						4'd9: begin
							timingcontroller9 <= t_cases_lhs_array_muxed0;
						end
						4'd10: begin
							timingcontroller10 <= t_cases_lhs_array_muxed0;
						end
						4'd11: begin
							timingcontroller11 <= t_cases_lhs_array_muxed0;
						end
						4'd12: begin
							timingcontroller12 <= t_cases_lhs_array_muxed0;
						end
						4'd13: begin
							timingcontroller13 <= t_cases_lhs_array_muxed0;
						end
						4'd14: begin
							timingcontroller14 <= t_cases_lhs_array_muxed0;
						end
						default: begin
							timingcontroller15 <= t_cases_lhs_array_muxed0;
						end
					endcase
				end else begin
					timingcontroller_ready <= 1'd0;
				end
			end
		endcase
	end else begin
		if ((timingcontroller0 > 1'd0)) begin
			timingcontroller0 <= (timingcontroller0 - 1'd1);
		end
		if ((timingcontroller1 > 1'd0)) begin
			timingcontroller1 <= (timingcontroller1 - 1'd1);
		end
		if ((timingcontroller2 > 1'd0)) begin
			timingcontroller2 <= (timingcontroller2 - 1'd1);
		end
		if ((timingcontroller3 > 1'd0)) begin
			timingcontroller3 <= (timingcontroller3 - 1'd1);
		end
		if ((timingcontroller4 > 1'd0)) begin
			timingcontroller4 <= (timingcontroller4 - 1'd1);
		end
		if ((timingcontroller5 > 1'd0)) begin
			timingcontroller5 <= (timingcontroller5 - 1'd1);
		end
		if ((timingcontroller6 > 1'd0)) begin
			timingcontroller6 <= (timingcontroller6 - 1'd1);
		end
		if ((timingcontroller7 > 1'd0)) begin
			timingcontroller7 <= (timingcontroller7 - 1'd1);
		end
		if ((timingcontroller8 > 1'd0)) begin
			timingcontroller8 <= (timingcontroller8 - 1'd1);
		end
		if ((timingcontroller9 > 1'd0)) begin
			timingcontroller9 <= (timingcontroller9 - 1'd1);
		end
		if ((timingcontroller10 > 1'd0)) begin
			timingcontroller10 <= (timingcontroller10 - 1'd1);
		end
		if ((timingcontroller11 > 1'd0)) begin
			timingcontroller11 <= (timingcontroller11 - 1'd1);
		end
		if ((timingcontroller12 > 1'd0)) begin
			timingcontroller12 <= (timingcontroller12 - 1'd1);
		end
		if ((timingcontroller13 > 1'd0)) begin
			timingcontroller13 <= (timingcontroller13 - 1'd1);
		end
		if ((timingcontroller14 > 1'd0)) begin
			timingcontroller14 <= (timingcontroller14 - 1'd1);
		end
		if ((timingcontroller15 > 1'd0)) begin
			timingcontroller15 <= (timingcontroller15 - 1'd1);
		end
	end
	case (bankstatetracker_cmd_decoded)
		2'd2: begin
			cases_lhs_array_muxed10 = 1'd0;
			case (bankstatetracker_bank_group)
				1'd0: begin
					cases_lhs_array_muxed11 = cases_lhs_array_muxed10;
					case (bankstatetracker_bank)
						1'd0: begin
							bankstatetracker0 <= cases_lhs_array_muxed11;
						end
						1'd1: begin
							bankstatetracker1 <= cases_lhs_array_muxed11;
						end
						2'd2: begin
							bankstatetracker2 <= cases_lhs_array_muxed11;
						end
						default: begin
							bankstatetracker3 <= cases_lhs_array_muxed11;
						end
					endcase
				end
				1'd1: begin
					cases_lhs_array_muxed12 = cases_lhs_array_muxed10;
					case (bankstatetracker_bank)
						1'd0: begin
							bankstatetracker4 <= cases_lhs_array_muxed12;
						end
						1'd1: begin
							bankstatetracker5 <= cases_lhs_array_muxed12;
						end
						2'd2: begin
							bankstatetracker6 <= cases_lhs_array_muxed12;
						end
						default: begin
							bankstatetracker7 <= cases_lhs_array_muxed12;
						end
					endcase
				end
				2'd2: begin
					cases_lhs_array_muxed13 = cases_lhs_array_muxed10;
					case (bankstatetracker_bank)
						1'd0: begin
							bankstatetracker8 <= cases_lhs_array_muxed13;
						end
						1'd1: begin
							bankstatetracker9 <= cases_lhs_array_muxed13;
						end
						2'd2: begin
							bankstatetracker10 <= cases_lhs_array_muxed13;
						end
						default: begin
							bankstatetracker11 <= cases_lhs_array_muxed13;
						end
					endcase
				end
				default: begin
					cases_lhs_array_muxed14 = cases_lhs_array_muxed10;
					case (bankstatetracker_bank)
						1'd0: begin
							bankstatetracker12 <= cases_lhs_array_muxed14;
						end
						1'd1: begin
							bankstatetracker13 <= cases_lhs_array_muxed14;
						end
						2'd2: begin
							bankstatetracker14 <= cases_lhs_array_muxed14;
						end
						default: begin
							bankstatetracker15 <= cases_lhs_array_muxed14;
						end
					endcase
				end
			endcase
		end
		2'd3: begin
			cases_lhs_array_muxed0 = 1'd1;
			case (bankstatetracker_bank_group)
				1'd0: begin
					cases_lhs_array_muxed1 = cases_lhs_array_muxed0;
					case (bankstatetracker_bank)
						1'd0: begin
							bankstatetracker0 <= cases_lhs_array_muxed1;
						end
						1'd1: begin
							bankstatetracker1 <= cases_lhs_array_muxed1;
						end
						2'd2: begin
							bankstatetracker2 <= cases_lhs_array_muxed1;
						end
						default: begin
							bankstatetracker3 <= cases_lhs_array_muxed1;
						end
					endcase
				end
				1'd1: begin
					cases_lhs_array_muxed2 = cases_lhs_array_muxed0;
					case (bankstatetracker_bank)
						1'd0: begin
							bankstatetracker4 <= cases_lhs_array_muxed2;
						end
						1'd1: begin
							bankstatetracker5 <= cases_lhs_array_muxed2;
						end
						2'd2: begin
							bankstatetracker6 <= cases_lhs_array_muxed2;
						end
						default: begin
							bankstatetracker7 <= cases_lhs_array_muxed2;
						end
					endcase
				end
				2'd2: begin
					cases_lhs_array_muxed3 = cases_lhs_array_muxed0;
					case (bankstatetracker_bank)
						1'd0: begin
							bankstatetracker8 <= cases_lhs_array_muxed3;
						end
						1'd1: begin
							bankstatetracker9 <= cases_lhs_array_muxed3;
						end
						2'd2: begin
							bankstatetracker10 <= cases_lhs_array_muxed3;
						end
						default: begin
							bankstatetracker11 <= cases_lhs_array_muxed3;
						end
					endcase
				end
				default: begin
					cases_lhs_array_muxed4 = cases_lhs_array_muxed0;
					case (bankstatetracker_bank)
						1'd0: begin
							bankstatetracker12 <= cases_lhs_array_muxed4;
						end
						1'd1: begin
							bankstatetracker13 <= cases_lhs_array_muxed4;
						end
						2'd2: begin
							bankstatetracker14 <= cases_lhs_array_muxed4;
						end
						default: begin
							bankstatetracker15 <= cases_lhs_array_muxed4;
						end
					endcase
				end
			endcase
			cases_lhs_array_muxed5 = bankstatetracker_row;
			case (bankstatetracker_bank_group)
				1'd0: begin
					cases_lhs_array_muxed6 = cases_lhs_array_muxed5;
					case (bankstatetracker_bank)
						1'd0: begin
							bankstatetracker16 <= cases_lhs_array_muxed6;
						end
						1'd1: begin
							bankstatetracker17 <= cases_lhs_array_muxed6;
						end
						2'd2: begin
							bankstatetracker18 <= cases_lhs_array_muxed6;
						end
						default: begin
							bankstatetracker19 <= cases_lhs_array_muxed6;
						end
					endcase
				end
				1'd1: begin
					cases_lhs_array_muxed7 = cases_lhs_array_muxed5;
					case (bankstatetracker_bank)
						1'd0: begin
							bankstatetracker20 <= cases_lhs_array_muxed7;
						end
						1'd1: begin
							bankstatetracker21 <= cases_lhs_array_muxed7;
						end
						2'd2: begin
							bankstatetracker22 <= cases_lhs_array_muxed7;
						end
						default: begin
							bankstatetracker23 <= cases_lhs_array_muxed7;
						end
					endcase
				end
				2'd2: begin
					cases_lhs_array_muxed8 = cases_lhs_array_muxed5;
					case (bankstatetracker_bank)
						1'd0: begin
							bankstatetracker24 <= cases_lhs_array_muxed8;
						end
						1'd1: begin
							bankstatetracker25 <= cases_lhs_array_muxed8;
						end
						2'd2: begin
							bankstatetracker26 <= cases_lhs_array_muxed8;
						end
						default: begin
							bankstatetracker27 <= cases_lhs_array_muxed8;
						end
					endcase
				end
				default: begin
					cases_lhs_array_muxed9 = cases_lhs_array_muxed5;
					case (bankstatetracker_bank)
						1'd0: begin
							bankstatetracker28 <= cases_lhs_array_muxed9;
						end
						1'd1: begin
							bankstatetracker29 <= cases_lhs_array_muxed9;
						end
						2'd2: begin
							bankstatetracker30 <= cases_lhs_array_muxed9;
						end
						default: begin
							bankstatetracker31 <= cases_lhs_array_muxed9;
						end
					endcase
				end
			endcase
		end
		3'd4: begin
			cases_lhs_array_muxed20 = 2'd3;
			case (bankstatetracker_bank_group)
				1'd0: begin
					cases_lhs_array_muxed21 = cases_lhs_array_muxed20;
					case (bankstatetracker_bank)
						1'd0: begin
							bankstatetracker0 <= cases_lhs_array_muxed21;
						end
						1'd1: begin
							bankstatetracker1 <= cases_lhs_array_muxed21;
						end
						2'd2: begin
							bankstatetracker2 <= cases_lhs_array_muxed21;
						end
						default: begin
							bankstatetracker3 <= cases_lhs_array_muxed21;
						end
					endcase
				end
				1'd1: begin
					cases_lhs_array_muxed22 = cases_lhs_array_muxed20;
					case (bankstatetracker_bank)
						1'd0: begin
							bankstatetracker4 <= cases_lhs_array_muxed22;
						end
						1'd1: begin
							bankstatetracker5 <= cases_lhs_array_muxed22;
						end
						2'd2: begin
							bankstatetracker6 <= cases_lhs_array_muxed22;
						end
						default: begin
							bankstatetracker7 <= cases_lhs_array_muxed22;
						end
					endcase
				end
				2'd2: begin
					cases_lhs_array_muxed23 = cases_lhs_array_muxed20;
					case (bankstatetracker_bank)
						1'd0: begin
							bankstatetracker8 <= cases_lhs_array_muxed23;
						end
						1'd1: begin
							bankstatetracker9 <= cases_lhs_array_muxed23;
						end
						2'd2: begin
							bankstatetracker10 <= cases_lhs_array_muxed23;
						end
						default: begin
							bankstatetracker11 <= cases_lhs_array_muxed23;
						end
					endcase
				end
				default: begin
					cases_lhs_array_muxed24 = cases_lhs_array_muxed20;
					case (bankstatetracker_bank)
						1'd0: begin
							bankstatetracker12 <= cases_lhs_array_muxed24;
						end
						1'd1: begin
							bankstatetracker13 <= cases_lhs_array_muxed24;
						end
						2'd2: begin
							bankstatetracker14 <= cases_lhs_array_muxed24;
						end
						default: begin
							bankstatetracker15 <= cases_lhs_array_muxed24;
						end
					endcase
				end
			endcase
		end
		3'd5: begin
			cases_lhs_array_muxed15 = 2'd2;
			case (bankstatetracker_bank_group)
				1'd0: begin
					cases_lhs_array_muxed16 = cases_lhs_array_muxed15;
					case (bankstatetracker_bank)
						1'd0: begin
							bankstatetracker0 <= cases_lhs_array_muxed16;
						end
						1'd1: begin
							bankstatetracker1 <= cases_lhs_array_muxed16;
						end
						2'd2: begin
							bankstatetracker2 <= cases_lhs_array_muxed16;
						end
						default: begin
							bankstatetracker3 <= cases_lhs_array_muxed16;
						end
					endcase
				end
				1'd1: begin
					cases_lhs_array_muxed17 = cases_lhs_array_muxed15;
					case (bankstatetracker_bank)
						1'd0: begin
							bankstatetracker4 <= cases_lhs_array_muxed17;
						end
						1'd1: begin
							bankstatetracker5 <= cases_lhs_array_muxed17;
						end
						2'd2: begin
							bankstatetracker6 <= cases_lhs_array_muxed17;
						end
						default: begin
							bankstatetracker7 <= cases_lhs_array_muxed17;
						end
					endcase
				end
				2'd2: begin
					cases_lhs_array_muxed18 = cases_lhs_array_muxed15;
					case (bankstatetracker_bank)
						1'd0: begin
							bankstatetracker8 <= cases_lhs_array_muxed18;
						end
						1'd1: begin
							bankstatetracker9 <= cases_lhs_array_muxed18;
						end
						2'd2: begin
							bankstatetracker10 <= cases_lhs_array_muxed18;
						end
						default: begin
							bankstatetracker11 <= cases_lhs_array_muxed18;
						end
					endcase
				end
				default: begin
					cases_lhs_array_muxed19 = cases_lhs_array_muxed15;
					case (bankstatetracker_bank)
						1'd0: begin
							bankstatetracker12 <= cases_lhs_array_muxed19;
						end
						1'd1: begin
							bankstatetracker13 <= cases_lhs_array_muxed19;
						end
						2'd2: begin
							bankstatetracker14 <= cases_lhs_array_muxed19;
						end
						default: begin
							bankstatetracker15 <= cases_lhs_array_muxed19;
						end
					endcase
				end
			endcase
		end
	endcase
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
	if (refreshmanager0_refresh) begin
		refreshmanager0_refresh_in_progress <= 1'd1;
		refreshmanager0_counter <= 1'd0;
	end else begin
		if (refreshmanager0_refresh_in_progress) begin
			if ((refreshmanager0_counter >= 9'd350)) begin
				refreshmanager0_refresh_in_progress <= 1'd0;
				refreshmanager0_refresh_done <= 1'd1;
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
				refreshmanager0_refresh_done <= 1'd0;
			end
		end
	end
	if ((commandscheduler_cmd_valid & (~commandscheduler_cmd_ready))) begin
		if ((t_basiclowerer_array_muxed0 != t_basiclowerer_array_muxed1)) begin
			t_basiclowerer_lhs_array_muxed0 = {commandscheduler_col, commandscheduler_row, commandscheduler_cmd_type};
			case (((commandscheduler_bank_group * 3'd4) + commandscheduler_bank))
				1'd0: begin
					t_basiclowerer_lhs_array_muxed1 = t_basiclowerer_lhs_array_muxed0;
					case (((commandscheduler_bank_group * 3'd4) + commandscheduler_bank))
						1'd0: begin
							commandscheduler528 <= t_basiclowerer_lhs_array_muxed2;
						end
						1'd1: begin
							commandscheduler529 <= t_basiclowerer_lhs_array_muxed2;
						end
						2'd2: begin
							commandscheduler530 <= t_basiclowerer_lhs_array_muxed2;
						end
						2'd3: begin
							commandscheduler531 <= t_basiclowerer_lhs_array_muxed2;
						end
						3'd4: begin
							commandscheduler532 <= t_basiclowerer_lhs_array_muxed2;
						end
						3'd5: begin
							commandscheduler533 <= t_basiclowerer_lhs_array_muxed2;
						end
						3'd6: begin
							commandscheduler534 <= t_basiclowerer_lhs_array_muxed2;
						end
						3'd7: begin
							commandscheduler535 <= t_basiclowerer_lhs_array_muxed2;
						end
						4'd8: begin
							commandscheduler536 <= t_basiclowerer_lhs_array_muxed2;
						end
						4'd9: begin
							commandscheduler537 <= t_basiclowerer_lhs_array_muxed2;
						end
						4'd10: begin
							commandscheduler538 <= t_basiclowerer_lhs_array_muxed2;
						end
						4'd11: begin
							commandscheduler539 <= t_basiclowerer_lhs_array_muxed2;
						end
						4'd12: begin
							commandscheduler540 <= t_basiclowerer_lhs_array_muxed2;
						end
						4'd13: begin
							commandscheduler541 <= t_basiclowerer_lhs_array_muxed2;
						end
						4'd14: begin
							commandscheduler542 <= t_basiclowerer_lhs_array_muxed2;
						end
						default: begin
							commandscheduler543 <= t_basiclowerer_lhs_array_muxed2;
						end
					endcase
					case (t_basiclowerer_lhs_array_muxed2)
						1'd0: begin
							commandscheduler0 <= t_basiclowerer_lhs_array_muxed1;
						end
						1'd1: begin
							commandscheduler1 <= t_basiclowerer_lhs_array_muxed1;
						end
						2'd2: begin
							commandscheduler2 <= t_basiclowerer_lhs_array_muxed1;
						end
						2'd3: begin
							commandscheduler3 <= t_basiclowerer_lhs_array_muxed1;
						end
						3'd4: begin
							commandscheduler4 <= t_basiclowerer_lhs_array_muxed1;
						end
						3'd5: begin
							commandscheduler5 <= t_basiclowerer_lhs_array_muxed1;
						end
						3'd6: begin
							commandscheduler6 <= t_basiclowerer_lhs_array_muxed1;
						end
						3'd7: begin
							commandscheduler7 <= t_basiclowerer_lhs_array_muxed1;
						end
						4'd8: begin
							commandscheduler8 <= t_basiclowerer_lhs_array_muxed1;
						end
						4'd9: begin
							commandscheduler9 <= t_basiclowerer_lhs_array_muxed1;
						end
						4'd10: begin
							commandscheduler10 <= t_basiclowerer_lhs_array_muxed1;
						end
						4'd11: begin
							commandscheduler11 <= t_basiclowerer_lhs_array_muxed1;
						end
						4'd12: begin
							commandscheduler12 <= t_basiclowerer_lhs_array_muxed1;
						end
						4'd13: begin
							commandscheduler13 <= t_basiclowerer_lhs_array_muxed1;
						end
						4'd14: begin
							commandscheduler14 <= t_basiclowerer_lhs_array_muxed1;
						end
						4'd15: begin
							commandscheduler15 <= t_basiclowerer_lhs_array_muxed1;
						end
						5'd16: begin
							commandscheduler16 <= t_basiclowerer_lhs_array_muxed1;
						end
						5'd17: begin
							commandscheduler17 <= t_basiclowerer_lhs_array_muxed1;
						end
						5'd18: begin
							commandscheduler18 <= t_basiclowerer_lhs_array_muxed1;
						end
						5'd19: begin
							commandscheduler19 <= t_basiclowerer_lhs_array_muxed1;
						end
						5'd20: begin
							commandscheduler20 <= t_basiclowerer_lhs_array_muxed1;
						end
						5'd21: begin
							commandscheduler21 <= t_basiclowerer_lhs_array_muxed1;
						end
						5'd22: begin
							commandscheduler22 <= t_basiclowerer_lhs_array_muxed1;
						end
						5'd23: begin
							commandscheduler23 <= t_basiclowerer_lhs_array_muxed1;
						end
						5'd24: begin
							commandscheduler24 <= t_basiclowerer_lhs_array_muxed1;
						end
						5'd25: begin
							commandscheduler25 <= t_basiclowerer_lhs_array_muxed1;
						end
						5'd26: begin
							commandscheduler26 <= t_basiclowerer_lhs_array_muxed1;
						end
						5'd27: begin
							commandscheduler27 <= t_basiclowerer_lhs_array_muxed1;
						end
						5'd28: begin
							commandscheduler28 <= t_basiclowerer_lhs_array_muxed1;
						end
						5'd29: begin
							commandscheduler29 <= t_basiclowerer_lhs_array_muxed1;
						end
						5'd30: begin
							commandscheduler30 <= t_basiclowerer_lhs_array_muxed1;
						end
						default: begin
							commandscheduler31 <= t_basiclowerer_lhs_array_muxed1;
						end
					endcase
				end
				1'd1: begin
					t_basiclowerer_lhs_array_muxed3 = t_basiclowerer_lhs_array_muxed0;
					case (((commandscheduler_bank_group * 3'd4) + commandscheduler_bank))
						1'd0: begin
							commandscheduler528 <= t_basiclowerer_lhs_array_muxed4;
						end
						1'd1: begin
							commandscheduler529 <= t_basiclowerer_lhs_array_muxed4;
						end
						2'd2: begin
							commandscheduler530 <= t_basiclowerer_lhs_array_muxed4;
						end
						2'd3: begin
							commandscheduler531 <= t_basiclowerer_lhs_array_muxed4;
						end
						3'd4: begin
							commandscheduler532 <= t_basiclowerer_lhs_array_muxed4;
						end
						3'd5: begin
							commandscheduler533 <= t_basiclowerer_lhs_array_muxed4;
						end
						3'd6: begin
							commandscheduler534 <= t_basiclowerer_lhs_array_muxed4;
						end
						3'd7: begin
							commandscheduler535 <= t_basiclowerer_lhs_array_muxed4;
						end
						4'd8: begin
							commandscheduler536 <= t_basiclowerer_lhs_array_muxed4;
						end
						4'd9: begin
							commandscheduler537 <= t_basiclowerer_lhs_array_muxed4;
						end
						4'd10: begin
							commandscheduler538 <= t_basiclowerer_lhs_array_muxed4;
						end
						4'd11: begin
							commandscheduler539 <= t_basiclowerer_lhs_array_muxed4;
						end
						4'd12: begin
							commandscheduler540 <= t_basiclowerer_lhs_array_muxed4;
						end
						4'd13: begin
							commandscheduler541 <= t_basiclowerer_lhs_array_muxed4;
						end
						4'd14: begin
							commandscheduler542 <= t_basiclowerer_lhs_array_muxed4;
						end
						default: begin
							commandscheduler543 <= t_basiclowerer_lhs_array_muxed4;
						end
					endcase
					case (t_basiclowerer_lhs_array_muxed4)
						1'd0: begin
							commandscheduler32 <= t_basiclowerer_lhs_array_muxed3;
						end
						1'd1: begin
							commandscheduler33 <= t_basiclowerer_lhs_array_muxed3;
						end
						2'd2: begin
							commandscheduler34 <= t_basiclowerer_lhs_array_muxed3;
						end
						2'd3: begin
							commandscheduler35 <= t_basiclowerer_lhs_array_muxed3;
						end
						3'd4: begin
							commandscheduler36 <= t_basiclowerer_lhs_array_muxed3;
						end
						3'd5: begin
							commandscheduler37 <= t_basiclowerer_lhs_array_muxed3;
						end
						3'd6: begin
							commandscheduler38 <= t_basiclowerer_lhs_array_muxed3;
						end
						3'd7: begin
							commandscheduler39 <= t_basiclowerer_lhs_array_muxed3;
						end
						4'd8: begin
							commandscheduler40 <= t_basiclowerer_lhs_array_muxed3;
						end
						4'd9: begin
							commandscheduler41 <= t_basiclowerer_lhs_array_muxed3;
						end
						4'd10: begin
							commandscheduler42 <= t_basiclowerer_lhs_array_muxed3;
						end
						4'd11: begin
							commandscheduler43 <= t_basiclowerer_lhs_array_muxed3;
						end
						4'd12: begin
							commandscheduler44 <= t_basiclowerer_lhs_array_muxed3;
						end
						4'd13: begin
							commandscheduler45 <= t_basiclowerer_lhs_array_muxed3;
						end
						4'd14: begin
							commandscheduler46 <= t_basiclowerer_lhs_array_muxed3;
						end
						4'd15: begin
							commandscheduler47 <= t_basiclowerer_lhs_array_muxed3;
						end
						5'd16: begin
							commandscheduler48 <= t_basiclowerer_lhs_array_muxed3;
						end
						5'd17: begin
							commandscheduler49 <= t_basiclowerer_lhs_array_muxed3;
						end
						5'd18: begin
							commandscheduler50 <= t_basiclowerer_lhs_array_muxed3;
						end
						5'd19: begin
							commandscheduler51 <= t_basiclowerer_lhs_array_muxed3;
						end
						5'd20: begin
							commandscheduler52 <= t_basiclowerer_lhs_array_muxed3;
						end
						5'd21: begin
							commandscheduler53 <= t_basiclowerer_lhs_array_muxed3;
						end
						5'd22: begin
							commandscheduler54 <= t_basiclowerer_lhs_array_muxed3;
						end
						5'd23: begin
							commandscheduler55 <= t_basiclowerer_lhs_array_muxed3;
						end
						5'd24: begin
							commandscheduler56 <= t_basiclowerer_lhs_array_muxed3;
						end
						5'd25: begin
							commandscheduler57 <= t_basiclowerer_lhs_array_muxed3;
						end
						5'd26: begin
							commandscheduler58 <= t_basiclowerer_lhs_array_muxed3;
						end
						5'd27: begin
							commandscheduler59 <= t_basiclowerer_lhs_array_muxed3;
						end
						5'd28: begin
							commandscheduler60 <= t_basiclowerer_lhs_array_muxed3;
						end
						5'd29: begin
							commandscheduler61 <= t_basiclowerer_lhs_array_muxed3;
						end
						5'd30: begin
							commandscheduler62 <= t_basiclowerer_lhs_array_muxed3;
						end
						default: begin
							commandscheduler63 <= t_basiclowerer_lhs_array_muxed3;
						end
					endcase
				end
				2'd2: begin
					t_basiclowerer_lhs_array_muxed5 = t_basiclowerer_lhs_array_muxed0;
					case (((commandscheduler_bank_group * 3'd4) + commandscheduler_bank))
						1'd0: begin
							commandscheduler528 <= t_basiclowerer_lhs_array_muxed6;
						end
						1'd1: begin
							commandscheduler529 <= t_basiclowerer_lhs_array_muxed6;
						end
						2'd2: begin
							commandscheduler530 <= t_basiclowerer_lhs_array_muxed6;
						end
						2'd3: begin
							commandscheduler531 <= t_basiclowerer_lhs_array_muxed6;
						end
						3'd4: begin
							commandscheduler532 <= t_basiclowerer_lhs_array_muxed6;
						end
						3'd5: begin
							commandscheduler533 <= t_basiclowerer_lhs_array_muxed6;
						end
						3'd6: begin
							commandscheduler534 <= t_basiclowerer_lhs_array_muxed6;
						end
						3'd7: begin
							commandscheduler535 <= t_basiclowerer_lhs_array_muxed6;
						end
						4'd8: begin
							commandscheduler536 <= t_basiclowerer_lhs_array_muxed6;
						end
						4'd9: begin
							commandscheduler537 <= t_basiclowerer_lhs_array_muxed6;
						end
						4'd10: begin
							commandscheduler538 <= t_basiclowerer_lhs_array_muxed6;
						end
						4'd11: begin
							commandscheduler539 <= t_basiclowerer_lhs_array_muxed6;
						end
						4'd12: begin
							commandscheduler540 <= t_basiclowerer_lhs_array_muxed6;
						end
						4'd13: begin
							commandscheduler541 <= t_basiclowerer_lhs_array_muxed6;
						end
						4'd14: begin
							commandscheduler542 <= t_basiclowerer_lhs_array_muxed6;
						end
						default: begin
							commandscheduler543 <= t_basiclowerer_lhs_array_muxed6;
						end
					endcase
					case (t_basiclowerer_lhs_array_muxed6)
						1'd0: begin
							commandscheduler64 <= t_basiclowerer_lhs_array_muxed5;
						end
						1'd1: begin
							commandscheduler65 <= t_basiclowerer_lhs_array_muxed5;
						end
						2'd2: begin
							commandscheduler66 <= t_basiclowerer_lhs_array_muxed5;
						end
						2'd3: begin
							commandscheduler67 <= t_basiclowerer_lhs_array_muxed5;
						end
						3'd4: begin
							commandscheduler68 <= t_basiclowerer_lhs_array_muxed5;
						end
						3'd5: begin
							commandscheduler69 <= t_basiclowerer_lhs_array_muxed5;
						end
						3'd6: begin
							commandscheduler70 <= t_basiclowerer_lhs_array_muxed5;
						end
						3'd7: begin
							commandscheduler71 <= t_basiclowerer_lhs_array_muxed5;
						end
						4'd8: begin
							commandscheduler72 <= t_basiclowerer_lhs_array_muxed5;
						end
						4'd9: begin
							commandscheduler73 <= t_basiclowerer_lhs_array_muxed5;
						end
						4'd10: begin
							commandscheduler74 <= t_basiclowerer_lhs_array_muxed5;
						end
						4'd11: begin
							commandscheduler75 <= t_basiclowerer_lhs_array_muxed5;
						end
						4'd12: begin
							commandscheduler76 <= t_basiclowerer_lhs_array_muxed5;
						end
						4'd13: begin
							commandscheduler77 <= t_basiclowerer_lhs_array_muxed5;
						end
						4'd14: begin
							commandscheduler78 <= t_basiclowerer_lhs_array_muxed5;
						end
						4'd15: begin
							commandscheduler79 <= t_basiclowerer_lhs_array_muxed5;
						end
						5'd16: begin
							commandscheduler80 <= t_basiclowerer_lhs_array_muxed5;
						end
						5'd17: begin
							commandscheduler81 <= t_basiclowerer_lhs_array_muxed5;
						end
						5'd18: begin
							commandscheduler82 <= t_basiclowerer_lhs_array_muxed5;
						end
						5'd19: begin
							commandscheduler83 <= t_basiclowerer_lhs_array_muxed5;
						end
						5'd20: begin
							commandscheduler84 <= t_basiclowerer_lhs_array_muxed5;
						end
						5'd21: begin
							commandscheduler85 <= t_basiclowerer_lhs_array_muxed5;
						end
						5'd22: begin
							commandscheduler86 <= t_basiclowerer_lhs_array_muxed5;
						end
						5'd23: begin
							commandscheduler87 <= t_basiclowerer_lhs_array_muxed5;
						end
						5'd24: begin
							commandscheduler88 <= t_basiclowerer_lhs_array_muxed5;
						end
						5'd25: begin
							commandscheduler89 <= t_basiclowerer_lhs_array_muxed5;
						end
						5'd26: begin
							commandscheduler90 <= t_basiclowerer_lhs_array_muxed5;
						end
						5'd27: begin
							commandscheduler91 <= t_basiclowerer_lhs_array_muxed5;
						end
						5'd28: begin
							commandscheduler92 <= t_basiclowerer_lhs_array_muxed5;
						end
						5'd29: begin
							commandscheduler93 <= t_basiclowerer_lhs_array_muxed5;
						end
						5'd30: begin
							commandscheduler94 <= t_basiclowerer_lhs_array_muxed5;
						end
						default: begin
							commandscheduler95 <= t_basiclowerer_lhs_array_muxed5;
						end
					endcase
				end
				2'd3: begin
					t_basiclowerer_lhs_array_muxed7 = t_basiclowerer_lhs_array_muxed0;
					case (((commandscheduler_bank_group * 3'd4) + commandscheduler_bank))
						1'd0: begin
							commandscheduler528 <= t_basiclowerer_lhs_array_muxed8;
						end
						1'd1: begin
							commandscheduler529 <= t_basiclowerer_lhs_array_muxed8;
						end
						2'd2: begin
							commandscheduler530 <= t_basiclowerer_lhs_array_muxed8;
						end
						2'd3: begin
							commandscheduler531 <= t_basiclowerer_lhs_array_muxed8;
						end
						3'd4: begin
							commandscheduler532 <= t_basiclowerer_lhs_array_muxed8;
						end
						3'd5: begin
							commandscheduler533 <= t_basiclowerer_lhs_array_muxed8;
						end
						3'd6: begin
							commandscheduler534 <= t_basiclowerer_lhs_array_muxed8;
						end
						3'd7: begin
							commandscheduler535 <= t_basiclowerer_lhs_array_muxed8;
						end
						4'd8: begin
							commandscheduler536 <= t_basiclowerer_lhs_array_muxed8;
						end
						4'd9: begin
							commandscheduler537 <= t_basiclowerer_lhs_array_muxed8;
						end
						4'd10: begin
							commandscheduler538 <= t_basiclowerer_lhs_array_muxed8;
						end
						4'd11: begin
							commandscheduler539 <= t_basiclowerer_lhs_array_muxed8;
						end
						4'd12: begin
							commandscheduler540 <= t_basiclowerer_lhs_array_muxed8;
						end
						4'd13: begin
							commandscheduler541 <= t_basiclowerer_lhs_array_muxed8;
						end
						4'd14: begin
							commandscheduler542 <= t_basiclowerer_lhs_array_muxed8;
						end
						default: begin
							commandscheduler543 <= t_basiclowerer_lhs_array_muxed8;
						end
					endcase
					case (t_basiclowerer_lhs_array_muxed8)
						1'd0: begin
							commandscheduler96 <= t_basiclowerer_lhs_array_muxed7;
						end
						1'd1: begin
							commandscheduler97 <= t_basiclowerer_lhs_array_muxed7;
						end
						2'd2: begin
							commandscheduler98 <= t_basiclowerer_lhs_array_muxed7;
						end
						2'd3: begin
							commandscheduler99 <= t_basiclowerer_lhs_array_muxed7;
						end
						3'd4: begin
							commandscheduler100 <= t_basiclowerer_lhs_array_muxed7;
						end
						3'd5: begin
							commandscheduler101 <= t_basiclowerer_lhs_array_muxed7;
						end
						3'd6: begin
							commandscheduler102 <= t_basiclowerer_lhs_array_muxed7;
						end
						3'd7: begin
							commandscheduler103 <= t_basiclowerer_lhs_array_muxed7;
						end
						4'd8: begin
							commandscheduler104 <= t_basiclowerer_lhs_array_muxed7;
						end
						4'd9: begin
							commandscheduler105 <= t_basiclowerer_lhs_array_muxed7;
						end
						4'd10: begin
							commandscheduler106 <= t_basiclowerer_lhs_array_muxed7;
						end
						4'd11: begin
							commandscheduler107 <= t_basiclowerer_lhs_array_muxed7;
						end
						4'd12: begin
							commandscheduler108 <= t_basiclowerer_lhs_array_muxed7;
						end
						4'd13: begin
							commandscheduler109 <= t_basiclowerer_lhs_array_muxed7;
						end
						4'd14: begin
							commandscheduler110 <= t_basiclowerer_lhs_array_muxed7;
						end
						4'd15: begin
							commandscheduler111 <= t_basiclowerer_lhs_array_muxed7;
						end
						5'd16: begin
							commandscheduler112 <= t_basiclowerer_lhs_array_muxed7;
						end
						5'd17: begin
							commandscheduler113 <= t_basiclowerer_lhs_array_muxed7;
						end
						5'd18: begin
							commandscheduler114 <= t_basiclowerer_lhs_array_muxed7;
						end
						5'd19: begin
							commandscheduler115 <= t_basiclowerer_lhs_array_muxed7;
						end
						5'd20: begin
							commandscheduler116 <= t_basiclowerer_lhs_array_muxed7;
						end
						5'd21: begin
							commandscheduler117 <= t_basiclowerer_lhs_array_muxed7;
						end
						5'd22: begin
							commandscheduler118 <= t_basiclowerer_lhs_array_muxed7;
						end
						5'd23: begin
							commandscheduler119 <= t_basiclowerer_lhs_array_muxed7;
						end
						5'd24: begin
							commandscheduler120 <= t_basiclowerer_lhs_array_muxed7;
						end
						5'd25: begin
							commandscheduler121 <= t_basiclowerer_lhs_array_muxed7;
						end
						5'd26: begin
							commandscheduler122 <= t_basiclowerer_lhs_array_muxed7;
						end
						5'd27: begin
							commandscheduler123 <= t_basiclowerer_lhs_array_muxed7;
						end
						5'd28: begin
							commandscheduler124 <= t_basiclowerer_lhs_array_muxed7;
						end
						5'd29: begin
							commandscheduler125 <= t_basiclowerer_lhs_array_muxed7;
						end
						5'd30: begin
							commandscheduler126 <= t_basiclowerer_lhs_array_muxed7;
						end
						default: begin
							commandscheduler127 <= t_basiclowerer_lhs_array_muxed7;
						end
					endcase
				end
				3'd4: begin
					t_basiclowerer_lhs_array_muxed9 = t_basiclowerer_lhs_array_muxed0;
					case (((commandscheduler_bank_group * 3'd4) + commandscheduler_bank))
						1'd0: begin
							commandscheduler528 <= t_basiclowerer_lhs_array_muxed10;
						end
						1'd1: begin
							commandscheduler529 <= t_basiclowerer_lhs_array_muxed10;
						end
						2'd2: begin
							commandscheduler530 <= t_basiclowerer_lhs_array_muxed10;
						end
						2'd3: begin
							commandscheduler531 <= t_basiclowerer_lhs_array_muxed10;
						end
						3'd4: begin
							commandscheduler532 <= t_basiclowerer_lhs_array_muxed10;
						end
						3'd5: begin
							commandscheduler533 <= t_basiclowerer_lhs_array_muxed10;
						end
						3'd6: begin
							commandscheduler534 <= t_basiclowerer_lhs_array_muxed10;
						end
						3'd7: begin
							commandscheduler535 <= t_basiclowerer_lhs_array_muxed10;
						end
						4'd8: begin
							commandscheduler536 <= t_basiclowerer_lhs_array_muxed10;
						end
						4'd9: begin
							commandscheduler537 <= t_basiclowerer_lhs_array_muxed10;
						end
						4'd10: begin
							commandscheduler538 <= t_basiclowerer_lhs_array_muxed10;
						end
						4'd11: begin
							commandscheduler539 <= t_basiclowerer_lhs_array_muxed10;
						end
						4'd12: begin
							commandscheduler540 <= t_basiclowerer_lhs_array_muxed10;
						end
						4'd13: begin
							commandscheduler541 <= t_basiclowerer_lhs_array_muxed10;
						end
						4'd14: begin
							commandscheduler542 <= t_basiclowerer_lhs_array_muxed10;
						end
						default: begin
							commandscheduler543 <= t_basiclowerer_lhs_array_muxed10;
						end
					endcase
					case (t_basiclowerer_lhs_array_muxed10)
						1'd0: begin
							commandscheduler128 <= t_basiclowerer_lhs_array_muxed9;
						end
						1'd1: begin
							commandscheduler129 <= t_basiclowerer_lhs_array_muxed9;
						end
						2'd2: begin
							commandscheduler130 <= t_basiclowerer_lhs_array_muxed9;
						end
						2'd3: begin
							commandscheduler131 <= t_basiclowerer_lhs_array_muxed9;
						end
						3'd4: begin
							commandscheduler132 <= t_basiclowerer_lhs_array_muxed9;
						end
						3'd5: begin
							commandscheduler133 <= t_basiclowerer_lhs_array_muxed9;
						end
						3'd6: begin
							commandscheduler134 <= t_basiclowerer_lhs_array_muxed9;
						end
						3'd7: begin
							commandscheduler135 <= t_basiclowerer_lhs_array_muxed9;
						end
						4'd8: begin
							commandscheduler136 <= t_basiclowerer_lhs_array_muxed9;
						end
						4'd9: begin
							commandscheduler137 <= t_basiclowerer_lhs_array_muxed9;
						end
						4'd10: begin
							commandscheduler138 <= t_basiclowerer_lhs_array_muxed9;
						end
						4'd11: begin
							commandscheduler139 <= t_basiclowerer_lhs_array_muxed9;
						end
						4'd12: begin
							commandscheduler140 <= t_basiclowerer_lhs_array_muxed9;
						end
						4'd13: begin
							commandscheduler141 <= t_basiclowerer_lhs_array_muxed9;
						end
						4'd14: begin
							commandscheduler142 <= t_basiclowerer_lhs_array_muxed9;
						end
						4'd15: begin
							commandscheduler143 <= t_basiclowerer_lhs_array_muxed9;
						end
						5'd16: begin
							commandscheduler144 <= t_basiclowerer_lhs_array_muxed9;
						end
						5'd17: begin
							commandscheduler145 <= t_basiclowerer_lhs_array_muxed9;
						end
						5'd18: begin
							commandscheduler146 <= t_basiclowerer_lhs_array_muxed9;
						end
						5'd19: begin
							commandscheduler147 <= t_basiclowerer_lhs_array_muxed9;
						end
						5'd20: begin
							commandscheduler148 <= t_basiclowerer_lhs_array_muxed9;
						end
						5'd21: begin
							commandscheduler149 <= t_basiclowerer_lhs_array_muxed9;
						end
						5'd22: begin
							commandscheduler150 <= t_basiclowerer_lhs_array_muxed9;
						end
						5'd23: begin
							commandscheduler151 <= t_basiclowerer_lhs_array_muxed9;
						end
						5'd24: begin
							commandscheduler152 <= t_basiclowerer_lhs_array_muxed9;
						end
						5'd25: begin
							commandscheduler153 <= t_basiclowerer_lhs_array_muxed9;
						end
						5'd26: begin
							commandscheduler154 <= t_basiclowerer_lhs_array_muxed9;
						end
						5'd27: begin
							commandscheduler155 <= t_basiclowerer_lhs_array_muxed9;
						end
						5'd28: begin
							commandscheduler156 <= t_basiclowerer_lhs_array_muxed9;
						end
						5'd29: begin
							commandscheduler157 <= t_basiclowerer_lhs_array_muxed9;
						end
						5'd30: begin
							commandscheduler158 <= t_basiclowerer_lhs_array_muxed9;
						end
						default: begin
							commandscheduler159 <= t_basiclowerer_lhs_array_muxed9;
						end
					endcase
				end
				3'd5: begin
					t_basiclowerer_lhs_array_muxed11 = t_basiclowerer_lhs_array_muxed0;
					case (((commandscheduler_bank_group * 3'd4) + commandscheduler_bank))
						1'd0: begin
							commandscheduler528 <= t_basiclowerer_lhs_array_muxed12;
						end
						1'd1: begin
							commandscheduler529 <= t_basiclowerer_lhs_array_muxed12;
						end
						2'd2: begin
							commandscheduler530 <= t_basiclowerer_lhs_array_muxed12;
						end
						2'd3: begin
							commandscheduler531 <= t_basiclowerer_lhs_array_muxed12;
						end
						3'd4: begin
							commandscheduler532 <= t_basiclowerer_lhs_array_muxed12;
						end
						3'd5: begin
							commandscheduler533 <= t_basiclowerer_lhs_array_muxed12;
						end
						3'd6: begin
							commandscheduler534 <= t_basiclowerer_lhs_array_muxed12;
						end
						3'd7: begin
							commandscheduler535 <= t_basiclowerer_lhs_array_muxed12;
						end
						4'd8: begin
							commandscheduler536 <= t_basiclowerer_lhs_array_muxed12;
						end
						4'd9: begin
							commandscheduler537 <= t_basiclowerer_lhs_array_muxed12;
						end
						4'd10: begin
							commandscheduler538 <= t_basiclowerer_lhs_array_muxed12;
						end
						4'd11: begin
							commandscheduler539 <= t_basiclowerer_lhs_array_muxed12;
						end
						4'd12: begin
							commandscheduler540 <= t_basiclowerer_lhs_array_muxed12;
						end
						4'd13: begin
							commandscheduler541 <= t_basiclowerer_lhs_array_muxed12;
						end
						4'd14: begin
							commandscheduler542 <= t_basiclowerer_lhs_array_muxed12;
						end
						default: begin
							commandscheduler543 <= t_basiclowerer_lhs_array_muxed12;
						end
					endcase
					case (t_basiclowerer_lhs_array_muxed12)
						1'd0: begin
							commandscheduler160 <= t_basiclowerer_lhs_array_muxed11;
						end
						1'd1: begin
							commandscheduler161 <= t_basiclowerer_lhs_array_muxed11;
						end
						2'd2: begin
							commandscheduler162 <= t_basiclowerer_lhs_array_muxed11;
						end
						2'd3: begin
							commandscheduler163 <= t_basiclowerer_lhs_array_muxed11;
						end
						3'd4: begin
							commandscheduler164 <= t_basiclowerer_lhs_array_muxed11;
						end
						3'd5: begin
							commandscheduler165 <= t_basiclowerer_lhs_array_muxed11;
						end
						3'd6: begin
							commandscheduler166 <= t_basiclowerer_lhs_array_muxed11;
						end
						3'd7: begin
							commandscheduler167 <= t_basiclowerer_lhs_array_muxed11;
						end
						4'd8: begin
							commandscheduler168 <= t_basiclowerer_lhs_array_muxed11;
						end
						4'd9: begin
							commandscheduler169 <= t_basiclowerer_lhs_array_muxed11;
						end
						4'd10: begin
							commandscheduler170 <= t_basiclowerer_lhs_array_muxed11;
						end
						4'd11: begin
							commandscheduler171 <= t_basiclowerer_lhs_array_muxed11;
						end
						4'd12: begin
							commandscheduler172 <= t_basiclowerer_lhs_array_muxed11;
						end
						4'd13: begin
							commandscheduler173 <= t_basiclowerer_lhs_array_muxed11;
						end
						4'd14: begin
							commandscheduler174 <= t_basiclowerer_lhs_array_muxed11;
						end
						4'd15: begin
							commandscheduler175 <= t_basiclowerer_lhs_array_muxed11;
						end
						5'd16: begin
							commandscheduler176 <= t_basiclowerer_lhs_array_muxed11;
						end
						5'd17: begin
							commandscheduler177 <= t_basiclowerer_lhs_array_muxed11;
						end
						5'd18: begin
							commandscheduler178 <= t_basiclowerer_lhs_array_muxed11;
						end
						5'd19: begin
							commandscheduler179 <= t_basiclowerer_lhs_array_muxed11;
						end
						5'd20: begin
							commandscheduler180 <= t_basiclowerer_lhs_array_muxed11;
						end
						5'd21: begin
							commandscheduler181 <= t_basiclowerer_lhs_array_muxed11;
						end
						5'd22: begin
							commandscheduler182 <= t_basiclowerer_lhs_array_muxed11;
						end
						5'd23: begin
							commandscheduler183 <= t_basiclowerer_lhs_array_muxed11;
						end
						5'd24: begin
							commandscheduler184 <= t_basiclowerer_lhs_array_muxed11;
						end
						5'd25: begin
							commandscheduler185 <= t_basiclowerer_lhs_array_muxed11;
						end
						5'd26: begin
							commandscheduler186 <= t_basiclowerer_lhs_array_muxed11;
						end
						5'd27: begin
							commandscheduler187 <= t_basiclowerer_lhs_array_muxed11;
						end
						5'd28: begin
							commandscheduler188 <= t_basiclowerer_lhs_array_muxed11;
						end
						5'd29: begin
							commandscheduler189 <= t_basiclowerer_lhs_array_muxed11;
						end
						5'd30: begin
							commandscheduler190 <= t_basiclowerer_lhs_array_muxed11;
						end
						default: begin
							commandscheduler191 <= t_basiclowerer_lhs_array_muxed11;
						end
					endcase
				end
				3'd6: begin
					t_basiclowerer_lhs_array_muxed13 = t_basiclowerer_lhs_array_muxed0;
					case (((commandscheduler_bank_group * 3'd4) + commandscheduler_bank))
						1'd0: begin
							commandscheduler528 <= t_basiclowerer_lhs_array_muxed14;
						end
						1'd1: begin
							commandscheduler529 <= t_basiclowerer_lhs_array_muxed14;
						end
						2'd2: begin
							commandscheduler530 <= t_basiclowerer_lhs_array_muxed14;
						end
						2'd3: begin
							commandscheduler531 <= t_basiclowerer_lhs_array_muxed14;
						end
						3'd4: begin
							commandscheduler532 <= t_basiclowerer_lhs_array_muxed14;
						end
						3'd5: begin
							commandscheduler533 <= t_basiclowerer_lhs_array_muxed14;
						end
						3'd6: begin
							commandscheduler534 <= t_basiclowerer_lhs_array_muxed14;
						end
						3'd7: begin
							commandscheduler535 <= t_basiclowerer_lhs_array_muxed14;
						end
						4'd8: begin
							commandscheduler536 <= t_basiclowerer_lhs_array_muxed14;
						end
						4'd9: begin
							commandscheduler537 <= t_basiclowerer_lhs_array_muxed14;
						end
						4'd10: begin
							commandscheduler538 <= t_basiclowerer_lhs_array_muxed14;
						end
						4'd11: begin
							commandscheduler539 <= t_basiclowerer_lhs_array_muxed14;
						end
						4'd12: begin
							commandscheduler540 <= t_basiclowerer_lhs_array_muxed14;
						end
						4'd13: begin
							commandscheduler541 <= t_basiclowerer_lhs_array_muxed14;
						end
						4'd14: begin
							commandscheduler542 <= t_basiclowerer_lhs_array_muxed14;
						end
						default: begin
							commandscheduler543 <= t_basiclowerer_lhs_array_muxed14;
						end
					endcase
					case (t_basiclowerer_lhs_array_muxed14)
						1'd0: begin
							commandscheduler192 <= t_basiclowerer_lhs_array_muxed13;
						end
						1'd1: begin
							commandscheduler193 <= t_basiclowerer_lhs_array_muxed13;
						end
						2'd2: begin
							commandscheduler194 <= t_basiclowerer_lhs_array_muxed13;
						end
						2'd3: begin
							commandscheduler195 <= t_basiclowerer_lhs_array_muxed13;
						end
						3'd4: begin
							commandscheduler196 <= t_basiclowerer_lhs_array_muxed13;
						end
						3'd5: begin
							commandscheduler197 <= t_basiclowerer_lhs_array_muxed13;
						end
						3'd6: begin
							commandscheduler198 <= t_basiclowerer_lhs_array_muxed13;
						end
						3'd7: begin
							commandscheduler199 <= t_basiclowerer_lhs_array_muxed13;
						end
						4'd8: begin
							commandscheduler200 <= t_basiclowerer_lhs_array_muxed13;
						end
						4'd9: begin
							commandscheduler201 <= t_basiclowerer_lhs_array_muxed13;
						end
						4'd10: begin
							commandscheduler202 <= t_basiclowerer_lhs_array_muxed13;
						end
						4'd11: begin
							commandscheduler203 <= t_basiclowerer_lhs_array_muxed13;
						end
						4'd12: begin
							commandscheduler204 <= t_basiclowerer_lhs_array_muxed13;
						end
						4'd13: begin
							commandscheduler205 <= t_basiclowerer_lhs_array_muxed13;
						end
						4'd14: begin
							commandscheduler206 <= t_basiclowerer_lhs_array_muxed13;
						end
						4'd15: begin
							commandscheduler207 <= t_basiclowerer_lhs_array_muxed13;
						end
						5'd16: begin
							commandscheduler208 <= t_basiclowerer_lhs_array_muxed13;
						end
						5'd17: begin
							commandscheduler209 <= t_basiclowerer_lhs_array_muxed13;
						end
						5'd18: begin
							commandscheduler210 <= t_basiclowerer_lhs_array_muxed13;
						end
						5'd19: begin
							commandscheduler211 <= t_basiclowerer_lhs_array_muxed13;
						end
						5'd20: begin
							commandscheduler212 <= t_basiclowerer_lhs_array_muxed13;
						end
						5'd21: begin
							commandscheduler213 <= t_basiclowerer_lhs_array_muxed13;
						end
						5'd22: begin
							commandscheduler214 <= t_basiclowerer_lhs_array_muxed13;
						end
						5'd23: begin
							commandscheduler215 <= t_basiclowerer_lhs_array_muxed13;
						end
						5'd24: begin
							commandscheduler216 <= t_basiclowerer_lhs_array_muxed13;
						end
						5'd25: begin
							commandscheduler217 <= t_basiclowerer_lhs_array_muxed13;
						end
						5'd26: begin
							commandscheduler218 <= t_basiclowerer_lhs_array_muxed13;
						end
						5'd27: begin
							commandscheduler219 <= t_basiclowerer_lhs_array_muxed13;
						end
						5'd28: begin
							commandscheduler220 <= t_basiclowerer_lhs_array_muxed13;
						end
						5'd29: begin
							commandscheduler221 <= t_basiclowerer_lhs_array_muxed13;
						end
						5'd30: begin
							commandscheduler222 <= t_basiclowerer_lhs_array_muxed13;
						end
						default: begin
							commandscheduler223 <= t_basiclowerer_lhs_array_muxed13;
						end
					endcase
				end
				3'd7: begin
					t_basiclowerer_lhs_array_muxed15 = t_basiclowerer_lhs_array_muxed0;
					case (((commandscheduler_bank_group * 3'd4) + commandscheduler_bank))
						1'd0: begin
							commandscheduler528 <= t_basiclowerer_lhs_array_muxed16;
						end
						1'd1: begin
							commandscheduler529 <= t_basiclowerer_lhs_array_muxed16;
						end
						2'd2: begin
							commandscheduler530 <= t_basiclowerer_lhs_array_muxed16;
						end
						2'd3: begin
							commandscheduler531 <= t_basiclowerer_lhs_array_muxed16;
						end
						3'd4: begin
							commandscheduler532 <= t_basiclowerer_lhs_array_muxed16;
						end
						3'd5: begin
							commandscheduler533 <= t_basiclowerer_lhs_array_muxed16;
						end
						3'd6: begin
							commandscheduler534 <= t_basiclowerer_lhs_array_muxed16;
						end
						3'd7: begin
							commandscheduler535 <= t_basiclowerer_lhs_array_muxed16;
						end
						4'd8: begin
							commandscheduler536 <= t_basiclowerer_lhs_array_muxed16;
						end
						4'd9: begin
							commandscheduler537 <= t_basiclowerer_lhs_array_muxed16;
						end
						4'd10: begin
							commandscheduler538 <= t_basiclowerer_lhs_array_muxed16;
						end
						4'd11: begin
							commandscheduler539 <= t_basiclowerer_lhs_array_muxed16;
						end
						4'd12: begin
							commandscheduler540 <= t_basiclowerer_lhs_array_muxed16;
						end
						4'd13: begin
							commandscheduler541 <= t_basiclowerer_lhs_array_muxed16;
						end
						4'd14: begin
							commandscheduler542 <= t_basiclowerer_lhs_array_muxed16;
						end
						default: begin
							commandscheduler543 <= t_basiclowerer_lhs_array_muxed16;
						end
					endcase
					case (t_basiclowerer_lhs_array_muxed16)
						1'd0: begin
							commandscheduler224 <= t_basiclowerer_lhs_array_muxed15;
						end
						1'd1: begin
							commandscheduler225 <= t_basiclowerer_lhs_array_muxed15;
						end
						2'd2: begin
							commandscheduler226 <= t_basiclowerer_lhs_array_muxed15;
						end
						2'd3: begin
							commandscheduler227 <= t_basiclowerer_lhs_array_muxed15;
						end
						3'd4: begin
							commandscheduler228 <= t_basiclowerer_lhs_array_muxed15;
						end
						3'd5: begin
							commandscheduler229 <= t_basiclowerer_lhs_array_muxed15;
						end
						3'd6: begin
							commandscheduler230 <= t_basiclowerer_lhs_array_muxed15;
						end
						3'd7: begin
							commandscheduler231 <= t_basiclowerer_lhs_array_muxed15;
						end
						4'd8: begin
							commandscheduler232 <= t_basiclowerer_lhs_array_muxed15;
						end
						4'd9: begin
							commandscheduler233 <= t_basiclowerer_lhs_array_muxed15;
						end
						4'd10: begin
							commandscheduler234 <= t_basiclowerer_lhs_array_muxed15;
						end
						4'd11: begin
							commandscheduler235 <= t_basiclowerer_lhs_array_muxed15;
						end
						4'd12: begin
							commandscheduler236 <= t_basiclowerer_lhs_array_muxed15;
						end
						4'd13: begin
							commandscheduler237 <= t_basiclowerer_lhs_array_muxed15;
						end
						4'd14: begin
							commandscheduler238 <= t_basiclowerer_lhs_array_muxed15;
						end
						4'd15: begin
							commandscheduler239 <= t_basiclowerer_lhs_array_muxed15;
						end
						5'd16: begin
							commandscheduler240 <= t_basiclowerer_lhs_array_muxed15;
						end
						5'd17: begin
							commandscheduler241 <= t_basiclowerer_lhs_array_muxed15;
						end
						5'd18: begin
							commandscheduler242 <= t_basiclowerer_lhs_array_muxed15;
						end
						5'd19: begin
							commandscheduler243 <= t_basiclowerer_lhs_array_muxed15;
						end
						5'd20: begin
							commandscheduler244 <= t_basiclowerer_lhs_array_muxed15;
						end
						5'd21: begin
							commandscheduler245 <= t_basiclowerer_lhs_array_muxed15;
						end
						5'd22: begin
							commandscheduler246 <= t_basiclowerer_lhs_array_muxed15;
						end
						5'd23: begin
							commandscheduler247 <= t_basiclowerer_lhs_array_muxed15;
						end
						5'd24: begin
							commandscheduler248 <= t_basiclowerer_lhs_array_muxed15;
						end
						5'd25: begin
							commandscheduler249 <= t_basiclowerer_lhs_array_muxed15;
						end
						5'd26: begin
							commandscheduler250 <= t_basiclowerer_lhs_array_muxed15;
						end
						5'd27: begin
							commandscheduler251 <= t_basiclowerer_lhs_array_muxed15;
						end
						5'd28: begin
							commandscheduler252 <= t_basiclowerer_lhs_array_muxed15;
						end
						5'd29: begin
							commandscheduler253 <= t_basiclowerer_lhs_array_muxed15;
						end
						5'd30: begin
							commandscheduler254 <= t_basiclowerer_lhs_array_muxed15;
						end
						default: begin
							commandscheduler255 <= t_basiclowerer_lhs_array_muxed15;
						end
					endcase
				end
				4'd8: begin
					t_basiclowerer_lhs_array_muxed17 = t_basiclowerer_lhs_array_muxed0;
					case (((commandscheduler_bank_group * 3'd4) + commandscheduler_bank))
						1'd0: begin
							commandscheduler528 <= t_basiclowerer_lhs_array_muxed18;
						end
						1'd1: begin
							commandscheduler529 <= t_basiclowerer_lhs_array_muxed18;
						end
						2'd2: begin
							commandscheduler530 <= t_basiclowerer_lhs_array_muxed18;
						end
						2'd3: begin
							commandscheduler531 <= t_basiclowerer_lhs_array_muxed18;
						end
						3'd4: begin
							commandscheduler532 <= t_basiclowerer_lhs_array_muxed18;
						end
						3'd5: begin
							commandscheduler533 <= t_basiclowerer_lhs_array_muxed18;
						end
						3'd6: begin
							commandscheduler534 <= t_basiclowerer_lhs_array_muxed18;
						end
						3'd7: begin
							commandscheduler535 <= t_basiclowerer_lhs_array_muxed18;
						end
						4'd8: begin
							commandscheduler536 <= t_basiclowerer_lhs_array_muxed18;
						end
						4'd9: begin
							commandscheduler537 <= t_basiclowerer_lhs_array_muxed18;
						end
						4'd10: begin
							commandscheduler538 <= t_basiclowerer_lhs_array_muxed18;
						end
						4'd11: begin
							commandscheduler539 <= t_basiclowerer_lhs_array_muxed18;
						end
						4'd12: begin
							commandscheduler540 <= t_basiclowerer_lhs_array_muxed18;
						end
						4'd13: begin
							commandscheduler541 <= t_basiclowerer_lhs_array_muxed18;
						end
						4'd14: begin
							commandscheduler542 <= t_basiclowerer_lhs_array_muxed18;
						end
						default: begin
							commandscheduler543 <= t_basiclowerer_lhs_array_muxed18;
						end
					endcase
					case (t_basiclowerer_lhs_array_muxed18)
						1'd0: begin
							commandscheduler256 <= t_basiclowerer_lhs_array_muxed17;
						end
						1'd1: begin
							commandscheduler257 <= t_basiclowerer_lhs_array_muxed17;
						end
						2'd2: begin
							commandscheduler258 <= t_basiclowerer_lhs_array_muxed17;
						end
						2'd3: begin
							commandscheduler259 <= t_basiclowerer_lhs_array_muxed17;
						end
						3'd4: begin
							commandscheduler260 <= t_basiclowerer_lhs_array_muxed17;
						end
						3'd5: begin
							commandscheduler261 <= t_basiclowerer_lhs_array_muxed17;
						end
						3'd6: begin
							commandscheduler262 <= t_basiclowerer_lhs_array_muxed17;
						end
						3'd7: begin
							commandscheduler263 <= t_basiclowerer_lhs_array_muxed17;
						end
						4'd8: begin
							commandscheduler264 <= t_basiclowerer_lhs_array_muxed17;
						end
						4'd9: begin
							commandscheduler265 <= t_basiclowerer_lhs_array_muxed17;
						end
						4'd10: begin
							commandscheduler266 <= t_basiclowerer_lhs_array_muxed17;
						end
						4'd11: begin
							commandscheduler267 <= t_basiclowerer_lhs_array_muxed17;
						end
						4'd12: begin
							commandscheduler268 <= t_basiclowerer_lhs_array_muxed17;
						end
						4'd13: begin
							commandscheduler269 <= t_basiclowerer_lhs_array_muxed17;
						end
						4'd14: begin
							commandscheduler270 <= t_basiclowerer_lhs_array_muxed17;
						end
						4'd15: begin
							commandscheduler271 <= t_basiclowerer_lhs_array_muxed17;
						end
						5'd16: begin
							commandscheduler272 <= t_basiclowerer_lhs_array_muxed17;
						end
						5'd17: begin
							commandscheduler273 <= t_basiclowerer_lhs_array_muxed17;
						end
						5'd18: begin
							commandscheduler274 <= t_basiclowerer_lhs_array_muxed17;
						end
						5'd19: begin
							commandscheduler275 <= t_basiclowerer_lhs_array_muxed17;
						end
						5'd20: begin
							commandscheduler276 <= t_basiclowerer_lhs_array_muxed17;
						end
						5'd21: begin
							commandscheduler277 <= t_basiclowerer_lhs_array_muxed17;
						end
						5'd22: begin
							commandscheduler278 <= t_basiclowerer_lhs_array_muxed17;
						end
						5'd23: begin
							commandscheduler279 <= t_basiclowerer_lhs_array_muxed17;
						end
						5'd24: begin
							commandscheduler280 <= t_basiclowerer_lhs_array_muxed17;
						end
						5'd25: begin
							commandscheduler281 <= t_basiclowerer_lhs_array_muxed17;
						end
						5'd26: begin
							commandscheduler282 <= t_basiclowerer_lhs_array_muxed17;
						end
						5'd27: begin
							commandscheduler283 <= t_basiclowerer_lhs_array_muxed17;
						end
						5'd28: begin
							commandscheduler284 <= t_basiclowerer_lhs_array_muxed17;
						end
						5'd29: begin
							commandscheduler285 <= t_basiclowerer_lhs_array_muxed17;
						end
						5'd30: begin
							commandscheduler286 <= t_basiclowerer_lhs_array_muxed17;
						end
						default: begin
							commandscheduler287 <= t_basiclowerer_lhs_array_muxed17;
						end
					endcase
				end
				4'd9: begin
					t_basiclowerer_lhs_array_muxed19 = t_basiclowerer_lhs_array_muxed0;
					case (((commandscheduler_bank_group * 3'd4) + commandscheduler_bank))
						1'd0: begin
							commandscheduler528 <= t_basiclowerer_lhs_array_muxed20;
						end
						1'd1: begin
							commandscheduler529 <= t_basiclowerer_lhs_array_muxed20;
						end
						2'd2: begin
							commandscheduler530 <= t_basiclowerer_lhs_array_muxed20;
						end
						2'd3: begin
							commandscheduler531 <= t_basiclowerer_lhs_array_muxed20;
						end
						3'd4: begin
							commandscheduler532 <= t_basiclowerer_lhs_array_muxed20;
						end
						3'd5: begin
							commandscheduler533 <= t_basiclowerer_lhs_array_muxed20;
						end
						3'd6: begin
							commandscheduler534 <= t_basiclowerer_lhs_array_muxed20;
						end
						3'd7: begin
							commandscheduler535 <= t_basiclowerer_lhs_array_muxed20;
						end
						4'd8: begin
							commandscheduler536 <= t_basiclowerer_lhs_array_muxed20;
						end
						4'd9: begin
							commandscheduler537 <= t_basiclowerer_lhs_array_muxed20;
						end
						4'd10: begin
							commandscheduler538 <= t_basiclowerer_lhs_array_muxed20;
						end
						4'd11: begin
							commandscheduler539 <= t_basiclowerer_lhs_array_muxed20;
						end
						4'd12: begin
							commandscheduler540 <= t_basiclowerer_lhs_array_muxed20;
						end
						4'd13: begin
							commandscheduler541 <= t_basiclowerer_lhs_array_muxed20;
						end
						4'd14: begin
							commandscheduler542 <= t_basiclowerer_lhs_array_muxed20;
						end
						default: begin
							commandscheduler543 <= t_basiclowerer_lhs_array_muxed20;
						end
					endcase
					case (t_basiclowerer_lhs_array_muxed20)
						1'd0: begin
							commandscheduler288 <= t_basiclowerer_lhs_array_muxed19;
						end
						1'd1: begin
							commandscheduler289 <= t_basiclowerer_lhs_array_muxed19;
						end
						2'd2: begin
							commandscheduler290 <= t_basiclowerer_lhs_array_muxed19;
						end
						2'd3: begin
							commandscheduler291 <= t_basiclowerer_lhs_array_muxed19;
						end
						3'd4: begin
							commandscheduler292 <= t_basiclowerer_lhs_array_muxed19;
						end
						3'd5: begin
							commandscheduler293 <= t_basiclowerer_lhs_array_muxed19;
						end
						3'd6: begin
							commandscheduler294 <= t_basiclowerer_lhs_array_muxed19;
						end
						3'd7: begin
							commandscheduler295 <= t_basiclowerer_lhs_array_muxed19;
						end
						4'd8: begin
							commandscheduler296 <= t_basiclowerer_lhs_array_muxed19;
						end
						4'd9: begin
							commandscheduler297 <= t_basiclowerer_lhs_array_muxed19;
						end
						4'd10: begin
							commandscheduler298 <= t_basiclowerer_lhs_array_muxed19;
						end
						4'd11: begin
							commandscheduler299 <= t_basiclowerer_lhs_array_muxed19;
						end
						4'd12: begin
							commandscheduler300 <= t_basiclowerer_lhs_array_muxed19;
						end
						4'd13: begin
							commandscheduler301 <= t_basiclowerer_lhs_array_muxed19;
						end
						4'd14: begin
							commandscheduler302 <= t_basiclowerer_lhs_array_muxed19;
						end
						4'd15: begin
							commandscheduler303 <= t_basiclowerer_lhs_array_muxed19;
						end
						5'd16: begin
							commandscheduler304 <= t_basiclowerer_lhs_array_muxed19;
						end
						5'd17: begin
							commandscheduler305 <= t_basiclowerer_lhs_array_muxed19;
						end
						5'd18: begin
							commandscheduler306 <= t_basiclowerer_lhs_array_muxed19;
						end
						5'd19: begin
							commandscheduler307 <= t_basiclowerer_lhs_array_muxed19;
						end
						5'd20: begin
							commandscheduler308 <= t_basiclowerer_lhs_array_muxed19;
						end
						5'd21: begin
							commandscheduler309 <= t_basiclowerer_lhs_array_muxed19;
						end
						5'd22: begin
							commandscheduler310 <= t_basiclowerer_lhs_array_muxed19;
						end
						5'd23: begin
							commandscheduler311 <= t_basiclowerer_lhs_array_muxed19;
						end
						5'd24: begin
							commandscheduler312 <= t_basiclowerer_lhs_array_muxed19;
						end
						5'd25: begin
							commandscheduler313 <= t_basiclowerer_lhs_array_muxed19;
						end
						5'd26: begin
							commandscheduler314 <= t_basiclowerer_lhs_array_muxed19;
						end
						5'd27: begin
							commandscheduler315 <= t_basiclowerer_lhs_array_muxed19;
						end
						5'd28: begin
							commandscheduler316 <= t_basiclowerer_lhs_array_muxed19;
						end
						5'd29: begin
							commandscheduler317 <= t_basiclowerer_lhs_array_muxed19;
						end
						5'd30: begin
							commandscheduler318 <= t_basiclowerer_lhs_array_muxed19;
						end
						default: begin
							commandscheduler319 <= t_basiclowerer_lhs_array_muxed19;
						end
					endcase
				end
				4'd10: begin
					t_basiclowerer_lhs_array_muxed21 = t_basiclowerer_lhs_array_muxed0;
					case (((commandscheduler_bank_group * 3'd4) + commandscheduler_bank))
						1'd0: begin
							commandscheduler528 <= t_basiclowerer_lhs_array_muxed22;
						end
						1'd1: begin
							commandscheduler529 <= t_basiclowerer_lhs_array_muxed22;
						end
						2'd2: begin
							commandscheduler530 <= t_basiclowerer_lhs_array_muxed22;
						end
						2'd3: begin
							commandscheduler531 <= t_basiclowerer_lhs_array_muxed22;
						end
						3'd4: begin
							commandscheduler532 <= t_basiclowerer_lhs_array_muxed22;
						end
						3'd5: begin
							commandscheduler533 <= t_basiclowerer_lhs_array_muxed22;
						end
						3'd6: begin
							commandscheduler534 <= t_basiclowerer_lhs_array_muxed22;
						end
						3'd7: begin
							commandscheduler535 <= t_basiclowerer_lhs_array_muxed22;
						end
						4'd8: begin
							commandscheduler536 <= t_basiclowerer_lhs_array_muxed22;
						end
						4'd9: begin
							commandscheduler537 <= t_basiclowerer_lhs_array_muxed22;
						end
						4'd10: begin
							commandscheduler538 <= t_basiclowerer_lhs_array_muxed22;
						end
						4'd11: begin
							commandscheduler539 <= t_basiclowerer_lhs_array_muxed22;
						end
						4'd12: begin
							commandscheduler540 <= t_basiclowerer_lhs_array_muxed22;
						end
						4'd13: begin
							commandscheduler541 <= t_basiclowerer_lhs_array_muxed22;
						end
						4'd14: begin
							commandscheduler542 <= t_basiclowerer_lhs_array_muxed22;
						end
						default: begin
							commandscheduler543 <= t_basiclowerer_lhs_array_muxed22;
						end
					endcase
					case (t_basiclowerer_lhs_array_muxed22)
						1'd0: begin
							commandscheduler320 <= t_basiclowerer_lhs_array_muxed21;
						end
						1'd1: begin
							commandscheduler321 <= t_basiclowerer_lhs_array_muxed21;
						end
						2'd2: begin
							commandscheduler322 <= t_basiclowerer_lhs_array_muxed21;
						end
						2'd3: begin
							commandscheduler323 <= t_basiclowerer_lhs_array_muxed21;
						end
						3'd4: begin
							commandscheduler324 <= t_basiclowerer_lhs_array_muxed21;
						end
						3'd5: begin
							commandscheduler325 <= t_basiclowerer_lhs_array_muxed21;
						end
						3'd6: begin
							commandscheduler326 <= t_basiclowerer_lhs_array_muxed21;
						end
						3'd7: begin
							commandscheduler327 <= t_basiclowerer_lhs_array_muxed21;
						end
						4'd8: begin
							commandscheduler328 <= t_basiclowerer_lhs_array_muxed21;
						end
						4'd9: begin
							commandscheduler329 <= t_basiclowerer_lhs_array_muxed21;
						end
						4'd10: begin
							commandscheduler330 <= t_basiclowerer_lhs_array_muxed21;
						end
						4'd11: begin
							commandscheduler331 <= t_basiclowerer_lhs_array_muxed21;
						end
						4'd12: begin
							commandscheduler332 <= t_basiclowerer_lhs_array_muxed21;
						end
						4'd13: begin
							commandscheduler333 <= t_basiclowerer_lhs_array_muxed21;
						end
						4'd14: begin
							commandscheduler334 <= t_basiclowerer_lhs_array_muxed21;
						end
						4'd15: begin
							commandscheduler335 <= t_basiclowerer_lhs_array_muxed21;
						end
						5'd16: begin
							commandscheduler336 <= t_basiclowerer_lhs_array_muxed21;
						end
						5'd17: begin
							commandscheduler337 <= t_basiclowerer_lhs_array_muxed21;
						end
						5'd18: begin
							commandscheduler338 <= t_basiclowerer_lhs_array_muxed21;
						end
						5'd19: begin
							commandscheduler339 <= t_basiclowerer_lhs_array_muxed21;
						end
						5'd20: begin
							commandscheduler340 <= t_basiclowerer_lhs_array_muxed21;
						end
						5'd21: begin
							commandscheduler341 <= t_basiclowerer_lhs_array_muxed21;
						end
						5'd22: begin
							commandscheduler342 <= t_basiclowerer_lhs_array_muxed21;
						end
						5'd23: begin
							commandscheduler343 <= t_basiclowerer_lhs_array_muxed21;
						end
						5'd24: begin
							commandscheduler344 <= t_basiclowerer_lhs_array_muxed21;
						end
						5'd25: begin
							commandscheduler345 <= t_basiclowerer_lhs_array_muxed21;
						end
						5'd26: begin
							commandscheduler346 <= t_basiclowerer_lhs_array_muxed21;
						end
						5'd27: begin
							commandscheduler347 <= t_basiclowerer_lhs_array_muxed21;
						end
						5'd28: begin
							commandscheduler348 <= t_basiclowerer_lhs_array_muxed21;
						end
						5'd29: begin
							commandscheduler349 <= t_basiclowerer_lhs_array_muxed21;
						end
						5'd30: begin
							commandscheduler350 <= t_basiclowerer_lhs_array_muxed21;
						end
						default: begin
							commandscheduler351 <= t_basiclowerer_lhs_array_muxed21;
						end
					endcase
				end
				4'd11: begin
					t_basiclowerer_lhs_array_muxed23 = t_basiclowerer_lhs_array_muxed0;
					case (((commandscheduler_bank_group * 3'd4) + commandscheduler_bank))
						1'd0: begin
							commandscheduler528 <= t_basiclowerer_lhs_array_muxed24;
						end
						1'd1: begin
							commandscheduler529 <= t_basiclowerer_lhs_array_muxed24;
						end
						2'd2: begin
							commandscheduler530 <= t_basiclowerer_lhs_array_muxed24;
						end
						2'd3: begin
							commandscheduler531 <= t_basiclowerer_lhs_array_muxed24;
						end
						3'd4: begin
							commandscheduler532 <= t_basiclowerer_lhs_array_muxed24;
						end
						3'd5: begin
							commandscheduler533 <= t_basiclowerer_lhs_array_muxed24;
						end
						3'd6: begin
							commandscheduler534 <= t_basiclowerer_lhs_array_muxed24;
						end
						3'd7: begin
							commandscheduler535 <= t_basiclowerer_lhs_array_muxed24;
						end
						4'd8: begin
							commandscheduler536 <= t_basiclowerer_lhs_array_muxed24;
						end
						4'd9: begin
							commandscheduler537 <= t_basiclowerer_lhs_array_muxed24;
						end
						4'd10: begin
							commandscheduler538 <= t_basiclowerer_lhs_array_muxed24;
						end
						4'd11: begin
							commandscheduler539 <= t_basiclowerer_lhs_array_muxed24;
						end
						4'd12: begin
							commandscheduler540 <= t_basiclowerer_lhs_array_muxed24;
						end
						4'd13: begin
							commandscheduler541 <= t_basiclowerer_lhs_array_muxed24;
						end
						4'd14: begin
							commandscheduler542 <= t_basiclowerer_lhs_array_muxed24;
						end
						default: begin
							commandscheduler543 <= t_basiclowerer_lhs_array_muxed24;
						end
					endcase
					case (t_basiclowerer_lhs_array_muxed24)
						1'd0: begin
							commandscheduler352 <= t_basiclowerer_lhs_array_muxed23;
						end
						1'd1: begin
							commandscheduler353 <= t_basiclowerer_lhs_array_muxed23;
						end
						2'd2: begin
							commandscheduler354 <= t_basiclowerer_lhs_array_muxed23;
						end
						2'd3: begin
							commandscheduler355 <= t_basiclowerer_lhs_array_muxed23;
						end
						3'd4: begin
							commandscheduler356 <= t_basiclowerer_lhs_array_muxed23;
						end
						3'd5: begin
							commandscheduler357 <= t_basiclowerer_lhs_array_muxed23;
						end
						3'd6: begin
							commandscheduler358 <= t_basiclowerer_lhs_array_muxed23;
						end
						3'd7: begin
							commandscheduler359 <= t_basiclowerer_lhs_array_muxed23;
						end
						4'd8: begin
							commandscheduler360 <= t_basiclowerer_lhs_array_muxed23;
						end
						4'd9: begin
							commandscheduler361 <= t_basiclowerer_lhs_array_muxed23;
						end
						4'd10: begin
							commandscheduler362 <= t_basiclowerer_lhs_array_muxed23;
						end
						4'd11: begin
							commandscheduler363 <= t_basiclowerer_lhs_array_muxed23;
						end
						4'd12: begin
							commandscheduler364 <= t_basiclowerer_lhs_array_muxed23;
						end
						4'd13: begin
							commandscheduler365 <= t_basiclowerer_lhs_array_muxed23;
						end
						4'd14: begin
							commandscheduler366 <= t_basiclowerer_lhs_array_muxed23;
						end
						4'd15: begin
							commandscheduler367 <= t_basiclowerer_lhs_array_muxed23;
						end
						5'd16: begin
							commandscheduler368 <= t_basiclowerer_lhs_array_muxed23;
						end
						5'd17: begin
							commandscheduler369 <= t_basiclowerer_lhs_array_muxed23;
						end
						5'd18: begin
							commandscheduler370 <= t_basiclowerer_lhs_array_muxed23;
						end
						5'd19: begin
							commandscheduler371 <= t_basiclowerer_lhs_array_muxed23;
						end
						5'd20: begin
							commandscheduler372 <= t_basiclowerer_lhs_array_muxed23;
						end
						5'd21: begin
							commandscheduler373 <= t_basiclowerer_lhs_array_muxed23;
						end
						5'd22: begin
							commandscheduler374 <= t_basiclowerer_lhs_array_muxed23;
						end
						5'd23: begin
							commandscheduler375 <= t_basiclowerer_lhs_array_muxed23;
						end
						5'd24: begin
							commandscheduler376 <= t_basiclowerer_lhs_array_muxed23;
						end
						5'd25: begin
							commandscheduler377 <= t_basiclowerer_lhs_array_muxed23;
						end
						5'd26: begin
							commandscheduler378 <= t_basiclowerer_lhs_array_muxed23;
						end
						5'd27: begin
							commandscheduler379 <= t_basiclowerer_lhs_array_muxed23;
						end
						5'd28: begin
							commandscheduler380 <= t_basiclowerer_lhs_array_muxed23;
						end
						5'd29: begin
							commandscheduler381 <= t_basiclowerer_lhs_array_muxed23;
						end
						5'd30: begin
							commandscheduler382 <= t_basiclowerer_lhs_array_muxed23;
						end
						default: begin
							commandscheduler383 <= t_basiclowerer_lhs_array_muxed23;
						end
					endcase
				end
				4'd12: begin
					t_basiclowerer_lhs_array_muxed25 = t_basiclowerer_lhs_array_muxed0;
					case (((commandscheduler_bank_group * 3'd4) + commandscheduler_bank))
						1'd0: begin
							commandscheduler528 <= t_basiclowerer_lhs_array_muxed26;
						end
						1'd1: begin
							commandscheduler529 <= t_basiclowerer_lhs_array_muxed26;
						end
						2'd2: begin
							commandscheduler530 <= t_basiclowerer_lhs_array_muxed26;
						end
						2'd3: begin
							commandscheduler531 <= t_basiclowerer_lhs_array_muxed26;
						end
						3'd4: begin
							commandscheduler532 <= t_basiclowerer_lhs_array_muxed26;
						end
						3'd5: begin
							commandscheduler533 <= t_basiclowerer_lhs_array_muxed26;
						end
						3'd6: begin
							commandscheduler534 <= t_basiclowerer_lhs_array_muxed26;
						end
						3'd7: begin
							commandscheduler535 <= t_basiclowerer_lhs_array_muxed26;
						end
						4'd8: begin
							commandscheduler536 <= t_basiclowerer_lhs_array_muxed26;
						end
						4'd9: begin
							commandscheduler537 <= t_basiclowerer_lhs_array_muxed26;
						end
						4'd10: begin
							commandscheduler538 <= t_basiclowerer_lhs_array_muxed26;
						end
						4'd11: begin
							commandscheduler539 <= t_basiclowerer_lhs_array_muxed26;
						end
						4'd12: begin
							commandscheduler540 <= t_basiclowerer_lhs_array_muxed26;
						end
						4'd13: begin
							commandscheduler541 <= t_basiclowerer_lhs_array_muxed26;
						end
						4'd14: begin
							commandscheduler542 <= t_basiclowerer_lhs_array_muxed26;
						end
						default: begin
							commandscheduler543 <= t_basiclowerer_lhs_array_muxed26;
						end
					endcase
					case (t_basiclowerer_lhs_array_muxed26)
						1'd0: begin
							commandscheduler384 <= t_basiclowerer_lhs_array_muxed25;
						end
						1'd1: begin
							commandscheduler385 <= t_basiclowerer_lhs_array_muxed25;
						end
						2'd2: begin
							commandscheduler386 <= t_basiclowerer_lhs_array_muxed25;
						end
						2'd3: begin
							commandscheduler387 <= t_basiclowerer_lhs_array_muxed25;
						end
						3'd4: begin
							commandscheduler388 <= t_basiclowerer_lhs_array_muxed25;
						end
						3'd5: begin
							commandscheduler389 <= t_basiclowerer_lhs_array_muxed25;
						end
						3'd6: begin
							commandscheduler390 <= t_basiclowerer_lhs_array_muxed25;
						end
						3'd7: begin
							commandscheduler391 <= t_basiclowerer_lhs_array_muxed25;
						end
						4'd8: begin
							commandscheduler392 <= t_basiclowerer_lhs_array_muxed25;
						end
						4'd9: begin
							commandscheduler393 <= t_basiclowerer_lhs_array_muxed25;
						end
						4'd10: begin
							commandscheduler394 <= t_basiclowerer_lhs_array_muxed25;
						end
						4'd11: begin
							commandscheduler395 <= t_basiclowerer_lhs_array_muxed25;
						end
						4'd12: begin
							commandscheduler396 <= t_basiclowerer_lhs_array_muxed25;
						end
						4'd13: begin
							commandscheduler397 <= t_basiclowerer_lhs_array_muxed25;
						end
						4'd14: begin
							commandscheduler398 <= t_basiclowerer_lhs_array_muxed25;
						end
						4'd15: begin
							commandscheduler399 <= t_basiclowerer_lhs_array_muxed25;
						end
						5'd16: begin
							commandscheduler400 <= t_basiclowerer_lhs_array_muxed25;
						end
						5'd17: begin
							commandscheduler401 <= t_basiclowerer_lhs_array_muxed25;
						end
						5'd18: begin
							commandscheduler402 <= t_basiclowerer_lhs_array_muxed25;
						end
						5'd19: begin
							commandscheduler403 <= t_basiclowerer_lhs_array_muxed25;
						end
						5'd20: begin
							commandscheduler404 <= t_basiclowerer_lhs_array_muxed25;
						end
						5'd21: begin
							commandscheduler405 <= t_basiclowerer_lhs_array_muxed25;
						end
						5'd22: begin
							commandscheduler406 <= t_basiclowerer_lhs_array_muxed25;
						end
						5'd23: begin
							commandscheduler407 <= t_basiclowerer_lhs_array_muxed25;
						end
						5'd24: begin
							commandscheduler408 <= t_basiclowerer_lhs_array_muxed25;
						end
						5'd25: begin
							commandscheduler409 <= t_basiclowerer_lhs_array_muxed25;
						end
						5'd26: begin
							commandscheduler410 <= t_basiclowerer_lhs_array_muxed25;
						end
						5'd27: begin
							commandscheduler411 <= t_basiclowerer_lhs_array_muxed25;
						end
						5'd28: begin
							commandscheduler412 <= t_basiclowerer_lhs_array_muxed25;
						end
						5'd29: begin
							commandscheduler413 <= t_basiclowerer_lhs_array_muxed25;
						end
						5'd30: begin
							commandscheduler414 <= t_basiclowerer_lhs_array_muxed25;
						end
						default: begin
							commandscheduler415 <= t_basiclowerer_lhs_array_muxed25;
						end
					endcase
				end
				4'd13: begin
					t_basiclowerer_lhs_array_muxed27 = t_basiclowerer_lhs_array_muxed0;
					case (((commandscheduler_bank_group * 3'd4) + commandscheduler_bank))
						1'd0: begin
							commandscheduler528 <= t_basiclowerer_lhs_array_muxed28;
						end
						1'd1: begin
							commandscheduler529 <= t_basiclowerer_lhs_array_muxed28;
						end
						2'd2: begin
							commandscheduler530 <= t_basiclowerer_lhs_array_muxed28;
						end
						2'd3: begin
							commandscheduler531 <= t_basiclowerer_lhs_array_muxed28;
						end
						3'd4: begin
							commandscheduler532 <= t_basiclowerer_lhs_array_muxed28;
						end
						3'd5: begin
							commandscheduler533 <= t_basiclowerer_lhs_array_muxed28;
						end
						3'd6: begin
							commandscheduler534 <= t_basiclowerer_lhs_array_muxed28;
						end
						3'd7: begin
							commandscheduler535 <= t_basiclowerer_lhs_array_muxed28;
						end
						4'd8: begin
							commandscheduler536 <= t_basiclowerer_lhs_array_muxed28;
						end
						4'd9: begin
							commandscheduler537 <= t_basiclowerer_lhs_array_muxed28;
						end
						4'd10: begin
							commandscheduler538 <= t_basiclowerer_lhs_array_muxed28;
						end
						4'd11: begin
							commandscheduler539 <= t_basiclowerer_lhs_array_muxed28;
						end
						4'd12: begin
							commandscheduler540 <= t_basiclowerer_lhs_array_muxed28;
						end
						4'd13: begin
							commandscheduler541 <= t_basiclowerer_lhs_array_muxed28;
						end
						4'd14: begin
							commandscheduler542 <= t_basiclowerer_lhs_array_muxed28;
						end
						default: begin
							commandscheduler543 <= t_basiclowerer_lhs_array_muxed28;
						end
					endcase
					case (t_basiclowerer_lhs_array_muxed28)
						1'd0: begin
							commandscheduler416 <= t_basiclowerer_lhs_array_muxed27;
						end
						1'd1: begin
							commandscheduler417 <= t_basiclowerer_lhs_array_muxed27;
						end
						2'd2: begin
							commandscheduler418 <= t_basiclowerer_lhs_array_muxed27;
						end
						2'd3: begin
							commandscheduler419 <= t_basiclowerer_lhs_array_muxed27;
						end
						3'd4: begin
							commandscheduler420 <= t_basiclowerer_lhs_array_muxed27;
						end
						3'd5: begin
							commandscheduler421 <= t_basiclowerer_lhs_array_muxed27;
						end
						3'd6: begin
							commandscheduler422 <= t_basiclowerer_lhs_array_muxed27;
						end
						3'd7: begin
							commandscheduler423 <= t_basiclowerer_lhs_array_muxed27;
						end
						4'd8: begin
							commandscheduler424 <= t_basiclowerer_lhs_array_muxed27;
						end
						4'd9: begin
							commandscheduler425 <= t_basiclowerer_lhs_array_muxed27;
						end
						4'd10: begin
							commandscheduler426 <= t_basiclowerer_lhs_array_muxed27;
						end
						4'd11: begin
							commandscheduler427 <= t_basiclowerer_lhs_array_muxed27;
						end
						4'd12: begin
							commandscheduler428 <= t_basiclowerer_lhs_array_muxed27;
						end
						4'd13: begin
							commandscheduler429 <= t_basiclowerer_lhs_array_muxed27;
						end
						4'd14: begin
							commandscheduler430 <= t_basiclowerer_lhs_array_muxed27;
						end
						4'd15: begin
							commandscheduler431 <= t_basiclowerer_lhs_array_muxed27;
						end
						5'd16: begin
							commandscheduler432 <= t_basiclowerer_lhs_array_muxed27;
						end
						5'd17: begin
							commandscheduler433 <= t_basiclowerer_lhs_array_muxed27;
						end
						5'd18: begin
							commandscheduler434 <= t_basiclowerer_lhs_array_muxed27;
						end
						5'd19: begin
							commandscheduler435 <= t_basiclowerer_lhs_array_muxed27;
						end
						5'd20: begin
							commandscheduler436 <= t_basiclowerer_lhs_array_muxed27;
						end
						5'd21: begin
							commandscheduler437 <= t_basiclowerer_lhs_array_muxed27;
						end
						5'd22: begin
							commandscheduler438 <= t_basiclowerer_lhs_array_muxed27;
						end
						5'd23: begin
							commandscheduler439 <= t_basiclowerer_lhs_array_muxed27;
						end
						5'd24: begin
							commandscheduler440 <= t_basiclowerer_lhs_array_muxed27;
						end
						5'd25: begin
							commandscheduler441 <= t_basiclowerer_lhs_array_muxed27;
						end
						5'd26: begin
							commandscheduler442 <= t_basiclowerer_lhs_array_muxed27;
						end
						5'd27: begin
							commandscheduler443 <= t_basiclowerer_lhs_array_muxed27;
						end
						5'd28: begin
							commandscheduler444 <= t_basiclowerer_lhs_array_muxed27;
						end
						5'd29: begin
							commandscheduler445 <= t_basiclowerer_lhs_array_muxed27;
						end
						5'd30: begin
							commandscheduler446 <= t_basiclowerer_lhs_array_muxed27;
						end
						default: begin
							commandscheduler447 <= t_basiclowerer_lhs_array_muxed27;
						end
					endcase
				end
				4'd14: begin
					t_basiclowerer_lhs_array_muxed29 = t_basiclowerer_lhs_array_muxed0;
					case (((commandscheduler_bank_group * 3'd4) + commandscheduler_bank))
						1'd0: begin
							commandscheduler528 <= t_basiclowerer_lhs_array_muxed30;
						end
						1'd1: begin
							commandscheduler529 <= t_basiclowerer_lhs_array_muxed30;
						end
						2'd2: begin
							commandscheduler530 <= t_basiclowerer_lhs_array_muxed30;
						end
						2'd3: begin
							commandscheduler531 <= t_basiclowerer_lhs_array_muxed30;
						end
						3'd4: begin
							commandscheduler532 <= t_basiclowerer_lhs_array_muxed30;
						end
						3'd5: begin
							commandscheduler533 <= t_basiclowerer_lhs_array_muxed30;
						end
						3'd6: begin
							commandscheduler534 <= t_basiclowerer_lhs_array_muxed30;
						end
						3'd7: begin
							commandscheduler535 <= t_basiclowerer_lhs_array_muxed30;
						end
						4'd8: begin
							commandscheduler536 <= t_basiclowerer_lhs_array_muxed30;
						end
						4'd9: begin
							commandscheduler537 <= t_basiclowerer_lhs_array_muxed30;
						end
						4'd10: begin
							commandscheduler538 <= t_basiclowerer_lhs_array_muxed30;
						end
						4'd11: begin
							commandscheduler539 <= t_basiclowerer_lhs_array_muxed30;
						end
						4'd12: begin
							commandscheduler540 <= t_basiclowerer_lhs_array_muxed30;
						end
						4'd13: begin
							commandscheduler541 <= t_basiclowerer_lhs_array_muxed30;
						end
						4'd14: begin
							commandscheduler542 <= t_basiclowerer_lhs_array_muxed30;
						end
						default: begin
							commandscheduler543 <= t_basiclowerer_lhs_array_muxed30;
						end
					endcase
					case (t_basiclowerer_lhs_array_muxed30)
						1'd0: begin
							commandscheduler448 <= t_basiclowerer_lhs_array_muxed29;
						end
						1'd1: begin
							commandscheduler449 <= t_basiclowerer_lhs_array_muxed29;
						end
						2'd2: begin
							commandscheduler450 <= t_basiclowerer_lhs_array_muxed29;
						end
						2'd3: begin
							commandscheduler451 <= t_basiclowerer_lhs_array_muxed29;
						end
						3'd4: begin
							commandscheduler452 <= t_basiclowerer_lhs_array_muxed29;
						end
						3'd5: begin
							commandscheduler453 <= t_basiclowerer_lhs_array_muxed29;
						end
						3'd6: begin
							commandscheduler454 <= t_basiclowerer_lhs_array_muxed29;
						end
						3'd7: begin
							commandscheduler455 <= t_basiclowerer_lhs_array_muxed29;
						end
						4'd8: begin
							commandscheduler456 <= t_basiclowerer_lhs_array_muxed29;
						end
						4'd9: begin
							commandscheduler457 <= t_basiclowerer_lhs_array_muxed29;
						end
						4'd10: begin
							commandscheduler458 <= t_basiclowerer_lhs_array_muxed29;
						end
						4'd11: begin
							commandscheduler459 <= t_basiclowerer_lhs_array_muxed29;
						end
						4'd12: begin
							commandscheduler460 <= t_basiclowerer_lhs_array_muxed29;
						end
						4'd13: begin
							commandscheduler461 <= t_basiclowerer_lhs_array_muxed29;
						end
						4'd14: begin
							commandscheduler462 <= t_basiclowerer_lhs_array_muxed29;
						end
						4'd15: begin
							commandscheduler463 <= t_basiclowerer_lhs_array_muxed29;
						end
						5'd16: begin
							commandscheduler464 <= t_basiclowerer_lhs_array_muxed29;
						end
						5'd17: begin
							commandscheduler465 <= t_basiclowerer_lhs_array_muxed29;
						end
						5'd18: begin
							commandscheduler466 <= t_basiclowerer_lhs_array_muxed29;
						end
						5'd19: begin
							commandscheduler467 <= t_basiclowerer_lhs_array_muxed29;
						end
						5'd20: begin
							commandscheduler468 <= t_basiclowerer_lhs_array_muxed29;
						end
						5'd21: begin
							commandscheduler469 <= t_basiclowerer_lhs_array_muxed29;
						end
						5'd22: begin
							commandscheduler470 <= t_basiclowerer_lhs_array_muxed29;
						end
						5'd23: begin
							commandscheduler471 <= t_basiclowerer_lhs_array_muxed29;
						end
						5'd24: begin
							commandscheduler472 <= t_basiclowerer_lhs_array_muxed29;
						end
						5'd25: begin
							commandscheduler473 <= t_basiclowerer_lhs_array_muxed29;
						end
						5'd26: begin
							commandscheduler474 <= t_basiclowerer_lhs_array_muxed29;
						end
						5'd27: begin
							commandscheduler475 <= t_basiclowerer_lhs_array_muxed29;
						end
						5'd28: begin
							commandscheduler476 <= t_basiclowerer_lhs_array_muxed29;
						end
						5'd29: begin
							commandscheduler477 <= t_basiclowerer_lhs_array_muxed29;
						end
						5'd30: begin
							commandscheduler478 <= t_basiclowerer_lhs_array_muxed29;
						end
						default: begin
							commandscheduler479 <= t_basiclowerer_lhs_array_muxed29;
						end
					endcase
				end
				default: begin
					t_basiclowerer_lhs_array_muxed31 = t_basiclowerer_lhs_array_muxed0;
					case (((commandscheduler_bank_group * 3'd4) + commandscheduler_bank))
						1'd0: begin
							commandscheduler528 <= t_basiclowerer_lhs_array_muxed32;
						end
						1'd1: begin
							commandscheduler529 <= t_basiclowerer_lhs_array_muxed32;
						end
						2'd2: begin
							commandscheduler530 <= t_basiclowerer_lhs_array_muxed32;
						end
						2'd3: begin
							commandscheduler531 <= t_basiclowerer_lhs_array_muxed32;
						end
						3'd4: begin
							commandscheduler532 <= t_basiclowerer_lhs_array_muxed32;
						end
						3'd5: begin
							commandscheduler533 <= t_basiclowerer_lhs_array_muxed32;
						end
						3'd6: begin
							commandscheduler534 <= t_basiclowerer_lhs_array_muxed32;
						end
						3'd7: begin
							commandscheduler535 <= t_basiclowerer_lhs_array_muxed32;
						end
						4'd8: begin
							commandscheduler536 <= t_basiclowerer_lhs_array_muxed32;
						end
						4'd9: begin
							commandscheduler537 <= t_basiclowerer_lhs_array_muxed32;
						end
						4'd10: begin
							commandscheduler538 <= t_basiclowerer_lhs_array_muxed32;
						end
						4'd11: begin
							commandscheduler539 <= t_basiclowerer_lhs_array_muxed32;
						end
						4'd12: begin
							commandscheduler540 <= t_basiclowerer_lhs_array_muxed32;
						end
						4'd13: begin
							commandscheduler541 <= t_basiclowerer_lhs_array_muxed32;
						end
						4'd14: begin
							commandscheduler542 <= t_basiclowerer_lhs_array_muxed32;
						end
						default: begin
							commandscheduler543 <= t_basiclowerer_lhs_array_muxed32;
						end
					endcase
					case (t_basiclowerer_lhs_array_muxed32)
						1'd0: begin
							commandscheduler480 <= t_basiclowerer_lhs_array_muxed31;
						end
						1'd1: begin
							commandscheduler481 <= t_basiclowerer_lhs_array_muxed31;
						end
						2'd2: begin
							commandscheduler482 <= t_basiclowerer_lhs_array_muxed31;
						end
						2'd3: begin
							commandscheduler483 <= t_basiclowerer_lhs_array_muxed31;
						end
						3'd4: begin
							commandscheduler484 <= t_basiclowerer_lhs_array_muxed31;
						end
						3'd5: begin
							commandscheduler485 <= t_basiclowerer_lhs_array_muxed31;
						end
						3'd6: begin
							commandscheduler486 <= t_basiclowerer_lhs_array_muxed31;
						end
						3'd7: begin
							commandscheduler487 <= t_basiclowerer_lhs_array_muxed31;
						end
						4'd8: begin
							commandscheduler488 <= t_basiclowerer_lhs_array_muxed31;
						end
						4'd9: begin
							commandscheduler489 <= t_basiclowerer_lhs_array_muxed31;
						end
						4'd10: begin
							commandscheduler490 <= t_basiclowerer_lhs_array_muxed31;
						end
						4'd11: begin
							commandscheduler491 <= t_basiclowerer_lhs_array_muxed31;
						end
						4'd12: begin
							commandscheduler492 <= t_basiclowerer_lhs_array_muxed31;
						end
						4'd13: begin
							commandscheduler493 <= t_basiclowerer_lhs_array_muxed31;
						end
						4'd14: begin
							commandscheduler494 <= t_basiclowerer_lhs_array_muxed31;
						end
						4'd15: begin
							commandscheduler495 <= t_basiclowerer_lhs_array_muxed31;
						end
						5'd16: begin
							commandscheduler496 <= t_basiclowerer_lhs_array_muxed31;
						end
						5'd17: begin
							commandscheduler497 <= t_basiclowerer_lhs_array_muxed31;
						end
						5'd18: begin
							commandscheduler498 <= t_basiclowerer_lhs_array_muxed31;
						end
						5'd19: begin
							commandscheduler499 <= t_basiclowerer_lhs_array_muxed31;
						end
						5'd20: begin
							commandscheduler500 <= t_basiclowerer_lhs_array_muxed31;
						end
						5'd21: begin
							commandscheduler501 <= t_basiclowerer_lhs_array_muxed31;
						end
						5'd22: begin
							commandscheduler502 <= t_basiclowerer_lhs_array_muxed31;
						end
						5'd23: begin
							commandscheduler503 <= t_basiclowerer_lhs_array_muxed31;
						end
						5'd24: begin
							commandscheduler504 <= t_basiclowerer_lhs_array_muxed31;
						end
						5'd25: begin
							commandscheduler505 <= t_basiclowerer_lhs_array_muxed31;
						end
						5'd26: begin
							commandscheduler506 <= t_basiclowerer_lhs_array_muxed31;
						end
						5'd27: begin
							commandscheduler507 <= t_basiclowerer_lhs_array_muxed31;
						end
						5'd28: begin
							commandscheduler508 <= t_basiclowerer_lhs_array_muxed31;
						end
						5'd29: begin
							commandscheduler509 <= t_basiclowerer_lhs_array_muxed31;
						end
						5'd30: begin
							commandscheduler510 <= t_basiclowerer_lhs_array_muxed31;
						end
						default: begin
							commandscheduler511 <= t_basiclowerer_lhs_array_muxed31;
						end
					endcase
				end
			endcase
			if ((t_basiclowerer_basiclowerer_array_muxed == 5'd31)) begin
				t_basiclowerer_t_array_muxed = 1'd0;
				case (((commandscheduler_bank_group * 3'd4) + commandscheduler_bank))
					1'd0: begin
						commandscheduler528 <= t_basiclowerer_t_array_muxed;
					end
					1'd1: begin
						commandscheduler529 <= t_basiclowerer_t_array_muxed;
					end
					2'd2: begin
						commandscheduler530 <= t_basiclowerer_t_array_muxed;
					end
					2'd3: begin
						commandscheduler531 <= t_basiclowerer_t_array_muxed;
					end
					3'd4: begin
						commandscheduler532 <= t_basiclowerer_t_array_muxed;
					end
					3'd5: begin
						commandscheduler533 <= t_basiclowerer_t_array_muxed;
					end
					3'd6: begin
						commandscheduler534 <= t_basiclowerer_t_array_muxed;
					end
					3'd7: begin
						commandscheduler535 <= t_basiclowerer_t_array_muxed;
					end
					4'd8: begin
						commandscheduler536 <= t_basiclowerer_t_array_muxed;
					end
					4'd9: begin
						commandscheduler537 <= t_basiclowerer_t_array_muxed;
					end
					4'd10: begin
						commandscheduler538 <= t_basiclowerer_t_array_muxed;
					end
					4'd11: begin
						commandscheduler539 <= t_basiclowerer_t_array_muxed;
					end
					4'd12: begin
						commandscheduler540 <= t_basiclowerer_t_array_muxed;
					end
					4'd13: begin
						commandscheduler541 <= t_basiclowerer_t_array_muxed;
					end
					4'd14: begin
						commandscheduler542 <= t_basiclowerer_t_array_muxed;
					end
					default: begin
						commandscheduler543 <= t_basiclowerer_t_array_muxed;
					end
				endcase
			end else begin
				t_basiclowerer_lhs_array_muxed33 = (t_basiclowerer_rhs_array_muxed + 1'd1);
				case (((commandscheduler_bank_group * 3'd4) + commandscheduler_bank))
					1'd0: begin
						commandscheduler528 <= t_basiclowerer_lhs_array_muxed33;
					end
					1'd1: begin
						commandscheduler529 <= t_basiclowerer_lhs_array_muxed33;
					end
					2'd2: begin
						commandscheduler530 <= t_basiclowerer_lhs_array_muxed33;
					end
					2'd3: begin
						commandscheduler531 <= t_basiclowerer_lhs_array_muxed33;
					end
					3'd4: begin
						commandscheduler532 <= t_basiclowerer_lhs_array_muxed33;
					end
					3'd5: begin
						commandscheduler533 <= t_basiclowerer_lhs_array_muxed33;
					end
					3'd6: begin
						commandscheduler534 <= t_basiclowerer_lhs_array_muxed33;
					end
					3'd7: begin
						commandscheduler535 <= t_basiclowerer_lhs_array_muxed33;
					end
					4'd8: begin
						commandscheduler536 <= t_basiclowerer_lhs_array_muxed33;
					end
					4'd9: begin
						commandscheduler537 <= t_basiclowerer_lhs_array_muxed33;
					end
					4'd10: begin
						commandscheduler538 <= t_basiclowerer_lhs_array_muxed33;
					end
					4'd11: begin
						commandscheduler539 <= t_basiclowerer_lhs_array_muxed33;
					end
					4'd12: begin
						commandscheduler540 <= t_basiclowerer_lhs_array_muxed33;
					end
					4'd13: begin
						commandscheduler541 <= t_basiclowerer_lhs_array_muxed33;
					end
					4'd14: begin
						commandscheduler542 <= t_basiclowerer_lhs_array_muxed33;
					end
					default: begin
						commandscheduler543 <= t_basiclowerer_lhs_array_muxed33;
					end
				endcase
			end
			commandscheduler_cmd_ready <= 1'd1;
		end else begin
			commandscheduler_cmd_ready <= 1'd0;
		end
	end
	if ((~commandscheduler_cmd_executed)) begin
		case (((commandscheduler_bank_group * 3'd4) + commandscheduler_bank))
			1'd0: begin
				if ((commandscheduler512 != commandscheduler528)) begin
					commandscheduler_scheduled_cmd_type <= t_cases_rhs_array_muxed0;
					commandscheduler_scheduled_row <= t_cases_rhs_array_muxed1;
					commandscheduler_scheduled_col <= t_cases_rhs_array_muxed2;
					commandscheduler_scheduled_bank_group <= 1'd0;
					commandscheduler_scheduled_bank <= 1'd0;
					if ((commandscheduler512 == 5'd31)) begin
						commandscheduler512 <= 1'd0;
					end else begin
						commandscheduler512 <= (commandscheduler512 + 1'd1);
					end
					commandscheduler_cmd_executed <= 1'd1;
				end
			end
			1'd1: begin
				if ((commandscheduler513 != commandscheduler529)) begin
					commandscheduler_scheduled_cmd_type <= t_cases_rhs_array_muxed3;
					commandscheduler_scheduled_row <= t_cases_rhs_array_muxed4;
					commandscheduler_scheduled_col <= t_cases_rhs_array_muxed5;
					commandscheduler_scheduled_bank_group <= 1'd0;
					commandscheduler_scheduled_bank <= 1'd1;
					if ((commandscheduler513 == 5'd31)) begin
						commandscheduler513 <= 1'd0;
					end else begin
						commandscheduler513 <= (commandscheduler513 + 1'd1);
					end
					commandscheduler_cmd_executed <= 1'd1;
				end
			end
			2'd2: begin
				if ((commandscheduler514 != commandscheduler530)) begin
					commandscheduler_scheduled_cmd_type <= t_cases_rhs_array_muxed6;
					commandscheduler_scheduled_row <= t_cases_rhs_array_muxed7;
					commandscheduler_scheduled_col <= t_cases_rhs_array_muxed8;
					commandscheduler_scheduled_bank_group <= 1'd0;
					commandscheduler_scheduled_bank <= 2'd2;
					if ((commandscheduler514 == 5'd31)) begin
						commandscheduler514 <= 1'd0;
					end else begin
						commandscheduler514 <= (commandscheduler514 + 1'd1);
					end
					commandscheduler_cmd_executed <= 1'd1;
				end
			end
			2'd3: begin
				if ((commandscheduler515 != commandscheduler531)) begin
					commandscheduler_scheduled_cmd_type <= t_cases_rhs_array_muxed9;
					commandscheduler_scheduled_row <= t_cases_rhs_array_muxed10;
					commandscheduler_scheduled_col <= t_cases_rhs_array_muxed11;
					commandscheduler_scheduled_bank_group <= 1'd0;
					commandscheduler_scheduled_bank <= 2'd3;
					if ((commandscheduler515 == 5'd31)) begin
						commandscheduler515 <= 1'd0;
					end else begin
						commandscheduler515 <= (commandscheduler515 + 1'd1);
					end
					commandscheduler_cmd_executed <= 1'd1;
				end
			end
			3'd4: begin
				if ((commandscheduler516 != commandscheduler532)) begin
					commandscheduler_scheduled_cmd_type <= t_cases_rhs_array_muxed12;
					commandscheduler_scheduled_row <= t_cases_rhs_array_muxed13;
					commandscheduler_scheduled_col <= t_cases_rhs_array_muxed14;
					commandscheduler_scheduled_bank_group <= 1'd1;
					commandscheduler_scheduled_bank <= 1'd0;
					if ((commandscheduler516 == 5'd31)) begin
						commandscheduler516 <= 1'd0;
					end else begin
						commandscheduler516 <= (commandscheduler516 + 1'd1);
					end
					commandscheduler_cmd_executed <= 1'd1;
				end
			end
			3'd5: begin
				if ((commandscheduler517 != commandscheduler533)) begin
					commandscheduler_scheduled_cmd_type <= t_cases_rhs_array_muxed15;
					commandscheduler_scheduled_row <= t_cases_rhs_array_muxed16;
					commandscheduler_scheduled_col <= t_cases_rhs_array_muxed17;
					commandscheduler_scheduled_bank_group <= 1'd1;
					commandscheduler_scheduled_bank <= 1'd1;
					if ((commandscheduler517 == 5'd31)) begin
						commandscheduler517 <= 1'd0;
					end else begin
						commandscheduler517 <= (commandscheduler517 + 1'd1);
					end
					commandscheduler_cmd_executed <= 1'd1;
				end
			end
			3'd6: begin
				if ((commandscheduler518 != commandscheduler534)) begin
					commandscheduler_scheduled_cmd_type <= t_cases_rhs_array_muxed18;
					commandscheduler_scheduled_row <= t_cases_rhs_array_muxed19;
					commandscheduler_scheduled_col <= t_cases_rhs_array_muxed20;
					commandscheduler_scheduled_bank_group <= 1'd1;
					commandscheduler_scheduled_bank <= 2'd2;
					if ((commandscheduler518 == 5'd31)) begin
						commandscheduler518 <= 1'd0;
					end else begin
						commandscheduler518 <= (commandscheduler518 + 1'd1);
					end
					commandscheduler_cmd_executed <= 1'd1;
				end
			end
			3'd7: begin
				if ((commandscheduler519 != commandscheduler535)) begin
					commandscheduler_scheduled_cmd_type <= t_cases_rhs_array_muxed21;
					commandscheduler_scheduled_row <= t_cases_rhs_array_muxed22;
					commandscheduler_scheduled_col <= t_cases_rhs_array_muxed23;
					commandscheduler_scheduled_bank_group <= 1'd1;
					commandscheduler_scheduled_bank <= 2'd3;
					if ((commandscheduler519 == 5'd31)) begin
						commandscheduler519 <= 1'd0;
					end else begin
						commandscheduler519 <= (commandscheduler519 + 1'd1);
					end
					commandscheduler_cmd_executed <= 1'd1;
				end
			end
			4'd8: begin
				if ((commandscheduler520 != commandscheduler536)) begin
					commandscheduler_scheduled_cmd_type <= t_cases_rhs_array_muxed24;
					commandscheduler_scheduled_row <= t_cases_rhs_array_muxed25;
					commandscheduler_scheduled_col <= t_cases_rhs_array_muxed26;
					commandscheduler_scheduled_bank_group <= 2'd2;
					commandscheduler_scheduled_bank <= 1'd0;
					if ((commandscheduler520 == 5'd31)) begin
						commandscheduler520 <= 1'd0;
					end else begin
						commandscheduler520 <= (commandscheduler520 + 1'd1);
					end
					commandscheduler_cmd_executed <= 1'd1;
				end
			end
			4'd9: begin
				if ((commandscheduler521 != commandscheduler537)) begin
					commandscheduler_scheduled_cmd_type <= t_cases_rhs_array_muxed27;
					commandscheduler_scheduled_row <= t_cases_rhs_array_muxed28;
					commandscheduler_scheduled_col <= t_cases_rhs_array_muxed29;
					commandscheduler_scheduled_bank_group <= 2'd2;
					commandscheduler_scheduled_bank <= 1'd1;
					if ((commandscheduler521 == 5'd31)) begin
						commandscheduler521 <= 1'd0;
					end else begin
						commandscheduler521 <= (commandscheduler521 + 1'd1);
					end
					commandscheduler_cmd_executed <= 1'd1;
				end
			end
			4'd10: begin
				if ((commandscheduler522 != commandscheduler538)) begin
					commandscheduler_scheduled_cmd_type <= t_cases_rhs_array_muxed30;
					commandscheduler_scheduled_row <= t_cases_rhs_array_muxed31;
					commandscheduler_scheduled_col <= t_cases_rhs_array_muxed32;
					commandscheduler_scheduled_bank_group <= 2'd2;
					commandscheduler_scheduled_bank <= 2'd2;
					if ((commandscheduler522 == 5'd31)) begin
						commandscheduler522 <= 1'd0;
					end else begin
						commandscheduler522 <= (commandscheduler522 + 1'd1);
					end
					commandscheduler_cmd_executed <= 1'd1;
				end
			end
			4'd11: begin
				if ((commandscheduler523 != commandscheduler539)) begin
					commandscheduler_scheduled_cmd_type <= t_cases_rhs_array_muxed33;
					commandscheduler_scheduled_row <= t_cases_rhs_array_muxed34;
					commandscheduler_scheduled_col <= t_cases_rhs_array_muxed35;
					commandscheduler_scheduled_bank_group <= 2'd2;
					commandscheduler_scheduled_bank <= 2'd3;
					if ((commandscheduler523 == 5'd31)) begin
						commandscheduler523 <= 1'd0;
					end else begin
						commandscheduler523 <= (commandscheduler523 + 1'd1);
					end
					commandscheduler_cmd_executed <= 1'd1;
				end
			end
			4'd12: begin
				if ((commandscheduler524 != commandscheduler540)) begin
					commandscheduler_scheduled_cmd_type <= t_cases_rhs_array_muxed36;
					commandscheduler_scheduled_row <= t_cases_rhs_array_muxed37;
					commandscheduler_scheduled_col <= t_cases_rhs_array_muxed38;
					commandscheduler_scheduled_bank_group <= 2'd3;
					commandscheduler_scheduled_bank <= 1'd0;
					if ((commandscheduler524 == 5'd31)) begin
						commandscheduler524 <= 1'd0;
					end else begin
						commandscheduler524 <= (commandscheduler524 + 1'd1);
					end
					commandscheduler_cmd_executed <= 1'd1;
				end
			end
			4'd13: begin
				if ((commandscheduler525 != commandscheduler541)) begin
					commandscheduler_scheduled_cmd_type <= t_cases_rhs_array_muxed39;
					commandscheduler_scheduled_row <= t_cases_rhs_array_muxed40;
					commandscheduler_scheduled_col <= t_cases_rhs_array_muxed41;
					commandscheduler_scheduled_bank_group <= 2'd3;
					commandscheduler_scheduled_bank <= 1'd1;
					if ((commandscheduler525 == 5'd31)) begin
						commandscheduler525 <= 1'd0;
					end else begin
						commandscheduler525 <= (commandscheduler525 + 1'd1);
					end
					commandscheduler_cmd_executed <= 1'd1;
				end
			end
			4'd14: begin
				if ((commandscheduler526 != commandscheduler542)) begin
					commandscheduler_scheduled_cmd_type <= t_cases_rhs_array_muxed42;
					commandscheduler_scheduled_row <= t_cases_rhs_array_muxed43;
					commandscheduler_scheduled_col <= t_cases_rhs_array_muxed44;
					commandscheduler_scheduled_bank_group <= 2'd3;
					commandscheduler_scheduled_bank <= 2'd2;
					if ((commandscheduler526 == 5'd31)) begin
						commandscheduler526 <= 1'd0;
					end else begin
						commandscheduler526 <= (commandscheduler526 + 1'd1);
					end
					commandscheduler_cmd_executed <= 1'd1;
				end
			end
			4'd15: begin
				if ((commandscheduler527 != commandscheduler543)) begin
					commandscheduler_scheduled_cmd_type <= t_cases_rhs_array_muxed45;
					commandscheduler_scheduled_row <= t_cases_rhs_array_muxed46;
					commandscheduler_scheduled_col <= t_cases_rhs_array_muxed47;
					commandscheduler_scheduled_bank_group <= 2'd3;
					commandscheduler_scheduled_bank <= 2'd3;
					if ((commandscheduler527 == 5'd31)) begin
						commandscheduler527 <= 1'd0;
					end else begin
						commandscheduler527 <= (commandscheduler527 + 1'd1);
					end
					commandscheduler_cmd_executed <= 1'd1;
				end
			end
		endcase
	end
	case (rowbuffermanager_cmd_decoded)
		2'd2: begin
			cases_lhs_array_muxed35 = 1'd0;
			case (rowbuffermanager_bank_group)
				1'd0: begin
					cases_lhs_array_muxed36 = cases_lhs_array_muxed35;
					case (rowbuffermanager_bank)
						1'd0: begin
							rowbuffermanager0 <= cases_lhs_array_muxed36;
						end
						1'd1: begin
							rowbuffermanager1 <= cases_lhs_array_muxed36;
						end
						2'd2: begin
							rowbuffermanager2 <= cases_lhs_array_muxed36;
						end
						default: begin
							rowbuffermanager3 <= cases_lhs_array_muxed36;
						end
					endcase
				end
				1'd1: begin
					cases_lhs_array_muxed37 = cases_lhs_array_muxed35;
					case (rowbuffermanager_bank)
						1'd0: begin
							rowbuffermanager4 <= cases_lhs_array_muxed37;
						end
						1'd1: begin
							rowbuffermanager5 <= cases_lhs_array_muxed37;
						end
						2'd2: begin
							rowbuffermanager6 <= cases_lhs_array_muxed37;
						end
						default: begin
							rowbuffermanager7 <= cases_lhs_array_muxed37;
						end
					endcase
				end
				2'd2: begin
					cases_lhs_array_muxed38 = cases_lhs_array_muxed35;
					case (rowbuffermanager_bank)
						1'd0: begin
							rowbuffermanager8 <= cases_lhs_array_muxed38;
						end
						1'd1: begin
							rowbuffermanager9 <= cases_lhs_array_muxed38;
						end
						2'd2: begin
							rowbuffermanager10 <= cases_lhs_array_muxed38;
						end
						default: begin
							rowbuffermanager11 <= cases_lhs_array_muxed38;
						end
					endcase
				end
				default: begin
					cases_lhs_array_muxed39 = cases_lhs_array_muxed35;
					case (rowbuffermanager_bank)
						1'd0: begin
							rowbuffermanager12 <= cases_lhs_array_muxed39;
						end
						1'd1: begin
							rowbuffermanager13 <= cases_lhs_array_muxed39;
						end
						2'd2: begin
							rowbuffermanager14 <= cases_lhs_array_muxed39;
						end
						default: begin
							rowbuffermanager15 <= cases_lhs_array_muxed39;
						end
					endcase
				end
			endcase
		end
		2'd3: begin
			cases_lhs_array_muxed25 = 1'd1;
			case (rowbuffermanager_bank_group)
				1'd0: begin
					cases_lhs_array_muxed26 = cases_lhs_array_muxed25;
					case (rowbuffermanager_bank)
						1'd0: begin
							rowbuffermanager0 <= cases_lhs_array_muxed26;
						end
						1'd1: begin
							rowbuffermanager1 <= cases_lhs_array_muxed26;
						end
						2'd2: begin
							rowbuffermanager2 <= cases_lhs_array_muxed26;
						end
						default: begin
							rowbuffermanager3 <= cases_lhs_array_muxed26;
						end
					endcase
				end
				1'd1: begin
					cases_lhs_array_muxed27 = cases_lhs_array_muxed25;
					case (rowbuffermanager_bank)
						1'd0: begin
							rowbuffermanager4 <= cases_lhs_array_muxed27;
						end
						1'd1: begin
							rowbuffermanager5 <= cases_lhs_array_muxed27;
						end
						2'd2: begin
							rowbuffermanager6 <= cases_lhs_array_muxed27;
						end
						default: begin
							rowbuffermanager7 <= cases_lhs_array_muxed27;
						end
					endcase
				end
				2'd2: begin
					cases_lhs_array_muxed28 = cases_lhs_array_muxed25;
					case (rowbuffermanager_bank)
						1'd0: begin
							rowbuffermanager8 <= cases_lhs_array_muxed28;
						end
						1'd1: begin
							rowbuffermanager9 <= cases_lhs_array_muxed28;
						end
						2'd2: begin
							rowbuffermanager10 <= cases_lhs_array_muxed28;
						end
						default: begin
							rowbuffermanager11 <= cases_lhs_array_muxed28;
						end
					endcase
				end
				default: begin
					cases_lhs_array_muxed29 = cases_lhs_array_muxed25;
					case (rowbuffermanager_bank)
						1'd0: begin
							rowbuffermanager12 <= cases_lhs_array_muxed29;
						end
						1'd1: begin
							rowbuffermanager13 <= cases_lhs_array_muxed29;
						end
						2'd2: begin
							rowbuffermanager14 <= cases_lhs_array_muxed29;
						end
						default: begin
							rowbuffermanager15 <= cases_lhs_array_muxed29;
						end
					endcase
				end
			endcase
			cases_lhs_array_muxed30 = rowbuffermanager_row;
			case (rowbuffermanager_bank_group)
				1'd0: begin
					cases_lhs_array_muxed31 = cases_lhs_array_muxed30;
					case (rowbuffermanager_bank)
						1'd0: begin
							rowbuffermanager16 <= cases_lhs_array_muxed31;
						end
						1'd1: begin
							rowbuffermanager17 <= cases_lhs_array_muxed31;
						end
						2'd2: begin
							rowbuffermanager18 <= cases_lhs_array_muxed31;
						end
						default: begin
							rowbuffermanager19 <= cases_lhs_array_muxed31;
						end
					endcase
				end
				1'd1: begin
					cases_lhs_array_muxed32 = cases_lhs_array_muxed30;
					case (rowbuffermanager_bank)
						1'd0: begin
							rowbuffermanager20 <= cases_lhs_array_muxed32;
						end
						1'd1: begin
							rowbuffermanager21 <= cases_lhs_array_muxed32;
						end
						2'd2: begin
							rowbuffermanager22 <= cases_lhs_array_muxed32;
						end
						default: begin
							rowbuffermanager23 <= cases_lhs_array_muxed32;
						end
					endcase
				end
				2'd2: begin
					cases_lhs_array_muxed33 = cases_lhs_array_muxed30;
					case (rowbuffermanager_bank)
						1'd0: begin
							rowbuffermanager24 <= cases_lhs_array_muxed33;
						end
						1'd1: begin
							rowbuffermanager25 <= cases_lhs_array_muxed33;
						end
						2'd2: begin
							rowbuffermanager26 <= cases_lhs_array_muxed33;
						end
						default: begin
							rowbuffermanager27 <= cases_lhs_array_muxed33;
						end
					endcase
				end
				default: begin
					cases_lhs_array_muxed34 = cases_lhs_array_muxed30;
					case (rowbuffermanager_bank)
						1'd0: begin
							rowbuffermanager28 <= cases_lhs_array_muxed34;
						end
						1'd1: begin
							rowbuffermanager29 <= cases_lhs_array_muxed34;
						end
						2'd2: begin
							rowbuffermanager30 <= cases_lhs_array_muxed34;
						end
						default: begin
							rowbuffermanager31 <= cases_lhs_array_muxed34;
						end
					endcase
				end
			endcase
		end
		3'd4: begin
			if ((cases_basiclowerer_array_muxed15 != rowbuffermanager_row)) begin
				cases_lhs_array_muxed45 = 1'd0;
				case (rowbuffermanager_bank_group)
					1'd0: begin
						cases_lhs_array_muxed46 = cases_lhs_array_muxed45;
						case (rowbuffermanager_bank)
							1'd0: begin
								rowbuffermanager0 <= cases_lhs_array_muxed46;
							end
							1'd1: begin
								rowbuffermanager1 <= cases_lhs_array_muxed46;
							end
							2'd2: begin
								rowbuffermanager2 <= cases_lhs_array_muxed46;
							end
							default: begin
								rowbuffermanager3 <= cases_lhs_array_muxed46;
							end
						endcase
					end
					1'd1: begin
						cases_lhs_array_muxed47 = cases_lhs_array_muxed45;
						case (rowbuffermanager_bank)
							1'd0: begin
								rowbuffermanager4 <= cases_lhs_array_muxed47;
							end
							1'd1: begin
								rowbuffermanager5 <= cases_lhs_array_muxed47;
							end
							2'd2: begin
								rowbuffermanager6 <= cases_lhs_array_muxed47;
							end
							default: begin
								rowbuffermanager7 <= cases_lhs_array_muxed47;
							end
						endcase
					end
					2'd2: begin
						cases_lhs_array_muxed48 = cases_lhs_array_muxed45;
						case (rowbuffermanager_bank)
							1'd0: begin
								rowbuffermanager8 <= cases_lhs_array_muxed48;
							end
							1'd1: begin
								rowbuffermanager9 <= cases_lhs_array_muxed48;
							end
							2'd2: begin
								rowbuffermanager10 <= cases_lhs_array_muxed48;
							end
							default: begin
								rowbuffermanager11 <= cases_lhs_array_muxed48;
							end
						endcase
					end
					default: begin
						cases_lhs_array_muxed49 = cases_lhs_array_muxed45;
						case (rowbuffermanager_bank)
							1'd0: begin
								rowbuffermanager12 <= cases_lhs_array_muxed49;
							end
							1'd1: begin
								rowbuffermanager13 <= cases_lhs_array_muxed49;
							end
							2'd2: begin
								rowbuffermanager14 <= cases_lhs_array_muxed49;
							end
							default: begin
								rowbuffermanager15 <= cases_lhs_array_muxed49;
							end
						endcase
					end
				endcase
				cases_basiclowerer_array_muxed20 = 1'd1;
				case (rowbuffermanager_bank_group)
					1'd0: begin
						cases_basiclowerer_array_muxed21 = cases_basiclowerer_array_muxed20;
						case (rowbuffermanager_bank)
							1'd0: begin
								rowbuffermanager0 <= cases_basiclowerer_array_muxed21;
							end
							1'd1: begin
								rowbuffermanager1 <= cases_basiclowerer_array_muxed21;
							end
							2'd2: begin
								rowbuffermanager2 <= cases_basiclowerer_array_muxed21;
							end
							default: begin
								rowbuffermanager3 <= cases_basiclowerer_array_muxed21;
							end
						endcase
					end
					1'd1: begin
						cases_basiclowerer_array_muxed22 = cases_basiclowerer_array_muxed20;
						case (rowbuffermanager_bank)
							1'd0: begin
								rowbuffermanager4 <= cases_basiclowerer_array_muxed22;
							end
							1'd1: begin
								rowbuffermanager5 <= cases_basiclowerer_array_muxed22;
							end
							2'd2: begin
								rowbuffermanager6 <= cases_basiclowerer_array_muxed22;
							end
							default: begin
								rowbuffermanager7 <= cases_basiclowerer_array_muxed22;
							end
						endcase
					end
					2'd2: begin
						cases_basiclowerer_array_muxed23 = cases_basiclowerer_array_muxed20;
						case (rowbuffermanager_bank)
							1'd0: begin
								rowbuffermanager8 <= cases_basiclowerer_array_muxed23;
							end
							1'd1: begin
								rowbuffermanager9 <= cases_basiclowerer_array_muxed23;
							end
							2'd2: begin
								rowbuffermanager10 <= cases_basiclowerer_array_muxed23;
							end
							default: begin
								rowbuffermanager11 <= cases_basiclowerer_array_muxed23;
							end
						endcase
					end
					default: begin
						cases_basiclowerer_array_muxed24 = cases_basiclowerer_array_muxed20;
						case (rowbuffermanager_bank)
							1'd0: begin
								rowbuffermanager12 <= cases_basiclowerer_array_muxed24;
							end
							1'd1: begin
								rowbuffermanager13 <= cases_basiclowerer_array_muxed24;
							end
							2'd2: begin
								rowbuffermanager14 <= cases_basiclowerer_array_muxed24;
							end
							default: begin
								rowbuffermanager15 <= cases_basiclowerer_array_muxed24;
							end
						endcase
					end
				endcase
				cases_basiclowerer_array_muxed25 = rowbuffermanager_row;
				case (rowbuffermanager_bank_group)
					1'd0: begin
						cases_basiclowerer_array_muxed26 = cases_basiclowerer_array_muxed25;
						case (rowbuffermanager_bank)
							1'd0: begin
								rowbuffermanager16 <= cases_basiclowerer_array_muxed26;
							end
							1'd1: begin
								rowbuffermanager17 <= cases_basiclowerer_array_muxed26;
							end
							2'd2: begin
								rowbuffermanager18 <= cases_basiclowerer_array_muxed26;
							end
							default: begin
								rowbuffermanager19 <= cases_basiclowerer_array_muxed26;
							end
						endcase
					end
					1'd1: begin
						cases_basiclowerer_array_muxed27 = cases_basiclowerer_array_muxed25;
						case (rowbuffermanager_bank)
							1'd0: begin
								rowbuffermanager20 <= cases_basiclowerer_array_muxed27;
							end
							1'd1: begin
								rowbuffermanager21 <= cases_basiclowerer_array_muxed27;
							end
							2'd2: begin
								rowbuffermanager22 <= cases_basiclowerer_array_muxed27;
							end
							default: begin
								rowbuffermanager23 <= cases_basiclowerer_array_muxed27;
							end
						endcase
					end
					2'd2: begin
						cases_basiclowerer_array_muxed28 = cases_basiclowerer_array_muxed25;
						case (rowbuffermanager_bank)
							1'd0: begin
								rowbuffermanager24 <= cases_basiclowerer_array_muxed28;
							end
							1'd1: begin
								rowbuffermanager25 <= cases_basiclowerer_array_muxed28;
							end
							2'd2: begin
								rowbuffermanager26 <= cases_basiclowerer_array_muxed28;
							end
							default: begin
								rowbuffermanager27 <= cases_basiclowerer_array_muxed28;
							end
						endcase
					end
					default: begin
						cases_basiclowerer_array_muxed29 = cases_basiclowerer_array_muxed25;
						case (rowbuffermanager_bank)
							1'd0: begin
								rowbuffermanager28 <= cases_basiclowerer_array_muxed29;
							end
							1'd1: begin
								rowbuffermanager29 <= cases_basiclowerer_array_muxed29;
							end
							2'd2: begin
								rowbuffermanager30 <= cases_basiclowerer_array_muxed29;
							end
							default: begin
								rowbuffermanager31 <= cases_basiclowerer_array_muxed29;
							end
						endcase
					end
				endcase
			end
		end
		3'd5: begin
			if ((cases_basiclowerer_array_muxed0 != rowbuffermanager_row)) begin
				cases_lhs_array_muxed40 = 1'd0;
				case (rowbuffermanager_bank_group)
					1'd0: begin
						cases_lhs_array_muxed41 = cases_lhs_array_muxed40;
						case (rowbuffermanager_bank)
							1'd0: begin
								rowbuffermanager0 <= cases_lhs_array_muxed41;
							end
							1'd1: begin
								rowbuffermanager1 <= cases_lhs_array_muxed41;
							end
							2'd2: begin
								rowbuffermanager2 <= cases_lhs_array_muxed41;
							end
							default: begin
								rowbuffermanager3 <= cases_lhs_array_muxed41;
							end
						endcase
					end
					1'd1: begin
						cases_lhs_array_muxed42 = cases_lhs_array_muxed40;
						case (rowbuffermanager_bank)
							1'd0: begin
								rowbuffermanager4 <= cases_lhs_array_muxed42;
							end
							1'd1: begin
								rowbuffermanager5 <= cases_lhs_array_muxed42;
							end
							2'd2: begin
								rowbuffermanager6 <= cases_lhs_array_muxed42;
							end
							default: begin
								rowbuffermanager7 <= cases_lhs_array_muxed42;
							end
						endcase
					end
					2'd2: begin
						cases_lhs_array_muxed43 = cases_lhs_array_muxed40;
						case (rowbuffermanager_bank)
							1'd0: begin
								rowbuffermanager8 <= cases_lhs_array_muxed43;
							end
							1'd1: begin
								rowbuffermanager9 <= cases_lhs_array_muxed43;
							end
							2'd2: begin
								rowbuffermanager10 <= cases_lhs_array_muxed43;
							end
							default: begin
								rowbuffermanager11 <= cases_lhs_array_muxed43;
							end
						endcase
					end
					default: begin
						cases_lhs_array_muxed44 = cases_lhs_array_muxed40;
						case (rowbuffermanager_bank)
							1'd0: begin
								rowbuffermanager12 <= cases_lhs_array_muxed44;
							end
							1'd1: begin
								rowbuffermanager13 <= cases_lhs_array_muxed44;
							end
							2'd2: begin
								rowbuffermanager14 <= cases_lhs_array_muxed44;
							end
							default: begin
								rowbuffermanager15 <= cases_lhs_array_muxed44;
							end
						endcase
					end
				endcase
				cases_basiclowerer_array_muxed5 = 1'd1;
				case (rowbuffermanager_bank_group)
					1'd0: begin
						cases_basiclowerer_array_muxed6 = cases_basiclowerer_array_muxed5;
						case (rowbuffermanager_bank)
							1'd0: begin
								rowbuffermanager0 <= cases_basiclowerer_array_muxed6;
							end
							1'd1: begin
								rowbuffermanager1 <= cases_basiclowerer_array_muxed6;
							end
							2'd2: begin
								rowbuffermanager2 <= cases_basiclowerer_array_muxed6;
							end
							default: begin
								rowbuffermanager3 <= cases_basiclowerer_array_muxed6;
							end
						endcase
					end
					1'd1: begin
						cases_basiclowerer_array_muxed7 = cases_basiclowerer_array_muxed5;
						case (rowbuffermanager_bank)
							1'd0: begin
								rowbuffermanager4 <= cases_basiclowerer_array_muxed7;
							end
							1'd1: begin
								rowbuffermanager5 <= cases_basiclowerer_array_muxed7;
							end
							2'd2: begin
								rowbuffermanager6 <= cases_basiclowerer_array_muxed7;
							end
							default: begin
								rowbuffermanager7 <= cases_basiclowerer_array_muxed7;
							end
						endcase
					end
					2'd2: begin
						cases_basiclowerer_array_muxed8 = cases_basiclowerer_array_muxed5;
						case (rowbuffermanager_bank)
							1'd0: begin
								rowbuffermanager8 <= cases_basiclowerer_array_muxed8;
							end
							1'd1: begin
								rowbuffermanager9 <= cases_basiclowerer_array_muxed8;
							end
							2'd2: begin
								rowbuffermanager10 <= cases_basiclowerer_array_muxed8;
							end
							default: begin
								rowbuffermanager11 <= cases_basiclowerer_array_muxed8;
							end
						endcase
					end
					default: begin
						cases_basiclowerer_array_muxed9 = cases_basiclowerer_array_muxed5;
						case (rowbuffermanager_bank)
							1'd0: begin
								rowbuffermanager12 <= cases_basiclowerer_array_muxed9;
							end
							1'd1: begin
								rowbuffermanager13 <= cases_basiclowerer_array_muxed9;
							end
							2'd2: begin
								rowbuffermanager14 <= cases_basiclowerer_array_muxed9;
							end
							default: begin
								rowbuffermanager15 <= cases_basiclowerer_array_muxed9;
							end
						endcase
					end
				endcase
				cases_basiclowerer_array_muxed10 = rowbuffermanager_row;
				case (rowbuffermanager_bank_group)
					1'd0: begin
						cases_basiclowerer_array_muxed11 = cases_basiclowerer_array_muxed10;
						case (rowbuffermanager_bank)
							1'd0: begin
								rowbuffermanager16 <= cases_basiclowerer_array_muxed11;
							end
							1'd1: begin
								rowbuffermanager17 <= cases_basiclowerer_array_muxed11;
							end
							2'd2: begin
								rowbuffermanager18 <= cases_basiclowerer_array_muxed11;
							end
							default: begin
								rowbuffermanager19 <= cases_basiclowerer_array_muxed11;
							end
						endcase
					end
					1'd1: begin
						cases_basiclowerer_array_muxed12 = cases_basiclowerer_array_muxed10;
						case (rowbuffermanager_bank)
							1'd0: begin
								rowbuffermanager20 <= cases_basiclowerer_array_muxed12;
							end
							1'd1: begin
								rowbuffermanager21 <= cases_basiclowerer_array_muxed12;
							end
							2'd2: begin
								rowbuffermanager22 <= cases_basiclowerer_array_muxed12;
							end
							default: begin
								rowbuffermanager23 <= cases_basiclowerer_array_muxed12;
							end
						endcase
					end
					2'd2: begin
						cases_basiclowerer_array_muxed13 = cases_basiclowerer_array_muxed10;
						case (rowbuffermanager_bank)
							1'd0: begin
								rowbuffermanager24 <= cases_basiclowerer_array_muxed13;
							end
							1'd1: begin
								rowbuffermanager25 <= cases_basiclowerer_array_muxed13;
							end
							2'd2: begin
								rowbuffermanager26 <= cases_basiclowerer_array_muxed13;
							end
							default: begin
								rowbuffermanager27 <= cases_basiclowerer_array_muxed13;
							end
						endcase
					end
					default: begin
						cases_basiclowerer_array_muxed14 = cases_basiclowerer_array_muxed10;
						case (rowbuffermanager_bank)
							1'd0: begin
								rowbuffermanager28 <= cases_basiclowerer_array_muxed14;
							end
							1'd1: begin
								rowbuffermanager29 <= cases_basiclowerer_array_muxed14;
							end
							2'd2: begin
								rowbuffermanager30 <= cases_basiclowerer_array_muxed14;
							end
							default: begin
								rowbuffermanager31 <= cases_basiclowerer_array_muxed14;
							end
						endcase
					end
				endcase
			end
		end
	endcase
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
	case (grant1)
		1'd0: begin
			if ((~request[0])) begin
				if (request[1]) begin
					grant1 <= 1'd1;
				end else begin
					if (request[2]) begin
						grant1 <= 2'd2;
					end else begin
						if (request[3]) begin
							grant1 <= 2'd3;
						end
					end
				end
			end
		end
		1'd1: begin
			if ((~request[1])) begin
				if (request[2]) begin
					grant1 <= 2'd2;
				end else begin
					if (request[3]) begin
						grant1 <= 2'd3;
					end else begin
						if (request[0]) begin
							grant1 <= 1'd0;
						end
					end
				end
			end
		end
		2'd2: begin
			if ((~request[2])) begin
				if (request[3]) begin
					grant1 <= 2'd3;
				end else begin
					if (request[0]) begin
						grant1 <= 1'd0;
					end else begin
						if (request[1]) begin
							grant1 <= 1'd1;
						end
					end
				end
			end
		end
		2'd3: begin
			if ((~request[3])) begin
				if (request[0]) begin
					grant1 <= 1'd0;
				end else begin
					if (request[1]) begin
						grant1 <= 1'd1;
					end else begin
						if (request[2]) begin
							grant1 <= 2'd2;
						end
					end
				end
			end
		end
	endcase
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
	if (refreshmanager1_refresh) begin
		refreshmanager1_refresh_in_progress <= 1'd1;
		refreshmanager1_counter <= 1'd0;
	end else begin
		if (refreshmanager1_refresh_in_progress) begin
			if ((refreshmanager1_counter >= 9'd350)) begin
				refreshmanager1_refresh_in_progress <= 1'd0;
				refreshmanager1_refresh_done <= 1'd1;
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
				refreshmanager1_refresh_done <= 1'd0;
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
		timingcontroller_ready <= 1'd0;
		timingcontroller0 <= 32'd0;
		timingcontroller1 <= 32'd0;
		timingcontroller2 <= 32'd0;
		timingcontroller3 <= 32'd0;
		timingcontroller4 <= 32'd0;
		timingcontroller5 <= 32'd0;
		timingcontroller6 <= 32'd0;
		timingcontroller7 <= 32'd0;
		timingcontroller8 <= 32'd0;
		timingcontroller9 <= 32'd0;
		timingcontroller10 <= 32'd0;
		timingcontroller11 <= 32'd0;
		timingcontroller12 <= 32'd0;
		timingcontroller13 <= 32'd0;
		timingcontroller14 <= 32'd0;
		timingcontroller15 <= 32'd0;
		bankstatetracker0 <= 2'd0;
		bankstatetracker1 <= 2'd0;
		bankstatetracker2 <= 2'd0;
		bankstatetracker3 <= 2'd0;
		bankstatetracker4 <= 2'd0;
		bankstatetracker5 <= 2'd0;
		bankstatetracker6 <= 2'd0;
		bankstatetracker7 <= 2'd0;
		bankstatetracker8 <= 2'd0;
		bankstatetracker9 <= 2'd0;
		bankstatetracker10 <= 2'd0;
		bankstatetracker11 <= 2'd0;
		bankstatetracker12 <= 2'd0;
		bankstatetracker13 <= 2'd0;
		bankstatetracker14 <= 2'd0;
		bankstatetracker15 <= 2'd0;
		bankstatetracker16 <= 16'd0;
		bankstatetracker17 <= 16'd0;
		bankstatetracker18 <= 16'd0;
		bankstatetracker19 <= 16'd0;
		bankstatetracker20 <= 16'd0;
		bankstatetracker21 <= 16'd0;
		bankstatetracker22 <= 16'd0;
		bankstatetracker23 <= 16'd0;
		bankstatetracker24 <= 16'd0;
		bankstatetracker25 <= 16'd0;
		bankstatetracker26 <= 16'd0;
		bankstatetracker27 <= 16'd0;
		bankstatetracker28 <= 16'd0;
		bankstatetracker29 <= 16'd0;
		bankstatetracker30 <= 16'd0;
		bankstatetracker31 <= 16'd0;
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
		refreshmanager0_refresh_done <= 1'd0;
		refreshmanager0_counter <= 32'd0;
		refreshmanager0_refresh_in_progress <= 1'd0;
		commandscheduler_cmd_ready <= 1'd0;
		commandscheduler_cmd_executed <= 1'd0;
		commandscheduler_scheduled_cmd_type <= 4'd0;
		commandscheduler_scheduled_bank_group <= 2'd0;
		commandscheduler_scheduled_bank <= 2'd0;
		commandscheduler_scheduled_row <= 16'd0;
		commandscheduler_scheduled_col <= 10'd0;
		commandscheduler0 <= 30'd0;
		commandscheduler1 <= 30'd0;
		commandscheduler2 <= 30'd0;
		commandscheduler3 <= 30'd0;
		commandscheduler4 <= 30'd0;
		commandscheduler5 <= 30'd0;
		commandscheduler6 <= 30'd0;
		commandscheduler7 <= 30'd0;
		commandscheduler8 <= 30'd0;
		commandscheduler9 <= 30'd0;
		commandscheduler10 <= 30'd0;
		commandscheduler11 <= 30'd0;
		commandscheduler12 <= 30'd0;
		commandscheduler13 <= 30'd0;
		commandscheduler14 <= 30'd0;
		commandscheduler15 <= 30'd0;
		commandscheduler16 <= 30'd0;
		commandscheduler17 <= 30'd0;
		commandscheduler18 <= 30'd0;
		commandscheduler19 <= 30'd0;
		commandscheduler20 <= 30'd0;
		commandscheduler21 <= 30'd0;
		commandscheduler22 <= 30'd0;
		commandscheduler23 <= 30'd0;
		commandscheduler24 <= 30'd0;
		commandscheduler25 <= 30'd0;
		commandscheduler26 <= 30'd0;
		commandscheduler27 <= 30'd0;
		commandscheduler28 <= 30'd0;
		commandscheduler29 <= 30'd0;
		commandscheduler30 <= 30'd0;
		commandscheduler31 <= 30'd0;
		commandscheduler32 <= 30'd0;
		commandscheduler33 <= 30'd0;
		commandscheduler34 <= 30'd0;
		commandscheduler35 <= 30'd0;
		commandscheduler36 <= 30'd0;
		commandscheduler37 <= 30'd0;
		commandscheduler38 <= 30'd0;
		commandscheduler39 <= 30'd0;
		commandscheduler40 <= 30'd0;
		commandscheduler41 <= 30'd0;
		commandscheduler42 <= 30'd0;
		commandscheduler43 <= 30'd0;
		commandscheduler44 <= 30'd0;
		commandscheduler45 <= 30'd0;
		commandscheduler46 <= 30'd0;
		commandscheduler47 <= 30'd0;
		commandscheduler48 <= 30'd0;
		commandscheduler49 <= 30'd0;
		commandscheduler50 <= 30'd0;
		commandscheduler51 <= 30'd0;
		commandscheduler52 <= 30'd0;
		commandscheduler53 <= 30'd0;
		commandscheduler54 <= 30'd0;
		commandscheduler55 <= 30'd0;
		commandscheduler56 <= 30'd0;
		commandscheduler57 <= 30'd0;
		commandscheduler58 <= 30'd0;
		commandscheduler59 <= 30'd0;
		commandscheduler60 <= 30'd0;
		commandscheduler61 <= 30'd0;
		commandscheduler62 <= 30'd0;
		commandscheduler63 <= 30'd0;
		commandscheduler64 <= 30'd0;
		commandscheduler65 <= 30'd0;
		commandscheduler66 <= 30'd0;
		commandscheduler67 <= 30'd0;
		commandscheduler68 <= 30'd0;
		commandscheduler69 <= 30'd0;
		commandscheduler70 <= 30'd0;
		commandscheduler71 <= 30'd0;
		commandscheduler72 <= 30'd0;
		commandscheduler73 <= 30'd0;
		commandscheduler74 <= 30'd0;
		commandscheduler75 <= 30'd0;
		commandscheduler76 <= 30'd0;
		commandscheduler77 <= 30'd0;
		commandscheduler78 <= 30'd0;
		commandscheduler79 <= 30'd0;
		commandscheduler80 <= 30'd0;
		commandscheduler81 <= 30'd0;
		commandscheduler82 <= 30'd0;
		commandscheduler83 <= 30'd0;
		commandscheduler84 <= 30'd0;
		commandscheduler85 <= 30'd0;
		commandscheduler86 <= 30'd0;
		commandscheduler87 <= 30'd0;
		commandscheduler88 <= 30'd0;
		commandscheduler89 <= 30'd0;
		commandscheduler90 <= 30'd0;
		commandscheduler91 <= 30'd0;
		commandscheduler92 <= 30'd0;
		commandscheduler93 <= 30'd0;
		commandscheduler94 <= 30'd0;
		commandscheduler95 <= 30'd0;
		commandscheduler96 <= 30'd0;
		commandscheduler97 <= 30'd0;
		commandscheduler98 <= 30'd0;
		commandscheduler99 <= 30'd0;
		commandscheduler100 <= 30'd0;
		commandscheduler101 <= 30'd0;
		commandscheduler102 <= 30'd0;
		commandscheduler103 <= 30'd0;
		commandscheduler104 <= 30'd0;
		commandscheduler105 <= 30'd0;
		commandscheduler106 <= 30'd0;
		commandscheduler107 <= 30'd0;
		commandscheduler108 <= 30'd0;
		commandscheduler109 <= 30'd0;
		commandscheduler110 <= 30'd0;
		commandscheduler111 <= 30'd0;
		commandscheduler112 <= 30'd0;
		commandscheduler113 <= 30'd0;
		commandscheduler114 <= 30'd0;
		commandscheduler115 <= 30'd0;
		commandscheduler116 <= 30'd0;
		commandscheduler117 <= 30'd0;
		commandscheduler118 <= 30'd0;
		commandscheduler119 <= 30'd0;
		commandscheduler120 <= 30'd0;
		commandscheduler121 <= 30'd0;
		commandscheduler122 <= 30'd0;
		commandscheduler123 <= 30'd0;
		commandscheduler124 <= 30'd0;
		commandscheduler125 <= 30'd0;
		commandscheduler126 <= 30'd0;
		commandscheduler127 <= 30'd0;
		commandscheduler128 <= 30'd0;
		commandscheduler129 <= 30'd0;
		commandscheduler130 <= 30'd0;
		commandscheduler131 <= 30'd0;
		commandscheduler132 <= 30'd0;
		commandscheduler133 <= 30'd0;
		commandscheduler134 <= 30'd0;
		commandscheduler135 <= 30'd0;
		commandscheduler136 <= 30'd0;
		commandscheduler137 <= 30'd0;
		commandscheduler138 <= 30'd0;
		commandscheduler139 <= 30'd0;
		commandscheduler140 <= 30'd0;
		commandscheduler141 <= 30'd0;
		commandscheduler142 <= 30'd0;
		commandscheduler143 <= 30'd0;
		commandscheduler144 <= 30'd0;
		commandscheduler145 <= 30'd0;
		commandscheduler146 <= 30'd0;
		commandscheduler147 <= 30'd0;
		commandscheduler148 <= 30'd0;
		commandscheduler149 <= 30'd0;
		commandscheduler150 <= 30'd0;
		commandscheduler151 <= 30'd0;
		commandscheduler152 <= 30'd0;
		commandscheduler153 <= 30'd0;
		commandscheduler154 <= 30'd0;
		commandscheduler155 <= 30'd0;
		commandscheduler156 <= 30'd0;
		commandscheduler157 <= 30'd0;
		commandscheduler158 <= 30'd0;
		commandscheduler159 <= 30'd0;
		commandscheduler160 <= 30'd0;
		commandscheduler161 <= 30'd0;
		commandscheduler162 <= 30'd0;
		commandscheduler163 <= 30'd0;
		commandscheduler164 <= 30'd0;
		commandscheduler165 <= 30'd0;
		commandscheduler166 <= 30'd0;
		commandscheduler167 <= 30'd0;
		commandscheduler168 <= 30'd0;
		commandscheduler169 <= 30'd0;
		commandscheduler170 <= 30'd0;
		commandscheduler171 <= 30'd0;
		commandscheduler172 <= 30'd0;
		commandscheduler173 <= 30'd0;
		commandscheduler174 <= 30'd0;
		commandscheduler175 <= 30'd0;
		commandscheduler176 <= 30'd0;
		commandscheduler177 <= 30'd0;
		commandscheduler178 <= 30'd0;
		commandscheduler179 <= 30'd0;
		commandscheduler180 <= 30'd0;
		commandscheduler181 <= 30'd0;
		commandscheduler182 <= 30'd0;
		commandscheduler183 <= 30'd0;
		commandscheduler184 <= 30'd0;
		commandscheduler185 <= 30'd0;
		commandscheduler186 <= 30'd0;
		commandscheduler187 <= 30'd0;
		commandscheduler188 <= 30'd0;
		commandscheduler189 <= 30'd0;
		commandscheduler190 <= 30'd0;
		commandscheduler191 <= 30'd0;
		commandscheduler192 <= 30'd0;
		commandscheduler193 <= 30'd0;
		commandscheduler194 <= 30'd0;
		commandscheduler195 <= 30'd0;
		commandscheduler196 <= 30'd0;
		commandscheduler197 <= 30'd0;
		commandscheduler198 <= 30'd0;
		commandscheduler199 <= 30'd0;
		commandscheduler200 <= 30'd0;
		commandscheduler201 <= 30'd0;
		commandscheduler202 <= 30'd0;
		commandscheduler203 <= 30'd0;
		commandscheduler204 <= 30'd0;
		commandscheduler205 <= 30'd0;
		commandscheduler206 <= 30'd0;
		commandscheduler207 <= 30'd0;
		commandscheduler208 <= 30'd0;
		commandscheduler209 <= 30'd0;
		commandscheduler210 <= 30'd0;
		commandscheduler211 <= 30'd0;
		commandscheduler212 <= 30'd0;
		commandscheduler213 <= 30'd0;
		commandscheduler214 <= 30'd0;
		commandscheduler215 <= 30'd0;
		commandscheduler216 <= 30'd0;
		commandscheduler217 <= 30'd0;
		commandscheduler218 <= 30'd0;
		commandscheduler219 <= 30'd0;
		commandscheduler220 <= 30'd0;
		commandscheduler221 <= 30'd0;
		commandscheduler222 <= 30'd0;
		commandscheduler223 <= 30'd0;
		commandscheduler224 <= 30'd0;
		commandscheduler225 <= 30'd0;
		commandscheduler226 <= 30'd0;
		commandscheduler227 <= 30'd0;
		commandscheduler228 <= 30'd0;
		commandscheduler229 <= 30'd0;
		commandscheduler230 <= 30'd0;
		commandscheduler231 <= 30'd0;
		commandscheduler232 <= 30'd0;
		commandscheduler233 <= 30'd0;
		commandscheduler234 <= 30'd0;
		commandscheduler235 <= 30'd0;
		commandscheduler236 <= 30'd0;
		commandscheduler237 <= 30'd0;
		commandscheduler238 <= 30'd0;
		commandscheduler239 <= 30'd0;
		commandscheduler240 <= 30'd0;
		commandscheduler241 <= 30'd0;
		commandscheduler242 <= 30'd0;
		commandscheduler243 <= 30'd0;
		commandscheduler244 <= 30'd0;
		commandscheduler245 <= 30'd0;
		commandscheduler246 <= 30'd0;
		commandscheduler247 <= 30'd0;
		commandscheduler248 <= 30'd0;
		commandscheduler249 <= 30'd0;
		commandscheduler250 <= 30'd0;
		commandscheduler251 <= 30'd0;
		commandscheduler252 <= 30'd0;
		commandscheduler253 <= 30'd0;
		commandscheduler254 <= 30'd0;
		commandscheduler255 <= 30'd0;
		commandscheduler256 <= 30'd0;
		commandscheduler257 <= 30'd0;
		commandscheduler258 <= 30'd0;
		commandscheduler259 <= 30'd0;
		commandscheduler260 <= 30'd0;
		commandscheduler261 <= 30'd0;
		commandscheduler262 <= 30'd0;
		commandscheduler263 <= 30'd0;
		commandscheduler264 <= 30'd0;
		commandscheduler265 <= 30'd0;
		commandscheduler266 <= 30'd0;
		commandscheduler267 <= 30'd0;
		commandscheduler268 <= 30'd0;
		commandscheduler269 <= 30'd0;
		commandscheduler270 <= 30'd0;
		commandscheduler271 <= 30'd0;
		commandscheduler272 <= 30'd0;
		commandscheduler273 <= 30'd0;
		commandscheduler274 <= 30'd0;
		commandscheduler275 <= 30'd0;
		commandscheduler276 <= 30'd0;
		commandscheduler277 <= 30'd0;
		commandscheduler278 <= 30'd0;
		commandscheduler279 <= 30'd0;
		commandscheduler280 <= 30'd0;
		commandscheduler281 <= 30'd0;
		commandscheduler282 <= 30'd0;
		commandscheduler283 <= 30'd0;
		commandscheduler284 <= 30'd0;
		commandscheduler285 <= 30'd0;
		commandscheduler286 <= 30'd0;
		commandscheduler287 <= 30'd0;
		commandscheduler288 <= 30'd0;
		commandscheduler289 <= 30'd0;
		commandscheduler290 <= 30'd0;
		commandscheduler291 <= 30'd0;
		commandscheduler292 <= 30'd0;
		commandscheduler293 <= 30'd0;
		commandscheduler294 <= 30'd0;
		commandscheduler295 <= 30'd0;
		commandscheduler296 <= 30'd0;
		commandscheduler297 <= 30'd0;
		commandscheduler298 <= 30'd0;
		commandscheduler299 <= 30'd0;
		commandscheduler300 <= 30'd0;
		commandscheduler301 <= 30'd0;
		commandscheduler302 <= 30'd0;
		commandscheduler303 <= 30'd0;
		commandscheduler304 <= 30'd0;
		commandscheduler305 <= 30'd0;
		commandscheduler306 <= 30'd0;
		commandscheduler307 <= 30'd0;
		commandscheduler308 <= 30'd0;
		commandscheduler309 <= 30'd0;
		commandscheduler310 <= 30'd0;
		commandscheduler311 <= 30'd0;
		commandscheduler312 <= 30'd0;
		commandscheduler313 <= 30'd0;
		commandscheduler314 <= 30'd0;
		commandscheduler315 <= 30'd0;
		commandscheduler316 <= 30'd0;
		commandscheduler317 <= 30'd0;
		commandscheduler318 <= 30'd0;
		commandscheduler319 <= 30'd0;
		commandscheduler320 <= 30'd0;
		commandscheduler321 <= 30'd0;
		commandscheduler322 <= 30'd0;
		commandscheduler323 <= 30'd0;
		commandscheduler324 <= 30'd0;
		commandscheduler325 <= 30'd0;
		commandscheduler326 <= 30'd0;
		commandscheduler327 <= 30'd0;
		commandscheduler328 <= 30'd0;
		commandscheduler329 <= 30'd0;
		commandscheduler330 <= 30'd0;
		commandscheduler331 <= 30'd0;
		commandscheduler332 <= 30'd0;
		commandscheduler333 <= 30'd0;
		commandscheduler334 <= 30'd0;
		commandscheduler335 <= 30'd0;
		commandscheduler336 <= 30'd0;
		commandscheduler337 <= 30'd0;
		commandscheduler338 <= 30'd0;
		commandscheduler339 <= 30'd0;
		commandscheduler340 <= 30'd0;
		commandscheduler341 <= 30'd0;
		commandscheduler342 <= 30'd0;
		commandscheduler343 <= 30'd0;
		commandscheduler344 <= 30'd0;
		commandscheduler345 <= 30'd0;
		commandscheduler346 <= 30'd0;
		commandscheduler347 <= 30'd0;
		commandscheduler348 <= 30'd0;
		commandscheduler349 <= 30'd0;
		commandscheduler350 <= 30'd0;
		commandscheduler351 <= 30'd0;
		commandscheduler352 <= 30'd0;
		commandscheduler353 <= 30'd0;
		commandscheduler354 <= 30'd0;
		commandscheduler355 <= 30'd0;
		commandscheduler356 <= 30'd0;
		commandscheduler357 <= 30'd0;
		commandscheduler358 <= 30'd0;
		commandscheduler359 <= 30'd0;
		commandscheduler360 <= 30'd0;
		commandscheduler361 <= 30'd0;
		commandscheduler362 <= 30'd0;
		commandscheduler363 <= 30'd0;
		commandscheduler364 <= 30'd0;
		commandscheduler365 <= 30'd0;
		commandscheduler366 <= 30'd0;
		commandscheduler367 <= 30'd0;
		commandscheduler368 <= 30'd0;
		commandscheduler369 <= 30'd0;
		commandscheduler370 <= 30'd0;
		commandscheduler371 <= 30'd0;
		commandscheduler372 <= 30'd0;
		commandscheduler373 <= 30'd0;
		commandscheduler374 <= 30'd0;
		commandscheduler375 <= 30'd0;
		commandscheduler376 <= 30'd0;
		commandscheduler377 <= 30'd0;
		commandscheduler378 <= 30'd0;
		commandscheduler379 <= 30'd0;
		commandscheduler380 <= 30'd0;
		commandscheduler381 <= 30'd0;
		commandscheduler382 <= 30'd0;
		commandscheduler383 <= 30'd0;
		commandscheduler384 <= 30'd0;
		commandscheduler385 <= 30'd0;
		commandscheduler386 <= 30'd0;
		commandscheduler387 <= 30'd0;
		commandscheduler388 <= 30'd0;
		commandscheduler389 <= 30'd0;
		commandscheduler390 <= 30'd0;
		commandscheduler391 <= 30'd0;
		commandscheduler392 <= 30'd0;
		commandscheduler393 <= 30'd0;
		commandscheduler394 <= 30'd0;
		commandscheduler395 <= 30'd0;
		commandscheduler396 <= 30'd0;
		commandscheduler397 <= 30'd0;
		commandscheduler398 <= 30'd0;
		commandscheduler399 <= 30'd0;
		commandscheduler400 <= 30'd0;
		commandscheduler401 <= 30'd0;
		commandscheduler402 <= 30'd0;
		commandscheduler403 <= 30'd0;
		commandscheduler404 <= 30'd0;
		commandscheduler405 <= 30'd0;
		commandscheduler406 <= 30'd0;
		commandscheduler407 <= 30'd0;
		commandscheduler408 <= 30'd0;
		commandscheduler409 <= 30'd0;
		commandscheduler410 <= 30'd0;
		commandscheduler411 <= 30'd0;
		commandscheduler412 <= 30'd0;
		commandscheduler413 <= 30'd0;
		commandscheduler414 <= 30'd0;
		commandscheduler415 <= 30'd0;
		commandscheduler416 <= 30'd0;
		commandscheduler417 <= 30'd0;
		commandscheduler418 <= 30'd0;
		commandscheduler419 <= 30'd0;
		commandscheduler420 <= 30'd0;
		commandscheduler421 <= 30'd0;
		commandscheduler422 <= 30'd0;
		commandscheduler423 <= 30'd0;
		commandscheduler424 <= 30'd0;
		commandscheduler425 <= 30'd0;
		commandscheduler426 <= 30'd0;
		commandscheduler427 <= 30'd0;
		commandscheduler428 <= 30'd0;
		commandscheduler429 <= 30'd0;
		commandscheduler430 <= 30'd0;
		commandscheduler431 <= 30'd0;
		commandscheduler432 <= 30'd0;
		commandscheduler433 <= 30'd0;
		commandscheduler434 <= 30'd0;
		commandscheduler435 <= 30'd0;
		commandscheduler436 <= 30'd0;
		commandscheduler437 <= 30'd0;
		commandscheduler438 <= 30'd0;
		commandscheduler439 <= 30'd0;
		commandscheduler440 <= 30'd0;
		commandscheduler441 <= 30'd0;
		commandscheduler442 <= 30'd0;
		commandscheduler443 <= 30'd0;
		commandscheduler444 <= 30'd0;
		commandscheduler445 <= 30'd0;
		commandscheduler446 <= 30'd0;
		commandscheduler447 <= 30'd0;
		commandscheduler448 <= 30'd0;
		commandscheduler449 <= 30'd0;
		commandscheduler450 <= 30'd0;
		commandscheduler451 <= 30'd0;
		commandscheduler452 <= 30'd0;
		commandscheduler453 <= 30'd0;
		commandscheduler454 <= 30'd0;
		commandscheduler455 <= 30'd0;
		commandscheduler456 <= 30'd0;
		commandscheduler457 <= 30'd0;
		commandscheduler458 <= 30'd0;
		commandscheduler459 <= 30'd0;
		commandscheduler460 <= 30'd0;
		commandscheduler461 <= 30'd0;
		commandscheduler462 <= 30'd0;
		commandscheduler463 <= 30'd0;
		commandscheduler464 <= 30'd0;
		commandscheduler465 <= 30'd0;
		commandscheduler466 <= 30'd0;
		commandscheduler467 <= 30'd0;
		commandscheduler468 <= 30'd0;
		commandscheduler469 <= 30'd0;
		commandscheduler470 <= 30'd0;
		commandscheduler471 <= 30'd0;
		commandscheduler472 <= 30'd0;
		commandscheduler473 <= 30'd0;
		commandscheduler474 <= 30'd0;
		commandscheduler475 <= 30'd0;
		commandscheduler476 <= 30'd0;
		commandscheduler477 <= 30'd0;
		commandscheduler478 <= 30'd0;
		commandscheduler479 <= 30'd0;
		commandscheduler480 <= 30'd0;
		commandscheduler481 <= 30'd0;
		commandscheduler482 <= 30'd0;
		commandscheduler483 <= 30'd0;
		commandscheduler484 <= 30'd0;
		commandscheduler485 <= 30'd0;
		commandscheduler486 <= 30'd0;
		commandscheduler487 <= 30'd0;
		commandscheduler488 <= 30'd0;
		commandscheduler489 <= 30'd0;
		commandscheduler490 <= 30'd0;
		commandscheduler491 <= 30'd0;
		commandscheduler492 <= 30'd0;
		commandscheduler493 <= 30'd0;
		commandscheduler494 <= 30'd0;
		commandscheduler495 <= 30'd0;
		commandscheduler496 <= 30'd0;
		commandscheduler497 <= 30'd0;
		commandscheduler498 <= 30'd0;
		commandscheduler499 <= 30'd0;
		commandscheduler500 <= 30'd0;
		commandscheduler501 <= 30'd0;
		commandscheduler502 <= 30'd0;
		commandscheduler503 <= 30'd0;
		commandscheduler504 <= 30'd0;
		commandscheduler505 <= 30'd0;
		commandscheduler506 <= 30'd0;
		commandscheduler507 <= 30'd0;
		commandscheduler508 <= 30'd0;
		commandscheduler509 <= 30'd0;
		commandscheduler510 <= 30'd0;
		commandscheduler511 <= 30'd0;
		commandscheduler512 <= 5'd0;
		commandscheduler513 <= 5'd0;
		commandscheduler514 <= 5'd0;
		commandscheduler515 <= 5'd0;
		commandscheduler516 <= 5'd0;
		commandscheduler517 <= 5'd0;
		commandscheduler518 <= 5'd0;
		commandscheduler519 <= 5'd0;
		commandscheduler520 <= 5'd0;
		commandscheduler521 <= 5'd0;
		commandscheduler522 <= 5'd0;
		commandscheduler523 <= 5'd0;
		commandscheduler524 <= 5'd0;
		commandscheduler525 <= 5'd0;
		commandscheduler526 <= 5'd0;
		commandscheduler527 <= 5'd0;
		commandscheduler528 <= 5'd0;
		commandscheduler529 <= 5'd0;
		commandscheduler530 <= 5'd0;
		commandscheduler531 <= 5'd0;
		commandscheduler532 <= 5'd0;
		commandscheduler533 <= 5'd0;
		commandscheduler534 <= 5'd0;
		commandscheduler535 <= 5'd0;
		commandscheduler536 <= 5'd0;
		commandscheduler537 <= 5'd0;
		commandscheduler538 <= 5'd0;
		commandscheduler539 <= 5'd0;
		commandscheduler540 <= 5'd0;
		commandscheduler541 <= 5'd0;
		commandscheduler542 <= 5'd0;
		commandscheduler543 <= 5'd0;
		rowbuffermanager0 <= 1'd0;
		rowbuffermanager1 <= 1'd0;
		rowbuffermanager2 <= 1'd0;
		rowbuffermanager3 <= 1'd0;
		rowbuffermanager4 <= 1'd0;
		rowbuffermanager5 <= 1'd0;
		rowbuffermanager6 <= 1'd0;
		rowbuffermanager7 <= 1'd0;
		rowbuffermanager8 <= 1'd0;
		rowbuffermanager9 <= 1'd0;
		rowbuffermanager10 <= 1'd0;
		rowbuffermanager11 <= 1'd0;
		rowbuffermanager12 <= 1'd0;
		rowbuffermanager13 <= 1'd0;
		rowbuffermanager14 <= 1'd0;
		rowbuffermanager15 <= 1'd0;
		rowbuffermanager16 <= 16'd0;
		rowbuffermanager17 <= 16'd0;
		rowbuffermanager18 <= 16'd0;
		rowbuffermanager19 <= 16'd0;
		rowbuffermanager20 <= 16'd0;
		rowbuffermanager21 <= 16'd0;
		rowbuffermanager22 <= 16'd0;
		rowbuffermanager23 <= 16'd0;
		rowbuffermanager24 <= 16'd0;
		rowbuffermanager25 <= 16'd0;
		rowbuffermanager26 <= 16'd0;
		rowbuffermanager27 <= 16'd0;
		rowbuffermanager28 <= 16'd0;
		rowbuffermanager29 <= 16'd0;
		rowbuffermanager30 <= 16'd0;
		rowbuffermanager31 <= 16'd0;
		qosmanager0_current_priority <= 2'd0;
		qosmanager00 <= 32'd0;
		qosmanager01 <= 32'd0;
		qosmanager02 <= 32'd0;
		qosmanager03 <= 32'd0;
		grant1 <= 2'd0;
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
		refreshmanager1_refresh_done <= 1'd0;
		refreshmanager1_counter <= 32'd0;
		refreshmanager1_refresh_in_progress <= 1'd0;
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
