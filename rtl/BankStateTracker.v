/* Machine-generated using Migen */
module BankStateTracker(
	input [3:0] cmd_decoded,
	input [1:0] bank_group,
	input [1:0] bank,
	input [15:0] row,
	output [1:0] bank_state,
	output [15:0] active_row,
	input sys_clk,
	input sys_rst
);

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
reg [1:0] comb_array_muxed0;
reg [1:0] comb_array_muxed1;
reg [1:0] comb_array_muxed2;
reg [1:0] comb_array_muxed3;
reg [1:0] comb_array_muxed4;
reg [15:0] comb_array_muxed5;
reg [15:0] comb_array_muxed6;
reg [15:0] comb_array_muxed7;
reg [15:0] comb_array_muxed8;
reg [15:0] comb_array_muxed9;
reg [1:0] sync_array_muxed0 = 2'd0;
reg [1:0] sync_array_muxed1 = 2'd0;
reg [1:0] sync_array_muxed2 = 2'd0;
reg [1:0] sync_array_muxed3 = 2'd0;
reg [1:0] sync_array_muxed4 = 2'd0;
reg [15:0] sync_array_muxed5 = 16'd0;
reg [15:0] sync_array_muxed6 = 16'd0;
reg [15:0] sync_array_muxed7 = 16'd0;
reg [15:0] sync_array_muxed8 = 16'd0;
reg [15:0] sync_array_muxed9 = 16'd0;
reg [1:0] sync_array_muxed10 = 2'd0;
reg [1:0] sync_array_muxed11 = 2'd0;
reg [1:0] sync_array_muxed12 = 2'd0;
reg [1:0] sync_array_muxed13 = 2'd0;
reg [1:0] sync_array_muxed14 = 2'd0;
reg [1:0] sync_array_muxed15 = 2'd0;
reg [1:0] sync_array_muxed16 = 2'd0;
reg [1:0] sync_array_muxed17 = 2'd0;
reg [1:0] sync_array_muxed18 = 2'd0;
reg [1:0] sync_array_muxed19 = 2'd0;
reg [1:0] sync_array_muxed20 = 2'd0;
reg [1:0] sync_array_muxed21 = 2'd0;
reg [1:0] sync_array_muxed22 = 2'd0;
reg [1:0] sync_array_muxed23 = 2'd0;
reg [1:0] sync_array_muxed24 = 2'd0;

// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on

assign bank_state = comb_array_muxed0;
assign active_row = comb_array_muxed5;

