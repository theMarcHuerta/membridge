from migen import *

class RowBufferManager(Module):
    def __init__(self, row_buffer_policy, command_encoding):
        # Input ports
        self.cmd_decoded = Signal(4)
        self.bank_group = Signal(2)
        self.bank = Signal(2)
        self.row = Signal(16)

        # Output ports
        self.row_buffer_hit = Signal()
        self.row_activate = Signal()
        self.row_precharge = Signal()

        # Internal signals
        self.current_row = Signal(16)
        self.row_open = Signal()

        # Store command encoding
        self.command_encoding = command_encoding

        # Row buffer states
        self.CLOSED, self.OPEN = range(2)

        # Create row buffer state trackers
        self.row_buffer_states = Array([Array([Signal(1) for _ in range(4)]) for _ in range(4)])
        self.active_rows = Array([Array([Signal(16) for _ in range(4)]) for _ in range(4)])

        # Main row buffer management logic
        self.sync += [
            Case(self.cmd_decoded, {
                self.command_encoding['ACTIVATE']: self.handle_activate(),
                self.command_encoding['PRECHARGE']: self.handle_precharge(),
                self.command_encoding['READ']: self.handle_read_write(),
                self.command_encoding['WRITE']: self.handle_read_write(),
            })
        ]

        # Implement row buffer policy
        if row_buffer_policy == 'closed_page':
            self.sync += If(self.cmd_decoded == self.command_encoding['READ'] | 
                            self.cmd_decoded == self.command_encoding['WRITE'],
                            self.handle_precharge())

        # Output current row buffer state
        self.comb += [
            self.row_buffer_hit.eq(self.row_open & (self.current_row == self.row)),
            self.row_open.eq(self.row_buffer_states[self.bank_group][self.bank]),
            self.current_row.eq(self.active_rows[self.bank_group][self.bank])
        ]

    def handle_activate(self):
        return [
            self.row_buffer_states[self.bank_group][self.bank].eq(self.OPEN),
            self.active_rows[self.bank_group][self.bank].eq(self.row)
        ]

    def handle_precharge(self):
        return self.row_buffer_states[self.bank_group][self.bank].eq(self.CLOSED)

    def handle_read_write(self):
        return If(self.active_rows[self.bank_group][self.bank] != self.row,
                  self.handle_precharge(),
                  self.handle_activate())