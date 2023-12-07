`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2022 08:51:52 PM
// Design Name: 
// Module Name: TB_top_vgaMaster
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


module TB_top_vgaMaster(
    );

reg clk =0;
wire Hsynq;
wire Vsynq;
wire [3:0] Red;
wire [3:0] Green;
wire [3:0] Blue;
    
    top_vgaMaster GEN(
        .clk(clk),
        .Hsynq(Hsynq),
        .Vsynq(Vsynq),
        .Red(Red),
        .Green(Green),
        .Blue(Blue)
        );
   
    
always    
    #5 clk = ~clk;
    
endmodule
