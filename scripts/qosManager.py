from migen import *

class QoSManager(Module):
    def __init__(self, num_requestors, qos_policy):
        # Input ports
        self.cmd_executed = Signal()
        self.request_completed = Signal()
        self.rst = Signal()  # Add reset signal

        # Output ports
        self.current_priority = Signal(max=num_requestors)
        self.grant = Signal(num_requestors)  # Add grant signal
        self.qos_priority = Signal(max=num_requestors)  # Add qos_priority signal

        # Internal signals
        self.request_counters = Array([Signal(32) for _ in range(num_requestors)])

        # Add QoS logic
        self.sync += [
            If(self.rst,
                self.current_priority.eq(0),
                [counter.eq(0) for counter in self.request_counters]
            ).Elif(self.request_completed,
                If(qos_policy == 'round_robin',
                    # Use bitwise AND for modulo operation
                    self.current_priority.eq((self.current_priority + 1) & (num_requestors - 1))
                ).Elif(qos_policy == 'weighted',
                    # Implement weighted priority logic here
                    # For simplicity, we'll just use round-robin for now
                    self.current_priority.eq((self.current_priority + 1) & (num_requestors - 1))
                )
            )
        ]

        self.comb += [
            self.grant.eq(1 << self.current_priority),
            self.qos_priority.eq(self.current_priority)  # Assign current_priority to qos_priority
        ]