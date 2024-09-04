from migen import *

class TimingController(Module):
    def __init__(self, config, command_encoding):
        # Input ports
        self.cmd_decoded = Signal(4)
        self.bank_group = Signal(max=config['bank_groups'])
        self.bank = Signal(max=config['banks_per_group'])

        # Output ports
        self.ready = Signal()

        # Store command encoding
        self.command_encoding = command_encoding

        # Timing parameters
        self.tRCD = config['tRCD']
        self.tRP = config['tRP']
        self.tRAS = config['tRAS']
        self.tRC = config['tRC']
        self.tWR = config['tWR']

        # Create timers for each bank
        self.timers = Array([Signal(32) for _ in range(config['bank_groups'] * config['banks_per_group'])])

        # Main timing control logic
        self.sync += [
            If(self.cmd_decoded != 0,
                Case(self.cmd_decoded, {
                    self.command_encoding['READ']: self.handle_read(),
                    self.command_encoding['WRITE']: self.handle_write(),
                    self.command_encoding['ACTIVATE']: self.handle_activate(),
                    self.command_encoding['PRECHARGE']: self.handle_precharge(),
                    self.command_encoding['REFRESH']: self.handle_refresh(),
                })
            ).Else(
                self.decrement_timers()
            )
        ]

    def handle_read(self):
        bank_index = self.bank_group * len(self.bank) + self.bank
        return If(self.timers[bank_index] == 0,
            self.ready.eq(1),
            self.timers[bank_index].eq(self.tRCD)
        ).Else(
            self.ready.eq(0)
        )

    def handle_write(self):
        bank_index = self.bank_group * len(self.bank) + self.bank
        return If(self.timers[bank_index] == 0,
            self.ready.eq(1),
            self.timers[bank_index].eq(self.tWR)
        ).Else(
            self.ready.eq(0)
        )

    def handle_activate(self):
        bank_index = self.bank_group * len(self.bank) + self.bank
        return If(self.timers[bank_index] == 0,
            self.ready.eq(1),
            self.timers[bank_index].eq(self.tRAS)
        ).Else(
            self.ready.eq(0)
        )

    def handle_precharge(self):
        bank_index = self.bank_group * len(self.bank) + self.bank
        return If(self.timers[bank_index] == 0,
            self.ready.eq(1),
            self.timers[bank_index].eq(self.tRP)
        ).Else(
            self.ready.eq(0)
        )

    def handle_refresh(self):
        return [
            self.ready.eq(0),
            *[timer.eq(self.tRC) for timer in self.timers]
        ]

    def decrement_timers(self):
        return [
            If(timer > 0,
                timer.eq(timer - 1)
            ) for timer in self.timers
        ]