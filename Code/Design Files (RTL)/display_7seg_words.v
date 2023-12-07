`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2022 03:27:35 AM
// Design Name: 
// Module Name: display_7seg_words
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


module display_7seg_words(mode, display_words_3, display_words_2, display_words_1, display_words_0);
input [1:0] mode;
output reg [6:0] display_words_3, display_words_2, display_words_1, display_words_0 = 0;
    
always @(mode)
    begin
        case(mode)
            2'b01 : display_words_3 = 7'b1000111; // low mode "L"
            2'b10 : display_words_3 = 7'b0111111; // normal mode "-"
            2'b11 : display_words_3 = 7'b0001001; // high mode "H"
            default : display_words_3 = 7'b0111111;
        endcase
    end

always @(mode)
    begin
        case(mode)
            2'b01 : display_words_2 = 7'b0100011; // low mode "o"
            2'b10 : display_words_2 = 7'b0111111; // normal mode "-"
            2'b11 : display_words_2 = 7'b1111010; // high mode "i"
            default : display_words_2 = 7'd0111111;
        endcase
    end

always @(mode)
    begin
        case(mode)
            2'b01 : display_words_1 = 7'b1111111; // low mode " "
            2'b10 : display_words_1 = 7'b1111111; // normal/medium mode " "
            2'b11 : display_words_1 = 7'b1111111; // high mode " "
            default : display_words_1 = 7'd1111111;
        endcase
    end

always @(mode)
    begin
        case(mode)
            2'b01 : display_words_0 = 7'b1111111; // low mode " "
            2'b10 : display_words_0 = 7'b1111111; // normal/medium mode " "
            2'b11 : display_words_0 = 7'b1111111; // high mode " "
            default : display_words_0 = 7'd1111111;
        endcase
    end
     
endmodule