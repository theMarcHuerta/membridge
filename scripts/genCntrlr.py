import json
import os
from migen import *
from scripts.commandDecoder import CommandDecoder
from scripts.timingCntrlr import TimingController
from scripts.dataBuffer import DataBuffer
from scripts.powerManage import PowerManagement
from scripts.memoryOperations import MemoryOperations
from scripts.addressMapping import AddressMapper
from scripts.accessArbitration import AccessArbitration
from scripts.clockDomainCrossing import ClockDomainCrossing
from migen.fhdl import verilog
from pulp import *
from migen.genlib.fifo import SyncFIFO
from migen.genlib.cdc import MultiReg
from migen.sim import run_simulation
from scripts.refreshManager import RefreshManager
from scripts.bankStateTracker import BankStateTracker
from scripts.commandScheduler import CommandScheduler
from scripts.rowBufferManager import RowBufferManager
from scripts.qosManager import QoSManager
from scripts.eccEncoder import ECCEncoder
from scripts.eccDecoder import ECCDecoder
from abc import ABC, abstractmethod  # Add this import

# Function to read configuration from a JSON file
def read_config(file_path):
    try:
        with open(file_path, 'r') as file:
            config = json.load(file)
    except FileNotFoundError:
        raise FileNotFoundError(f"Configuration file not found: {file_path}")
    except json.JSONDecodeError:
        raise json.JSONDecodeError(f"Invalid JSON in configuration file: {file_path}")
    
    # Add more configuration options with default values
    config.setdefault('address_mapping_scheme', 'linear')
    config.setdefault('refresh_rate', 64)  # in ms
    config.setdefault('bank_groups', 4)
    config.setdefault('banks_per_group', 4)
    config.setdefault('rows', 65536)
    config.setdefault('columns', 1024)
    config.setdefault('page_size', 2048)
    config.setdefault('tRCD', 18)
    config.setdefault('tRP', 18)
    config.setdefault('tRAS', 32)
    config.setdefault('tRC', 50)
    config.setdefault('tWR', 20)
    config.setdefault('tRFC', 350)
    config.setdefault('row_buffer_policy', 'open_page')
    config.setdefault('command_queue_depth', 32)
    config.setdefault('write_recovery_time', 12)
    config.setdefault('read_to_precharge_time', 8)
    config.setdefault('scheduling_policy', 'FR-FCFS')
    config.setdefault('power_down_modes', ['self-refresh', 'power-down'])
    config.setdefault('num_requestors', 4)
    config.setdefault('qos_policy', 'FCFS')
    config.setdefault('ecc_enabled', False)
    config.setdefault('thermal_shutdown_temp', 85)
    config.setdefault('deep_power_down_threshold', 70)
    config.setdefault('run_simulation', False)
    config.setdefault('run_formal_verification', False)
    
    return config

# Function to optimize memory controller parameters using linear programming
def optimize_parameters(config):
    prob = LpProblem("Memory_Controller_Optimization", LpMinimize)

    clock_freq = LpVariable("clock_freq", lowBound=config['min_clock_frequency'], upBound=config['max_clock_frequency'])
    cas_latency = LpVariable("cas_latency", lowBound=config['min_cas_latency'], upBound=config['max_cas_latency'], cat='Integer')

    prob += 1000 * cas_latency * config['max_clock_frequency'] - clock_freq * config['max_cas_latency']

    prob += clock_freq >= config['min_clock_frequency']
    prob += clock_freq <= config['max_clock_frequency']
    prob += cas_latency >= config['min_cas_latency']
    prob += cas_latency <= config['max_cas_latency']

    prob.solve()

    return {
        'clock_frequency': int(value(clock_freq)),
        'cas_latency': int(value(cas_latency))
    }

class MemoryType(ABC):
    @abstractmethod
    def get_timing_parameters(self):
        pass

    @abstractmethod
    def get_command_encoding(self):
        pass

class DDR5(MemoryType):
    def __init__(self, clock_frequency, cas_latency):
        self.clock_frequency = clock_frequency
        self.cas_latency = cas_latency

    def get_timing_parameters(self):
        return {
            'tRCD': 18,
            'tRP': 18,
            'tRAS': 32,
            'tRC': 50,
            'tWR': 20,
        }

    def get_command_encoding(self):
        return {
            'READ': 0b0101,
            'WRITE': 0b0100,
            'ACTIVATE': 0b0011,
            'PRECHARGE': 0b0010,
            'REFRESH': 0b0001,
        }

