`timescale 1ns / 1ps

module TB_top_UART(
    );
    reg clk;
    reg rst;
    reg rd_uart;
    reg rx;
    reg [7:0] w_data;
    reg wr_uart;
    reg [10:0] TIMER_FINAL_VALUE;
    wire [7:0] r_data;
    wire rx_empty;
    wire tx_full;
    wire tx;
        
    top_UART GEN(
        .clk(clk),
        .rst(rst),
        .rd_uart(rd_uart),
        .rx(rx),
        .w_data(w_data),
        .wr_uart(wr_uart),
        .TIMER_FINAL_VALUE(TIMER_FINAL_VALUE),
        .r_data(r_data),
        .rx_empty(rx_empty),
        .tx_full(tx_full),
        .tx(tx)
        );
        
    initial
        begin
            clk = 0;
            rst = 0;
            rd_uart = 0;
            rx = 0;
            w_data = 0;
            wr_uart = 0;
            TIMER_FINAL_VALUE = 0;
        end
    
    always
        #5 clk = ~clk;
        
    initial
        begin
            #7 rst = 1;
            #3 rst = 0;
            #10 w_data = 8'b00001111;
            #10 TIMER_FINAL_VALUE = 11'b000000000000;
            #10 wr_uart = 1;
            #10 wr_uart = 0;
            #10 rx = 1;
            #10 wr_uart = 1;
            #10 wr_uart = 0;
            #10 rd_uart = 1;
            #17;
        end
endmodule
