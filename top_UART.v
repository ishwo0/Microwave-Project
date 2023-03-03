`timescale 1ns / 1ps

module top_UART#(parameter DBIT = 8,        //data bits
                           SB_TICK = 16     //stop bit ticks
                                        )
    (
    input clk,
    input rst,
    
    //receiver ports
    output [DBIT - 1:0] r_data,
    input rd_uart,
    input rx,
    
    //transmitter ports
//    input [DBIT - 1:0] w_data,
//    input wr_uart,
//    output tx_full,
//    output tx,
    
    //baud rate 
    input [10:0] TIMER_FINAL_VALUE
    );
    
//timer as baud rate generator
wire tick;
timer_input #(.BITS(11)) baud_rate_generator (
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .FINAL_VALUE(TIMER_FINAL_VALUE),
    .done(tick)
    );
    
//receiver
wire rx_done_tick;
wire [DBIT - 1:0] rx_dout;
uart_rx #(.DBIT(DBIT), .SB_TICK(SB_TICK)) receiver(
    .clk(clk),
    .rst(rst),
    .rx(rx),
    .s_tick(tick),
    .rx_done_tick(rx_done_tick),
    .rx_dout(rx_dout)
    );
    
fifo_generator_0 rx_FIFO (
  .clk(clk),      // input wire clk
  .srst(rst),    // input wire srst
  .din(rx_dout),      // input wire [7 : 0] din
  .wr_en(rx_done_tick),  // input wire wr_en
  .rd_en(rd_uart),  // input wire rd_en
  .dout(r_data),    // output wire [7 : 0] dout
  .full(),    // output wire full
  .empty(rx_empty)  // output wire empty
);    
    
    
    
//wire tx_fifo_empty, tx_done_tick;
//wire [DBIT - 1:0] tx_din;
//uart_tx #(.DBIT(DBIT), .SB_TICK(SB_TICK)) transmitter(
//    .clk(clk),
//    .rst(rst),
//    .tx_start(~tx_fifo_empty),
//    .s_tick(tick),
//    .tx_din(tx_din),
//    .tx_done_tick(tx_done_tick),
//    .tx(tx)
//    );
   
//fifo_generator_0 tx_FIFO (
//  .clk(clk),      // input wire clk
//  .srst(rst),    // input wire srst
//  .din(w_data),      // input wire [7 : 0] din
//  .wr_en(wr_uart),  // input wire wr_en
//  .rd_en(rx_done_tick),  // input wire rd_en
//  .dout(tx_din),    // output wire [7 : 0] dout
//  .full(tx_full),    // output wire full
//  .empty(tx_fifo_empty)  // output wire empty
//);         

endmodule
