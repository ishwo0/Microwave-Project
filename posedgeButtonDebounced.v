`timescale 1ns / 1ps

module posedgeButtonDebounced(
    input clk, rst,
    input btn,
    output debounced,
    output p_edge, n_edge, _edge
    );
    
debouncer_delayed DD(
    .clk(clk),
    .rst(rst),
    .noisy(btn),
    .debounced(debounced)
    );
    
edgeDetector ED(
    .clk(clk),
    .rst(rst),
    .level(debounced),
    .p_edge(p_edge),
    .n_edge(n_edge),
    ._edge(_edge)
    );        
    
    
    
    
    
endmodule
