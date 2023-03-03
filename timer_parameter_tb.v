`timescale 1ns / 1ps

module timer_parameter_tb(

    );
    
localparam FINAL_VALUE = 49999;
localparam BITS = $clog2(FINAL_VALUE);    
    
reg clk;
reg rst;
reg en;
wire done;

timer_parameter #(.FINAL_VALUE(FINAL_VALUE)) GEN(
    .clk(clk),
    .rst(rst),
    .en(en),
    .done(done)
    );
    
initial begin
clk = 0;
rst = 1;
en = 0;
end

always         
    #5 clk = ~clk;
    
initial begin
#2 rst = 0;
en = 1;

end    

endmodule
