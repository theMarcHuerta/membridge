from migen import *
from migen.genlib.fifo import SyncFIFO

class DataBuffer(Module):
    def __init__(self, data_width, burst_length):
        self.rst = Signal()
        self.ready = Signal()
        self.mem_write = Signal()
        self.mem_read = Signal()
        self.data_in = Signal(data_width)
        self.data_out = Signal(data_width)
        
        # Create FIFOs
        self.submodules.write_fifo = SyncFIFO(width=data_width, depth=burst_length)
        self.submodules.read_fifo = SyncFIFO(width=data_width, depth=burst_length)

        # Add data buffer logic
        self.sync += [
            If(self.rst,
                self.write_fifo.we.eq(0),
                self.read_fifo.re.eq(0)
            ).Elif(self.ready,
                If(self.mem_write,
                    self.write_fifo.din.eq(self.data_in),
                    self.write_fifo.we.eq(1)
                ).Elif(self.mem_read,
                    self.data_out.eq(self.read_fifo.dout),
                    self.read_fifo.re.eq(1)
                ).Else(
                    self.write_fifo.we.eq(0),
                    self.read_fifo.re.eq(0)
                )
            )
        ]