module MC_PowerManagement(
    input wire clk,
    input wire reset,
    input wire activity_detected,
    input wire [3:0] cmd_type,
    output reg power_down,
    output reg low_power_mode
);

    localparam ACTIVE = 0, IDLE = 1, POWER_DOWN = 2;
    reg [1:0] current_state = IDLE;

    always @(posedge clk) begin
        if (reset) begin
            current_state <= IDLE;
            power_down <= 0;
            low_power_mode <= 0;
        end else begin
            case (current_state)
                ACTIVE: begin
                    if (!activity_detected) begin
                        current_state <= IDLE;
                    end
                    low_power_mode <= 0;
                end
                IDLE: begin
                    if (activity_detected) begin
                        current_state <= ACTIVE;
                    end else if (cmd_type == 4'b0100) begin
                        current_state <= POWER_DOWN;
                    end
                end
                POWER_DOWN: begin
                    power_down <= 1;
                    if (activity_detected) begin
                        current_state <= ACTIVE;
                        power_down <= 0;
                    end
                end
            endcase
        end
    end
endmodule