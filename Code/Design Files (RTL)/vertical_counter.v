`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2022 01:08:32 PM
// Design Name: 
// Module Name: vertical_counter
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


module vertical_counter(
    input clk_25MHz,
    input enable_V_Counter,
    output reg [15:0] V_Count_Value = 0
    );
    
always @(posedge clk_25MHz)
    begin
    if (enable_V_Counter == 1'b1)
        begin
            if(V_Count_Value < 524) // keep counting until 525
                V_Count_Value <= V_Count_Value + 1;
            else
                V_Count_Value <= 0; // reset Vertical counter
        end
    end
endmodule
