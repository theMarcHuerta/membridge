/* Machine-generated using Migen */
module RowBufferManager(
	input [3:0] cmd_decoded,
	input [1:0] bank_group,
	input [1:0] bank,
	input [15:0] row,
	output row_buffer_hit,
	input row_activate,
	input row_precharge,
	input sys_clk,
	input sys_rst
);

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
reg array_muxed0;
reg array_muxed1;
reg array_muxed2;
reg array_muxed3;
reg array_muxed4;
reg [15:0] array_muxed5;
reg [15:0] array_muxed6;
reg [15:0] array_muxed7;
reg [15:0] array_muxed8;
reg [15:0] array_muxed9;
reg lhs_array_muxed0 = 1'd0;
reg lhs_array_muxed1 = 1'd0;
reg lhs_array_muxed2 = 1'd0;
reg lhs_array_muxed3 = 1'd0;
reg lhs_array_muxed4 = 1'd0;
reg [15:0] lhs_array_muxed5 = 16'd0;
reg [15:0] lhs_array_muxed6 = 16'd0;
reg [15:0] lhs_array_muxed7 = 16'd0;
reg [15:0] lhs_array_muxed8 = 16'd0;
reg [15:0] lhs_array_muxed9 = 16'd0;
reg lhs_array_muxed10 = 1'd0;
reg lhs_array_muxed11 = 1'd0;
reg lhs_array_muxed12 = 1'd0;
reg lhs_array_muxed13 = 1'd0;
reg lhs_array_muxed14 = 1'd0;
reg [15:0] basiclowerer_array_muxed0;
reg [15:0] basiclowerer_array_muxed1;
reg [15:0] basiclowerer_array_muxed2;
reg [15:0] basiclowerer_array_muxed3;
reg [15:0] basiclowerer_array_muxed4;
reg lhs_array_muxed15 = 1'd0;
reg lhs_array_muxed16 = 1'd0;
reg lhs_array_muxed17 = 1'd0;
reg lhs_array_muxed18 = 1'd0;
reg lhs_array_muxed19 = 1'd0;
reg basiclowerer_array_muxed5 = 1'd0;
reg basiclowerer_array_muxed6 = 1'd0;
reg basiclowerer_array_muxed7 = 1'd0;
reg basiclowerer_array_muxed8 = 1'd0;
reg basiclowerer_array_muxed9 = 1'd0;
reg [15:0] basiclowerer_array_muxed10 = 16'd0;
reg [15:0] basiclowerer_array_muxed11 = 16'd0;
reg [15:0] basiclowerer_array_muxed12 = 16'd0;
reg [15:0] basiclowerer_array_muxed13 = 16'd0;
reg [15:0] basiclowerer_array_muxed14 = 16'd0;
reg [15:0] basiclowerer_array_muxed15;
reg [15:0] basiclowerer_array_muxed16;
reg [15:0] basiclowerer_array_muxed17;
reg [15:0] basiclowerer_array_muxed18;
reg [15:0] basiclowerer_array_muxed19;
reg lhs_array_muxed20 = 1'd0;
reg lhs_array_muxed21 = 1'd0;
reg lhs_array_muxed22 = 1'd0;
reg lhs_array_muxed23 = 1'd0;
reg lhs_array_muxed24 = 1'd0;
reg basiclowerer_array_muxed20 = 1'd0;
reg basiclowerer_array_muxed21 = 1'd0;
reg basiclowerer_array_muxed22 = 1'd0;
reg basiclowerer_array_muxed23 = 1'd0;
reg basiclowerer_array_muxed24 = 1'd0;
reg [15:0] basiclowerer_array_muxed25 = 16'd0;
reg [15:0] basiclowerer_array_muxed26 = 16'd0;
reg [15:0] basiclowerer_array_muxed27 = 16'd0;
reg [15:0] basiclowerer_array_muxed28 = 16'd0;
reg [15:0] basiclowerer_array_muxed29 = 16'd0;

// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on

assign row_buffer_hit = (rowbuffermanager_row_open & (rowbuffermanager_current_row == row));
assign rowbuffermanager_row_open = array_muxed0;
assign rowbuffermanager_current_row = array_muxed5;

