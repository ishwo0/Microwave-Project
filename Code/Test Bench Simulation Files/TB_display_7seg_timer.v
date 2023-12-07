`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2022 10:50:26 AM
// Design Name: 
// Module Name: TB_display_7seg_timer
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


module TB_display_7seg_timer(
    );
    
reg [3:0] min_D1, min_D0, sec_D1, sec_D0;
wire [6:0] display_min_D1, display_min_D0, display_sec_D1, display_sec_D0;

display_7seg_timer GEN(min_D1, min_D0, sec_D1, sec_D0, display_min_D1, display_min_D0, display_sec_D1, display_sec_D0);

initial begin
min_D1 = 4'b0000;
min_D0 = 4'b0001;
sec_D1 = 4'b0001;
sec_D0 = 4'b0000;
#20
min_D1 = 4'b0000;
min_D0 = 4'b0001;
sec_D1 = 4'b0000;
sec_D0 = 4'b1001;
#20
min_D1 = 4'b0000;
min_D0 = 4'b0001;
sec_D1 = 4'b0000;
sec_D0 = 4'b1000;
#20
min_D1 = 4'b0000;
min_D0 = 4'b0001;
sec_D1 = 4'b0000;
sec_D0 = 4'b0111;
#20
min_D1 = 4'b0000;
min_D0 = 4'b0001;
sec_D1 = 4'b0000;
sec_D0 = 4'b0110;
#20
min_D1 = 4'b0000;
min_D0 = 4'b0001;
sec_D1 = 4'b0000;
sec_D0 = 4'b0101;
#20
min_D1 = 4'b0000;
min_D0 = 4'b0001;
sec_D1 = 4'b0000;
sec_D0 = 4'b0100;
#20
min_D1 = 4'b0000;
min_D0 = 4'b0001;
sec_D1 = 4'b0000;
sec_D0 = 4'b0011;
#20
min_D1 = 4'b0000;
min_D0 = 4'b0001;
sec_D1 = 4'b0000;
sec_D0 = 4'b0010;
#20
min_D1 = 4'b0000;
min_D0 = 4'b0001;
sec_D1 = 4'b0000;
sec_D0 = 4'b0001;
#20
min_D1 = 4'b0000;
min_D0 = 4'b0001;
sec_D1 = 4'b0000;
sec_D0 = 4'b0000;
#20
min_D1 = 4'b0000;
min_D0 = 4'b0000;
sec_D1 = 4'b0101;
sec_D0 = 4'b1001;
#20
min_D1 = 4'b0000;
min_D0 = 4'b0000;
sec_D1 = 4'b0101;
sec_D0 = 4'b1000;
#20
$finish;
end    

endmodule
