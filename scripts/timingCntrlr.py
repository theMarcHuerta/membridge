from migen import *

class TimingController(Module):
    def __init__(self, config):
        self.rst = Signal()
        self.cmd_decoded = Signal(4)
        self.bank_group = Signal(max=config['bank_groups'])
        self.bank = Signal(max=config['banks_per_group'])
        self.ready = Signal()
        
        self.tRCD = config['tRCD']
        self.tRP = config['tRP']
        self.tRAS = config['tRAS']
        self.tRC = config['tRC']
        self.tWR = config['tWR']
        
        self.timers = Array([Signal(32) for _ in range(config['bank_groups'] * config['banks_per_group'])])

    def elaborate(self, platform):
        m = Module()
        
        bank_index = self.bank_group * len(self.bank) + self.bank
        
        m.d.sync += [
            If(self.rst,
                [timer.eq(0) for timer in self.timers],
                self.ready.eq(1)
            ).Else(
                Case(self.cmd_decoded, {
                    # READ or WRITE
                    0b0101 | 0b0100: [
                        If(self.timers[bank_index] == 0,
                            self.ready.eq(1),
                            self.timers[bank_index].eq(self.tRCD)
                        ).Else(
                            self.ready.eq(0),
                            self.timers[bank_index].eq(self.timers[bank_index] - 1)
                        )
                    ],
                    # ACTIVATE
                    0b0011: [
                        If(self.timers[bank_index] == 0,
                            self.ready.eq(1),
                            self.timers[bank_index].eq(self.tRAS)
                        ).Else(
                            self.ready.eq(0),
                            self.timers[bank_index].eq(self.timers[bank_index] - 1)
                        )
                    ],
                    # PRECHARGE
                    0b0010: [
                        If(self.timers[bank_index] == 0,
                            self.ready.eq(1),
                            self.timers[bank_index].eq(self.tRP)
                        ).Else(
                            self.ready.eq(0),
                            self.timers[bank_index].eq(self.timers[bank_index] - 1)
                        )
                    ],
                    "default": self.ready.eq(1)
                })
            )
        ]
        
        return m