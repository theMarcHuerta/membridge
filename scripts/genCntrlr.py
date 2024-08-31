import json
import os

def read_config(file_path):
    """Reads the JSON configuration file and returns a dictionary of settings."""
    with open(file_path, 'r') as file:
        config = json.load(file)
    return config

def generate_verilog(config):
    """Generates a SystemVerilog file based on the configuration."""
    verilog_template = f"""
module DDR5_Memory_Controller #(
    parameter CLOCK_FREQ = {config['clock_frequency']},
    parameter DATA_WIDTH = {config['data_width']},
    parameter BURST_LENGTH = {config['burst_length']},
    parameter CAS_LATENCY = {config['cas_latency']}
)(
    input wire clk,
    input wire reset,
    input wire [31:0] system_bus,
    output wire memory_interface_ready
);
    // DDR5 controller implementation
    // (The rest of the module remains unchanged)
endmodule
"""
    with open('rtl/DDR5_Memory_Controller.sv', 'w') as verilog_file:
        verilog_file.write(verilog_template)

def main():
    config_path = 'configs/default_config.json'
    config = read_config(config_path)
    generate_verilog(config)
    print("DDR5 Memory Controller generated successfully.")

if __name__ == "__main__":
    main()