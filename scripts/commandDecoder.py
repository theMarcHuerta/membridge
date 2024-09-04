from migen import *

class CommandDecoder(Module):
    def __init__(self):
        # Define input and output ports
        self.addr = Signal(32)
        self.mem_read = Signal()
        self.mem_write = Signal()
        self.refresh = Signal()
        self.chip_select = Signal()
        self.ras = Signal()
        self.cas = Signal()
        self.we = Signal()

        self.cmd_decoded = Signal(4)
        self.cmd_valid = Signal()
        self.row_addr = Signal(16)
        self.col_addr = Signal(10)
        self.bank_addr = Signal(3)

        # Command decoding logic
        self.command_encoding = {
            'READ': 0b0001,
            'WRITE': 0b0010,
            'ACTIVATE': 0b0011,
            'PRECHARGE': 0b0100,
            'REFRESH': 0b0101,
        }

        # Add command decoding logic
        self.comb += [
            self.cmd_valid.eq(self.chip_select & ~(self.ras & self.cas & self.we)),
            Case(Cat(self.ras, self.cas, self.we), {
                0b011: self.cmd_decoded.eq(self.command_encoding['READ']),
                0b010: self.cmd_decoded.eq(self.command_encoding['WRITE']),
                0b001: self.cmd_decoded.eq(self.command_encoding['ACTIVATE']),
                0b100: self.cmd_decoded.eq(self.command_encoding['PRECHARGE']),
                0b000: self.cmd_decoded.eq(self.command_encoding['REFRESH']),
                "default": self.cmd_decoded.eq(0)
            }),
            self.row_addr.eq(self.addr[16:32]),
            self.col_addr.eq(self.addr[6:16]),
            self.bank_addr.eq(self.addr[3:6])
        ]