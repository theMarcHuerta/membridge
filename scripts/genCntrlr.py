import json
import os
from migen import *
from migen.fhdl import verilog
from pulp import *
from migen.genlib.fifo import SyncFIFO
from migen.genlib.cdc import MultiReg

# Function to read configuration from a JSON file
def read_config(file_path):
    with open(file_path, 'r') as file:
        return json.load(file)  # Load and return the JSON configuration

# Function to optimize memory controller parameters using linear programming
def optimize_parameters(config):
    prob = LpProblem("Memory_Controller_Optimization", LpMinimize)  # Define an LP problem

    # Define LP variables with bounds from config
    clock_freq = LpVariable("clock_freq", lowBound=config['min_clock_frequency'], upBound=config['max_clock_frequency'])
    cas_latency = LpVariable("cas_latency", lowBound=config['min_cas_latency'], upBound=config['max_cas_latency'], cat='Integer')

    # Objective: Minimize CAS latency and maximize clock frequency
    # Using a weighted sum of normalized values for objective function
    prob += 1000 * cas_latency * config['max_clock_frequency'] - clock_freq * config['max_cas_latency']

    # Constraints based on config bounds
    prob += clock_freq >= config['min_clock_frequency']
    prob += clock_freq <= config['max_clock_frequency']
    prob += cas_latency >= config['min_cas_latency']
    prob += cas_latency <= config['max_cas_latency']

    # Solve the optimization problem
    prob.solve()

    # Return optimized values as a dictionary
    return {
        'clock_frequency': int(value(clock_freq)),
        'cas_latency': int(value(cas_latency))
    }

