/* Machine-generated using Migen */
module CommandDecoder(

);

reg [31:0] addr = 32'd0;
reg chip_select = 1'd0;
reg ras = 1'd0;
reg cas = 1'd0;
reg we = 1'd0;
reg [3:0] cmd_decoded;
wire cmd_valid;
wire [15:0] row_addr;
wire [9:0] col_addr;
wire [2:0] bank_addr;

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
			cmd_decoded <= 3'd5;
		end
		1'd1: begin
			cmd_decoded <= 2'd3;
		end
		2'd2: begin
			cmd_decoded <= 2'd2;
		end
		2'd3: begin
			cmd_decoded <= 1'd1;
		end
		3'd4: begin
			cmd_decoded <= 3'd4;
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
