from migen import *
from migen.genlib.roundrobin import RoundRobin

class AccessArbitration(Module):
    def __init__(self, parent):
        self.parent = parent

    def elaborate(self, platform):
        m = Module()
        arbiter = RoundRobin(4)  # Instantiate a round-robin arbiter for 4 requestors
        m.submodules.arbiter = arbiter  # Add arbiter as submodule
        m.comb += [
            arbiter.request.eq(self.parent.req),  # Connect request signals to arbiter
            self.parent.grant.eq(arbiter.grant)  # Connect arbiter grant signals to grant output
        ]
        return m