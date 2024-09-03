from migen import *

class CommandDecoder(Module):
    def __init__(self, command_encoding):
        self.rst = Signal()
        self.addr = Signal(32)
        self.mem_read = Signal()
        self.mem_write = Signal()
        self.activate = Signal()
        self.precharge = Signal()
        self.refresh = Signal()
        self.cmd_decoded = Signal(4)
        self.address = Signal(32)

        # Add command decoding logic
        self.sync += [
            If(self.rst,
                self.cmd_decoded.eq(0),
                self.address.eq(0)
            ).Else(
                self.address.eq(self.addr),
                Case(Cat(self.mem_read, self.mem_write, self.activate, self.precharge, self.refresh), {
                    0b10000: self.cmd_decoded.eq(command_encoding['READ']),
                    0b01000: self.cmd_decoded.eq(command_encoding['WRITE']),
                    0b00100: self.cmd_decoded.eq(command_encoding['ACTIVATE']),
                    0b00010: self.cmd_decoded.eq(command_encoding['PRECHARGE']),
                    0b00001: self.cmd_decoded.eq(command_encoding['REFRESH']),
                    "default": self.cmd_decoded.eq(0)
                })
            )
        ]