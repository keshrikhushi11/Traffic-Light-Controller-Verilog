module traffic_light_controller_tb;

reg clk;
reg rst;
reg emergency;

wire [2:0] highway;
wire [2:0] side_road;
wire [1:0] state;
wire [3:0] count;

// DUT INSTANTIATION
traffic_light_controller dut(
    .clk(clk),
    .rst(rst),
    .emergency(emergency),
    .highway(highway),
    .side_road(side_road),
    .state(state),
    .count(count)
);

// CLOCK GENERATION
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// VCD FILE
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, traffic_light_controller_tb);
end

// MONITOR OUTPUT
initial begin
    $display("TIME\tCLK\tRST\tEMERGENCY\tSTATE\tCOUNT\tHIGHWAY\tSIDE");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%d\t%b\t%b",
        $time, clk, rst, emergency, state, count, highway, side_road);
end

// TEST SEQUENCE
initial begin
    // INITIAL VALUES
    rst = 1;
    emergency = 0;
    // RESET ACTIVE
    #10;
    rst = 0;
    // NORMAL OPERATION
    #100;
    // EMERGENCY ON
    emergency = 1;
    #20;
    // EMERGENCY OFF
    emergency = 0;
    // CONTINUE NORMAL OPERATION
    #100;
    $finish;
end

endmodule