from migen import *

class RowBufferManager(Module):
    def __init__(self, row_buffer_policy):
        self.clk = Signal()
        self.rst = Signal()
        self.row_activate = Signal()
        self.row_precharge = Signal()
        self.row_hit = Signal()
        self.current_row = Signal(16)
        self.requested_row = Signal(16)
        
        self.policy = row_buffer_policy
        
    def elaborate(self, platform):
        m = Module()
        
        row_open = Signal()
        
        m.d.sync += [
            If(self.rst,
                row_open.eq(0),
                self.current_row.eq(0)
            ).Elif(self.row_activate,
                row_open.eq(1),
                self.current_row.eq(self.requested_row)
            ).Elif(self.row_precharge,
                row_open.eq(0)
            )
        ]
        
        m.d.comb += [
            self.row_hit.eq(row_open & (self.current_row == self.requested_row))
        ]
        
        if self.policy == 'closed_page':
            m.d.sync += [
                If(self.row_activate,
                    self.row_precharge.eq(1)
                ).Else(
                    self.row_precharge.eq(0)
                )
            ]
        elif self.policy == 'open_page':
            # The row remains open until explicitly precharged
            pass
        
        return m