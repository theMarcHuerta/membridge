from migen import *

class ECCDecoder(Module):
    def __init__(self, data_width):
        self.data_in = Signal(data_width + 8)  # Assuming 8-bit ECC
        self.data_out = Signal(data_width)
        self.error_detected = Signal()

        # Simple parity-based ECC decoding (for demonstration purposes)
        parity = Signal(8)
        self.comb += [
            self.data_out.eq(self.data_in[:data_width]),
            parity.eq(reduce(lambda x, y: x ^ y, [self.data_in[i] for i in range(data_width)])),
            self.error_detected.eq(parity != self.data_in[data_width:])
        ]