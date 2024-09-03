from migen import *

class BankStateTracker(Module):
    def __init__(self, bank_groups, banks_per_group):
        self.clk = Signal()
        self.rst = Signal()
        self.bank_group = Signal(max=bank_groups)
        self.bank = Signal(max=banks_per_group)
        self.activate = Signal()
        self.precharge = Signal()
        self.read = Signal()
        self.write = Signal()
        
        self.bank_states = Array([Array([Signal(2) for _ in range(banks_per_group)]) for _ in range(bank_groups)])
        self.active_rows = Array([Array([Signal(16) for _ in range(banks_per_group)]) for _ in range(bank_groups)])
        
    def elaborate(self, platform):
        m = Module()
        
        IDLE, ACTIVE, READ, WRITE = range(4)
        
        m.d.sync += [
            If(self.rst,
                [bg.eq(IDLE) for bg in self.bank_states for b in bg]
            ).Elif(self.activate,
                self.bank_states[self.bank_group][self.bank].eq(ACTIVE),
                self.active_rows[self.bank_group][self.bank].eq(self.bank)
            ).Elif(self.precharge,
                self.bank_states[self.bank_group][self.bank].eq(IDLE)
            ).Elif(self.read,
                self.bank_states[self.bank_group][self.bank].eq(READ)
            ).Elif(self.write,
                self.bank_states[self.bank_group][self.bank].eq(WRITE)
            )
        ]
        
        return m