from migen import *
from migen.genlib.roundrobin import RoundRobin

class AccessArbitration(Module):
    def __init__(self, num_requestors):
        if num_requestors <= 0:
            raise ValueError("num_requestors must be a positive integer")
        
        self.requests = Signal(num_requestors)
        self.grant = Signal(num_requestors)
        self.arbiter = RoundRobin(num_requestors)
        self.submodules += self.arbiter

        self.comb += [
            self.arbiter.request.eq(self.requests),
            self.grant.eq(self.arbiter.grant)
        ]