from migen import *

class ClockDomainCrossing(Module):
    def __init__(self, width):
        self.src_clk = Signal()
        self.src_rst = Signal()
        self.src_data = Signal(width)
        self.dst_clk = Signal()
        self.dst_rst = Signal()
        self.dst_data = Signal(width)

        sync_ff1 = Signal(width)
        sync_ff2 = Signal(width)

        self.sync += [
            If(self.dst_rst,
                sync_ff1.eq(0),
                sync_ff2.eq(0),
                self.dst_data.eq(0)
            ).Else(
                sync_ff1.eq(self.src_data),
                sync_ff2.eq(sync_ff1),
                self.dst_data.eq(sync_ff2)
            )
        ]