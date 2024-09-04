/* Machine-generated using Migen */
module AddressMapper(
	input [31:0] addr_in,
	output [15:0] row_addr,
	output [9:0] col_addr,
	output [1:0] bank_group_addr,
	output [1:0] bank_addr
);


// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on

assign row_addr = {addr_in[4:2], addr_in[28:16]};
assign col_addr = addr_in[14:5];
assign bank_addr = addr_in[13:12];
assign bank_group_addr = addr_in[15:14];

endmodule
