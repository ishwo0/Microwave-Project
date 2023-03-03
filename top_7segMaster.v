`timescale 1ns / 1ps

module top_7segMaster(
    input sys_clk,
    input [1:0] mode,
    input rst,
    input [5:0] load_minutes, //= 6'b000010; // using load_minutes = 2 and load_seconds = 30 for testing
    input [5:0] load_seconds, //= 6'b011110; // using load_minutes = 2 and load_seconds = 30 for testing
    input start,
    input idle,
    output [7:0] AN,
    output [6:0] display,
    output DP,
    output timerEnd
    );
    
  
wire clk_1Hz, clk_400Hz, clk_5Hz;
wire [2:0] sel;
wire [5:0] minutes, seconds;
wire [3:0] min_D1, min_D0, sec_D1, sec_D0;
wire [6:0] display_min_D1, display_min_D0, display_sec_D1, display_sec_D0;
wire [6:0] display_words_3, display_words_2, display_words_1, display_words_0;
    
// slows down the system clock to the three frequencues (1 Hz, 400 Hz, and 5 Hz)
clk_frequencyChange slowerClock(sys_clk, clk_1Hz, clk_400Hz, clk_5Hz);

// is a select/refresh counter for the anode controller                                                        
counter_refresh refreshCounter(clk_400Hz, sel); // counts up from 0-3 using the 400 Hz clock

// counts down the minutes and seconds of the timer using the 1 Hz clock
minSecDownCounter timerCounter(start, rst, clk_1Hz, load_minutes, load_seconds, minutes, seconds, timerEnd); // begins counting down once start button is pushed

// separates the digits the timer's minutes and seconds
digitSeparator timerDigits(minutes, seconds, min_D1, min_D0, sec_D1, sec_D0);

// the 7 seg display patterns for the minutes and seconds of the timer                                                   
display_7seg_timer timerDisplay(min_D1, min_D0, sec_D1, sec_D0, display_min_D1, display_min_D0, display_sec_D1, display_sec_D0);

// the 7 seg display patterns for the modes
display_7seg_words wordsDisplay(mode, display_words_3, display_words_2, display_words_1, display_words_0);

// decides which 7 seg pattern to display and where based on the refresh counter (2-bit, 400 Hz clk counter)
anodeController timerAnode(sys_clk, sel, display_min_D1, display_min_D0, display_sec_D1, display_sec_D0,
         display_words_3, display_words_2, display_words_1, display_words_0, AN, DP, display);

endmodule
