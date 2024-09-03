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
        
        # Internal signals
        self.row_open = Signal()
        
        # Add row buffer management logic
        self.sync += [
            If(self.rst,
                self.row_open.eq(0),
                self.current_row.eq(0)
            ).Elif(self.row_activate,
                self.row_open.eq(1),
                self.current_row.eq(self.requested_row)
            ).Elif(self.row_precharge,
                self.row_open.eq(0)
            )
        ]
        
        self.comb += [
            self.row_hit.eq(self.row_open & (self.current_row == self.requested_row))
        ]
        
        if row_buffer_policy == 'closed_page':
            self.sync += [
                If(self.row_activate,
                    self.row_precharge.eq(1)
                ).Else(
                    self.row_precharge.eq(0)
                )
            ]