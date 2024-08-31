import json
import os
from kratos import *
from pulp import *

def read_config(file_path):
    with open(file_path, 'r') as file:
        return json.load(file)

def optimize_parameters(config):
    prob = LpProblem("Memory Controller Optimization", LpMinimize)

    clock_freq = LpVariable("clock_freq", lowBound=config['min_clock_frequency'], upBound=config['max_clock_frequency'])
    cas_latency = LpVariable("cas_latency", lowBound=config['min_cas_latency'], upBound=config['max_cas_latency'], cat='Integer')

    prob += cas_latency / clock_freq

    prob += clock_freq >= config['min_clock_frequency']
    prob += clock_freq <= config['max_clock_frequency']
    prob += cas_latency >= config['min_cas_latency']

    prob.solve()

    return {
        'clock_frequency': value(clock_freq),
        'cas_latency': int(value(cas_latency))
    }

class MemoryController(Generator):
    def __init__(self, config):
        super().__init__("memory_controller")
        
        self.data_width = config['data_width']
        self.clock_frequency = config['clock_frequency']
        self.cas_latency = config['cas_latency']
        self.burst_length = config['burst_length']

        self.clk = self.clock("clk")
        self.rst = self.reset("rst")
        self.addr = self.input("addr", 32)
        self.data_in = self.input("data_in", self.data_width)
        self.data_out = self.output("data_out", self.data_width)
        self.mem_write = self.input("mem_write", 1)
        self.mem_read = self.input("mem_read", 1)
        self.ready = self.output("ready", 1)

        self.mem_array = self.var("mem_array", self.data_width, size=1024, packed=True)
        self.read_data = self.var("read_data", self.data_width)

        self.add_command_decoder()
        self.add_timing_controller()
        self.add_data_buffer()
        self.add_power_management()
        self.add_config_interface()

        self.add_always(self.memory_operations)

    def add_command_decoder(self):
        self.cmd_decoded = self.var("cmd_decoded", 4)
        self.address = self.var("address", 32)

        @always_ff((posedge, "clk"), (posedge, "rst"))
        def cmd_decode():
            if self.rst:
                self.cmd_decoded = 0
                self.address = 0
            else:
                self.address = self.addr
                if self.mem_read:
                    self.cmd_decoded = 2  # READ
                elif self.mem_write:
                    self.cmd_decoded = 3  # WRITE
                else:
                    self.cmd_decoded = 0  # NOP

        self.add_code(cmd_decode)

    def add_timing_controller(self):
        self.timer = self.var("timer", 32)
        self.state = self.var("state", 2)

        @always_ff((posedge, "clk"), (posedge, "rst"))
        def timing_control():
            if self.rst:
                self.timer = 0
                self.state = 0
                self.ready = 0
            else:
                if self.state == 0:  # IDLE
                    if self.cmd_decoded != 0:
                        self.state = 1
                        self.timer = 0
                        self.ready = 0
                elif self.state == 1:  # WAIT
                    if self.timer >= self.cas_latency:
                        self.state = 2
                        self.ready = 1
                    else:
                        self.timer = self.timer + 1
                elif self.state == 2:  # EXECUTE
                    self.state = 0

        self.add_code(timing_control)

    def add_data_buffer(self):
        self.buffer = self.var("buffer", self.data_width, size=self.burst_length, packed=True)
        self.buffer_index = self.var("buffer_index", clog2(self.burst_length))

        @always_ff((posedge, "clk"), (posedge, "rst"))
        def buffer_control():
            if self.rst:
                self.buffer_index = 0
            else:
                if self.mem_write and self.ready:
                    self.buffer[self.buffer_index] = self.data_in
                    self.buffer_index = (self.buffer_index + 1) % self.burst_length
                elif self.mem_read and self.ready:
                    self.data_out = self.buffer[self.buffer_index]
                    self.buffer_index = (self.buffer_index + 1) % self.burst_length

        self.add_code(buffer_control)

    def add_power_management(self):
        self.power_state = self.var("power_state", 2)

        @always_ff((posedge, "clk"), (posedge, "rst"))
        def power_control():
            if self.rst:
                self.power_state = 0  # ACTIVE
            else:
                if self.cmd_decoded == 0 and self.power_state == 0:
                    self.power_state = 1  # IDLE
                elif self.cmd_decoded != 0 and self.power_state != 0:
                    self.power_state = 0  # ACTIVE

        self.add_code(power_control)

    def add_config_interface(self):
        self.config_addr = self.input("config_addr", 8)
        self.config_data_in = self.input("config_data_in", 32)
        self.config_write = self.input("config_write", 1)
        self.config_data_out = self.output("config_data_out", 32)

        self.config_regs = self.var("config_regs", 32, size=256, packed=True)

        @always_ff((posedge, "clk"), (posedge, "rst"))
        def config_control():
            if self.rst:
                self.config_regs[0] = self.clock_frequency
                self.config_regs[1] = self.cas_latency
            else:
                if self.config_write:
                    self.config_regs[self.config_addr] = self.config_data_in
                self.config_data_out = self.config_regs[self.config_addr]

        self.add_code(config_control)

    @always_ff((posedge, "clk"), (posedge, "rst"))
    def memory_operations(self):
        if self.rst:
            self.read_data = 0
        elif self.mem_read and self.ready:
            self.read_data = self.mem_array[self.addr]
        elif self.mem_write and self.ready:
            self.mem_array[self.addr] = self.data_in

def generate_verilog(config):
    mem_ctrl = MemoryController(config)
    verilog_code = verilog(mem_ctrl)
    with open('rtl/DDR5_Memory_Controller.sv', 'w') as file:
        file.write(verilog_code)

def main():
    config_path = 'configs/default_config.json'
    config = read_config(config_path)
    
    optimized_params = optimize_parameters(config)
    config.update(optimized_params)

    generate_verilog(config)
    print("DDR5 Memory Controller generated successfully.")

if __name__ == "__main__":
    main()