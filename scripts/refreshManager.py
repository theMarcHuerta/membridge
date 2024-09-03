from migen import *

class RefreshManager(Module):
    def __init__(self, refresh_rate, tRFC, bank_groups, banks_per_group):
        self.clk = Signal()
        self.rst = Signal()
        self.refresh_needed = Signal()
        self.refresh_done = Signal()
        self.bank_group = Signal(max=bank_groups)
        self.bank = Signal(max=banks_per_group)
        
        self.refresh_interval = int(refresh_rate * 1e-3 * 1e9)  # Convert ms to ns
        self.tRFC = tRFC
        
        self.counter = Signal(32)
        self.refresh_in_progress = Signal()
        self.refresh_counters = Array([Signal(32) for _ in range(bank_groups * banks_per_group)])
        
    def elaborate(self, platform):
        m = Module()
        
        total_banks = len(self.refresh_counters)
        current_bank = Signal(max=total_banks)
        
        m.d.sync += [
            If(self.rst,
                self.counter.eq(0),
                self.refresh_needed.eq(0),
                self.refresh_in_progress.eq(0),
                current_bank.eq(0),
                [counter.eq(0) for counter in self.refresh_counters]
            ).Elif(self.refresh_in_progress,
                If(self.counter >= self.tRFC,
                    self.refresh_in_progress.eq(0),
                    self.counter.eq(0),
                    current_bank.eq((current_bank + 1) % total_banks)
                ).Else(
                    self.counter.eq(self.counter + 1)
                )
            ).Else(
                [
                    If(counter >= self.refresh_interval,
                        self.refresh_needed.eq(1)
                    ).Else(
                        counter.eq(counter + 1)
                    )
                    for counter in self.refresh_counters
                ],
                If(self.refresh_done,
                    self.refresh_needed.eq(0),
                    self.refresh_in_progress.eq(1),
                    self.refresh_counters[current_bank].eq(0),
                    self.bank_group.eq(current_bank // banks_per_group),
                    self.bank.eq(current_bank % banks_per_group)
                )
            )
        ]
        
        return m