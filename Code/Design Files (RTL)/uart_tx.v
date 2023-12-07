`timescale 1ns / 1ps

module uart_tx #(parameter DBIT = 8,        //data bits
                           SB_TICK = 16     //stop bit ticks
                                        )
    (
    input clk,
    input rst,
    input tx_start,
    input s_tick,
    input [DBIT - 1:0] tx_din,
    output reg tx_done_tick,
    output tx 
    );
    
localparam idle = 0, start = 1,
           data = 2, stop = 3;
           
reg [1:0] state_reg, state_next;        
reg [3:0] s_reg, s_next;                    //keep track of baud rate ticks (16 total)
reg [$clog2(DBIT) - 1:0] n_reg, n_next;     //keep track of number of data bits received
reg [DBIT - 1:0] b_reg, b_next;             //shift the transmitted data bits
reg tx_reg, tx_next;                        //track the transmitted bit

always @ (posedge clk, posedge rst)
begin

    if(rst)
      begin
        state_reg <= idle;
        s_reg <= 0;
        n_reg <= 0;
        b_reg <= 0;
        tx_reg <= 1'b1;
      end
    else
      begin
        state_reg <= state_next;
        s_reg <= s_next;
        n_reg <= n_next;
        b_reg <= b_next;
        tx_reg <= tx_next;
      end
    
end
    

always @ (state_reg or s_reg or n_reg or b_reg or s_tick or tx_reg or tx_start or tx_din)
begin

    state_next = state_reg;
    s_next <= s_reg;
    n_next <= n_reg;
    b_next <= b_reg;
    tx_done_tick = 1'b0;
    
    case(state_reg)
    
        idle: 
          begin
            tx_next = 1'b1;
            if (tx_start)
              begin
                s_next = 0;
                b_next = tx_din;
                state_next = start;
              end
          end
          
        start:
          begin
            tx_next = 1'b0;
            if (s_tick)
              begin
                if (s_reg == 15)
                  begin
                    s_next = 0;
                    n_next = 0;
                    state_next = data;
                  end
                else
                    s_next = s_reg + 1;
              end
          end
          
        data:
          begin
            tx_next = b_reg[0];
            if (s_tick)
              begin
                if (s_reg == 15)
                  begin
                    s_next = 0;
                    b_next = {1'b0, b_reg[DBIT - 1:1]};   //right shift using concatination
                    if (n_reg == (DBIT - 1))
                        state_next = stop;
                    else
                        n_next = n_reg + 1;
                  end
                else
                    s_next = s_reg + 1; 
              end
          end
          
        stop:
          begin
            tx_next = 1'b1;
            if (s_tick)
              begin
                if (s_reg == (SB_TICK - 1))
                  begin
                    tx_done_tick = 1'b1;
                    state_next = idle;
                  end
                else
                    s_next = s_reg + 1; 
              end
          end
      default:
           state_next = idle;
    endcase
    
end    
    
assign tx = b_reg; 

endmodule