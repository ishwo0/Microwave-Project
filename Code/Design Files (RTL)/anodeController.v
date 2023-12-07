`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2022 09:36:59 PM
// Design Name: 
// Module Name: anodeController
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

// decides which 7 seg pattern to display and where based on the refresh counter (2-bit, 400 Hz clk counter)
module anodeController(clk, sel, display_min_D1, display_min_D0, display_sec_D1, display_sec_D0,
         display_words_3, display_words_2, display_words_1, display_words_0, AN, DP, display);
input clk;
input [2:0] sel;
input [6:0] display_min_D1, display_min_D0, display_sec_D1, display_sec_D0;
input [6:0] display_words_3, display_words_2, display_words_1, display_words_0;
output reg [7:0] AN = 0;
output reg DP = 0;
output reg [6:0] display = 0;
    
reg [7:0] AN1, AN2, AN3, AN4, AN5, AN6, AN7, AN8;   // The eight segments that are to be lit up

always@(sel)
    begin
        AN1 = 8'b11111110; // sets a scenario for each individual 7 seg to be lit up
        AN2 = 8'b11111101;
        AN3 = 8'b11111011;
        AN4 = 8'b11110111;
        AN5 = 8'b11101111;
        AN6 = 8'b11011111;
        AN7 = 8'b10111111;
        AN8 = 8'b01111111;
            
        case(sel)
            3'b000: // if counter is at 0
                begin
                    display <= display_sec_D0; // select 1st pattern
                    AN <= AN1; // light up 1st 7 seg display
                end
            3'b001: // if counter is at 1
                begin
                    display <= display_sec_D1; // select 2nd pattern
                    AN <= AN2; // light up 2nd 7seg display
                end
            3'b010: // if counter is at 2
                begin
                    display <= display_min_D0; // select 3rd pattern
                    AN <= AN3; // light up 3rd 7seg display
                end
            3'b011: // if counter is at 3
                begin
                    display <= display_min_D1; // select 4th pattern
                    AN <= AN4; // light up 4th 7seg display
                end

            3'b100: // if counter is at 4
                begin
                    display <= display_words_0; // select 5th pattern
                    AN <= AN5; // light up 5th 7seg display
                end
            3'b101: // if counter is at 5
                begin
                    display <= display_words_1; // select 6th pattern
                    AN <= AN6; // light up 6th 7seg display
                end
            3'b110: // if counter is at 6
                begin
                    display <= display_words_2; // select 7th pattern
                    AN <= AN7; // light up 7th 7seg display
                end
            3'b111: // if counter is at 7
                begin
                    display <= display_words_3; // select 8th pattern
                    AN <= AN8; // light up 8th 7seg display
                end
            default:
                begin
                    display <= 7'b0111111; // otherwise display '-' and this
                    AN <= 8'b01010101; // flipping pattern
                end
        endcase
    end
endmodule