// synthesis translate_off
reg dummy_d;
// synthesis translate_on
always @(*) begin
	comb_array_muxed1 <= 2'd0;
	case (bank)
		1'd0: begin
			comb_array_muxed1 <= bankstatetracker0;
		end
		1'd1: begin
			comb_array_muxed1 <= bankstatetracker1;
		end
		2'd2: begin
			comb_array_muxed1 <= bankstatetracker2;
		end
		default: begin
			comb_array_muxed1 <= bankstatetracker3;
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
	comb_array_muxed2 <= 2'd0;
	case (bank)
		1'd0: begin
			comb_array_muxed2 <= bankstatetracker4;
		end
		1'd1: begin
			comb_array_muxed2 <= bankstatetracker5;
		end
		2'd2: begin
			comb_array_muxed2 <= bankstatetracker6;
		end
		default: begin
			comb_array_muxed2 <= bankstatetracker7;
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
	comb_array_muxed3 <= 2'd0;
	case (bank)
		1'd0: begin
			comb_array_muxed3 <= bankstatetracker8;
		end
		1'd1: begin
			comb_array_muxed3 <= bankstatetracker9;
		end
		2'd2: begin
			comb_array_muxed3 <= bankstatetracker10;
		end
		default: begin
			comb_array_muxed3 <= bankstatetracker11;
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
	comb_array_muxed4 <= 2'd0;
	case (bank)
		1'd0: begin
			comb_array_muxed4 <= bankstatetracker12;
		end
		1'd1: begin
			comb_array_muxed4 <= bankstatetracker13;
		end
		2'd2: begin
			comb_array_muxed4 <= bankstatetracker14;
		end
		default: begin
			comb_array_muxed4 <= bankstatetracker15;
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
	comb_array_muxed0 <= 2'd0;
	case (bank_group)
		1'd0: begin
			comb_array_muxed0 <= comb_array_muxed1;
		end
		1'd1: begin
			comb_array_muxed0 <= comb_array_muxed2;
		end
		2'd2: begin
			comb_array_muxed0 <= comb_array_muxed3;
		end
		default: begin
			comb_array_muxed0 <= comb_array_muxed4;
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
	comb_array_muxed6 <= 16'd0;
	case (bank)
		1'd0: begin
			comb_array_muxed6 <= bankstatetracker16;
		end
		1'd1: begin
			comb_array_muxed6 <= bankstatetracker17;
		end
		2'd2: begin
			comb_array_muxed6 <= bankstatetracker18;
		end
		default: begin
			comb_array_muxed6 <= bankstatetracker19;
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
	comb_array_muxed7 <= 16'd0;
	case (bank)
		1'd0: begin
			comb_array_muxed7 <= bankstatetracker20;
		end
		1'd1: begin
			comb_array_muxed7 <= bankstatetracker21;
		end
		2'd2: begin
			comb_array_muxed7 <= bankstatetracker22;
		end
		default: begin
			comb_array_muxed7 <= bankstatetracker23;
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
	comb_array_muxed8 <= 16'd0;
	case (bank)
		1'd0: begin
			comb_array_muxed8 <= bankstatetracker24;
		end
		1'd1: begin
			comb_array_muxed8 <= bankstatetracker25;
		end
		2'd2: begin
			comb_array_muxed8 <= bankstatetracker26;
		end
		default: begin
			comb_array_muxed8 <= bankstatetracker27;
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
	comb_array_muxed9 <= 16'd0;
	case (bank)
		1'd0: begin
			comb_array_muxed9 <= bankstatetracker28;
		end
		1'd1: begin
			comb_array_muxed9 <= bankstatetracker29;
		end
		2'd2: begin
			comb_array_muxed9 <= bankstatetracker30;
		end
		default: begin
			comb_array_muxed9 <= bankstatetracker31;
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
	comb_array_muxed5 <= 16'd0;
	case (bank_group)
		1'd0: begin
			comb_array_muxed5 <= comb_array_muxed6;
		end
		1'd1: begin
			comb_array_muxed5 <= comb_array_muxed7;
		end
		2'd2: begin
			comb_array_muxed5 <= comb_array_muxed8;
		end
		default: begin
			comb_array_muxed5 <= comb_array_muxed9;
		end
	endcase
// synthesis translate_off
	dummy_d_9 <= dummy_s;
// synthesis translate_on
end

