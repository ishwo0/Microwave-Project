`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2022 12:01:40 PM
// Design Name: 
// Module Name: debouncer_delayed
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


module debouncer_delayed(
    input clk, rst,
    input noisy,
    output debounced
    );
    
wire timer_done, timer_reset;    
    
debouncer_delayed_fsm FSM(
    .clk(clk),
    .rst(rst),
    .noisy(noisy),
    .timer_done(timer_done),
    .timer_reset(timer_reset),
    .debounced(debounced)
    );    
    
timer_parameter #(.FINAL_VALUE(1_999_999)) T(
    .clk(clk),
    .rst(timer_reset),
    .en(~timer_reset),
    .done(timer_done)
    );    
    
    
    
endmodule
