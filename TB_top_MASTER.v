`timescale 1ns / 1ps

module TB_top_MASTER(
    );
    
reg sys_clk;
reg sys_rst;
reg btn_up;
reg btn_dwn;
reg btn_start;
reg rx;
reg [5:0] load_minutes;
reg [5:0] load_seconds;
wire [7:0] AN;
wire [6:0] display;
wire DP;
wire [15:0] LED;
wire start;
wire idle;
wire Hsynq;
wire Vsynq;
wire [3:0] Red;
wire [3:0] Green;
wire [3:0] Blue;

   
top_MASTER GEN(
    .sys_clk(sys_clk),
    .sys_rst(sys_rst),
    .btn_up(btn_up),
    .btn_dwn(btn_dwn),
    .btn_start(btn_start),
    .rx(rx),
    .load_minutes(load_minutes), 
    .load_seconds(load_seconds),   
    .AN(AN),
    .display(display),
    .DP(DP),    
    .LED(LED),
    .start(start),
    .idle(idle),
    .Hsynq(Hsynq),
    .Vsynq(Vsynq),
    .Red(Red),
    .Green(Green),
    .Blue(Blue)
    );    
    
    
initial begin
sys_clk = 0;
sys_rst = 1;
btn_up = 0;
btn_dwn = 0;
btn_start = 0;
rx = 1;
load_minutes = 6'd0;
load_seconds = 6'd2;
end    
    
always    
    #5 sys_clk = ~sys_clk;
    
initial begin
#5
sys_rst = 0;
#1000000
btn_up = 1;
#30000000
btn_up = 0;
#1000000
btn_up = 1;
#30000000
btn_up = 0;
#1000000
btn_up = 1;
#30000000
btn_up = 0;
#1000000
btn_dwn = 1;
#30000000
btn_dwn = 0;
#1000000
btn_dwn = 1;
#30000000
btn_dwn = 0;
#1000000
btn_dwn = 1;
#30000000
btn_dwn = 0;
#1000000
btn_dwn = 1;
#30000000
btn_dwn = 0;
#1000000
btn_dwn = 1;
#30000000
btn_dwn = 0;
#30000000
btn_start = 1;
#30000000
btn_start = 0;
end    
endmodule
