`timescale 1ns / 1ps

module top_LEDMaster(
    input sys_clk, sys_rst,
    input mini_rst,
    input start, idle,
    input [1:0]mode, //three possible modes: low (2'b01), normal (2'b10), and high (2'b11)
    output [15:0]LED //the 16 LEDs
    );
    wire [4:0]compareSW; //will be either 5'b10110, 5'b10101, or 5'b10100 (speeds at the 22nd, 21st, and 20th bits respectively)
    wire out_clk;
    led_modeSelect A(.mode(mode),.compareNUM(compareSW)); //selects the 3 speeds based off mode
    ClockManage B(.sys_clk(sys_clk),.rst(sys_rst),.en(1'b1),.sw(compareSW),.out_clk(out_clk)); //chosen speed manages the speed of the clock
    wire [3:0]i;
    UDAltCounter C(.Clk(out_clk),.reset(mini_rst),.en(1'b1),.count(i));
    foursixteendecoder D(.I(i),.mode(mode),.start(start),.idle(idle),.LED(LED));
endmodule
