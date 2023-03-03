`timescale 1ns / 1ps

module top_vgaMaster(
    input clk,
    input start,
    input idle,
    output Hsynq,
    output Vsynq,
    output [3:0] Red,
    output [3:0] Green,
    output [3:0] Blue
    );
    
wire clk_25MHz;
wire enable_V_Counter;
wire [15:0] H_Count_Value;
wire [15:0] V_Count_Value;
reg [3:0] r_red;
reg [3:0] r_green;
reg [3:0] r_blue;

clock_divider VGA_Clock_gen(
    .clk(clk), 
    .divided_clk(clk_25MHz)
    );

horizontal_counter VGA_Horizontal(
    .clk_25MHz(clk_25MHz), 
    .enable_V_Counter(enable_V_Counter), 
    .H_Count_Value(H_Count_Value)
    );

vertical_counter VGA_Vertical(
    .clk_25MHz(clk_25MHz), 
    .enable_V_Counter(enable_V_Counter), 
    .V_Count_Value(V_Count_Value)
    );

// outputs
assign Hsynq = (H_Count_Value < 96) ? 1'b1:1'b0;
assign Vsynq = (V_Count_Value < 2) ? 1'b1:1'b0;

always @ (posedge clk_25MHz)
begin

//////////////////////////////////////////////////////////////////////////////////////////  
    if (V_Count_Value < 88)
        begin 
            r_red <= 4'hF;    // white                white section above microwave 
            r_blue <= 4'hF;
            r_green <= 4'hF;
        end  
//////////////////////////////////////////////////////////////////////////////////////////    
  
//////////////////////////////////////////////////////////////////////////////////////////     
    else if (V_Count_Value >= 88 && V_Count_Value < 135)
        begin
            if (H_Count_Value < 192)
                begin
                    r_red <= 4'hF;    // white
                    r_blue <= 4'hF;
                    r_green <= 4'hF;
                end
            else if (H_Count_Value >= 192 && H_Count_Value < 731)
                begin
                    r_red <= 4'h8;    // gray                           microwave section 1
                    r_blue <= 4'h8;
                    r_green <= 4'h8;
                end
            else if (H_Count_Value >= 731)
                begin
                    r_red <= 4'hF;    // white
                    r_blue <= 4'hF;
                    r_green <= 4'hF;
                end
        end
//////////////////////////////////////////////////////////////////////////////////////////   
   
//////////////////////////////////////////////////////////////////////////////////////////         
    else if (V_Count_Value >= 135 && V_Count_Value < 162)
        begin
            if (H_Count_Value < 192)
                begin
                    r_red <= 4'hF;    // white
                    r_blue <= 4'hF;
                    r_green <= 4'hF;
                end
            else if (H_Count_Value >= 192 && H_Count_Value < 233)
                begin
                    r_red <= 4'h8;    // gray                         
                    r_blue <= 4'h8;
                    r_green <= 4'h8;
                end
            else if (H_Count_Value >= 233 && H_Count_Value < 552)
                begin
                    if (start == 1'b1)
                        begin
                            r_red <= 4'hC;    // yellow                         microwave section 2
                            r_blue <= 4'h0;
                            r_green <= 4'hC;
                        end
                    else
                        begin
                            r_red <= 4'hB;    // glass white      
                            r_blue <= 4'hB;
                            r_green <= 4'hB;
                        end
                end
            else if (H_Count_Value >= 552 && H_Count_Value < 731)
                begin
                    r_red <= 4'h8;    // gray 
                    r_blue <= 4'h8;
                    r_green <= 4'h8;
                end
            else if (H_Count_Value >= 731)
                begin
                    r_red <= 4'hF;    // white
                    r_blue <= 4'hF;
                    r_green <= 4'hF;
                end
        end
//////////////////////////////////////////////////////////////////////////////////////////   
   
//////////////////////////////////////////////////////////////////////////////////////////          
    else if (V_Count_Value >= 162 && V_Count_Value < 218)
        begin
            if (H_Count_Value < 192)
                begin
                    r_red <= 4'hF;    // white
                    r_blue <= 4'hF;
                    r_green <= 4'hF;
                end
            else if (H_Count_Value >= 192 && H_Count_Value < 233)
                begin
                    r_red <= 4'h8;    // gray                         
                    r_blue <= 4'h8;
                    r_green <= 4'h8;
                end
            else if (H_Count_Value >= 233 && H_Count_Value < 552)
                begin
                    if (start == 1'b1)
                        begin
                            r_red <= 4'hC;    // yellow                         microwave section 3
                            r_blue <= 4'h0;
                            r_green <= 4'hC;
                        end
                    else
                        begin
                            r_red <= 4'hB;    // glass white      
                            r_blue <= 4'hB;
                            r_green <= 4'hB;
                        end
                end
            else if (H_Count_Value >= 552 && H_Count_Value < 574)
                begin
                    r_red <= 4'h8;    // gray 
                    r_blue <= 4'h8;
                    r_green <= 4'h8;
                end
            else if (H_Count_Value >= 574 && H_Count_Value < 710)
                begin
                    r_red <= 4'h0;    // black 
                    r_blue <= 4'h0;
                    r_green <= 4'h0;
                end
            else if (H_Count_Value >= 710 && H_Count_Value < 731)
                begin
                    r_red <= 4'h8;    // gray 
                    r_blue <= 4'h8;
                    r_green <= 4'h8;
                end
            else if (H_Count_Value >= 731)
                begin
                    r_red <= 4'hF;    // white
                    r_blue <= 4'hF;
                    r_green <= 4'hF;
                end
        end
//////////////////////////////////////////////////////////////////////////////////////////  
    
//////////////////////////////////////////////////////////////////////////////////////////          
    else if (V_Count_Value >= 218 && V_Count_Value < 234)
        begin
            if (H_Count_Value < 192)
                begin
                    r_red <= 4'hF;    // white
                    r_blue <= 4'hF;
                    r_green <= 4'hF;
                end
            else if (H_Count_Value >= 192 && H_Count_Value < 233)
                begin
                    r_red <= 4'h8;    // gray                         
                    r_blue <= 4'h8;
                    r_green <= 4'h8;
                end
            else if (H_Count_Value >= 233 && H_Count_Value < 552)
                begin
                    if (start == 1'b1)
                        begin
                            r_red <= 4'hC;    // yellow                         microwave section 4
                            r_blue <= 4'h0;
                            r_green <= 4'hC;
                        end
                    else
                        begin
                            r_red <= 4'hB;    // glass white      
                            r_blue <= 4'hB;
                            r_green <= 4'hB;
                        end
                end
            else if (H_Count_Value >= 552 && H_Count_Value < 731)
                begin
                    r_red <= 4'h8;    // gray 
                    r_blue <= 4'h8;
                    r_green <= 4'h8;
                end
            else if (H_Count_Value >= 731)
                begin
                    r_red <= 4'hF;    // white
                    r_blue <= 4'hF;
                    r_green <= 4'hF;
                end
        end
//////////////////////////////////////////////////////////////////////////////////////////  
    
//////////////////////////////////////////////////////////////////////////////////////////         
    else if (V_Count_Value >= 234 && V_Count_Value < 361)
        begin
            if (H_Count_Value < 192)
                begin
                    r_red <= 4'hF;    // white
                    r_blue <= 4'hF;
                    r_green <= 4'hF;
                end
            else if (H_Count_Value >= 192 && H_Count_Value < 233)
                begin
                    r_red <= 4'h8;    // gray                         
                    r_blue <= 4'h8;
                    r_green <= 4'h8;
                end
            else if (H_Count_Value >= 233 && H_Count_Value < 552)
                begin
                    if (start == 1'b1)
                        begin
                            r_red <= 4'hC;    // yellow                         microwave section 5
                            r_blue <= 4'h0;
                            r_green <= 4'hC;
                        end
                    else
                        begin
                            r_red <= 4'hB;    // glass white      
                            r_blue <= 4'hB;
                            r_green <= 4'hB;
                        end
                end
            else if (H_Count_Value >= 552 && H_Count_Value < 574)
                begin
                    r_red <= 4'h8;    // gray 
                    r_blue <= 4'h8;
                    r_green <= 4'h8;
                end
            else if (H_Count_Value >= 574 && H_Count_Value < 710)
                begin
                    r_red <= 4'h6;    // brown
                    r_blue <= 4'h6;
                    r_green <= 4'h6;
                end
            else if (H_Count_Value >= 710 && H_Count_Value < 731)
                begin
                    r_red <= 4'h8;    // gray 
                    r_blue <= 4'h8;
                    r_green <= 4'h8;
                end
            else if (H_Count_Value >= 731)
                begin
                    r_red <= 4'hF;    // white
                    r_blue <= 4'hF;
                    r_green <= 4'hF;
                end
        end
//////////////////////////////////////////////////////////////////////////////////////////  
    
//////////////////////////////////////////////////////////////////////////////////////////            
    else if (V_Count_Value >= 361 && V_Count_Value < 383)
        begin
            if (H_Count_Value < 192)
                begin
                    r_red <= 4'hF;    // white
                    r_blue <= 4'hF;
                    r_green <= 4'hF;
                end
            else if (H_Count_Value >= 192 && H_Count_Value < 233)
                begin
                    r_red <= 4'h8;    // gray                         
                    r_blue <= 4'h8;
                    r_green <= 4'h8;
                end
            else if (H_Count_Value >= 233 && H_Count_Value < 552)
                begin
                    if (start == 1'b1)
                        begin
                            r_red <= 4'hC;    // yellow                         microwave section 6
                            r_blue <= 4'h0;
                            r_green <= 4'hC;
                        end
                    else
                        begin
                            r_red <= 4'hB;    // glass white      
                            r_blue <= 4'hB;
                            r_green <= 4'hB;
                        end
                end
            else if (H_Count_Value >= 552 && H_Count_Value < 731)
                begin
                    r_red <= 4'h8;    // gray 
                    r_blue <= 4'h8;
                    r_green <= 4'h8;
                end
            else if (H_Count_Value >= 731)
                begin
                    r_red <= 4'hF;    // white
                    r_blue <= 4'hF;
                    r_green <= 4'hF;
                end
        end  
//////////////////////////////////////////////////////////////////////////////////////////  
    
//////////////////////////////////////////////////////////////////////////////////////////          
    else if (V_Count_Value >= 383 && V_Count_Value < 439)
        begin
            if (H_Count_Value < 192)
                begin
                    r_red <= 4'hF;    // white
                    r_blue <= 4'hF;
                    r_green <= 4'hF;
                end
            else if (H_Count_Value >= 192 && H_Count_Value < 233)
                begin
                    r_red <= 4'h8;    // gray                         
                    r_blue <= 4'h8;
                    r_green <= 4'h8;
                end
            else if (H_Count_Value >= 233 && H_Count_Value < 552)
                begin
                    if (start == 1'b1)
                        begin
                            r_red <= 4'hC;    // yellow                         microwave section 7
                            r_blue <= 4'h0;
                            r_green <= 4'hC;
                        end
                    else
                        begin
                            r_red <= 4'hB;    // glass white      
                            r_blue <= 4'hB;
                            r_green <= 4'hB;
                        end
                end
            else if (H_Count_Value >= 552 && H_Count_Value < 574)
                begin
                    r_red <= 4'h8;    // gray 
                    r_blue <= 4'h8;
                    r_green <= 4'h8;
                end
            else if (H_Count_Value >= 574 && H_Count_Value < 710)
                begin
                    r_red <= 4'hA;    // brown 
                    r_blue <= 4'hA;
                    r_green <= 4'hA;
                end
            else if (H_Count_Value >= 710 && H_Count_Value < 731)
                begin
                    r_red <= 4'h8;    // gray 
                    r_blue <= 4'h8;
                    r_green <= 4'h8;
                end
            else if (H_Count_Value >= 731)
                begin
                    r_red <= 4'hF;    // white
                    r_blue <= 4'hF;
                    r_green <= 4'hF;
                end
        end
//////////////////////////////////////////////////////////////////////////////////////////  
    
//////////////////////////////////////////////////////////////////////////////////////////           
    else if (V_Count_Value >= 439 && V_Count_Value < 470)
        begin
            if (H_Count_Value < 192)
                begin
                    r_red <= 4'hF;    // white
                    r_blue <= 4'hF;
                    r_green <= 4'hF;
                end
            else if (H_Count_Value >= 192 && H_Count_Value < 731)
                begin
                    r_red <= 4'h8;    // gray                           microwave section 8
                    r_blue <= 4'h8;
                    r_green <= 4'h8;
                end
            else if (H_Count_Value >= 731)
                begin
                    r_red <= 4'hF;    // white
                    r_blue <= 4'hF;
                    r_green <= 4'hF;
                end
        end 
//////////////////////////////////////////////////////////////////////////////////////////  
    
//////////////////////////////////////////////////////////////////////////////////////////           
    else if (V_Count_Value >= 470)
        begin
            r_red <= 4'hF;    // white                white section belkow microwave 
            r_blue <= 4'hF;
            r_green <= 4'hF;
        end


end



// colors - all colors high = white screen
assign Red = (H_Count_Value < 784 && H_Count_Value > 143 && V_Count_Value < 515 && V_Count_Value > 34) ? r_red : 4'h0;
assign Green = (H_Count_Value < 784 && H_Count_Value > 143 && V_Count_Value < 515 && V_Count_Value > 34) ? r_green : 4'h0;
assign Blue = (H_Count_Value < 784 && H_Count_Value > 143 && V_Count_Value < 515 && V_Count_Value > 34) ? r_blue : 4'h0;

endmodule
