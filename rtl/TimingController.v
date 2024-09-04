/* Machine-generated using Migen */
module TimingController(
	input [3:0] cmd_decoded,
	input [1:0] bank_group,
	input [1:0] bank,
	output reg ready,
	input sys_clk,
	input sys_rst
);

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
reg [31:0] basiclowerer_array_muxed0;
reg [31:0] t_array_muxed0 = 32'd0;
reg [31:0] basiclowerer_array_muxed1;
reg [31:0] t_array_muxed1 = 32'd0;
reg [31:0] basiclowerer_array_muxed2;
reg [31:0] t_array_muxed2 = 32'd0;
reg [31:0] basiclowerer_array_muxed3;
reg [31:0] t_array_muxed3 = 32'd0;

// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on


// synthesis translate_off
reg dummy_d;
// synthesis translate_on
always @(*) begin
	basiclowerer_array_muxed0 <= 32'd0;
	case (((bank_group * 2'd2) + bank))
		1'd0: begin
			basiclowerer_array_muxed0 <= timingcontroller0;
		end
		1'd1: begin
			basiclowerer_array_muxed0 <= timingcontroller1;
		end
		2'd2: begin
			basiclowerer_array_muxed0 <= timingcontroller2;
		end
		2'd3: begin
			basiclowerer_array_muxed0 <= timingcontroller3;
		end
		3'd4: begin
			basiclowerer_array_muxed0 <= timingcontroller4;
		end
		3'd5: begin
			basiclowerer_array_muxed0 <= timingcontroller5;
		end
		3'd6: begin
			basiclowerer_array_muxed0 <= timingcontroller6;
		end
		3'd7: begin
			basiclowerer_array_muxed0 <= timingcontroller7;
		end
		4'd8: begin
			basiclowerer_array_muxed0 <= timingcontroller8;
		end
		4'd9: begin
			basiclowerer_array_muxed0 <= timingcontroller9;
		end
		4'd10: begin
			basiclowerer_array_muxed0 <= timingcontroller10;
		end
		4'd11: begin
			basiclowerer_array_muxed0 <= timingcontroller11;
		end
		4'd12: begin
			basiclowerer_array_muxed0 <= timingcontroller12;
		end
		4'd13: begin
			basiclowerer_array_muxed0 <= timingcontroller13;
		end
		4'd14: begin
			basiclowerer_array_muxed0 <= timingcontroller14;
		end
		default: begin
			basiclowerer_array_muxed0 <= timingcontroller15;
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
	basiclowerer_array_muxed1 <= 32'd0;
	case (((bank_group * 2'd2) + bank))
		1'd0: begin
			basiclowerer_array_muxed1 <= timingcontroller0;
		end
		1'd1: begin
			basiclowerer_array_muxed1 <= timingcontroller1;
		end
		2'd2: begin
			basiclowerer_array_muxed1 <= timingcontroller2;
		end
		2'd3: begin
			basiclowerer_array_muxed1 <= timingcontroller3;
		end
		3'd4: begin
			basiclowerer_array_muxed1 <= timingcontroller4;
		end
		3'd5: begin
			basiclowerer_array_muxed1 <= timingcontroller5;
		end
		3'd6: begin
			basiclowerer_array_muxed1 <= timingcontroller6;
		end
		3'd7: begin
			basiclowerer_array_muxed1 <= timingcontroller7;
		end
		4'd8: begin
			basiclowerer_array_muxed1 <= timingcontroller8;
		end
		4'd9: begin
			basiclowerer_array_muxed1 <= timingcontroller9;
		end
		4'd10: begin
			basiclowerer_array_muxed1 <= timingcontroller10;
		end
		4'd11: begin
			basiclowerer_array_muxed1 <= timingcontroller11;
		end
		4'd12: begin
			basiclowerer_array_muxed1 <= timingcontroller12;
		end
		4'd13: begin
			basiclowerer_array_muxed1 <= timingcontroller13;
		end
		4'd14: begin
			basiclowerer_array_muxed1 <= timingcontroller14;
		end
		default: begin
			basiclowerer_array_muxed1 <= timingcontroller15;
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
	basiclowerer_array_muxed2 <= 32'd0;
	case (((bank_group * 2'd2) + bank))
		1'd0: begin
			basiclowerer_array_muxed2 <= timingcontroller0;
		end
		1'd1: begin
			basiclowerer_array_muxed2 <= timingcontroller1;
		end
		2'd2: begin
			basiclowerer_array_muxed2 <= timingcontroller2;
		end
		2'd3: begin
			basiclowerer_array_muxed2 <= timingcontroller3;
		end
		3'd4: begin
			basiclowerer_array_muxed2 <= timingcontroller4;
		end
		3'd5: begin
			basiclowerer_array_muxed2 <= timingcontroller5;
		end
		3'd6: begin
			basiclowerer_array_muxed2 <= timingcontroller6;
		end
		3'd7: begin
			basiclowerer_array_muxed2 <= timingcontroller7;
		end
		4'd8: begin
			basiclowerer_array_muxed2 <= timingcontroller8;
		end
		4'd9: begin
			basiclowerer_array_muxed2 <= timingcontroller9;
		end
		4'd10: begin
			basiclowerer_array_muxed2 <= timingcontroller10;
		end
		4'd11: begin
			basiclowerer_array_muxed2 <= timingcontroller11;
		end
		4'd12: begin
			basiclowerer_array_muxed2 <= timingcontroller12;
		end
		4'd13: begin
			basiclowerer_array_muxed2 <= timingcontroller13;
		end
		4'd14: begin
			basiclowerer_array_muxed2 <= timingcontroller14;
		end
		default: begin
			basiclowerer_array_muxed2 <= timingcontroller15;
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
	basiclowerer_array_muxed3 <= 32'd0;
	case (((bank_group * 2'd2) + bank))
		1'd0: begin
			basiclowerer_array_muxed3 <= timingcontroller0;
		end
		1'd1: begin
			basiclowerer_array_muxed3 <= timingcontroller1;
		end
		2'd2: begin
			basiclowerer_array_muxed3 <= timingcontroller2;
		end
		2'd3: begin
			basiclowerer_array_muxed3 <= timingcontroller3;
		end
		3'd4: begin
			basiclowerer_array_muxed3 <= timingcontroller4;
		end
		3'd5: begin
			basiclowerer_array_muxed3 <= timingcontroller5;
		end
		3'd6: begin
			basiclowerer_array_muxed3 <= timingcontroller6;
		end
		3'd7: begin
			basiclowerer_array_muxed3 <= timingcontroller7;
		end
		4'd8: begin
			basiclowerer_array_muxed3 <= timingcontroller8;
		end
		4'd9: begin
			basiclowerer_array_muxed3 <= timingcontroller9;
		end
		4'd10: begin
			basiclowerer_array_muxed3 <= timingcontroller10;
		end
		4'd11: begin
			basiclowerer_array_muxed3 <= timingcontroller11;
		end
		4'd12: begin
			basiclowerer_array_muxed3 <= timingcontroller12;
		end
		4'd13: begin
			basiclowerer_array_muxed3 <= timingcontroller13;
		end
		4'd14: begin
			basiclowerer_array_muxed3 <= timingcontroller14;
		end
		default: begin
			basiclowerer_array_muxed3 <= timingcontroller15;
		end
	endcase
// synthesis translate_off
	dummy_d_3 <= dummy_s;
// synthesis translate_on
end

always @(posedge sys_clk) begin
	if ((cmd_decoded != 1'd0)) begin
		case (cmd_decoded)
			1'd1: begin
				ready <= 1'd0;
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
				if ((basiclowerer_array_muxed3 == 1'd0)) begin
					ready <= 1'd1;
					t_array_muxed3 = 5'd18;
					case (((bank_group * 2'd2) + bank))
						1'd0: begin
							timingcontroller0 <= t_array_muxed3;
						end
						1'd1: begin
							timingcontroller1 <= t_array_muxed3;
						end
						2'd2: begin
							timingcontroller2 <= t_array_muxed3;
						end
						2'd3: begin
							timingcontroller3 <= t_array_muxed3;
						end
						3'd4: begin
							timingcontroller4 <= t_array_muxed3;
						end
						3'd5: begin
							timingcontroller5 <= t_array_muxed3;
						end
						3'd6: begin
							timingcontroller6 <= t_array_muxed3;
						end
						3'd7: begin
							timingcontroller7 <= t_array_muxed3;
						end
						4'd8: begin
							timingcontroller8 <= t_array_muxed3;
						end
						4'd9: begin
							timingcontroller9 <= t_array_muxed3;
						end
						4'd10: begin
							timingcontroller10 <= t_array_muxed3;
						end
						4'd11: begin
							timingcontroller11 <= t_array_muxed3;
						end
						4'd12: begin
							timingcontroller12 <= t_array_muxed3;
						end
						4'd13: begin
							timingcontroller13 <= t_array_muxed3;
						end
						4'd14: begin
							timingcontroller14 <= t_array_muxed3;
						end
						default: begin
							timingcontroller15 <= t_array_muxed3;
						end
					endcase
				end else begin
					ready <= 1'd0;
				end
			end
			2'd3: begin
				if ((basiclowerer_array_muxed2 == 1'd0)) begin
					ready <= 1'd1;
					t_array_muxed2 = 6'd32;
					case (((bank_group * 2'd2) + bank))
						1'd0: begin
							timingcontroller0 <= t_array_muxed2;
						end
						1'd1: begin
							timingcontroller1 <= t_array_muxed2;
						end
						2'd2: begin
							timingcontroller2 <= t_array_muxed2;
						end
						2'd3: begin
							timingcontroller3 <= t_array_muxed2;
						end
						3'd4: begin
							timingcontroller4 <= t_array_muxed2;
						end
						3'd5: begin
							timingcontroller5 <= t_array_muxed2;
						end
						3'd6: begin
							timingcontroller6 <= t_array_muxed2;
						end
						3'd7: begin
							timingcontroller7 <= t_array_muxed2;
						end
						4'd8: begin
							timingcontroller8 <= t_array_muxed2;
						end
						4'd9: begin
							timingcontroller9 <= t_array_muxed2;
						end
						4'd10: begin
							timingcontroller10 <= t_array_muxed2;
						end
						4'd11: begin
							timingcontroller11 <= t_array_muxed2;
						end
						4'd12: begin
							timingcontroller12 <= t_array_muxed2;
						end
						4'd13: begin
							timingcontroller13 <= t_array_muxed2;
						end
						4'd14: begin
							timingcontroller14 <= t_array_muxed2;
						end
						default: begin
							timingcontroller15 <= t_array_muxed2;
						end
					endcase
				end else begin
					ready <= 1'd0;
				end
			end
			3'd4: begin
				if ((basiclowerer_array_muxed1 == 1'd0)) begin
					ready <= 1'd1;
					t_array_muxed1 = 5'd20;
					case (((bank_group * 2'd2) + bank))
						1'd0: begin
							timingcontroller0 <= t_array_muxed1;
						end
						1'd1: begin
							timingcontroller1 <= t_array_muxed1;
						end
						2'd2: begin
							timingcontroller2 <= t_array_muxed1;
						end
						2'd3: begin
							timingcontroller3 <= t_array_muxed1;
						end
						3'd4: begin
							timingcontroller4 <= t_array_muxed1;
						end
						3'd5: begin
							timingcontroller5 <= t_array_muxed1;
						end
						3'd6: begin
							timingcontroller6 <= t_array_muxed1;
						end
						3'd7: begin
							timingcontroller7 <= t_array_muxed1;
						end
						4'd8: begin
							timingcontroller8 <= t_array_muxed1;
						end
						4'd9: begin
							timingcontroller9 <= t_array_muxed1;
						end
						4'd10: begin
							timingcontroller10 <= t_array_muxed1;
						end
						4'd11: begin
							timingcontroller11 <= t_array_muxed1;
						end
						4'd12: begin
							timingcontroller12 <= t_array_muxed1;
						end
						4'd13: begin
							timingcontroller13 <= t_array_muxed1;
						end
						4'd14: begin
							timingcontroller14 <= t_array_muxed1;
						end
						default: begin
							timingcontroller15 <= t_array_muxed1;
						end
					endcase
				end else begin
					ready <= 1'd0;
				end
			end
			3'd5: begin
				if ((basiclowerer_array_muxed0 == 1'd0)) begin
					ready <= 1'd1;
					t_array_muxed0 = 5'd18;
					case (((bank_group * 2'd2) + bank))
						1'd0: begin
							timingcontroller0 <= t_array_muxed0;
						end
						1'd1: begin
							timingcontroller1 <= t_array_muxed0;
						end
						2'd2: begin
							timingcontroller2 <= t_array_muxed0;
						end
						2'd3: begin
							timingcontroller3 <= t_array_muxed0;
						end
						3'd4: begin
							timingcontroller4 <= t_array_muxed0;
						end
						3'd5: begin
							timingcontroller5 <= t_array_muxed0;
						end
						3'd6: begin
							timingcontroller6 <= t_array_muxed0;
						end
						3'd7: begin
							timingcontroller7 <= t_array_muxed0;
						end
						4'd8: begin
							timingcontroller8 <= t_array_muxed0;
						end
						4'd9: begin
							timingcontroller9 <= t_array_muxed0;
						end
						4'd10: begin
							timingcontroller10 <= t_array_muxed0;
						end
						4'd11: begin
							timingcontroller11 <= t_array_muxed0;
						end
						4'd12: begin
							timingcontroller12 <= t_array_muxed0;
						end
						4'd13: begin
							timingcontroller13 <= t_array_muxed0;
						end
						4'd14: begin
							timingcontroller14 <= t_array_muxed0;
						end
						default: begin
							timingcontroller15 <= t_array_muxed0;
						end
					endcase
				end else begin
					ready <= 1'd0;
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
	if (sys_rst) begin
		ready <= 1'd0;
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
	end
end

endmodule
