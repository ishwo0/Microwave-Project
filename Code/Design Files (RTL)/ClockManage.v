`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2022 03:10:19 PM
// Design Name: 
// Module Name: ClockManage
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


module ClockManage(
    input sys_clk,rst,en,
    input [4:0]sw,
    output out_clk
    );
    wire [31:0]inClk;
    SysCounter A(.Clk(sys_clk),.Rst(rst),.En(en),.count(inClk));
    MUX32to1 B(.c(inClk),.sw(sw),.o(out_clk));
endmodule
