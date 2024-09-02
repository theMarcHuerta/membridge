import unittest
from migen import *
from migen.fhdl import verilog
from scripts.genCntrlr import MemoryController, CommandDecoder, TimingController, DataBuffer, PowerManagement

class TestMemoryController(unittest.TestCase):
    def setUp(self):
        self.config = {
            'clock_frequency': 3200,
            'cas_latency': 16,
            'data_width': 64,
            'burst_length': 8,
            'memory_type': 'DDR5',
            'tRCD': 18,
            'tRP': 18,
            'tRAS': 32
        }
        self.dut = MemoryController(self.config)

    def test_initialization(self):
        self.assertEqual(self.dut.clock_frequency, 3200)
        self.assertEqual(self.dut.cas_latency, 16)
        self.assertEqual(self.dut.data_width, 64)
        self.assertEqual(self.dut.burst_length, 8)
        self.assertEqual(self.dut.memory_type, 'DDR5')

    def test_command_decoder(self):
        def gen_test():
            yield self.dut.command_decoder.rst.eq(1)
            yield
            yield self.dut.command_decoder.rst.eq(0)
            yield self.dut.command_decoder.mem_read.eq(1)
            yield
            self.assertEqual((yield self.dut.command_decoder.cmd_decoded), 2)
            yield self.dut.command_decoder.mem_read.eq(0)
            yield self.dut.command_decoder.mem_write.eq(1)
            yield
            self.assertEqual((yield self.dut.command_decoder.cmd_decoded), 3)

        run_simulation(self.dut.command_decoder, gen_test())

    def test_timing_controller(self):
        def gen_test():
            yield self.dut.timing_controller.rst.eq(1)
            yield
            yield self.dut.timing_controller.rst.eq(0)
            yield self.dut.timing_controller.cmd_decoded.eq(2)
            for _ in range(20):
                yield
                if (yield self.dut.timing_controller.ready):
                    break
            self.assertEqual((yield self.dut.timing_controller.ready), 1)

        run_simulation(self.dut.timing_controller, gen_test())

    def test_data_buffer(self):
        def gen_test():
            yield self.dut.data_buffer.rst.eq(1)
            yield
            yield self.dut.data_buffer.rst.eq(0)
            yield self.dut.data_buffer.ready.eq(1)
            yield self.dut.data_buffer.mem_write.eq(1)
            yield self.dut.data_buffer.data_in.eq(0xDEADBEEF)
            yield
            self.assertEqual((yield self.dut.data_buffer.data_in_fifo.dout), 0xDEADBEEF)

        run_simulation(self.dut.data_buffer, gen_test())

    def test_power_management(self):
        def gen_test():
            yield self.dut.power_management.rst.eq(1)
            yield
            yield self.dut.power_management.rst.eq(0)
            yield self.dut.power_management.cmd_decoded.eq(0)
            yield
            self.assertEqual((yield self.dut.power_management.power_state), 1)
            yield self.dut.power_management.cmd_decoded.eq(2)
            yield
            self.assertEqual((yield self.dut.power_management.power_state), 0)

        run_simulation(self.dut.power_management, gen_test())

    def test_command_decoder_extended(self):
        def gen_test():
            yield self.dut.command_decoder.rst.eq(1)
            yield
            yield self.dut.command_decoder.rst.eq(0)
            
            # Test READ command
            yield self.dut.command_decoder.mem_read.eq(1)
            yield
            self.assertEqual((yield self.dut.command_decoder.cmd_decoded), self.dut.command_decoder.command_encoding['READ'])
            
            # Test WRITE command
            yield self.dut.command_decoder.mem_read.eq(0)
            yield self.dut.command_decoder.mem_write.eq(1)
            yield
            self.assertEqual((yield self.dut.command_decoder.cmd_decoded), self.dut.command_decoder.command_encoding['WRITE'])
            
            # Test ACTIVATE command
            yield self.dut.command_decoder.mem_write.eq(0)
            yield self.dut.command_decoder.activate.eq(1)
            yield
            self.assertEqual((yield self.dut.command_decoder.cmd_decoded), self.dut.command_decoder.command_encoding['ACTIVATE'])
            
            # Test PRECHARGE command
            yield self.dut.command_decoder.activate.eq(0)
            yield self.dut.command_decoder.precharge.eq(1)
            yield
            self.assertEqual((yield self.dut.command_decoder.cmd_decoded), self.dut.command_decoder.command_encoding['PRECHARGE'])
            
            # Test REFRESH command
            yield self.dut.command_decoder.precharge.eq(0)
            yield self.dut.command_decoder.refresh.eq(1)
            yield
            self.assertEqual((yield self.dut.command_decoder.cmd_decoded), self.dut.command_decoder.command_encoding['REFRESH'])

        run_simulation(self.dut.command_decoder, gen_test())

if __name__ == '__main__':
    unittest.main()