`timescale 1ns / 1ps

module top_btnLEDMaster(
    input sys_clk, sys_rst,
    input mini_rst,
    input timerEnd,
    input btn_up,
    input btn_dwn,
    input btn_start,
    input kb_start,
    output [15:0] LED,
    output [1:0] mode,
    output start,
    output idle
    );
    
wire s;
wire i;    
wire [1:0] modes;
assign start = s;
assign idle = i;
assign mode = modes;
    
top_buttonMaster btnMaster(
    .clk(sys_clk),
    .rst(1'b0),
    .timerEnd(timerEnd),
    .btn_up(btn_up),
    .btn_dwn(btn_dwn),
    .btn_start(btn_start),
    .kb_start(kb_start),
    .mode(modes),
    .start(s),
    .idle(i)
    );
    
top_LEDMaster LEDMaster(
    .sys_clk(sys_clk),
    .sys_rst(sys_rst),
    .mini_rst(mini_rst),
    .start(s),
    .mode(modes),
    .LED(LED)
    );
    
    
       
endmodule
