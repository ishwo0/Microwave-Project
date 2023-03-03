`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2022 01:26:29 PM
// Design Name: 
// Module Name: TB_anodeController
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


module TB_anodeController(
    );
    
    reg clk;
    reg [2:0] sel;
    reg [6:0] display_min_D1, display_min_D0, display_sec_D1, display_sec_D0;
    reg [6:0] display_words_3, display_words_2, display_words_1, display_words_0;
    wire [7:0] AN;
    wire DP;
    wire [6:0] display;

anodeController GEN(clk, sel, display_min_D1, display_min_D0, display_sec_D1, display_sec_D0,
         display_words_3, display_words_2, display_words_1, display_words_0, AN, DP, display);


initial
begin
clk = 0;
sel = 0;
display_min_D1 = 0;
display_min_D0 = 0;
display_sec_D1 = 0;
display_sec_D1 = 0;
display_words_3 = 0;
display_words_2 = 0;
display_words_1 = 0;
display_words_0 = 0;
end  

always
begin
    #5 clk = clk;
end   

initial
begin
#20
display_min_D1 = 7'b1000000;
display_min_D0 = 7'b1111001;
display_sec_D1 = 7'b0010010;
display_sec_D0 = 7'b0010010;
display_words_3 = 7'b1000111;
display_words_2 = 7'b0100011;
display_words_1 = 7'b1111111;
display_words_0 = 7'b1111111;
#20
sel = 3'b000;
#20
sel = 3'b001;
#20
sel = 3'b010;
#20
sel = 3'b011;
#20
sel = 3'b100;
#20
sel = 3'b101;
#20
sel = 3'b110;
#20
sel = 3'b111;
#20

$finish;
end

endmodule
