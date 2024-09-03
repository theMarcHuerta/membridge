from migen import *

class QoSManager(Module):
    def __init__(self, num_requestors, qos_policy):
        self.clk = Signal()
        self.rst = Signal()
        self.request = Signal(num_requestors)
        self.grant = Signal(num_requestors)
        self.current_priority = Signal(max=num_requestors)
        self.request_completed = Signal()
        
        self.qos_policy = qos_policy
        self.num_requestors = num_requestors
        
    def elaborate(self, platform):
        m = Module()
        
        request_counters = Array([Signal(32) for _ in range(self.num_requestors)])
        
        m.d.sync += [
            If(self.rst,
                self.current_priority.eq(0),
                [counter.eq(0) for counter in request_counters]
            ).Elif(self.request_completed,
                If(self.qos_policy == 'round_robin',
                    self.current_priority.eq((self.current_priority + 1) % self.num_requestors)
                ).Elif(self.qos_policy == 'weighted',
                    # Implement weighted priority logic here
                    # For simplicity, we'll just use round-robin for now
                    self.current_priority.eq((self.current_priority + 1) % self.num_requestors)
                )
            )
        ]
        
        m.d.comb += [
            self.grant.eq(1 << self.current_priority)
        ]
        
        return m