// synthesis translate_off
reg dummy_d;
// synthesis translate_on
always @(*) begin
	array_muxed1 <= 1'd0;
	case (bank)
		1'd0: begin
			array_muxed1 <= rowbuffermanager0;
		end
		1'd1: begin
			array_muxed1 <= rowbuffermanager1;
		end
		2'd2: begin
			array_muxed1 <= rowbuffermanager2;
		end
		default: begin
			array_muxed1 <= rowbuffermanager3;
		end
	endcase
// synthesis translate_off
	dummy_d <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_1;
// synthesis translate_on
always @(*) begin
	array_muxed2 <= 1'd0;
	case (bank)
		1'd0: begin
			array_muxed2 <= rowbuffermanager4;
		end
		1'd1: begin
			array_muxed2 <= rowbuffermanager5;
		end
		2'd2: begin
			array_muxed2 <= rowbuffermanager6;
		end
		default: begin
			array_muxed2 <= rowbuffermanager7;
		end
	endcase
// synthesis translate_off
	dummy_d_1 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_2;
// synthesis translate_on
always @(*) begin
	array_muxed3 <= 1'd0;
	case (bank)
		1'd0: begin
			array_muxed3 <= rowbuffermanager8;
		end
		1'd1: begin
			array_muxed3 <= rowbuffermanager9;
		end
		2'd2: begin
			array_muxed3 <= rowbuffermanager10;
		end
		default: begin
			array_muxed3 <= rowbuffermanager11;
		end
	endcase
// synthesis translate_off
	dummy_d_2 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_3;
// synthesis translate_on
always @(*) begin
	array_muxed4 <= 1'd0;
	case (bank)
		1'd0: begin
			array_muxed4 <= rowbuffermanager12;
		end
		1'd1: begin
			array_muxed4 <= rowbuffermanager13;
		end
		2'd2: begin
			array_muxed4 <= rowbuffermanager14;
		end
		default: begin
			array_muxed4 <= rowbuffermanager15;
		end
	endcase
// synthesis translate_off
	dummy_d_3 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_4;
// synthesis translate_on
always @(*) begin
	array_muxed0 <= 1'd0;
	case (bank_group)
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
	dummy_d_4 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_5;
// synthesis translate_on
always @(*) begin
	array_muxed6 <= 16'd0;
	case (bank)
		1'd0: begin
			array_muxed6 <= rowbuffermanager16;
		end
		1'd1: begin
			array_muxed6 <= rowbuffermanager17;
		end
		2'd2: begin
			array_muxed6 <= rowbuffermanager18;
		end
		default: begin
			array_muxed6 <= rowbuffermanager19;
		end
	endcase
// synthesis translate_off
	dummy_d_5 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_6;
// synthesis translate_on
always @(*) begin
	array_muxed7 <= 16'd0;
	case (bank)
		1'd0: begin
			array_muxed7 <= rowbuffermanager20;
		end
		1'd1: begin
			array_muxed7 <= rowbuffermanager21;
		end
		2'd2: begin
			array_muxed7 <= rowbuffermanager22;
		end
		default: begin
			array_muxed7 <= rowbuffermanager23;
		end
	endcase
// synthesis translate_off
	dummy_d_6 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_7;
// synthesis translate_on
always @(*) begin
	array_muxed8 <= 16'd0;
	case (bank)
		1'd0: begin
			array_muxed8 <= rowbuffermanager24;
		end
		1'd1: begin
			array_muxed8 <= rowbuffermanager25;
		end
		2'd2: begin
			array_muxed8 <= rowbuffermanager26;
		end
		default: begin
			array_muxed8 <= rowbuffermanager27;
		end
	endcase
// synthesis translate_off
	dummy_d_7 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_8;
// synthesis translate_on
always @(*) begin
	array_muxed9 <= 16'd0;
	case (bank)
		1'd0: begin
			array_muxed9 <= rowbuffermanager28;
		end
		1'd1: begin
			array_muxed9 <= rowbuffermanager29;
		end
		2'd2: begin
			array_muxed9 <= rowbuffermanager30;
		end
		default: begin
			array_muxed9 <= rowbuffermanager31;
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
	array_muxed5 <= 16'd0;
	case (bank_group)
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
	dummy_d_9 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_10;
