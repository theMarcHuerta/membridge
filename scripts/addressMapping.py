from migen import *

class AddressMapper(Module):
    def __init__(self, config):
        self.addr_in = Signal(32)
        self.row_addr = Signal(log2_int(config['rows']))
        self.col_addr = Signal(log2_int(config['columns']))
        self.bank_group_addr = Signal(log2_int(config['bank_groups']))
        self.bank_addr = Signal(log2_int(config['banks_per_group']))
        
        # Add address mapping logic
        if config['address_mapping_scheme'] == 'linear':
            self.comb += [
                self.row_addr.eq(self.addr_in[16:16+log2_int(config['rows'])]),
                self.col_addr.eq(self.addr_in[2:2+log2_int(config['columns'])]),
                self.bank_addr.eq(self.addr_in[12:12+log2_int(config['banks_per_group'])]),
                self.bank_group_addr.eq(self.addr_in[14:14+log2_int(config['bank_groups'])])
            ]
        elif config['address_mapping_scheme'] == 'interleaved':
            self.comb += [
                self.row_addr.eq(Cat(self.addr_in[16:16+log2_int(config['rows'])-3], self.addr_in[2:5])),
                self.col_addr.eq(self.addr_in[5:5+log2_int(config['columns'])]),
                self.bank_addr.eq(self.addr_in[12:12+log2_int(config['banks_per_group'])]),
                self.bank_group_addr.eq(self.addr_in[14:14+log2_int(config['bank_groups'])])
            ]