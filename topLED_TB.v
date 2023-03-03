`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2022 06:16:51 PM
// Design Name: 
// Module Name: topLED_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module topLED_TB(
    ); //this is neglecting the clock divider
    reg clk, reset, en, start, idle;
    reg [1:0]mode;
    wire [3:0]I;
    wire [15:0]LED;
    UDAltCounter tb(.Clk(clk),.reset(reset),.en(en),.count(I));    
    foursixteendecoder D(.I(I),.mode(mode),.start(start),.idle(idle),.LED(LED));
    initial begin
    clk = 1;
    end
    always #0.5 clk = ~clk;
    initial begin
    reset = 1; en = 1; mode = 2'b01; start = 0; idle = 0;
    #4 reset = 0;
    #5 start = 1;
    #20 start = 0; mode = 2'b10;
    #5 start = 1;
    #20 start = 0; mode = 2'b11;
    #5 start = 1;
    #15 $finish;
    end
endmodule
