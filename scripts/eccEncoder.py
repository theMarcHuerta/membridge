from migen import *

class ECCEncoder(Module):
    def __init__(self, data_width):
        self.data_in = Signal(data_width)
        self.data_out = Signal(data_width + 8)  # Assuming 8-bit ECC

        # Simple parity-based ECC encoding (for demonstration purposes)
        parity = Signal(8)
        self.comb += [
            parity.eq(reduce(lambda x, y: x ^ y, [self.data_in[i] for i in range(data_width)])),
            self.data_out.eq(Cat(self.data_in, parity))
        ]