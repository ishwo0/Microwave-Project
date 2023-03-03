`define normal 3'b010       //normal mode represented by binary '010'
`define low 3'b001          //low mode represented by binary '001'
`define high 3'b100         //high mode represented by binary '100'
`timescale 1ns / 1ps

module btn_modeSelect(
    input clk,          //input system clock
    input rst,          //input reset
    input start,        //start detector
    input idle,         //idle detector
    input btn_up,       //up button for cycling upwards through modes
    input btn_dwn,      //down button for cycling downwards through modes
    output [1:0] mode   //mode output 2'b01 for low, 2'b10 for normal, 2'b11 for high
    );
reg [1:0] modereg;               //mode register
reg [2:0] state;        //current state register
reg [2:0] next_state;   //next state register
assign mode = modereg;

initial begin
state = `normal;
next_state = `normal;
end

always @ (posedge clk)          //for every clock pulse...
begin
    if (rst)                    //check for reset
        state <= `normal;        //set state to normal mode (aka normal mode is default mode when resetted)
    else if (idle)              //else, check if currently in idle
        state <= next_state;     //set current state to next state (allow mode to be changed)
    else if (start)
        state <= state;
end        
    
always @ (btn_up or btn_dwn or state)       //for any change in the up button input, down button input, or current state register...
begin
case (state)                                //check cases for current state register
    `normal:                                //when current state is in normal mode...
      begin 
        if (idle)                               //if currently in idle...
          begin
            if (btn_up)                         //check if up button input is pressed (high)
                next_state = `high;             //set the next state register to high mode
            else if (btn_dwn)                   //else, check if down button input is pressed (high)
                next_state = `low;              //set the next state register to low mode
            else                                //if neither button, up or down, is pressed...
                next_state = `normal;           //set next state register to normal mode (essentially stay still) *this code isnt neccessary
          end
        else                                    //else (if NOT in idle), set next state register to idself (aka do nothing)
            next_state = next_state;
      end 
    `high:                                  //when current state is in high mode...
      begin 
        if (idle)                               //if currently in idle...
          begin
            if (btn_up)                         //check if up button input is pressed (high)
                next_state = `low;              //set the next state register to low mode
            else if (btn_dwn)                   //else, check if down button input is pressed (high)
                next_state = `normal;           //set the next state register to normal mode
            else                                //if neither button, up or down, is pressed...
                next_state = `high;             //set next state register to high mode (essentially stay still) *this code isnt neccessary
          end
        else                                    //else (if NOT in idle), set next state register to idself (aka do nothing)
            next_state = next_state;
      end 
    `low:                                   //when current state is in low mode...
      begin    
        if (idle)                               //if currently in idle...
          begin                             
            if (btn_up)                         //check if up button input is pressed (high)
                next_state = `normal;           //set the next state register to normal mode
            else if (btn_dwn)                   //else, check if down button input is pressed (high)
                next_state = `high;             //set the next state register to high mode
            else                                //if neither button, up or down, is pressed...
                next_state = `low;              //set next state register to low mode (essentially stay still) *this code isnt neccessary
          end
        else                                    //else (if NOT in idle), set next state register to idself (aka do nothing)
            next_state = next_state;
      end
endcase
end

always @(state)                     //for any change in the current state register 
begin           
case (state)                        //check cases for current state register
    `low: modereg = 2'b01;             //when current state is in low mode, set mode output to 2'b01
    `normal: modereg = 2'b10;          //when current state is in normal mode, set mode output to 2'b10
    `high: modereg = 2'b11;            //when current state is in high mode, set mode output to 2'b11
endcase
end    

endmodule