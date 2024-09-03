/* Machine-generated using Migen */
module AddressMapper(

);

reg [31:0] addr_in = 32'd0;
wire [15:0] row_addr;
wire [9:0] col_addr;
wire [1:0] bank_group_addr;
wire [1:0] bank_addr;

// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on

assign row_addr = {addr_in[4:2], addr_in[28:16]};
assign col_addr = addr_in[14:5];
assign bank_addr = addr_in[13:12];
assign bank_group_addr = addr_in[15:14];

endmodule
