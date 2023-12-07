`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2022 09:21:02 PM
// Design Name: 
// Module Name: display_7seg_timer
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

// the 7 seg display patterns for the minutes and seconds of the timer
module display_7seg_timer(min_D1, min_D0, sec_D1, sec_D0, display_min_D1, display_min_D0, display_sec_D1, display_sec_D0);
input [3:0] min_D1, min_D0, sec_D1, sec_D0;
output reg [6:0] display_min_D1 = 0, display_min_D0 = 0, display_sec_D1 = 0, display_sec_D0 = 0;
always @(min_D1) // Changes the 7seg display for every second (at the ones place)
    begin
        case(min_D1)
            4'b0000: display_min_D1 <= 7'b1000000; //0
            4'b0001: display_min_D1 <= 7'b1111001; //1
            4'b0010: display_min_D1 <= 7'b0100100; //2
            4'b0011: display_min_D1 <= 7'b0110000; //3
            4'b0100: display_min_D1 <= 7'b0011001; //4
            4'b0101: display_min_D1 <= 7'b0010010; //5
            4'b0110: display_min_D1 <= 7'b0000010; //6
            4'b0111: display_min_D1 <= 7'b1111000; //7
            4'b1000: display_min_D1 <= 7'b0000000; //8
            4'b1001: display_min_D1 <= 7'b0010000; //9
            default: display_min_D1 <= 7'dz;
        endcase        
    end
always @(min_D0) // Changes the 7seg display for every second (at the tens place)
    begin
        case(min_D0)
            4'b0000: display_min_D0 <= 7'b1000000; //0
            4'b0001: display_min_D0 <= 7'b1111001; //1
            4'b0010: display_min_D0 <= 7'b0100100; //2
            4'b0011: display_min_D0 <= 7'b0110000; //3
            4'b0100: display_min_D0 <= 7'b0011001; //4
            4'b0101: display_min_D0 <= 7'b0010010; //5
            4'b0110: display_min_D0 <= 7'b0000010; //6
            4'b0111: display_min_D0 <= 7'b1111000; //7
            4'b1000: display_min_D0 <= 7'b0000000; //8
            4'b1001: display_min_D0 <= 7'b0010000; //9
            default: display_min_D0 <= 7'dz;
        endcase        
    end
always @(sec_D1) // Changes the 7seg display for every minute (at the ones place)
    begin
        case(sec_D1)
            4'b0000: display_sec_D1 <= 7'b1000000; //0
            4'b0001: display_sec_D1 <= 7'b1111001; //1
            4'b0010: display_sec_D1 <= 7'b0100100; //2
            4'b0011: display_sec_D1 <= 7'b0110000; //3
            4'b0100: display_sec_D1 <= 7'b0011001; //4
            4'b0101: display_sec_D1 <= 7'b0010010; //5
            4'b0110: display_sec_D1 <= 7'b0000010; //6
            4'b0111: display_sec_D1 <= 7'b1111000; //7
            4'b1000: display_sec_D1 <= 7'b0000000; //8
            4'b1001: display_sec_D1 <= 7'b0010000; //9
            default: display_sec_D1 <= 7'dz;
        endcase        
    end
always @(sec_D0) // Changes the 7seg display for every minute (at the tens place)
    begin
        case(sec_D0)
            4'b0000: display_sec_D0 <= 7'b1000000; //0
            4'b0001: display_sec_D0 <= 7'b1111001; //1
            4'b0010: display_sec_D0 <= 7'b0100100; //2
            4'b0011: display_sec_D0 <= 7'b0110000; //3
            4'b0100: display_sec_D0 <= 7'b0011001; //4
            4'b0101: display_sec_D0 <= 7'b0010010; //5
            4'b0110: display_sec_D0 <= 7'b0000010; //6
            4'b0111: display_sec_D0 <= 7'b1111000; //7
            4'b1000: display_sec_D0 <= 7'b0000000; //8
            4'b1001: display_sec_D0 <= 7'b0010000; //9
            default: display_sec_D0 <= 7'dz;
        endcase        
    end
endmodule