class MemoryController(Module):
    def __init__(self, config):
        required_params = ['clock_frequency', 'cas_latency', 'data_width', 'burst_length', 'memory_type']
        for param in required_params:
            if param not in config:
                raise ValueError(f"Missing required parameter: {param}")

        self.clock_frequency = config['clock_frequency']
        self.cas_latency = config['cas_latency']
        self.data_width = config['data_width']
        self.burst_length = config['burst_length']
        self.memory_type = config['memory_type']

        if self.clock_frequency <= 0:
            raise ValueError("Clock frequency must be positive")
        if self.cas_latency <= 0:
            raise ValueError("CAS latency must be positive")
        if self.data_width not in [8, 16, 32, 64]:
            raise ValueError("Data width must be 8, 16, 32, or 64 bits")
        if self.burst_length not in [4, 8, 16]:
            raise ValueError("Burst length must be 4, 8, or 16")
        if self.memory_type not in ['DDR5']:
            raise ValueError(f"Unsupported memory type: {self.memory_type}")

        try:
            if self.memory_type == 'DDR5':
                self.memory_type_obj = DDR5(self.clock_frequency, self.cas_latency)
            else:
                raise ValueError(f"Unsupported memory type: {self.memory_type}")
        except Exception as e:
            raise RuntimeError(f"Error creating memory type object: {str(e)}")

        try:
            timing_params = self.memory_type_obj.get_timing_parameters()
            command_encoding = self.memory_type_obj.get_command_encoding()
            self.submodules.timing_controller = TimingController(config)
            self.submodules.command_decoder = CommandDecoder(command_encoding)
        except Exception as e:
            raise RuntimeError(f"Error initializing controller components: {str(e)}")

        self.submodules.data_buffer = DataBuffer(config['data_width'], config['burst_length'])
        self.submodules.power_management = PowerManagement(config['power_down_modes'])
        self.submodules.refresh_manager = RefreshManager(config['refresh_rate'], config['tRFC'])
        self.submodules.bank_state_tracker = BankStateTracker(config['bank_groups'], config['banks_per_group'])
        self.submodules.command_scheduler = CommandScheduler(config['command_queue_depth'], config['scheduling_policy'])
        self.submodules.row_buffer_manager = RowBufferManager(config['row_buffer_policy'])
        self.submodules.qos_manager = QoSManager(config['num_requestors'], config['qos_policy'])

        # Define input signals
        self.clk = Signal()
        self.rst = Signal()
        self.addr = Signal(32)
        self.data_in = Signal(self.data_width)
        self.mem_write = Signal()
        self.mem_read = Signal()
        self.refresh = Signal()
        self.chip_select = Signal()
        self.ras = Signal()
        self.cas = Signal()
        self.we = Signal()

        # Define output signals
        self.data_out = Signal(self.data_width)
        self.ready = Signal()

        # Internal signals
        self.cmd_decoded = Signal(4)
        self.address = Signal(32)
        self.timer = Signal(32)
        self.state = Signal(2)
        self.buffer = Array([Signal(self.data_width) for _ in range(self.burst_length)])
        self.buffer_index = Signal(max=self.burst_length)
        self.power_state = Signal(2)

        # Memory array simulating DRAM
        self.mem_array = Array([Signal(self.data_width) for _ in range(1024)])

        # ECC signals
        self.ecc_in = Signal(8)
        self.ecc_out = Signal(8)

        # FIFO buffers for data handling
        self.submodules.data_in_fifo = SyncFIFO(width=self.data_width, depth=16)
        self.submodules.data_out_fifo = SyncFIFO(width=self.data_width, depth=16)

        # Data width conversion logic
        self.data_width_conversion = Signal(self.data_width)

        # Byte enable logic for partial writes
        self.byte_enable = Signal(self.data_width // 8)

        # Clock domain crossing signals
        self.data_in_sync = Signal(self.data_width)
        self.data_out_sync = Signal(self.data_width)

        # Initialization flag
        self.init_done = Signal()

        # Mode register setup signal
        self.mode_register = Signal(16)

        # Calibration complete signal
        self.calibration_done = Signal()

        # Low-power mode signal
        self.low_power_mode = Signal()

        # Dynamic power control signal
        self.power_control = Signal()

        # Command scheduler queue
        self.command_queue = Array(Signal(4) for _ in range(16))
        self.command_queue_index = Signal(max=16)

        # Lookahead buffers for pre-fetching commands
        self.lookahead_buffer = Array(Signal(4) for _ in range(16))
        self.lookahead_buffer_index = Signal(max=16)

        # JTAG interface signals for testing
        self.jtag_tdi = Signal()
        self.jtag_tdo = Signal()
        self.jtag_tck = Signal()
        self.jtag_tms = Signal()

        # BIST signals
        self.bist_start = Signal()
        self.bist_done = Signal()
        self.bist_pass = Signal()

        # Status register for reporting status
        self.status_register = Signal(32)

        # Throughput and utilization measurement signals
        self.throughput = Signal(32)
        self.utilization = Signal(32)

        # Adding submodules to the memory controller
        self.submodules += [
            self.command_decoder,
            self.timing_controller,
            self.data_buffer,
            self.power_management,
            MemoryOperations(self),
            AddressMapper(config),
            AccessArbitration(self),
            ClockDomainCrossing(self.data_width),
        ]

        # Address mapping signals
        self.row_addr = Signal(16)
        self.col_addr = Signal(10)
        self.bank_addr = Signal(3)

        # Request and grant signals for multiple requestors
        self.req = Signal(4)
        self.grant = Signal(4)

        # Clock domain crossing instances
        self.submodules.data_in_cdc = ClockDomainCrossing(self.data_width)
        self.submodules.data_out_cdc = ClockDomainCrossing(self.data_width)

        # Add QoS Manager
        self.submodules.qos_manager = QoSManager(config['num_requestors'], config['qos_policy'])

        # Add per-bank refresh support
        self.submodules.refresh_manager = RefreshManager(config['refresh_rate'], config['tRFC'], config['bank_groups'], config['banks_per_group'])

        # Enhance power management
        self.submodules.power_management = PowerManagement(config['power_down_modes'], config['deep_power_down_threshold'])

        # Add error checking and correction (ECC) support
        self.ecc_enabled = config['ecc_enabled']
        if self.ecc_enabled:
            self.submodules.ecc_encoder = ECCEncoder(self.data_width)
            self.submodules.ecc_decoder = ECCDecoder(self.data_width)

        # Add support for different data widths
        self.data_mask = Signal(self.data_width // 8)

        # Add temperature sensor and thermal management
        self.temperature = Signal(8)  # 8-bit temperature reading
        self.thermal_shutdown = Signal()

        # Add debug and performance monitoring
        self.debug_signals = Signal(32)
        self.performance_counters = Array([Signal(32) for _ in range(8)])

    def elaborate(self, platform):
        m = Module()
        
        # Add all submodules
        for submodule in self.submodules:
            m.submodules += submodule

        # Connect signals between modules
        m.d.comb += [
            self.command_decoder.rst.eq(self.rst),
            self.command_decoder.addr.eq(self.addr),
            self.command_decoder.mem_read.eq(self.mem_read),
            self.command_decoder.mem_write.eq(self.mem_write),
            self.command_decoder.refresh.eq(self.refresh),
            self.command_decoder.chip_select.eq(self.chip_select),
            self.command_decoder.ras.eq(self.ras),
            self.command_decoder.cas.eq(self.cas),
            self.command_decoder.we.eq(self.we),
            self.timing_controller.rst.eq(self.rst),
            self.timing_controller.cmd_decoded.eq(self.command_decoder.cmd_decoded),
            self.data_buffer.rst.eq(self.rst),
            self.data_buffer.ready.eq(self.timing_controller.ready),
            self.data_buffer.mem_read.eq(self.mem_read),
            self.data_buffer.mem_write.eq(self.mem_write),
            self.data_buffer.data_in.eq(self.data_in_cdc.dst_data),
            self.data_out.eq(self.data_out_cdc.dst_data),
            self.power_management.rst.eq(self.rst),
            self.power_management.cmd_decoded.eq(self.command_decoder.cmd_decoded),
            self.ready.eq(self.timing_controller.ready),
            self.refresh_manager.clk.eq(self.clk),
            self.refresh_manager.rst.eq(self.rst),
            self.bank_state_tracker.clk.eq(self.clk),
            self.bank_state_tracker.rst.eq(self.rst),
            self.command_scheduler.clk.eq(self.clk),
            self.command_scheduler.rst.eq(self.rst),
            self.row_buffer_manager.clk.eq(self.clk),
            self.row_buffer_manager.rst.eq(self.rst),
        ]

        # Implement main control logic
        with m.FSM(name="main_control"):
            with m.State("IDLE"):
                with m.If(self.refresh_manager.refresh_needed):
                    m.next = "REFRESH"
                with m.Elif(self.command_scheduler.cmd_ready):
                    m.next = "EXECUTE_COMMAND"
                with m.Elif(self.power_management.power_down_ready):
                    m.next = "POWER_DOWN"

            with m.State("REFRESH"):
                m.d.comb += [
                    self.command_decoder.refresh.eq(1),
                    self.refresh_manager.refresh_done.eq(self.timing_controller.ready)
                ]
                with m.If(self.timing_controller.ready):
                    m.next = "IDLE"

            with m.State("EXECUTE_COMMAND"):
                m.d.comb += [
                    self.command_decoder.mem_read.eq(self.command_scheduler.cmd_type == 0),
                    self.command_decoder.mem_write.eq(self.command_scheduler.cmd_type == 1),
                    self.command_decoder.activate.eq(self.command_scheduler.cmd_type == 2),
                    self.command_decoder.precharge.eq(self.command_scheduler.cmd_type == 3),
                ]
                with m.If(self.timing_controller.ready):
                    m.d.comb += self.command_scheduler.cmd_executed.eq(1)
                    m.next = "IDLE"

            with m.State("POWER_DOWN"):
                m.d.comb += self.power_management.enter_power_down.eq(1)
                with m.If(self.power_management.power_down_entered):
                    m.next = "IDLE"

            # Add new states for advanced features
            with m.State("ECC_CHECK"):
                m.d.comb += [
                    self.ecc_decoder.data_in.eq(self.data_buffer.data_out),
                    self.data_out.eq(self.ecc_decoder.data_out),
                    self.ecc_error.eq(self.ecc_decoder.error_detected)
                ]
                m.next = "IDLE"

            with m.State("THERMAL_MANAGEMENT"):
                with m.If(self.temperature > config['thermal_shutdown_temp']):
                    m.d.comb += self.thermal_shutdown.eq(1)
                    m.next = "POWER_DOWN"
                with m.Else():
                    m.next = "IDLE"

        # Implement QoS-aware command scheduling
        m.d.comb += [
            self.command_scheduler.qos_priority.eq(self.qos_manager.current_priority),
            self.qos_manager.request_completed.eq(self.command_scheduler.cmd_executed)
        ]

        # Implement per-bank refresh logic
        m.d.comb += [
            self.refresh_manager.bank_group.eq(self.bank_group),
            self.refresh_manager.bank.eq(self.bank)
        ]

        # Implement advanced power management
        m.d.comb += [
            self.power_management.temperature.eq(self.temperature),
            self.low_power_mode.eq(self.power_management.low_power_mode)
        ]

        # Implement ECC
        if self.ecc_enabled:
            m.d.comb += [
                self.ecc_encoder.data_in.eq(self.data_in),
                self.data_buffer.data_in.eq(self.ecc_encoder.data_out)
            ]

        # Implement debug and performance monitoring
        m.d.sync += [
            self.performance_counters[0].eq(self.performance_counters[0] + self.command_scheduler.cmd_executed),
            self.performance_counters[1].eq(self.performance_counters[1] + self.refresh_manager.refresh_done),
            self.performance_counters[2].eq(self.performance_counters[2] + self.power_management.power_down_entered),
            # ... (add more performance counters as needed)
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
                                                    mem_ctrl.ready, mem_ctrl.refresh, 
                                                    mem_ctrl.chip_select, mem_ctrl.ras, 
                                                    mem_ctrl.cas, mem_ctrl.we})  # Convert to Verilog

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

def validate_config(config):
    required_fields = ['clock_frequency', 'cas_latency', 'data_width', 'burst_length', 'memory_type']
    for field in required_fields:
        if field not in config:
            raise ValueError(f"Missing required configuration field: {field}")
    
    if config['memory_type'] not in ['DDR4', 'DDR5']:
        raise ValueError(f"Unsupported memory type: {config['memory_type']}")
    
    if config['clock_frequency'] <= 0:
        raise ValueError("Clock frequency must be positive")
    
    if config['cas_latency'] <= 0:
        raise ValueError("CAS latency must be positive")
    
    if config['data_width'] not in [8, 16, 32, 64]:
        raise ValueError("Data width must be 8, 16, 32, or 64 bits")
    
    if config['burst_length'] not in [4, 8, 16]:
        raise ValueError("Burst length must be 4, 8, or 16")
    
    if config['address_mapping_scheme'] not in ['linear', 'interleaved']:
        raise ValueError("Unsupported address mapping scheme")
    
    if config['row_buffer_policy'] not in ['open_page', 'close_page']:
        raise ValueError("Unsupported row buffer policy")
    
    if config['bank_groups'] <= 0 or config['banks_per_group'] <= 0:
        raise ValueError("Bank groups and banks per group must be positive")
    
    if config['rows'] <= 0 or config['columns'] <= 0:
        raise ValueError("Rows and columns must be positive")
    
    if config['page_size'] <= 0:
        raise ValueError("Page size must be positive")
    
    # Add validations for timing parameters
    timing_params = ['tRCD', 'tRP', 'tRAS', 'tRC', 'tWR', 'tRFC']
    for param in timing_params:
        if config[param] <= 0:
            raise ValueError(f"{param} must be positive")
    
    if config['scheduling_policy'] not in ['FCFS', 'FR-FCFS']:
        raise ValueError("Unsupported scheduling policy")
    
    if not set(config['power_down_modes']).issubset({'self-refresh', 'power-down', 'deep-power-down'}):
        raise ValueError("Unsupported power-down modes")

def run_memory_controller_simulation(config):
    from migen.sim import Simulator, Delay

    def testbench(dut):
        # Example testbench for simulation
        yield dut.rst.eq(1)
        yield Delay(1e-6)
        yield dut.rst.eq(0)
        yield dut.mem_write.eq(1)
        yield dut.addr.eq(0x1000)
        yield dut.data_in.eq(0xDEADBEEF)
        yield Delay(1e-6)
        yield dut.mem_write.eq(0)
        yield dut.mem_read.eq(1)
        yield dut.addr.eq(0x1000)
        yield Delay(1e-6)
        yield dut.mem_read.eq(0)
        yield Delay(1e-6)
        print(f"Read data: {hex((yield dut.data_out))}")

    dut = MemoryController(config)
    sim = Simulator(dut)
    sim.add_clock(1e-6)  # 1 MHz clock
    sim.add_sync_process(testbench)
    sim.run()

def run_formal_verification(config):
    from migen.fhdl.verification import assert_, assume, cover

    class FormalMemoryController(MemoryController):
        def __init__(self, config):
            super().__init__(config)
            self.specials += [
                assert_(self.ready == 1),
                cover(self.mem_read & (self.data_out == 0xDEADBEEF))
            ]

    dut = FormalMemoryController(config)
    from migen.fhdl.verification import Formal
    f = Formal(dut)
    f.check()

def main():
    try:
        config_path = 'configs/default_config.json'
        config = read_config(config_path)
        
        # Validate configuration
        validate_config(config)

        optimized_params = optimize_parameters(config)
        config.update(optimized_params)

        print("Optimized parameters:")
        print(f"Clock Frequency: {config['clock_frequency']} MHz")
        print(f"CAS Latency: {config['cas_latency']}")
        print(f"Memory Type: {config['memory_type']}")

        generate_verilog(config)
        print("Memory Controller generated successfully.")

        # Add simulation and verification
        if config['run_simulation']:
            run_memory_controller_simulation(config)

        if config['run_formal_verification']:
            run_formal_verification(config)

    except FileNotFoundError:
        print(f"Error: Configuration file not found at {config_path}")
    except json.JSONDecodeError:
        print(f"Error: Invalid JSON in configuration file {config_path}")
    except ValueError as ve:
        print(f"Error in configuration: {str(ve)}")
    except Exception as e:
        print(f"An unexpected error occurred: {str(e)}")
        import traceback
        traceback.print_exc()

# Entry point of the script
if __name__ == "__main__":
    main()