always @(posedge sys_clk) begin
	case (cmd_decoded)
		2'd2: begin
			sync_array_muxed10 = 1'd0;
			case (bank_group)
				1'd0: begin
					sync_array_muxed11 = sync_array_muxed10;
					case (bank)
						1'd0: begin
							bankstatetracker0 <= sync_array_muxed11;
						end
						1'd1: begin
							bankstatetracker1 <= sync_array_muxed11;
						end
						2'd2: begin
							bankstatetracker2 <= sync_array_muxed11;
						end
						default: begin
							bankstatetracker3 <= sync_array_muxed11;
						end
					endcase
				end
				1'd1: begin
					sync_array_muxed12 = sync_array_muxed10;
					case (bank)
						1'd0: begin
							bankstatetracker4 <= sync_array_muxed12;
						end
						1'd1: begin
							bankstatetracker5 <= sync_array_muxed12;
						end
						2'd2: begin
							bankstatetracker6 <= sync_array_muxed12;
						end
						default: begin
							bankstatetracker7 <= sync_array_muxed12;
						end
					endcase
				end
				2'd2: begin
					sync_array_muxed13 = sync_array_muxed10;
					case (bank)
						1'd0: begin
							bankstatetracker8 <= sync_array_muxed13;
						end
						1'd1: begin
							bankstatetracker9 <= sync_array_muxed13;
						end
						2'd2: begin
							bankstatetracker10 <= sync_array_muxed13;
						end
						default: begin
							bankstatetracker11 <= sync_array_muxed13;
						end
					endcase
				end
				default: begin
					sync_array_muxed14 = sync_array_muxed10;
					case (bank)
						1'd0: begin
							bankstatetracker12 <= sync_array_muxed14;
						end
						1'd1: begin
							bankstatetracker13 <= sync_array_muxed14;
						end
						2'd2: begin
							bankstatetracker14 <= sync_array_muxed14;
						end
						default: begin
							bankstatetracker15 <= sync_array_muxed14;
						end
					endcase
				end
			endcase
		end
		2'd3: begin
			sync_array_muxed0 = 1'd1;
			case (bank_group)
				1'd0: begin
					sync_array_muxed1 = sync_array_muxed0;
					case (bank)
						1'd0: begin
							bankstatetracker0 <= sync_array_muxed1;
						end
						1'd1: begin
							bankstatetracker1 <= sync_array_muxed1;
						end
						2'd2: begin
							bankstatetracker2 <= sync_array_muxed1;
						end
						default: begin
							bankstatetracker3 <= sync_array_muxed1;
						end
					endcase
				end
				1'd1: begin
					sync_array_muxed2 = sync_array_muxed0;
					case (bank)
						1'd0: begin
							bankstatetracker4 <= sync_array_muxed2;
						end
						1'd1: begin
							bankstatetracker5 <= sync_array_muxed2;
						end
						2'd2: begin
							bankstatetracker6 <= sync_array_muxed2;
						end
						default: begin
							bankstatetracker7 <= sync_array_muxed2;
						end
					endcase
				end
				2'd2: begin
					sync_array_muxed3 = sync_array_muxed0;
					case (bank)
						1'd0: begin
							bankstatetracker8 <= sync_array_muxed3;
						end
						1'd1: begin
							bankstatetracker9 <= sync_array_muxed3;
						end
						2'd2: begin
							bankstatetracker10 <= sync_array_muxed3;
						end
						default: begin
							bankstatetracker11 <= sync_array_muxed3;
						end
					endcase
				end
				default: begin
					sync_array_muxed4 = sync_array_muxed0;
					case (bank)
						1'd0: begin
							bankstatetracker12 <= sync_array_muxed4;
						end
						1'd1: begin
							bankstatetracker13 <= sync_array_muxed4;
						end
						2'd2: begin
							bankstatetracker14 <= sync_array_muxed4;
						end
						default: begin
							bankstatetracker15 <= sync_array_muxed4;
						end
					endcase
				end
			endcase
			sync_array_muxed5 = row;
			case (bank_group)
				1'd0: begin
					sync_array_muxed6 = sync_array_muxed5;
					case (bank)
						1'd0: begin
							bankstatetracker16 <= sync_array_muxed6;
						end
						1'd1: begin
							bankstatetracker17 <= sync_array_muxed6;
						end
						2'd2: begin
							bankstatetracker18 <= sync_array_muxed6;
						end
						default: begin
							bankstatetracker19 <= sync_array_muxed6;
						end
					endcase
				end
				1'd1: begin
					sync_array_muxed7 = sync_array_muxed5;
					case (bank)
						1'd0: begin
							bankstatetracker20 <= sync_array_muxed7;
						end
						1'd1: begin
							bankstatetracker21 <= sync_array_muxed7;
						end
						2'd2: begin
							bankstatetracker22 <= sync_array_muxed7;
						end
						default: begin
							bankstatetracker23 <= sync_array_muxed7;
						end
					endcase
				end
				2'd2: begin
					sync_array_muxed8 = sync_array_muxed5;
					case (bank)
						1'd0: begin
							bankstatetracker24 <= sync_array_muxed8;
						end
						1'd1: begin
							bankstatetracker25 <= sync_array_muxed8;
						end
						2'd2: begin
							bankstatetracker26 <= sync_array_muxed8;
						end
						default: begin
							bankstatetracker27 <= sync_array_muxed8;
						end
					endcase
				end
				default: begin
					sync_array_muxed9 = sync_array_muxed5;
					case (bank)
						1'd0: begin
							bankstatetracker28 <= sync_array_muxed9;
						end
						1'd1: begin
							bankstatetracker29 <= sync_array_muxed9;
						end
						2'd2: begin
							bankstatetracker30 <= sync_array_muxed9;
						end
						default: begin
							bankstatetracker31 <= sync_array_muxed9;
						end
					endcase
				end
			endcase
		end
		3'd4: begin
			sync_array_muxed20 = 2'd3;
			case (bank_group)
				1'd0: begin
					sync_array_muxed21 = sync_array_muxed20;
					case (bank)
						1'd0: begin
							bankstatetracker0 <= sync_array_muxed21;
						end
						1'd1: begin
							bankstatetracker1 <= sync_array_muxed21;
						end
						2'd2: begin
							bankstatetracker2 <= sync_array_muxed21;
						end
						default: begin
							bankstatetracker3 <= sync_array_muxed21;
						end
					endcase
				end
				1'd1: begin
					sync_array_muxed22 = sync_array_muxed20;
					case (bank)
						1'd0: begin
							bankstatetracker4 <= sync_array_muxed22;
						end
						1'd1: begin
							bankstatetracker5 <= sync_array_muxed22;
						end
						2'd2: begin
							bankstatetracker6 <= sync_array_muxed22;
						end
						default: begin
							bankstatetracker7 <= sync_array_muxed22;
						end
					endcase
				end
				2'd2: begin
					sync_array_muxed23 = sync_array_muxed20;
					case (bank)
						1'd0: begin
							bankstatetracker8 <= sync_array_muxed23;
						end
						1'd1: begin
							bankstatetracker9 <= sync_array_muxed23;
						end
						2'd2: begin
							bankstatetracker10 <= sync_array_muxed23;
						end
						default: begin
							bankstatetracker11 <= sync_array_muxed23;
						end
					endcase
				end
				default: begin
					sync_array_muxed24 = sync_array_muxed20;
					case (bank)
						1'd0: begin
							bankstatetracker12 <= sync_array_muxed24;
						end
						1'd1: begin
							bankstatetracker13 <= sync_array_muxed24;
						end
						2'd2: begin
							bankstatetracker14 <= sync_array_muxed24;
						end
						default: begin
							bankstatetracker15 <= sync_array_muxed24;
						end
					endcase
				end
			endcase
		end
		3'd5: begin
			sync_array_muxed15 = 2'd2;
			case (bank_group)
				1'd0: begin
					sync_array_muxed16 = sync_array_muxed15;
					case (bank)
						1'd0: begin
							bankstatetracker0 <= sync_array_muxed16;
						end
						1'd1: begin
							bankstatetracker1 <= sync_array_muxed16;
						end
						2'd2: begin
							bankstatetracker2 <= sync_array_muxed16;
						end
						default: begin
							bankstatetracker3 <= sync_array_muxed16;
						end
					endcase
				end
				1'd1: begin
					sync_array_muxed17 = sync_array_muxed15;
					case (bank)
						1'd0: begin
							bankstatetracker4 <= sync_array_muxed17;
						end
						1'd1: begin
							bankstatetracker5 <= sync_array_muxed17;
						end
						2'd2: begin
							bankstatetracker6 <= sync_array_muxed17;
						end
						default: begin
							bankstatetracker7 <= sync_array_muxed17;
						end
					endcase
				end
				2'd2: begin
					sync_array_muxed18 = sync_array_muxed15;
					case (bank)
						1'd0: begin
							bankstatetracker8 <= sync_array_muxed18;
						end
						1'd1: begin
							bankstatetracker9 <= sync_array_muxed18;
						end
						2'd2: begin
							bankstatetracker10 <= sync_array_muxed18;
						end
						default: begin
							bankstatetracker11 <= sync_array_muxed18;
						end
					endcase
				end
				default: begin
					sync_array_muxed19 = sync_array_muxed15;
					case (bank)
						1'd0: begin
							bankstatetracker12 <= sync_array_muxed19;
						end
						1'd1: begin
							bankstatetracker13 <= sync_array_muxed19;
						end
						2'd2: begin
							bankstatetracker14 <= sync_array_muxed19;
						end
						default: begin
							bankstatetracker15 <= sync_array_muxed19;
						end
					endcase
				end
			endcase
		end
	endcase
	if (sys_rst) begin
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
	end
end

endmodule
