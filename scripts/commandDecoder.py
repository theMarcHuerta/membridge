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
        self.auto_refresh = Signal()
        self.self_refresh_enter = Signal()
        self.self_refresh_exit = Signal()
        self.cmd_decoded = Signal(4)
        self.address = Signal(32)
        self.command_encoding = command_encoding

    def elaborate(self, platform):
        m = Module()
        m.d.sync += [
            If(self.rst,
                self.cmd_decoded.eq(0),
                self.address.eq(0)
            ).Else(
                self.address.eq(self.addr),
                Case(Cat(self.mem_read, self.mem_write, self.activate, self.precharge, self.refresh, self.auto_refresh, self.self_refresh_enter, self.self_refresh_exit), {
                    0b10000000: self.cmd_decoded.eq(self.command_encoding['READ']),
                    0b01000000: self.cmd_decoded.eq(self.command_encoding['WRITE']),
                    0b00100000: self.cmd_decoded.eq(self.command_encoding['ACTIVATE']),
                    0b00010000: self.cmd_decoded.eq(self.command_encoding['PRECHARGE']),
                    0b00001000: self.cmd_decoded.eq(self.command_encoding['REFRESH']),
                    0b00000100: self.cmd_decoded.eq(self.command_encoding['AUTO_REFRESH']),
                    0b00000010: self.cmd_decoded.eq(self.command_encoding['SELF_REFRESH_ENTER']),
                    0b00000001: self.cmd_decoded.eq(self.command_encoding['SELF_REFRESH_EXIT']),
                    "default": self.cmd_decoded.eq(0)
                })
            )
        ]
        return m