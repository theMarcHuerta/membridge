from migen import *

class BankStateTracker(Module):
    def __init__(self, bank_groups, banks_per_group, command_encoding):
        # Input ports
        self.cmd_decoded = Signal(4)
        self.bank_group = Signal(max=bank_groups)
        self.bank = Signal(max=banks_per_group)
        self.row = Signal(16)

        # Output ports
        self.bank_state = Signal(2)
        self.active_row = Signal(16)

        # Store command encoding
        self.command_encoding = command_encoding

        # States
        self.IDLE, self.ACTIVE, self.READ, self.WRITE = range(4)

        # Create bank state and active row trackers
        self.bank_states = Array([Array([Signal(2) for _ in range(banks_per_group)]) for _ in range(bank_groups)])
        self.active_rows = Array([Array([Signal(16) for _ in range(banks_per_group)]) for _ in range(bank_groups)])

        # Main bank state tracking logic
        self.sync += [
            Case(self.cmd_decoded, {
                self.command_encoding['ACTIVATE']: self.handle_activate(),
                self.command_encoding['PRECHARGE']: self.handle_precharge(),
                self.command_encoding['READ']: self.handle_read(),
                self.command_encoding['WRITE']: self.handle_write(),
            })
        ]

        # Output current bank state and active row
        self.comb += [
            self.bank_state.eq(self.bank_states[self.bank_group][self.bank]),
            self.active_row.eq(self.active_rows[self.bank_group][self.bank])
        ]

    def handle_activate(self):
        return [
            self.bank_states[self.bank_group][self.bank].eq(self.ACTIVE),
            self.active_rows[self.bank_group][self.bank].eq(self.row)
        ]

    def handle_precharge(self):
        return self.bank_states[self.bank_group][self.bank].eq(self.IDLE)

    def handle_read(self):
        return self.bank_states[self.bank_group][self.bank].eq(self.READ)

    def handle_write(self):
        return self.bank_states[self.bank_group][self.bank].eq(self.WRITE)
