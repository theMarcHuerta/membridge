module DDR5_Memory_Controller #(
    parameter CLOCK_FREQ = 3200,
    parameter DATA_WIDTH = 64,
    parameter BURST_LENGTH = 8,
    parameter CAS_LATENCY = 14
)(
    input wire clk,
    input wire reset,
    input wire [31:0] system_bus,
    output wire memory_interface_ready
);

    // Internal signals
    wire [3:0] cmd_decoded;
    wire [31:0] address;
    wire power_down, low_power_mode;
    wire [63:0] data_in, data_out;
    wire write_request, read_request, buffer_full, buffer_empty;
    wire [31:0] config_data_out;
    wire config_valid;

    // Instantiate submodules
    MC_CommandDecoder cmd_decoder (
        .clk(clk),
        .reset(reset),
        .cmd_input(system_bus),
        .cmd_decoded(cmd_decoded),
        .address(address)
    );

    MC_TimingController #(
        .tCK(1000/CLOCK_FREQ),
        .CAS_LATENCY(CAS_LATENCY)
    ) timing_ctrl (
        .clk(clk),
        .reset(reset),
        .cmd_valid(cmd_decoded[0]),
        .cmd_type(cmd_decoded),
        .ready_to_execute(memory_interface_ready)
    );

    MC_DataBuffer #(
        .DATA_WIDTH(DATA_WIDTH)
    ) data_buffer (
        .clk(clk),
        .reset(reset),
        .enable(memory_interface_ready),
        .data_in(data_in),
        .write_request(write_request),
        .read_request(read_request),
        .data_out(data_out),
        .buffer_full(buffer_full),
        .buffer_empty(buffer_empty)
    );

    MC_PowerManagement power_mgmt (
        .clk(clk),
        .reset(reset),
        .activity_detected(cmd_decoded[0]),
        .cmd_type(cmd_decoded),
        .power_down(power_down),
        .low_power_mode(low_power_mode)
    );

    MC_ConfigInterface config_iface (
        .clk(clk),
        .reset(reset),
        .addr(address[7:0]),
        .data_in(data_out[31:0]),
        .write_enable(write_request),
        .data_out(config_data_out),
        .valid(config_valid)
    );

endmodule