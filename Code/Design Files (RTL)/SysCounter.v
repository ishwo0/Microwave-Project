`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2022 01:02:33 PM
// Design Name: 
// Module Name: SysCounter
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


module SysCounter(
    input Clk,Rst,En,
    output [31:0]count
    );
    reg [31:0]temp = 0;
    always @(posedge Clk)
    begin
    if(Rst)
    temp <= 4'd0;
    else
        if(En)
        temp <= temp + 4'd1;  
    end
    assign count = temp;
endmodule
