`timescale 1ns / 1ps

module foursixteendecoder(
    input [3:0]I,
    input start,
    input idle,
    input [1:0] mode,
    output [15:0]LED
    );
reg [15:0] tmp;    

always @ (I or start or mode)
begin
    if (start == 1'b1)
        begin
            case(I)
                4'b0000: tmp = 16'b0000000000000001;
                4'b0001: tmp = 16'b0000000000000010;
                4'b0010: tmp = 16'b0000000000000100;
                4'b0011: tmp = 16'b0000000000001000;
                4'b0100: tmp = 16'b0000000000010000;
                4'b0101: tmp = 16'b0000000000100000;
                4'b0110: tmp = 16'b0000000001000000;
                4'b0111: tmp = 16'b0000000010000000;
                4'b1000: tmp = 16'b0000000100000000;
                4'b1001: tmp = 16'b0000001000000000;
                4'b1010: tmp = 16'b0000010000000000;
                4'b1011: tmp = 16'b0000100000000000;
                4'b1100: tmp = 16'b0001000000000000;
                4'b1101: tmp = 16'b0010000000000000;
                4'b1110: tmp = 16'b0100000000000000;
                4'b1111: tmp = 16'b1000000000000000;
              default: tmp = 16'b0000000000000000;
            endcase
        end
    else
        begin
            case(mode)
                2'b01: tmp = 16'b0000001111000000;
                2'b10: tmp = 16'b0001111111111000;
                2'b11: tmp = 16'b1111111111111111;
              default: tmp = 16'b0001111111111000;
            endcase
        end
end


assign LED = tmp;

endmodule
