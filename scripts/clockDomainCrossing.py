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

        # Use += instead of = for assigning to sync domains
        self.sync.src += [
            sync_ff1.eq(self.src_data)
        ]

        self.sync.dst += [
            If(self.dst_rst,
                sync_ff2.eq(0),
                self.dst_data.eq(0)
            ).Else(
                sync_ff2.eq(sync_ff1),
                self.dst_data.eq(sync_ff2)
            )
        ]