# MemoryController class that defines the behavior and structure of the memory controller
class MemoryController(Module):
    def __init__(self, config):
        # Initialize memory controller parameters from config
        self.clock_frequency = config['clock_frequency']
        self.cas_latency = config['cas_latency']
        self.data_width = config['data_width']
        self.burst_length = config['burst_length']

        # Define input signals
        self.clk = Signal()  # Clock signal
        self.rst = Signal()  # Reset signal
        self.addr = Signal(32)  # 32-bit address bus
        self.data_in = Signal(self.data_width)  # Data input bus
        self.mem_write = Signal()  # Write enable signal
        self.mem_read = Signal()  # Read enable signal

        # Define output signals
        self.data_out = Signal(self.data_width)  # Data output bus
        self.ready = Signal()  # Ready signal indicating data availability

        # Internal signals for various control and state management
        self.cmd_decoded = Signal(4)  # Decoded command signal
        self.address = Signal(32)  # Internal address signal
        self.timer = Signal(32)  # Timer for timing control
        self.state = Signal(2)  # State signal for state machine
        self.buffer = Array([Signal(self.data_width) for _ in range(self.burst_length)])  # Data buffer array
        self.buffer_index = Signal(max=self.burst_length)  # Index to manage buffer operations
        self.power_state = Signal(2)  # Power state signal

        # Memory array simulating DRAM
        self.mem_array = Array([Signal(self.data_width) for _ in range(1024)])  # Array for memory storage

        # ECC (Error Correcting Code) signals
        self.ecc_in = Signal(8)  # ECC input signal
        self.ecc_out = Signal(8)  # ECC output signal

        # Refresh signal for DRAM refresh operations
        self.refresh = Signal()  # Refresh signal

        # FIFO buffers for data handling
        self.submodules.data_in_fifo = SyncFIFO(width=self.data_width, depth=16)  # FIFO for data input
        self.submodules.data_out_fifo = SyncFIFO(width=self.data_width, depth=16)  # FIFO for data output

        # Data width conversion logic
        self.data_width_conversion = Signal(self.data_width)  # Signal for data width conversion

        # Byte enable logic for partial writes
        self.byte_enable = Signal(self.data_width // 8)  # Byte enable signal

        # Timing parameters for DRAM operations
        self.tRCD = config['tRCD']  # Row to Column Delay
        self.tRP = config['tRP']  # Row Precharge Time
        self.tRAS = config['tRAS']  # Row Active Time

        # Clock domain crossing signals
        self.data_in_sync = Signal(self.data_width)  # Synchronized data input
        self.data_out_sync = Signal(self.data_width)  # Synchronized data output

        # Initialization flag
        self.init_done = Signal()  # Signal indicating initialization is complete

        # Mode register setup signal
        self.mode_register = Signal(16)  # Mode register signal

        # Calibration complete signal
        self.calibration_done = Signal()  # Signal indicating calibration is complete

        # Low-power mode signal
        self.low_power_mode = Signal()  # Signal for low-power mode

        # Dynamic power control signal
        self.power_control = Signal()  # Power control signal

        # Command scheduler queue
        self.command_queue = Array(Signal(4) for _ in range(16))  # Command queue array
        self.command_queue_index = Signal(max=16)  # Command queue index

        # Lookahead buffers for pre-fetching commands
        self.lookahead_buffer = Array(Signal(4) for _ in range(16))  # Lookahead buffer array
        self.lookahead_buffer_index = Signal(max=16)  # Lookahead buffer index

        # JTAG interface signals for testing
        self.jtag_tdi = Signal()  # JTAG data in
        self.jtag_tdo = Signal()  # JTAG data out
        self.jtag_tck = Signal()  # JTAG clock
        self.jtag_tms = Signal()  # JTAG mode select

        # BIST (Built-In Self-Test) signals
        self.bist_start = Signal()  # BIST start signal
        self.bist_done = Signal()  # BIST done signal
        self.bist_pass = Signal()  # BIST pass signal

        # Status register for reporting status
        self.status_register = Signal(32)  # 32-bit status register

        # Throughput and utilization measurement signals
        self.throughput = Signal(32)  # Signal for throughput measurement
        self.utilization = Signal(32)  # Signal for utilization measurement

        # Adding submodules to the memory controller
        self.submodules += [
            self.command_decoder(),
            self.timing_controller(),
            self.data_buffer(),
            self.power_management(),
            self.memory_operations(),
            self.address_mapping(),
            self.access_arbitration(),
            self.ecc_logic(),
            self.refresh_logic(),
            self.data_width_conversion_logic(),
            self.byte_enable_logic(),
            self.clock_domain_crossing(),
            self.power_up_initialization(),
            self.mode_register_setup(),
            self.calibration(),
            self.low_power_modes(),
            self.dynamic_power_control(),
            self.command_scheduler(),
            self.lookahead_buffers(),
            self.jtag_interface(),
            self.built_in_self_test(),
            self.status_registers(),
            self.dram_standards_compliance(),
            self.protocol_adaptation_logic(),
            self.modular_design(),
            self.parameterization(),
            self.access_control_logic(),
            self.data_scrambling_logic(),
            self.assertions(),
            self.latency_measurement(),
            self.throughput_measurement(),
            self.utilization_measurement()
        ]

        # Address mapping signals
        self.row_addr = Signal(16)  # Row address signal
        self.col_addr = Signal(10)  # Column address signal
        self.bank_addr = Signal(3)  # Bank address signal

        # Request and grant signals for multiple requestors
        self.req = Signal(4)  # Request signal for 4 requestors
        self.grant = Signal(4)  # Grant signal for 4 requestors

    # Method to decode memory commands
    def command_decoder(self):
        m = Module()
        m.sync += [
            If(self.rst,  # Reset condition
                self.cmd_decoded.eq(0),  # Reset command decoded signal
                self.address.eq(0)  # Reset address signal
            ).Else(
                self.address.eq(self.addr),  # Set internal address
                If(self.mem_read,  # If read command
                    self.cmd_decoded.eq(2)  # Decode as read command
                ).Elif(self.mem_write,  # If write command
                    self.cmd_decoded.eq(3)  # Decode as write command
                ).Else(
                    self.cmd_decoded.eq(0)  # Default to no command
                )
            )
        ]
        return m

    # Method for managing timing of memory operations
    def timing_controller(self):
        m = Module()
        m.sync += [
            If(self.rst,  # Reset condition
                self.timer.eq(0),  # Reset timer
                self.state.eq(0),  # Reset state
                self.ready.eq(0)  # Reset ready signal
            ).Else(
                Case(self.state, {  # State machine for timing control
                    0: If(self.cmd_decoded != 0,  # If command is decoded
                          self.state.eq(1),  # Move to next state
                          self.timer.eq(0),  # Reset timer
                          self.ready.eq(0)),  # Clear ready signal
                    1: If(self.timer >= self.cas_latency,  # If CAS latency is met
                          self.state.eq(2),  # Move to next state
                          self.ready.eq(1)  # Set ready signal
                       ).Else(
                          self.timer.eq(self.timer + 1)  # Increment timer
                       ),
                    2: If(self.timer >= self.tRCD,  # If tRCD is met
                          self.state.eq(3)  # Move to next state
                       ).Else(
                          self.timer.eq(self.timer + 1)  # Increment timer
                       ),
                    3: If(self.timer >= self.tRP,  # If tRP is met
                          self.state.eq(4)  # Move to next state
                       ).Else(
                          self.timer.eq(self.timer + 1)  # Increment timer
                       ),
                    4: If(self.timer >= self.tRAS,  # If tRAS is met
                          self.state.eq(0)  # Reset to initial state
                       ).Else(
                          self.timer.eq(self.timer + 1)  # Increment timer
                       )
                })
            )
        ]
        return m

    # Method to manage data buffering
    def data_buffer(self):
        m = Module()
        m.sync += [
            If(self.rst,  # Reset condition
                self.buffer_index.eq(0)  # Reset buffer index
            ).Elif(self.ready,  # If ready signal is high
                If(self.mem_write,  # If write operation
                    self.data_in_fifo.din.eq(self.data_in),  # Load data into input FIFO
                    self.data_in_fifo.we.eq(1),  # Write enable for input FIFO
                    If(self.buffer_index == self.burst_length - 1,  # If buffer is full
                        self.buffer_index.eq(0)  # Reset buffer index
                    ).Else(
                        self.buffer_index.eq(self.buffer_index + 1)  # Increment buffer index
                    )
                ).Elif(self.mem_read,  # If read operation
                    self.data_out.eq(self.data_out_fifo.dout),  # Output data from FIFO
                    self.data_out_fifo.re.eq(1),  # Read enable for output FIFO
                    If(self.buffer_index == self.burst_length - 1,  # If buffer is full
                        self.buffer_index.eq(0)  # Reset buffer index
                    ).Else(
                        self.buffer_index.eq(self.buffer_index + 1)  # Increment buffer index
                    )
                )
            )
        ]
        return m

    # Method for power management
    def power_management(self):
        m = Module()
        m.sync += [
            If(self.rst,  # Reset condition
                self.power_state.eq(0)  # Reset power state
            ).Else(
                Case(self.power_state, {  # State machine for power management
                     0: If(self.cmd_decoded == 0,  # If no command
                          self.power_state.eq(1)),  # Move to low power state
                    1: If(self.cmd_decoded != 0,  # If command detected
                          self.power_state.eq(0))  # Exit low power state
                })
            )
        ]
        return m

    # Method for handling memory read/write operations
    def memory_operations(self):
        m = Module()
        m.sync += [
            If(self.rst,  # Reset condition
                self.buffer_index.eq(0),  # Reset buffer index
                self.data_in_fifo.din.eq(0),  # Clear data in FIFO
                self.data_in_fifo.we.eq(0),  # Disable write enable
                self.data_out_fifo.re.eq(0)  # Disable read enable
            ).Elif(self.ready,  # If ready signal is high
                If(self.mem_read,  # If read operation
                    self.buffer[self.buffer_index].eq(self.mem_array[self.address]),  # Load data from memory to buffer
                    self.data_out_fifo.din.eq(self.mem_array[self.address]),  # Load data into output FIFO
                    self.data_out_fifo.we.eq(1)  # Write enable for output FIFO
                ).Elif(self.mem_write,  # If write operation
                    self.mem_array[self.address].eq(self.buffer[self.buffer_index]),  # Write buffer data to memory
                    self.data_in_fifo.din.eq(self.data_in),  # Load input data into FIFO
                    self.data_in_fifo.we.eq(1)  # Write enable for input FIFO
                )
            )
        ]
        return m

    # Method for address mapping
    def address_mapping(self):
        m = Module()
        m.comb += [
            self.row_addr.eq(self.addr[16:32]),  # Map higher address bits to row address
            self.col_addr.eq(self.addr[2:12]),  # Map lower address bits to column address
            self.bank_addr.eq(self.addr[12:15])  # Map middle address bits to bank address
        ]
        return m

    # Method for access arbitration between multiple requestors
    def access_arbitration(self):
        m = Module()
        arbiter = RoundRobin(4)  # Instantiate a round-robin arbiter for 4 requestors
        m.submodules.arbiter = arbiter  # Add arbiter as submodule
        m.comb += [
            arbiter.request.eq(self.req),  # Connect request signals to arbiter
            self.grant.eq(arbiter.grant)  # Connect arbiter grant signals to grant output
        ]
        return m

    # Method for ECC (Error Correcting Code) logic
    def ecc_logic(self):
        m = Module()
        # Simple ECC logic example
        m.comb += [
            self.ecc_out.eq(self.data_in ^ self.ecc_in)  # Simple XOR for ECC example (replace with real ECC logic)
        ]
        return m

    # Method for DRAM refresh logic
    def refresh_logic(self):
        m = Module()
        refresh_counter = Signal(32)  # Counter for refresh timing
        m.sync += [
            If(self.rst,  # Reset condition
                refresh_counter.eq(0)  # Reset refresh counter
            ).Else(
                If(refresh_counter == 100000,  # Example refresh threshold
                    self.refresh.eq(1),  # Set refresh signal
                    refresh_counter.eq(0)  # Reset counter
                ).Else(
                    self.refresh.eq(0),  # Clear refresh signal
                    refresh_counter.eq(refresh_counter + 1)  # Increment counter
                )
            )
        ]
        return m

    # Method for data width conversion
    def data_width_conversion_logic(self):
        m = Module()
        m.comb += [
            If(self.data_width == 64,  # If data width is 64-bit
                self.data_width_conversion.eq(Cat(self.data_in[0:32], self.data_in[32:64]))  # Concatenate two 32-bit sections
            ).Else(
                self.data_width_conversion.eq(self.data_in)  # No conversion
            )
        ]
        return m

    # Method for byte enable logic in partial writes
    def byte_enable_logic(self):
        m = Module()
        m.comb += [
            If(self.mem_write,  # If write operation
                self.byte_enable.eq(0b1111)  # Enable all bytes (example)
            ).Else(
                self.byte_enable.eq(0b0000)  # Disable all bytes
            )
        ]
        return m

    # Method for handling clock domain crossing
    def clock_domain_crossing(self):
        m = Module()
        m.submodules += MultiReg(self.data_in, self.data_in_sync, "sys")  # Synchronize data input to system clock
        m.submodules += MultiReg(self.data_out, self.data_out_sync, "sys")  # Synchronize data output to system clock
        return m

    # Method for power-up initialization
    def power_up_initialization(self):
        m = Module()
        init_counter = Signal(32)  # Counter for initialization timing
        m.sync += [
            If(self.rst,  # Reset condition
                init_counter.eq(0),  # Reset initialization counter
                self.init_done.eq(0)  # Clear initialization done signal
            ).Else(
                If(init_counter < 100000,  # Example initialization duration
                    init_counter.eq(init_counter + 1)  # Increment counter
                ).Else(
                    self.init_done.eq(1)  # Set initialization done signal
                )
            )
        ]
        return m

    # Method for mode register setup
    def mode_register_setup(self):
        m = Module()
        m.sync += [
            If(self.init_done,  # If initialization is complete
                self.mode_register.eq(0x1234)  # Set mode register (example value)
            )
        ]
        return m

    # Method for calibration
    def calibration(self):
        m = Module()
        calibration_counter = Signal(32)  # Counter for calibration timing
        m.sync += [
            If(self.rst,  # Reset condition
                calibration_counter.eq(0),  # Reset calibration counter
                self.calibration_done.eq(0)  # Clear calibration done signal
            ).Else(
                If(calibration_counter < 50000,  # Example calibration duration
                    calibration_counter.eq(calibration_counter + 1)  # Increment counter
                ).Else(
                    self.calibration_done.eq(1)  # Set calibration done signal
                )
            )
        ]
        return m

    # Method for managing low-power modes
    def low_power_modes(self):
        m = Module()
        m.sync += [
            If(self.rst,  # Reset condition
                self.low_power_mode.eq(0)  # Clear low-power mode signal
            ).Else(
                If(self.cmd_decoded == 0,  # If no command
                    self.low_power_mode.eq(1)  # Enter low-power mode
                ).Else(
                    self.low_power_mode.eq(0)  # Exit low-power mode
                )
            )
        ]
        return m

    # Method for dynamic power control
    def dynamic_power_control(self):
        m = Module()
        m.sync += [
            If(self.rst,  # Reset condition
                self.power_control.eq(0)  # Clear power control signal
            ).Else(
                If(self.mem_read | self.mem_write,  # If memory read or write
                    self.power_control.eq(1)  # Enable power control
                ).Else(
                    self.power_control.eq(0)  # Disable power control
                )
            )
        ]
        return m

    # Method for command scheduling
    def command_scheduler(self):
        m = Module()
        m.sync += [
            If(self.rst,  # Reset condition
                self.command_queue_index.eq(0)  # Reset command queue index
            ).Else(
                If(self.mem_read | self.mem_write,  # If read or write command
                    self.command_queue[self.command_queue_index].eq(self.cmd_decoded),  # Add command to queue
                    If(self.command_queue_index == 15,  # If queue is full
                        self.command_queue_index.eq(0)  # Reset queue index
                    ).Else(
                        self.command_queue_index.eq(self.command_queue_index + 1)  # Increment queue index
                    )
                )
            )
        ]
        return m

    # Method for managing lookahead buffers
    def lookahead_buffers(self):
        m = Module()
        m.sync += [
            If(self.rst,  # Reset condition
                self.lookahead_buffer_index.eq(0)  # Reset lookahead buffer index
            ).Else(
                If(self.mem_read | self.mem_write,  # If read or write command
                    self.lookahead_buffer[self.lookahead_buffer_index].eq(self.cmd_decoded),  # Add command to lookahead buffer
                    If(self.lookahead_buffer_index == 15,  # If buffer is full
                        self.lookahead_buffer_index.eq(0)  # Reset buffer index
                    ).Else(
                        self.lookahead_buffer_index.eq(self.lookahead_buffer_index + 1)  # Increment buffer index
                    )
                )
            )
        ]
        return m

    # Method for JTAG interface
    def jtag_interface(self):
        m = Module()
        # Simple JTAG logic example
        m.sync += [
            If(self.jtag_tck,  # On JTAG clock edge
                self.jtag_tdo.eq(self.jtag_tdi)  # Pass data through JTAG chain
            )
        ]
        return m

    # Method for Built-In Self-Test (BIST)
    def built_in_self_test(self):
        m = Module()
        bist_counter = Signal(32)  # Counter for BIST timing
        m.sync += [
            If(self.bist_start,  # If BIST start signal is high
                bist_counter.eq(0),  # Reset BIST counter
                self.bist_done.eq(0),  # Clear BIST done signal
                self.bist_pass.eq(0)  # Clear BIST pass signal
            ).Else(
                If(bist_counter < 100000,  # Example BIST duration
                    bist_counter.eq(bist_counter + 1)  # Increment BIST counter
                ).Else(
                    self.bist_done.eq(1),  # Set BIST done signal
                    self.bist_pass.eq(1)  # Set BIST pass signal (example always pass)
                )
            )
        ]
        return m

    # Method for managing status registers
    def status_registers(self):
        m = Module()
        m.sync += [
            If(self.rst,  # Reset condition
                self.status_register.eq(0)  # Clear status register
            ).Else(
                self.status_register.eq(Cat(self.ready, self.low_power_mode, self.calibration_done))  # Update status register
            )
        ]
        return m

    # Method for ensuring DRAM standards compliance
    def dram_standards_compliance(self):
        m = Module()
        m.sync += [
            If(self.rst,  # Reset condition
                self.dram_compliance.eq(0)  # Clear compliance signal
            ).Else(
                self.dram_compliance.eq(1)  # Set compliance signal (example always compliant)
            )
        ]
        return m

    # Method for protocol adaptation logic
    def protocol_adaptation_logic(self):
        m = Module()
        m.sync += [
            If(self.rst,  # Reset condition
                self.protocol_adaptation.eq(0)  # Clear protocol adaptation signal
            ).Else(
                self.protocol_adaptation.eq(1)  # Set protocol adaptation signal (example always adapted)
            )
        ]
        return m

    # Method for modular design logic
    def modular_design(self):
        m = Module()
        m.sync += [
            If(self.rst,  # Reset condition
                self.module_select.eq(0)  # Clear module select signal
            ).Else(
                self.module_select.eq(1)  # Set module select signal (example always select module 1)
            )
        ]
        return m

    # Method for parameterization of the memory controller
    def parameterization(self):
        m = Module()
        m.sync += [
            If(self.rst,  # Reset condition
                self.param_data_width.eq(config.get('data_width', 64)),  # Set default data width to 64-bit
                self.param_burst_length.eq(config.get('burst_length', 8))  # Set default burst length to 8
            ).Else(
                self.param_data_width.eq(config['data_width']),  # Update data width from config
                self.param_burst_length.eq(config['burst_length'])  # Update burst length from config
            )
        ]
        return m

    # Method for access control logic
    def access_control_logic(self):
        m = Module()
        m.sync += [
            If(self.rst,  # Reset condition
                self.access_control.eq(0)  # Clear access control signal
            ).Else(
                If(self.addr < 0x1000,  # Example: restrict access to lower addresses
                    self.access_control.eq(1)  # Set access control signal
                ).Else(
                    self.access_control.eq(0)  # Clear access control signal
                )
            )
        ]
        return m

    # Method for data scrambling logic
    def data_scrambling_logic(self):
        m = Module()
        m.sync += [
            If(self.rst,  # Reset condition
                self.data_scrambling.eq(0)  # Clear data scrambling signal
            ).Else(
                self.data_scrambling.eq(self.data_in ^ 0xAA)  # Example: simple XOR scrambling
            )
        ]
        return m

    # Method for adding assertions for debugging
    def assertions(self):
        m = Module()
        m.sync += [
            If(self.mem_read & self.mem_write,  # If both read and write are high (illegal state)
                self.assertion_failed.eq(1)  # Set assertion failed signal
            ).Else(
                self.assertion_failed.eq(0)  # Clear assertion failed signal
            ),
            If(self.addr >= 1024,  # Example: address out of range
                self.assertion_failed.eq(1)  # Set assertion failed signal
            ).Else(
                self.assertion_failed.eq(0)  # Clear assertion failed signal
            )
        ]
        return m

    # Method for latency measurement
    def latency_measurement(self):
        m = Module()
        latency_counter = Signal(32)  # Counter for latency measurement
        m.sync += [
            If(self.mem_read | self.mem_write,  # If read or write operation
                latency_counter.eq(latency_counter + 1)  # Increment latency counter
            ).Else(
                self.latency.eq(latency_counter),  # Set latency signal
                latency_counter.eq(0)  # Reset latency counter
            )
        ]
        return m

    # Method for throughput measurement
    def throughput_measurement(self):
        m = Module()
        throughput_counter = Signal(32)  # Counter for throughput measurement
        m.sync += [
            If(self.mem_read | self.mem_write,  # If read or write operation
                throughput_counter.eq(throughput_counter + 1)  # Increment throughput counter
            ).Else(
                self.throughput.eq(throughput_counter),  # Set throughput signal
                throughput_counter.eq(0)  # Reset throughput counter
            )
        ]
        return m

    # Method for utilization measurement
    def utilization_measurement(self):
        m = Module()
        utilization_counter = Signal(32)  # Counter for utilization measurement
        m.sync += [
            If(self.mem_read | self.mem_write,  # If read or write operation
                utilization_counter.eq(utilization_counter + 1)  # Increment utilization counter
            ).Else(
                self.utilization.eq(utilization_counter),  # Set utilization signal
                utilization_counter.eq(0)  # Reset utilization counter
            )
        ]
        return m

# Function to generate Verilog code from the MemoryController module
def generate_verilog(config):
    # Create the rtl directory if it doesn't exist
    os.makedirs('rtl', exist_ok=True)

    mem_ctrl = MemoryController(config)  # Instantiate the MemoryController
    verilog_output = verilog.convert(mem_ctrl, ios={mem_ctrl.clk, mem_ctrl.rst, mem_ctrl.addr, 
                                                    mem_ctrl.data_in, mem_ctrl.data_out, 
                                                    mem_ctrl.mem_write, mem_ctrl.mem_read, 
                                                    mem_ctrl.ready})  # Convert to Verilog

    # Write the main Verilog file
    with open('rtl/DDR5_Memory_Controller.v', 'w') as file:
        file.write(verilog_output.main_source)

    # If there are any additional sources, they will be in verilog_output.ns
    for name in dir(verilog_output.ns):
        if not name.startswith('__'):  # Ignore special methods/attributes
            content = getattr(verilog_output.ns, name)
            if isinstance(content, str):
                with open(f'rtl/{name}.v', 'w') as additional_file:  # Write additional sources
                    additional_file.write(content)

    print("Verilog files generated successfully.")

# Main function to execute the memory controller design flow
def main():
    try:
        config_path = 'configs/default_config.json'  # Path to default configuration file
        config = read_config(config_path)  # Read configuration

        optimized_params = optimize_parameters(config)  # Optimize parameters
        config.update(optimized_params)  # Update config with optimized parameters

        print("Optimized parameters:")
        print(f"Clock Frequency: {config['clock_frequency']} MHz")  # Output optimized clock frequency
        print(f"CAS Latency: {config['cas_latency']}")  # Output optimized CAS latency

        generate_verilog(config)  # Generate Verilog code
        print("DDR5 Memory Controller generated successfully.")
    except Exception as e:
        print(f"An error occurred: {str(e)}")  # Print error message
        import traceback
        traceback.print_exc()  # Print stack trace

# Entry point of the script
if __name__ == "__main__":
    main()