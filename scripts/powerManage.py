from migen import *

class PowerManagement(Module):
    def __init__(self, power_down_modes, deep_power_down_threshold):
        self.clk = Signal()
        self.rst = Signal()
        self.cmd_decoded = Signal(4)
        self.power_state = Signal(2)
        self.enter_power_down = Signal()
        self.power_down_entered = Signal()
        self.power_down_ready = Signal()
        self.temperature = Signal(8)  # 8-bit temperature reading
        self.low_power_mode = Signal()
        
        self.modes = power_down_modes
        self.deep_power_down_threshold = deep_power_down_threshold
        
    def elaborate(self, platform):
        m = Module()
        
        idle_counter = Signal(32)
        idle_threshold = 1000  # Example threshold, adjust as needed
        
        m.d.sync += [
            If(self.rst,
                self.power_state.eq(0),
                idle_counter.eq(0),
                self.power_down_ready.eq(0),
                self.power_down_entered.eq(0),
                self.low_power_mode.eq(0)
            ).Elif(self.cmd_decoded != 0,
                idle_counter.eq(0),
                self.power_down_ready.eq(0)
            ).Elif(idle_counter < idle_threshold,
                idle_counter.eq(idle_counter + 1)
            ).Elif(idle_counter == idle_threshold,
                self.power_down_ready.eq(1)
            )
        ]
        
        with m.FSM(name="power_state"):
            with m.State("ACTIVE"):
                with m.If(self.enter_power_down & self.power_down_ready):
                    m.next = "POWER_DOWN"
                    m.d.sync += self.power_down_entered.eq(1)
            
            with m.State("POWER_DOWN"):
                with m.If(self.cmd_decoded != 0):
                    m.next = "ACTIVE"
                    m.d.sync += self.power_down_entered.eq(0)
                with m.Elif(self.temperature >= self.deep_power_down_threshold):
                    m.next = "DEEP_POWER_DOWN"
            
            with m.State("DEEP_POWER_DOWN"):
                m.d.comb += self.low_power_mode.eq(1)
                with m.If(self.cmd_decoded != 0):
                    m.next = "ACTIVE"
                    m.d.sync += [
                        self.power_down_entered.eq(0),
                        self.low_power_mode.eq(0)
                    ]
        
        return m