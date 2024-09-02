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
        self.buffer_index = Signal(max=burst_length)
        
        # FIFOs for handling input and output data
        self.data_in_fifo = SyncFIFO(width=data_width, depth=16)
        self.data_out_fifo = SyncFIFO(width=data_width, depth=16)

    def elaborate(self, platform):
        m = Module()
        m.submodules.data_in_fifo = self.data_in_fifo
        m.submodules.data_out_fifo = self.data_out_fifo

        m.d.sync += [
            If(self.rst,
                self.buffer_index.eq(0)
            ).Elif(self.ready,
                If(self.mem_write,
                    # Handle write operation
                    self.data_in_fifo.din.eq(self.data_in),
                    self.data_in_fifo.we.eq(1),
                    If(self.buffer_index == self.burst_length - 1,
                        self.buffer_index.eq(0)  # Reset index at end of burst
                    ).Else(
                        self.buffer_index.eq(self.buffer_index + 1)
                    )
                ).Elif(self.mem_read,
                    # Handle read operation
                    self.data_out.eq(self.data_out_fifo.dout),
                    self.data_out_fifo.re.eq(1),
                    If(self.buffer_index == self.burst_length - 1,
                        self.buffer_index.eq(0)  # Reset index at end of burst
                    ).Else(
                        self.buffer_index.eq(self.buffer_index + 1)
                    )
                )
            )
        ]
        return m