// synthesis translate_on
always @(*) begin
	basiclowerer_array_muxed1 <= 16'd0;
	case (bank)
		1'd0: begin
			basiclowerer_array_muxed1 <= rowbuffermanager16;
		end
		1'd1: begin
			basiclowerer_array_muxed1 <= rowbuffermanager17;
		end
		2'd2: begin
			basiclowerer_array_muxed1 <= rowbuffermanager18;
		end
		default: begin
			basiclowerer_array_muxed1 <= rowbuffermanager19;
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
	basiclowerer_array_muxed2 <= 16'd0;
	case (bank)
		1'd0: begin
			basiclowerer_array_muxed2 <= rowbuffermanager20;
		end
		1'd1: begin
			basiclowerer_array_muxed2 <= rowbuffermanager21;
		end
		2'd2: begin
			basiclowerer_array_muxed2 <= rowbuffermanager22;
		end
		default: begin
			basiclowerer_array_muxed2 <= rowbuffermanager23;
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
	basiclowerer_array_muxed3 <= 16'd0;
	case (bank)
		1'd0: begin
			basiclowerer_array_muxed3 <= rowbuffermanager24;
		end
		1'd1: begin
			basiclowerer_array_muxed3 <= rowbuffermanager25;
		end
		2'd2: begin
			basiclowerer_array_muxed3 <= rowbuffermanager26;
		end
		default: begin
			basiclowerer_array_muxed3 <= rowbuffermanager27;
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
	basiclowerer_array_muxed4 <= 16'd0;
	case (bank)
		1'd0: begin
			basiclowerer_array_muxed4 <= rowbuffermanager28;
		end
		1'd1: begin
			basiclowerer_array_muxed4 <= rowbuffermanager29;
		end
		2'd2: begin
			basiclowerer_array_muxed4 <= rowbuffermanager30;
		end
		default: begin
			basiclowerer_array_muxed4 <= rowbuffermanager31;
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
	basiclowerer_array_muxed0 <= 16'd0;
	case (bank_group)
		1'd0: begin
			basiclowerer_array_muxed0 <= basiclowerer_array_muxed1;
		end
		1'd1: begin
			basiclowerer_array_muxed0 <= basiclowerer_array_muxed2;
		end
		2'd2: begin
			basiclowerer_array_muxed0 <= basiclowerer_array_muxed3;
		end
		default: begin
			basiclowerer_array_muxed0 <= basiclowerer_array_muxed4;
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
	basiclowerer_array_muxed16 <= 16'd0;
	case (bank)
		1'd0: begin
			basiclowerer_array_muxed16 <= rowbuffermanager16;
		end
		1'd1: begin
			basiclowerer_array_muxed16 <= rowbuffermanager17;
		end
		2'd2: begin
			basiclowerer_array_muxed16 <= rowbuffermanager18;
		end
		default: begin
			basiclowerer_array_muxed16 <= rowbuffermanager19;
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
	basiclowerer_array_muxed17 <= 16'd0;
	case (bank)
		1'd0: begin
			basiclowerer_array_muxed17 <= rowbuffermanager20;
		end
		1'd1: begin
			basiclowerer_array_muxed17 <= rowbuffermanager21;
		end
		2'd2: begin
			basiclowerer_array_muxed17 <= rowbuffermanager22;
		end
		default: begin
			basiclowerer_array_muxed17 <= rowbuffermanager23;
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
	basiclowerer_array_muxed18 <= 16'd0;
	case (bank)
		1'd0: begin
			basiclowerer_array_muxed18 <= rowbuffermanager24;
		end
		1'd1: begin
			basiclowerer_array_muxed18 <= rowbuffermanager25;
		end
		2'd2: begin
			basiclowerer_array_muxed18 <= rowbuffermanager26;
		end
		default: begin
			basiclowerer_array_muxed18 <= rowbuffermanager27;
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
	basiclowerer_array_muxed19 <= 16'd0;
	case (bank)
		1'd0: begin
			basiclowerer_array_muxed19 <= rowbuffermanager28;
		end
		1'd1: begin
			basiclowerer_array_muxed19 <= rowbuffermanager29;
		end
		2'd2: begin
			basiclowerer_array_muxed19 <= rowbuffermanager30;
		end
		default: begin
			basiclowerer_array_muxed19 <= rowbuffermanager31;
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
	basiclowerer_array_muxed15 <= 16'd0;
	case (bank_group)
		1'd0: begin
			basiclowerer_array_muxed15 <= basiclowerer_array_muxed16;
		end
		1'd1: begin
			basiclowerer_array_muxed15 <= basiclowerer_array_muxed17;
		end
		2'd2: begin
			basiclowerer_array_muxed15 <= basiclowerer_array_muxed18;
		end
		default: begin
			basiclowerer_array_muxed15 <= basiclowerer_array_muxed19;
		end
	endcase
