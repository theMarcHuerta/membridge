from migen import *
from collections import deque

class CommandScheduler(Module):
    def __init__(self, queue_depth, scheduling_policy):
        self.clk = Signal()
        self.rst = Signal()
        self.cmd_in = Signal(4)  # Command type input
        self.cmd_addr = Signal(32)  # Address for the command
        self.cmd_valid = Signal()  # Input command valid signal
        self.cmd_ready = Signal()  # Output signal indicating a command is ready
        self.cmd_type = Signal(4)  # Output command type
        self.cmd_addr_out = Signal(32)  # Output command address
        self.cmd_executed = Signal()  # Signal indicating a command has been executed
        
        self.row_buffer_hit = Signal()  # New signal for FR-FCFS
        self.bank_group = Signal(2)  # Assuming 4 bank groups
        self.bank = Signal(2)  # Assuming 4 banks per group
        
        self.queue = Array([Array([deque(maxlen=queue_depth) for _ in range(4)]) for _ in range(4)])
        self.scheduling_policy = scheduling_policy
        
    def elaborate(self, platform):
        m = Module()
        
        # Helper function to find the highest priority command
        def find_priority_cmd():
            for bg in range(4):
                for b in range(4):
                    if self.queue[bg][b]:
                        if self.scheduling_policy == 'FR-FCFS':
                            # Prioritize row buffer hits
                            for cmd in self.queue[bg][b]:
                                if cmd[2]:  # Row buffer hit
                                    return bg, b, cmd
                        # If no row buffer hits or FCFS, return the oldest command
                        return bg, b, self.queue[bg][b][0]
            return None, None, None

        m.d.sync += [
            If(self.rst,
                [bg.clear() for bg in self.queue for b in bg],
                self.cmd_ready.eq(0)
            ).Elif(self.cmd_valid,
                self.queue[self.bank_group][self.bank].append((self.cmd_in, self.cmd_addr, self.row_buffer_hit)),
                self.cmd_ready.eq(0)
            ).Else(
                # Fix: Assign priority_cmd before the If statement
                priority_cmd.eq(find_priority_cmd()),
                If(priority_cmd[2] is not None,
                    self.cmd_type.eq(priority_cmd[2][0]),
                    self.cmd_addr_out.eq(priority_cmd[2][1]),
                    self.bank_group.eq(priority_cmd[0]),
                    self.bank.eq(priority_cmd[1]),
                    self.cmd_ready.eq(1)
                ).Else(
                    self.cmd_ready.eq(0)
                )
            )
        ]
        
        m.d.sync += [
            If(self.cmd_executed,
                self.queue[self.bank_group][self.bank].popleft()
            )
        ]
        
        return m