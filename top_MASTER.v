`timescale 1ns / 1ps

module top_MASTER(
    input sys_clk,
    input sys_rst,
    input btn_up,
    input btn_dwn,
    input btn_start,
    input rx,
    input [5:0] load_minutes, //= 6'b000010; // using load_minutes = 2 and load_seconds = 30 for testing
    input [5:0] load_seconds, //= 6'b011110; // using load_minutes = 2 and load_seconds = 30 for testing    
    output [7:0] AN,
    output [6:0] display,
    output DP,    
    output [15:0] LED,
    output start,
    output idle,
    output Hsynq,
    output Vsynq,
    output [3:0] Red,
    output [3:0] Green,
    output [3:0] Blue
    );
    

wire [1:0] modes;
wire timerEnd;
wire s;
wire i;
wire kb_start;
assign start = s;
assign idle = i;
    
top_btnLEDMaster btnLEDMaster(
    .sys_clk(sys_clk), 
    .sys_rst(sys_rst),
    .mini_rst(sys_rst),
    .timerEnd(timerEnd),
    .btn_up(btn_up),
    .btn_dwn(btn_dwn),
    .btn_start(btn_start),
    .kb_start(kb_start),
    .LED(LED),
    .mode(modes),
    .start(s),
    .idle(i)
    );    
    
top_7segMaster ssegMaster(
    .sys_clk(sys_clk),
    .mode(modes),
    .rst(sys_rst),
    .load_minutes(load_minutes), 
    .load_seconds(load_seconds), 
    .start(s),
    .idle(i),
    .AN(AN),
    .display(display),
    .DP(DP),
    .timerEnd(timerEnd)
    );    
    
top_vgaMaster VGAMaster(
    .clk(sys_clk),
    .start(s),
    .idle(i),
    .Hsynq(Hsynq),
    .Vsynq(Vsynq),
    .Red(Red),
    .Green(Green),
    .Blue(Blue)
    );    
    
    
wire tick;
timer_input #(.BITS(11)) baud_rate_generator (
    .clk(sys_clk),
    .rst(sys_rst),
    .en(1'b1),
    .FINAL_VALUE(11'd650),
    .done(tick)
    );    

wire kb_start;    
uart_rx spacebar_receiver(
    .clk(sys_clk),
    .rst(sys_rst),
    .rx(rx),
    .s_tick(tick),
    .rx_done_tick(kb_start),
    .rx_dout()
    );
   
endmodule
