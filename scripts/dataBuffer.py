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
        
        self.write_fifo = SyncFIFO(width=data_width, depth=burst_length)
        self.read_fifo = SyncFIFO(width=data_width, depth=burst_length)

    def elaborate(self, platform):
        m = Module()
        m.submodules.write_fifo = self.write_fifo
        m.submodules.read_fifo = self.read_fifo

        m.d.sync += [
            If(self.rst,
                self.buffer_index.eq(0),
                self.write_fifo.we.eq(0),
                self.read_fifo.re.eq(0)
            ).Elif(self.ready,
                If(self.mem_write,
                    self.write_fifo.din.eq(self.data_in),
                    self.write_fifo.we.eq(1),
                    If(self.buffer_index == self.write_fifo.depth - 1,
                        self.buffer_index.eq(0)
                    ).Else(
                        self.buffer_index.eq(self.buffer_index + 1)
                    )
                ).Elif(self.mem_read,
                    self.data_out.eq(self.read_fifo.dout),
                    self.read_fifo.re.eq(1),
                    If(self.buffer_index == self.read_fifo.depth - 1,
                        self.buffer_index.eq(0)
                    ).Else(
                        self.buffer_index.eq(self.buffer_index + 1)
                    )
                ).Else(
                    self.write_fifo.we.eq(0),
                    self.read_fifo.re.eq(0)
                )
            )
        ]
        
        return m