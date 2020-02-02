`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2020 12:41:09 AM
// Design Name: 
// Module Name: SimMain
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


module SimMain;
     reg c = 1'b0;
     wire [2:1] out;
       
     XADCdemo demo(
           .CLK100MHZ(c),
           .ck_an_p(),
           .ck_an_n(),
           .vp_in(),
           .vn_in(),
           .ck_io(out)
        );
        
     parameter CLOCK_PERIOD = 100;
     
     
     initial
     begin
        $monitor("c: %b", c);
     end

        always #(CLOCK_PERIOD/2)  c <= ~c;

endmodule
