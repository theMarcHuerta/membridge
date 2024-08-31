`timescale 1ns / 1ps

module DDR5_Memory_Controller_TB();

    reg clk;
    reg reset;
    reg [31:0] system_bus;
    wire memory_interface_ready;

    // Instantiate the DDR5 Memory Controller
    DDR5_Memory_Controller dut (
        .clk(clk),
        .reset(reset),
        .system_bus(system_bus),
        .memory_interface_ready(memory_interface_ready)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;  // 100MHz clock
    end

    // Scoreboard
    reg [63:0] expected_data;
    reg [63:0] actual_data;

    // Test scenario
    initial begin
        clk = 0;
        reset = 1;
        system_bus = 32'h0;

        #100 reset = 0;

        // Test case 1: Write operation
        write_data(32'h00001000, 64'hABCD_1234_5678_90EF);

        // Test case 2: Read operation
        read_data(32'h00001000);

        // Test case 3: Multiple writes
        repeat(5) begin
            write_data($random, {$random, $random});
        end

        // Test case 4: Read after multiple writes
        read_data(32'h00001000);

        #1000 $finish;
    end

    // Task for write operation
    task write_data(input [31:0] address, input [63:0] data);
        begin
            @(posedge clk);
            system_bus = {4'b0011, address[27:0]};  // Write command
            @(posedge clk);
            system_bus = data[31:0];
            @(posedge clk);
            system_bus = data[63:32];
            @(posedge clk);
            system_bus = 32'h0;  // End of transaction
            expected_data = data;
        end
    endtask

    // Task for read operation
    task read_data(input [31:0] address);
        begin
            @(posedge clk);
            system_bus = {4'b0010, address[27:0]};  // Read command
            @(posedge clk);
            system_bus = 32'h0;  // End of transaction
            repeat(10) @(posedge clk);
            actual_data = {dut.data_buffer.data_out, dut.data_buffer.data_out};
            check_data();
        end
    endtask

    // Task to check read data
    task check_data();
        begin
            if (actual_data === expected_data)
                $display("Data match: Expected %h, Got %h", expected_data, actual_data);
            else
                $error("Data mismatch: Expected %h, Got %h", expected_data, actual_data);
        end
    endtask

    // Assertions
    property cmd_to_ready_delay;
        @(posedge clk) $rose(system_bus[31:28] != 0) |-> ##[1:20] memory_interface_ready;
    endproperty

    assert property (cmd_to_ready_delay)
        else $error("Memory interface not ready within expected time after command");

    // Monitor
    always @(posedge clk) begin
        if (memory_interface_ready)
            $display("Time %t: Memory interface ready", $time);
    end

endmodule