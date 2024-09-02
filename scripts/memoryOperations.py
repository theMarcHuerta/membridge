from migen import *

class MemoryOperations(Module):
    def __init__(self, parent):
        self.parent = parent

    def elaborate(self, platform):
        m = Module()
        m.sync += [
            If(self.parent.rst,  # Reset condition
                self.parent.buffer_index.eq(0),  # Reset buffer index
                self.parent.data_in_fifo.din.eq(0),  # Clear data in FIFO
                self.parent.data_in_fifo.we.eq(0),  # Disable write enable
                self.parent.data_out_fifo.re.eq(0)  # Disable read enable
            ).Elif(self.parent.ready,  # If ready signal is high
                If(self.parent.mem_read,  # If read operation
                    self.parent.buffer[self.parent.buffer_index].eq(self.parent.mem_array[self.parent.address]),  # Load data from memory to buffer
                    self.parent.data_out_fifo.din.eq(self.parent.mem_array[self.parent.address]),  # Load data into output FIFO
                    self.parent.data_out_fifo.we.eq(1)  # Write enable for output FIFO
                ).Elif(self.parent.mem_write,  # If write operation
                    self.parent.mem_array[self.parent.address].eq(self.parent.buffer[self.parent.buffer_index]),  # Write buffer data to memory
                    self.parent.data_in_fifo.din.eq(self.parent.data_in),  # Load input data into FIFO
                    self.parent.data_in_fifo.we.eq(1)  # Write enable for input FIFO
                )
            )
        ]
        return m