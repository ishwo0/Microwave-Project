`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2022 01:08:32 PM
// Design Name: 
// Module Name: horizontal_counter
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


module horizontal_counter(
    input clk_25MHz,
    output reg enable_V_Counter = 0,
    output reg [15:0] H_Count_Value = 0
    );
    
always @(posedge clk_25MHz)
    begin
        if(H_Count_Value < 799)
            begin
                H_Count_Value <= H_Count_Value + 1;
                enable_V_Counter <= 0; // disable vertical counter
            end
        else
            begin
                H_Count_Value <= 0; // reset Horizontal counter
                enable_V_Counter <= 1; // trigger V counter
            end
    end
    
endmodule
