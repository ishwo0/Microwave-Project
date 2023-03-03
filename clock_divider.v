`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2022 01:08:32 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider #(parameter div_value = 1)( // make div_value global
    input wire clk, // 100MHz
    output reg divided_clk = 0// 25MHz
);

// division_value = 100MHz / (2*desired Frequency) - 1
// counter
integer counter_value = 0; // 32 bit wide reg bus

always @(posedge clk) // sensitivity list // timing edge 0-1
    begin
        // keep counting until div_value
        if(counter_value == div_value)
            counter_value <= 0; // reset value
        else
            counter_value <= counter_value + 1; // count up
    end

// dividde clock
always @(posedge clk)
    begin
        if(counter_value == div_value)
            divided_clk <= ~divided_clk; // flip the signal
        else
            divided_clk <= divided_clk; // store value
    end

endmodule
