`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2022 09:18:15 PM
// Design Name: 
// Module Name: minSecDownCounter
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

// counts down the minutes and seconds of the timer using the 1 Hz clock
module minSecDownCounter(start, rst, clk_1Hz, load_minutes, load_seconds, minutes, seconds, timerEnd);
input start; // if high, enables the counter to start counting
input rst; // button that resets the minutes and seconds to the laoded values (and sets timerEnd to 0)
input clk_1Hz;
input [5:0] load_minutes, load_seconds; // the minutes and seconds given by the switches
output reg [5:0] minutes = 0, seconds = 0;
output reg timerEnd = 0;

integer i = 0; // used to check if the microwave should be idle

always @(posedge clk_1Hz)
    begin
    timerEnd = 0;
        if(rst)
            begin
                timerEnd = 0;
                minutes = load_minutes;
                seconds = load_seconds;
            end
        if(i == 0 && timerEnd == 0)
            begin
                minutes = load_minutes;
                seconds = load_seconds;
            end
        if(start) // if start is high
        begin
        if(minutes == 0 && seconds == 0) // if the counter reaches 0 minutes and 0 seconds (heating complete)
            begin
                minutes = minutes; // no longer decrementing
                seconds = seconds; // no longer decrementing
                i = 0;
                timerEnd = 1; // sends indicator that the microwave is done heating
            end
        else
            begin  
                if(seconds == 6'b000000) // if the counter reaches 0 seconds
                    begin
                        seconds <= 6'b111011; // reset seconds to 59 seconds
                        i = i + 1;
                        if(minutes == 6'b000000) // of the counter reaches 0 minutes
                            minutes = minutes; // no longer decrementing
                        else    
                            minutes <= minutes - 1; // decrement minutes by 1
                    end
                else
                    seconds = seconds - 1; // decrement seconds by 1
                    i = i + 1;
            end
            end            
    end
endmodule