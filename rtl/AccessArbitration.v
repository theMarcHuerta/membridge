/* Machine-generated using Migen */
module AccessArbitration(
	input [3:0] requests,
	output [3:0] grant,
	input sys_clk,
	input sys_rst
);

wire [3:0] request;
reg [1:0] grant1 = 2'd0;

// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on

assign request = requests;
assign grant = grant1;

always @(posedge sys_clk) begin
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
	if (sys_rst) begin
		grant1 <= 2'd0;
	end
end

endmodule
