`timescale 1ns / 1ps
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
     wire [2:0] out;
       
     XADCdemo demo(
           .CLK100MHZ(c),
           .ck_an_p(),
           .ck_an_n(),
           .vp_in(),
           .vn_in(),
           .ck_io(out)
        );
        
     initial
     begin
        $monitor("c: %b", c);
     end

     always 
        #5 c = !c;

endmodule
