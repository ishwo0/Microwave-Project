`timescale 1ns / 1ps

module debouncer_delayed_fsm(
    input clk,
    input rst,
    input noisy,
    input timer_done,
    output timer_reset,
    output debounced
    );
    
reg [1:0] state, next_state;
parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3;

always @(posedge clk, posedge rst)
begin
    if(rst)
        state <= 0;
    else
        state <= next_state;
end

always @(noisy or state or timer_done)
begin
    next_state = state;
    case(state)
        s0:
            begin
                if(~noisy)
                    next_state = s0;
                else if (noisy)
                    next_state = s1;
            end
        s1:
            begin
                if(~noisy)
                    next_state = s0;
                else if (noisy & ~timer_done)
                    next_state = s1;
                else if (noisy & timer_done)
                    next_state = s2;
            end
        s2:
            begin
                if(~noisy)
                    next_state = s3;
                else if (noisy)
                    next_state = s2;
            end
        s3:
            begin
                if(noisy)
                    next_state = s2;
                else if (~noisy & ~timer_done)
                    next_state = s3;
                else if (~noisy & timer_done)
                    next_state = s0;
            end
      default: next_state = s0;
    endcase
end
    
assign timer_reset = (state == s0) | (state == s2);
assign debounced = (state == s2) | (state == s3);    
    
    
endmodule
