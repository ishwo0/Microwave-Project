`timescale 1ns / 1ps

module btn_startButton(
    input clk,              //input system clock
    input rst,              //input reset
    input btn_start,      //button to start microwave
    input kb_start,         //keyboard start
    input timerEnd,         //input signal to detect when timer ends
    output start,           //output signal to know if microwave started and is heating
    output idle             //output signal to know if microwave is in idle
    );
    
reg startreg = 'b0;          //start register
reg idlereg = 'b1;           //idle register


always @ (posedge clk)          //for every clock pulse...
begin
    if (rst)                        //check for reset
        begin
            startreg <= 'b0;           //set default idle state
            idlereg <= 'b1;
        end
    else if (btn_start || kb_start)         //if start button pressed...
        begin        
            startreg <= ~startreg;      //inverse start and idle registers (button is a pause/unpause mechanism)
            idlereg <= ~idlereg;
        end  
    if (timerEnd)               //if timer ends...
        begin
            startreg <= 'b0;       //set idle
            idlereg <= 'b1;
        end    
end 

assign start = startreg;
assign idle = idlereg;


endmodule
