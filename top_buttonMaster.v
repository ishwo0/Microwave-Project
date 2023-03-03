`timescale 1ns / 1ps

module top_buttonMaster(
    input clk,
    input rst,
    input timerEnd,
    input btn_up,
    input btn_dwn,
    input btn_start,
    input kb_start,
    output [1:0] mode,
    output start,
    output idle
    );
    
wire s;
wire i;    
assign start = s;
assign idle = i;    
   
wire up_debounced, down_debounced, start_debounced;   
 
posedgeButtonDebounced buttonUp(
    .clk(clk),
    .rst(rst),
    .btn(btn_up),
    .debounced(),
    .p_edge(up_debounced),
    .n_edge(),
    ._edge()    
    );
    
posedgeButtonDebounced buttonDown(
    .clk(clk),
    .rst(rst),
    .btn(btn_dwn),
    .debounced(),
    .p_edge(down_debounced),
    .n_edge(),
    ._edge()    
    );
    
posedgeButtonDebounced buttonStart(
    .clk(clk),
    .rst(rst),
    .btn(btn_start),
    .debounced(),
    .p_edge(start_debounced),
    .n_edge(),
    ._edge()    
    );                
    
    
btn_startButton startButton(
    .clk(clk),              
    .rst(rst),              
    .btn_start(start_debounced),   
    .kb_start(kb_start),  
    .timerEnd(timerEnd),         
    .start(s),          
    .idle(i)            
    );
    
btn_modeSelect modeSelect(
    .clk(clk),          
    .rst(rst),        
    .start(s),       
    .idle(i),         
    .btn_up(up_debounced),      
    .btn_dwn(down_debounced),     
    .mode(mode)   
    );        
    
    
    
endmodule