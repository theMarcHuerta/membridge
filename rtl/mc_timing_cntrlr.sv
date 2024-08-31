module MC_TimingController #(
    parameter tCK = 0.625, // Default: 1600MHz (DDR5-3200)
    parameter CAS_LATENCY = 14
)(
    input wire clk,
    input wire reset,
    input wire cmd_valid,
    input wire [3:0] cmd_type,
    output reg ready_to_execute
);

    localparam IDLE = 0, WAIT_FOR_RCD = 1, WAIT_FOR_CAS = 2, EXECUTE = 3;
    
    reg [1:0] state = IDLE;
    integer counter = 0;

    always @(posedge clk) begin
        if (reset) begin
            state <= IDLE;
            ready_to_execute <= 0;
            counter <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (cmd_valid) begin
                        case (cmd_type)
                            4'b0001: state <= WAIT_FOR_RCD;
                            4'b0010, 4'b0011: state <= WAIT_FOR_CAS;
                            default: state <= IDLE;
                        endcase
                    end
                end
                WAIT_FOR_RCD: begin
                    if (counter >= 13) begin // tRCD = 13.75ns for DDR5-3200
                        state <= EXECUTE;
                        counter <= 0;
                    end else begin
                        counter <= counter + 1;
                    end
                end
                WAIT_FOR_CAS: begin
                    if (counter >= CAS_LATENCY) begin
                        state <= EXECUTE;
                        counter <= 0;
                    end else begin
                        counter <= counter + 1;
                    end
                end
                EXECUTE: begin
                    ready_to_execute <= 1;
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule