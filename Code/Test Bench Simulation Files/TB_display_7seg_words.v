`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2022 11:12:42 AM
// Design Name: 
// Module Name: TB_display_7seg_words
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


module TB_display_7seg_words(
    );

reg [1:0] mode;
wire [6:0] display_words_3, display_words_2, display_words_1, display_words_0;
    
display_7seg_words GEN(mode, display_words_3, display_words_2, display_words_1, display_words_0);

initial begin
mode = 2'b01;
#20
mode = 2'b10;
#20
mode = 2'b11;
#20;
$finish;
end    

endmodule
