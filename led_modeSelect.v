`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2022 02:19:16 PM
// Design Name: 
// Module Name: led_modeSelect
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

module led_modeSelect(
    input [1:0]mode,
    output reg [4:0]compareNUM
    );
    always @(mode) //determines the speed of the LED decoding
    begin
        case(mode)
        2'b01: compareNUM = 5'b10101; //low, 21st bit
        2'b10: compareNUM = 5'b10100; //normal, 20th bit
        2'b11: compareNUM = 5'b10011; //high, 19th bit
        default: compareNUM = 5'dz;
        endcase
    end
endmodule
