/* Machine-generated using Migen */
module CommandDecoder(
	input [31:0] addr,
	input mem_read,
	input mem_write,
	input refresh,
	input chip_select,
	input ras,
	input cas,
	input we,
	output reg [3:0] cmd_decoded,
	output cmd_valid,
	output [15:0] row_addr,
	output [9:0] col_addr,
	output [2:0] bank_addr
);


// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on

assign cmd_valid = (chip_select & (~((ras & cas) & we)));

// synthesis translate_off
reg dummy_d;
// synthesis translate_on
always @(*) begin
	cmd_decoded <= 4'd0;
	case ({we, cas, ras})
		1'd0: begin
			cmd_decoded <= 1'd1;
		end
		1'd1: begin
			cmd_decoded <= 2'd3;
		end
		2'd2: begin
			cmd_decoded <= 3'd4;
		end
		2'd3: begin
			cmd_decoded <= 3'd5;
		end
		3'd4: begin
			cmd_decoded <= 2'd2;
		end
		default: begin
			cmd_decoded <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d <= dummy_s;
// synthesis translate_on
end
assign row_addr = addr[31:16];
assign col_addr = addr[15:6];
assign bank_addr = addr[5:3];

endmodule