// synthesis translate_off
	dummy_d_19 <= dummy_s;
// synthesis translate_on
end

always @(posedge sys_clk) begin
	case (cmd_decoded)
		2'd2: begin
			lhs_array_muxed10 = 1'd0;
			case (bank_group)
				1'd0: begin
					lhs_array_muxed11 = lhs_array_muxed10;
					case (bank)
						1'd0: begin
							rowbuffermanager0 <= lhs_array_muxed11;
						end
						1'd1: begin
							rowbuffermanager1 <= lhs_array_muxed11;
						end
						2'd2: begin
							rowbuffermanager2 <= lhs_array_muxed11;
						end
						default: begin
							rowbuffermanager3 <= lhs_array_muxed11;
						end
					endcase
				end
				1'd1: begin
					lhs_array_muxed12 = lhs_array_muxed10;
					case (bank)
						1'd0: begin
							rowbuffermanager4 <= lhs_array_muxed12;
						end
						1'd1: begin
							rowbuffermanager5 <= lhs_array_muxed12;
						end
						2'd2: begin
							rowbuffermanager6 <= lhs_array_muxed12;
						end
						default: begin
							rowbuffermanager7 <= lhs_array_muxed12;
						end
					endcase
				end
				2'd2: begin
					lhs_array_muxed13 = lhs_array_muxed10;
					case (bank)
						1'd0: begin
							rowbuffermanager8 <= lhs_array_muxed13;
						end
						1'd1: begin
							rowbuffermanager9 <= lhs_array_muxed13;
						end
						2'd2: begin
							rowbuffermanager10 <= lhs_array_muxed13;
						end
						default: begin
							rowbuffermanager11 <= lhs_array_muxed13;
						end
					endcase
				end
				default: begin
					lhs_array_muxed14 = lhs_array_muxed10;
					case (bank)
						1'd0: begin
							rowbuffermanager12 <= lhs_array_muxed14;
						end
						1'd1: begin
							rowbuffermanager13 <= lhs_array_muxed14;
						end
						2'd2: begin
							rowbuffermanager14 <= lhs_array_muxed14;
						end
						default: begin
							rowbuffermanager15 <= lhs_array_muxed14;
						end
					endcase
				end
			endcase
		end
		2'd3: begin
			lhs_array_muxed0 = 1'd1;
			case (bank_group)
				1'd0: begin
					lhs_array_muxed1 = lhs_array_muxed0;
					case (bank)
						1'd0: begin
							rowbuffermanager0 <= lhs_array_muxed1;
						end
						1'd1: begin
							rowbuffermanager1 <= lhs_array_muxed1;
						end
						2'd2: begin
							rowbuffermanager2 <= lhs_array_muxed1;
						end
						default: begin
							rowbuffermanager3 <= lhs_array_muxed1;
						end
					endcase
				end
				1'd1: begin
					lhs_array_muxed2 = lhs_array_muxed0;
					case (bank)
						1'd0: begin
							rowbuffermanager4 <= lhs_array_muxed2;
						end
						1'd1: begin
							rowbuffermanager5 <= lhs_array_muxed2;
						end
						2'd2: begin
							rowbuffermanager6 <= lhs_array_muxed2;
						end
						default: begin
							rowbuffermanager7 <= lhs_array_muxed2;
						end
					endcase
				end
				2'd2: begin
					lhs_array_muxed3 = lhs_array_muxed0;
					case (bank)
						1'd0: begin
							rowbuffermanager8 <= lhs_array_muxed3;
						end
						1'd1: begin
							rowbuffermanager9 <= lhs_array_muxed3;
						end
						2'd2: begin
							rowbuffermanager10 <= lhs_array_muxed3;
						end
						default: begin
							rowbuffermanager11 <= lhs_array_muxed3;
						end
					endcase
				end
				default: begin
					lhs_array_muxed4 = lhs_array_muxed0;
					case (bank)
						1'd0: begin
							rowbuffermanager12 <= lhs_array_muxed4;
						end
						1'd1: begin
							rowbuffermanager13 <= lhs_array_muxed4;
						end
						2'd2: begin
							rowbuffermanager14 <= lhs_array_muxed4;
						end
						default: begin
							rowbuffermanager15 <= lhs_array_muxed4;
						end
					endcase
				end
			endcase
			lhs_array_muxed5 = row;
			case (bank_group)
				1'd0: begin
					lhs_array_muxed6 = lhs_array_muxed5;
					case (bank)
						1'd0: begin
							rowbuffermanager16 <= lhs_array_muxed6;
						end
						1'd1: begin
							rowbuffermanager17 <= lhs_array_muxed6;
						end
						2'd2: begin
							rowbuffermanager18 <= lhs_array_muxed6;
						end
						default: begin
							rowbuffermanager19 <= lhs_array_muxed6;
						end
					endcase
				end
				1'd1: begin
					lhs_array_muxed7 = lhs_array_muxed5;
					case (bank)
						1'd0: begin
							rowbuffermanager20 <= lhs_array_muxed7;
						end
						1'd1: begin
							rowbuffermanager21 <= lhs_array_muxed7;
						end
						2'd2: begin
							rowbuffermanager22 <= lhs_array_muxed7;
						end
						default: begin
							rowbuffermanager23 <= lhs_array_muxed7;
						end
					endcase
				end
				2'd2: begin
					lhs_array_muxed8 = lhs_array_muxed5;
					case (bank)
						1'd0: begin
							rowbuffermanager24 <= lhs_array_muxed8;
						end
						1'd1: begin
							rowbuffermanager25 <= lhs_array_muxed8;
						end
						2'd2: begin
							rowbuffermanager26 <= lhs_array_muxed8;
						end
						default: begin
							rowbuffermanager27 <= lhs_array_muxed8;
						end
					endcase
				end
				default: begin
					lhs_array_muxed9 = lhs_array_muxed5;
					case (bank)
						1'd0: begin
							rowbuffermanager28 <= lhs_array_muxed9;
						end
						1'd1: begin
							rowbuffermanager29 <= lhs_array_muxed9;
						end
						2'd2: begin
							rowbuffermanager30 <= lhs_array_muxed9;
						end
						default: begin
							rowbuffermanager31 <= lhs_array_muxed9;
						end
					endcase
				end
			endcase
		end
		3'd4: begin
			if ((basiclowerer_array_muxed15 != row)) begin
				lhs_array_muxed20 = 1'd0;
				case (bank_group)
					1'd0: begin
						lhs_array_muxed21 = lhs_array_muxed20;
						case (bank)
							1'd0: begin
								rowbuffermanager0 <= lhs_array_muxed21;
							end
							1'd1: begin
								rowbuffermanager1 <= lhs_array_muxed21;
							end
							2'd2: begin
								rowbuffermanager2 <= lhs_array_muxed21;
							end
							default: begin
								rowbuffermanager3 <= lhs_array_muxed21;
							end
						endcase
					end
					1'd1: begin
						lhs_array_muxed22 = lhs_array_muxed20;
						case (bank)
							1'd0: begin
								rowbuffermanager4 <= lhs_array_muxed22;
							end
							1'd1: begin
								rowbuffermanager5 <= lhs_array_muxed22;
							end
							2'd2: begin
								rowbuffermanager6 <= lhs_array_muxed22;
							end
							default: begin
								rowbuffermanager7 <= lhs_array_muxed22;
							end
						endcase
					end
					2'd2: begin
						lhs_array_muxed23 = lhs_array_muxed20;
						case (bank)
							1'd0: begin
								rowbuffermanager8 <= lhs_array_muxed23;
							end
							1'd1: begin
								rowbuffermanager9 <= lhs_array_muxed23;
							end
							2'd2: begin
								rowbuffermanager10 <= lhs_array_muxed23;
							end
							default: begin
								rowbuffermanager11 <= lhs_array_muxed23;
							end
						endcase
					end
					default: begin
						lhs_array_muxed24 = lhs_array_muxed20;
						case (bank)
							1'd0: begin
								rowbuffermanager12 <= lhs_array_muxed24;
							end
							1'd1: begin
								rowbuffermanager13 <= lhs_array_muxed24;
							end
							2'd2: begin
								rowbuffermanager14 <= lhs_array_muxed24;
							end
							default: begin
								rowbuffermanager15 <= lhs_array_muxed24;
							end
						endcase
					end
				endcase
				basiclowerer_array_muxed20 = 1'd1;
				case (bank_group)
					1'd0: begin
						basiclowerer_array_muxed21 = basiclowerer_array_muxed20;
						case (bank)
							1'd0: begin
								rowbuffermanager0 <= basiclowerer_array_muxed21;
							end
							1'd1: begin
								rowbuffermanager1 <= basiclowerer_array_muxed21;
							end
							2'd2: begin
								rowbuffermanager2 <= basiclowerer_array_muxed21;
							end
							default: begin
								rowbuffermanager3 <= basiclowerer_array_muxed21;
							end
						endcase
					end
					1'd1: begin
						basiclowerer_array_muxed22 = basiclowerer_array_muxed20;
						case (bank)
							1'd0: begin
								rowbuffermanager4 <= basiclowerer_array_muxed22;
							end
							1'd1: begin
								rowbuffermanager5 <= basiclowerer_array_muxed22;
							end
							2'd2: begin
								rowbuffermanager6 <= basiclowerer_array_muxed22;
							end
							default: begin
								rowbuffermanager7 <= basiclowerer_array_muxed22;
							end
						endcase
					end
					2'd2: begin
						basiclowerer_array_muxed23 = basiclowerer_array_muxed20;
						case (bank)
							1'd0: begin
								rowbuffermanager8 <= basiclowerer_array_muxed23;
							end
							1'd1: begin
								rowbuffermanager9 <= basiclowerer_array_muxed23;
							end
							2'd2: begin
								rowbuffermanager10 <= basiclowerer_array_muxed23;
							end
							default: begin
								rowbuffermanager11 <= basiclowerer_array_muxed23;
							end
						endcase
					end
					default: begin
						basiclowerer_array_muxed24 = basiclowerer_array_muxed20;
						case (bank)
							1'd0: begin
								rowbuffermanager12 <= basiclowerer_array_muxed24;
							end
							1'd1: begin
								rowbuffermanager13 <= basiclowerer_array_muxed24;
							end
							2'd2: begin
								rowbuffermanager14 <= basiclowerer_array_muxed24;
							end
							default: begin
								rowbuffermanager15 <= basiclowerer_array_muxed24;
							end
						endcase
					end
				endcase
				basiclowerer_array_muxed25 = row;
				case (bank_group)
					1'd0: begin
						basiclowerer_array_muxed26 = basiclowerer_array_muxed25;
						case (bank)
							1'd0: begin
								rowbuffermanager16 <= basiclowerer_array_muxed26;
							end
							1'd1: begin
								rowbuffermanager17 <= basiclowerer_array_muxed26;
							end
							2'd2: begin
								rowbuffermanager18 <= basiclowerer_array_muxed26;
							end
							default: begin
								rowbuffermanager19 <= basiclowerer_array_muxed26;
							end
						endcase
					end
					1'd1: begin
						basiclowerer_array_muxed27 = basiclowerer_array_muxed25;
						case (bank)
							1'd0: begin
								rowbuffermanager20 <= basiclowerer_array_muxed27;
							end
							1'd1: begin
								rowbuffermanager21 <= basiclowerer_array_muxed27;
							end
							2'd2: begin
								rowbuffermanager22 <= basiclowerer_array_muxed27;
							end
							default: begin
								rowbuffermanager23 <= basiclowerer_array_muxed27;
							end
						endcase
					end
					2'd2: begin
						basiclowerer_array_muxed28 = basiclowerer_array_muxed25;
						case (bank)
							1'd0: begin
								rowbuffermanager24 <= basiclowerer_array_muxed28;
							end
							1'd1: begin
								rowbuffermanager25 <= basiclowerer_array_muxed28;
							end
							2'd2: begin
								rowbuffermanager26 <= basiclowerer_array_muxed28;
							end
							default: begin
								rowbuffermanager27 <= basiclowerer_array_muxed28;
							end
						endcase
					end
					default: begin
						basiclowerer_array_muxed29 = basiclowerer_array_muxed25;
						case (bank)
							1'd0: begin
								rowbuffermanager28 <= basiclowerer_array_muxed29;
							end
							1'd1: begin
								rowbuffermanager29 <= basiclowerer_array_muxed29;
							end
							2'd2: begin
								rowbuffermanager30 <= basiclowerer_array_muxed29;
							end
							default: begin
								rowbuffermanager31 <= basiclowerer_array_muxed29;
							end
						endcase
					end
				endcase
			end
		end
		3'd5: begin
			if ((basiclowerer_array_muxed0 != row)) begin
				lhs_array_muxed15 = 1'd0;
				case (bank_group)
					1'd0: begin
						lhs_array_muxed16 = lhs_array_muxed15;
						case (bank)
							1'd0: begin
								rowbuffermanager0 <= lhs_array_muxed16;
							end
							1'd1: begin
								rowbuffermanager1 <= lhs_array_muxed16;
							end
							2'd2: begin
								rowbuffermanager2 <= lhs_array_muxed16;
							end
							default: begin
								rowbuffermanager3 <= lhs_array_muxed16;
							end
						endcase
					end
					1'd1: begin
						lhs_array_muxed17 = lhs_array_muxed15;
						case (bank)
							1'd0: begin
								rowbuffermanager4 <= lhs_array_muxed17;
							end
							1'd1: begin
								rowbuffermanager5 <= lhs_array_muxed17;
							end
							2'd2: begin
								rowbuffermanager6 <= lhs_array_muxed17;
							end
							default: begin
								rowbuffermanager7 <= lhs_array_muxed17;
							end
						endcase
					end
					2'd2: begin
						lhs_array_muxed18 = lhs_array_muxed15;
						case (bank)
							1'd0: begin
								rowbuffermanager8 <= lhs_array_muxed18;
							end
							1'd1: begin
								rowbuffermanager9 <= lhs_array_muxed18;
							end
							2'd2: begin
								rowbuffermanager10 <= lhs_array_muxed18;
							end
							default: begin
								rowbuffermanager11 <= lhs_array_muxed18;
							end
						endcase
					end
					default: begin
						lhs_array_muxed19 = lhs_array_muxed15;
						case (bank)
							1'd0: begin
								rowbuffermanager12 <= lhs_array_muxed19;
							end
							1'd1: begin
								rowbuffermanager13 <= lhs_array_muxed19;
							end
							2'd2: begin
								rowbuffermanager14 <= lhs_array_muxed19;
							end
							default: begin
								rowbuffermanager15 <= lhs_array_muxed19;
							end
						endcase
					end
				endcase
				basiclowerer_array_muxed5 = 1'd1;
				case (bank_group)
					1'd0: begin
						basiclowerer_array_muxed6 = basiclowerer_array_muxed5;
						case (bank)
							1'd0: begin
								rowbuffermanager0 <= basiclowerer_array_muxed6;
							end
							1'd1: begin
								rowbuffermanager1 <= basiclowerer_array_muxed6;
							end
							2'd2: begin
								rowbuffermanager2 <= basiclowerer_array_muxed6;
							end
							default: begin
								rowbuffermanager3 <= basiclowerer_array_muxed6;
							end
						endcase
					end
					1'd1: begin
						basiclowerer_array_muxed7 = basiclowerer_array_muxed5;
						case (bank)
							1'd0: begin
								rowbuffermanager4 <= basiclowerer_array_muxed7;
							end
							1'd1: begin
								rowbuffermanager5 <= basiclowerer_array_muxed7;
							end
							2'd2: begin
								rowbuffermanager6 <= basiclowerer_array_muxed7;
							end
							default: begin
								rowbuffermanager7 <= basiclowerer_array_muxed7;
							end
						endcase
					end
					2'd2: begin
						basiclowerer_array_muxed8 = basiclowerer_array_muxed5;
						case (bank)
							1'd0: begin
								rowbuffermanager8 <= basiclowerer_array_muxed8;
							end
							1'd1: begin
								rowbuffermanager9 <= basiclowerer_array_muxed8;
							end
							2'd2: begin
								rowbuffermanager10 <= basiclowerer_array_muxed8;
							end
							default: begin
								rowbuffermanager11 <= basiclowerer_array_muxed8;
							end
						endcase
					end
					default: begin
						basiclowerer_array_muxed9 = basiclowerer_array_muxed5;
						case (bank)
							1'd0: begin
								rowbuffermanager12 <= basiclowerer_array_muxed9;
							end
							1'd1: begin
								rowbuffermanager13 <= basiclowerer_array_muxed9;
							end
							2'd2: begin
								rowbuffermanager14 <= basiclowerer_array_muxed9;
							end
							default: begin
								rowbuffermanager15 <= basiclowerer_array_muxed9;
							end
						endcase
					end
				endcase
				basiclowerer_array_muxed10 = row;
				case (bank_group)
					1'd0: begin
						basiclowerer_array_muxed11 = basiclowerer_array_muxed10;
						case (bank)
							1'd0: begin
								rowbuffermanager16 <= basiclowerer_array_muxed11;
							end
							1'd1: begin
								rowbuffermanager17 <= basiclowerer_array_muxed11;
							end
							2'd2: begin
								rowbuffermanager18 <= basiclowerer_array_muxed11;
							end
							default: begin
								rowbuffermanager19 <= basiclowerer_array_muxed11;
							end
						endcase
					end
					1'd1: begin
						basiclowerer_array_muxed12 = basiclowerer_array_muxed10;
						case (bank)
							1'd0: begin
								rowbuffermanager20 <= basiclowerer_array_muxed12;
							end
							1'd1: begin
								rowbuffermanager21 <= basiclowerer_array_muxed12;
							end
							2'd2: begin
								rowbuffermanager22 <= basiclowerer_array_muxed12;
							end
							default: begin
								rowbuffermanager23 <= basiclowerer_array_muxed12;
							end
						endcase
					end
					2'd2: begin
						basiclowerer_array_muxed13 = basiclowerer_array_muxed10;
						case (bank)
							1'd0: begin
								rowbuffermanager24 <= basiclowerer_array_muxed13;
							end
							1'd1: begin
								rowbuffermanager25 <= basiclowerer_array_muxed13;
							end
							2'd2: begin
								rowbuffermanager26 <= basiclowerer_array_muxed13;
							end
							default: begin
								rowbuffermanager27 <= basiclowerer_array_muxed13;
							end
						endcase
					end
					default: begin
						basiclowerer_array_muxed14 = basiclowerer_array_muxed10;
						case (bank)
							1'd0: begin
								rowbuffermanager28 <= basiclowerer_array_muxed14;
							end
							1'd1: begin
								rowbuffermanager29 <= basiclowerer_array_muxed14;
							end
							2'd2: begin
								rowbuffermanager30 <= basiclowerer_array_muxed14;
							end
							default: begin
								rowbuffermanager31 <= basiclowerer_array_muxed14;
							end
						endcase
					end
				endcase
			end
		end
	endcase
	if (sys_rst) begin
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
	end
end

endmodule
