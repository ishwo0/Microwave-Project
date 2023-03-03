`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2022 06:04:33 PM
// Design Name: 
// Module Name: AltCountTB
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


module AltCountTB(

    );
    reg Clk,reset,en;
    wire [3:0]count;
    UDAltCounter tb(.Clk(Clk),.reset(reset),.en(en),.count(count));
    initial begin
    Clk = 1;
    end
    always #5 Clk = ~Clk;
    initial begin
    reset = 1; en = 1;
    #3 reset = 0;
    #1000 $finish;
    end
endmodule
