from migen import *

class TimingController(Module):
    def __init__(self, config):
        self.clk = Signal()
        self.rst = Signal()
        self.cmd_decoded = Signal(4)
        self.ready = Signal()

        # Internal signals
        self.timer = Signal(32)

        # Add timing logic
        self.sync += [
            If(self.rst,
                self.timer.eq(0),
                self.ready.eq(1)
            ).Elif(self.cmd_decoded != 0,
                self.timer.eq(config['tRCD']),  # Example timing
                self.ready.eq(0)
            ).Elif(self.timer > 0,
                self.timer.eq(self.timer - 1)
            ).Else(
                self.ready.eq(1)
            )
        ]