from migen import *

class RefreshManager(Module):
    def __init__(self, refresh_rate, tRFC, bank_groups, banks_per_group):
        # Input ports
        self.refresh = Signal()
        self.bank_group = Signal(max=bank_groups)
        self.bank = Signal(max=banks_per_group)

        # Output ports
        self.refresh_needed = Signal()
        self.refresh_done = Signal()

        self.refresh_interval = int(refresh_rate * 1e-3 * 1e9)  # Convert ms to ns
        self.tRFC = tRFC

        # Internal signals
        self.counter = Signal(32)
        self.refresh_in_progress = Signal()
        self.refresh_counters = Array([Signal(32) for _ in range(bank_groups * banks_per_group)])

        # Add refresh logic
        self.sync += [
            If(self.refresh,
                self.refresh_in_progress.eq(1),
                self.counter.eq(0)
            ).Elif(self.refresh_in_progress,
                If(self.counter >= self.tRFC,
                    self.refresh_in_progress.eq(0),
                    self.refresh_done.eq(1)
                ).Else(
                    self.counter.eq(self.counter + 1)
                )
            ).Else(
                self.counter.eq(self.counter + 1),
                If(self.counter >= self.refresh_interval,
                    self.refresh_needed.eq(1)
                ),
                If(self.refresh_done,
                    self.refresh_needed.eq(0),
                    self.refresh_done.eq(0)
                )
            )
        ]