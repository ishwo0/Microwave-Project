`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2022 09:19:47 PM
// Design Name: 
// Module Name: digitSeparator
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

// separates the digits the timer's minutes and seconds
module digitSeparator(minutes, seconds, min_D1, min_D0, sec_D1, sec_D0);
input [5:0] minutes, seconds;
output reg [3:0] min_D1 = 0, min_D0 = 0, sec_D1 = 0, sec_D0 = 0;
    
always@(minutes) // at every minute
    begin
        min_D1 = minutes / 10; // separate ten's place digit into one value
        min_D0 = minutes % 10; // separate one's place digit into another
    end
always@(seconds) // at every second
    begin
    sec_D1 = seconds / 10; // separate ten's place digit into one value
    sec_D0 = seconds % 10; // separate one's place digit into another
    end
endmodule