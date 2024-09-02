from migen import *

class AddressMapper(Module):
    def __init__(self, row_bits, col_bits, bank_bits):
        self.addr_in = Signal(32)
        self.row_addr = Signal(row_bits)
        self.col_addr = Signal(col_bits)
        self.bank_addr = Signal(bank_bits)

    def elaborate(self, platform):
        m = Module()
        m.comb += [
            self.row_addr.eq(self.addr_in[16:32]),  # Map higher address bits to row address
            self.col_addr.eq(self.addr_in[2:12]),  # Map lower address bits to column address
            self.bank_addr.eq(self.addr_in[12:15])  # Map middle address bits to bank address
        ]
        return m