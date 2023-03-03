`timescale 1ns / 1ps

module TB_btn_startButton(
    );

reg clk;
reg rst;    
reg btn_start;
reg timerEnd;
wire start;
wire idle;    

btn_startButton GEN(
    .clk(clk),
    .rst(rst),
    .btn_start(btn_start),
    .timerEnd(timerEnd),
    .start(start),
    .idle(idle)
    );
    
initial begin
clk = 0;
rst = 1;
btn_start = 0;
timerEnd = 0;
end

always
    #5 clk = ~clk;
    
initial begin    
rst = 0;
#50
btn_start = 1;
#5
btn_start = 0;
#50
btn_start = 1;
#5
btn_start = 0;
#50
btn_start = 1;
#5
btn_start = 0;
#100
timerEnd = 1;
#50
btn_start = 1;
#5
btn_start = 0;
end    

endmodule
