from migen import *

class TimingController(Module):
    def __init__(self, cas_latency, tRCD, tRP, tRAS):
        self.rst = Signal()
        self.cmd_decoded = Signal(4)
        self.timer = Signal(32)
        self.state = Signal(3)
        self.ready = Signal()
        self.cas_latency = cas_latency
        self.tRCD = tRCD
        self.tRP = tRP
        self.tRAS = tRAS

    def elaborate(self, platform):
        m = Module()
        m.d.sync += [
            If(self.rst,
                self.timer.eq(0),
                self.state.eq(0),
                self.ready.eq(0)
            ).Else(
                Case(self.state, {
                    # Idle state: Wait for a command
                    0: If(self.cmd_decoded != 0,
                          self.state.eq(1),
                          self.timer.eq(0),
                          self.ready.eq(0)),
                    # CAS Latency state: Wait for CAS latency to elapse
                    1: If(self.timer >= self.cas_latency,
                          self.state.eq(2),
                          self.ready.eq(1)
                       ).Else(
                          self.timer.eq(self.timer + 1)
                       ),
                    # RCD state: Wait for tRCD to elapse
                    2: If(self.timer >= self.tRCD,
                          self.state.eq(3)
                       ).Else(
                          self.timer.eq(self.timer + 1)
                       ),
                    # RP state: Wait for tRP to elapse
                    3: If(self.timer >= self.tRP,
                          self.state.eq(4)
                       ).Else(
                          self.timer.eq(self.timer + 1)
                       ),
                    # RAS state: Wait for tRAS to elapse
                    4: If(self.timer >= self.tRAS,
                          self.state.eq(0)  # Return to idle state
                       ).Else(
                          self.timer.eq(self.timer + 1)
                       ),
                    "default": self.state.eq(0)  # Default to idle state
                })
            )
        ]
        return m