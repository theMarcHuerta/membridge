from migen import *

class PowerManagement(Module):
    def __init__(self):
        self.rst = Signal()
        self.cmd_decoded = Signal(4)
        self.power_state = Signal(2)

    def elaborate(self, platform):
        m = Module()
        m.d.sync += [
            If(self.rst,
                self.power_state.eq(0)
            ).Else(
                Case(self.power_state, {
                     0: If(self.cmd_decoded == 0,
                          self.power_state.eq(1)),
                    1: If(self.cmd_decoded != 0,
                          self.power_state.eq(0))
                })
            )
        ]
        return m