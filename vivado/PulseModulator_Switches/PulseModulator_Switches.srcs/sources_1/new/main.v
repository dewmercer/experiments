`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/02/2020 10:41:55 AM
// Design Name: 
// Module Name: main
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


module main(
    input sys_clk,
    input BTN_0,
    input BTN_1,
    input [3:0] sw,
    output [3:0] led,
    output [2:0] ck_io,
    input vaux4_p,
    input vaux4_n
    );


   wire clk_5MHz;
   clk_wiz_0 clk5 (
      .clk_out_5MHz(clk_5MHz),
      .clk_in1(sys_clk),
      .resetn(1)
    );
    
    wire enable;
    reg bad_address = 0;
    wire ready;
    wire[15:0] data;
    reg Address_in = 8'h14;
    xadc_wiz_0 adc
          (
          .daddr_in(Address_in),            // Address bus for the dynamic reconfiguration port
          .dclk_in(sys_clk),             // Clock input for the dynamic reconfiguration port
          .den_in(enable & ~bad_address),              // Enable Signal for the dynamic reconfiguration port
          .di_in(0),               // Input data bus for the dynamic reconfiguration port
          .dwe_in(0),              // Write Enable for the dynamic reconfiguration port
          .busy_out(),            // ADC Busy signal
          .channel_out(),         // Channel Selection Outputs
          .do_out(data),              // Output data bus for dynamic reconfiguration port
          .drdy_out(ready),            // Data ready signal for the dynamic reconfiguration port
          .eoc_out(enable),             // End of Conversion Signal
          .eos_out(),             // End of Sequence Signal
          .vccaux_alarm_out(),    // VCCAUX-sensor alarm output
          .vccint_alarm_out(),    //  VCCINT-sensor alarm output
          .user_temp_alarm_out(), // Temperature-sensor alarm output
          .alarm_out(),           // OR'ed output of all the Alarms    
          .vp_in(vaux4_p),               // Dedicated Analog Input Pair
          .vn_in(vaux4_n)
          );
          
   
    assign ck_io[0] = clk_5MHz;

    reg [15:0] highSetting;
    reg [15:0] lowSetting; 
    wire highSelected;
    assign highSelected = sw[0]? 1:0;
    assign led = highSelected? highSetting:lowSetting;
  
    // Setup LEDS
    reg btnLast_0 = 0;
    reg btnLast_1 = 0;
    /**
    always @(sw[0]) begin
        deassign highSelected;
        assign highSelected 
    end
     */
    reg _ready = 0;
    always @(posedge sys_clk) _ready <= ready;

    always @(posedge sys_clk) begin
/**        if(ready == 1 && _ready == 0) begin
            highSetting <= data;
            lowSetting <= data;
        end
*/

        case ({BTN_0, btnLast_0})
            2'b10: if (led < 4'b1111) begin
                if(sw[0]) highSetting <= highSetting + 1;
                else lowSetting <= lowSetting + 1;
                btnLast_0 <= 1;
            end 
            2'b01: btnLast_0 <= 0;
        endcase 

        case ({BTN_1, btnLast_1})
            2'b10: if (led > 4'b0000) begin
                if(sw[0]) highSetting <= highSetting - 1;
                else lowSetting <= lowSetting - 1;
                btnLast_1 <= 1;
            end
            2'b01: btnLast_1 <= 0;            
        endcase
     end
     
    
    
   
    reg [3:0] highCounter = 0;
    reg [3:0] lowCounter = 0;
    reg ck_io_1 = 1;
    assign ck_io[1] = ck_io_1;
    
    reg highActive = 1;

    reg w = 0;
    assign ck_io[2] = w;
    
    always @(posedge clk_5MHz) begin
        w <= ~w;
        if (highActive) begin
            highCounter <= highCounter + 1;
            if (highCounter >= highSetting) begin 
                highActive <= 0;
                lowCounter <= 0;
                ck_io_1 <= 0;
            end
        end else begin
            lowCounter <= lowCounter + 1;
            if (lowCounter >= lowSetting) begin
                highActive <= 1;
                highCounter <= 0;
                ck_io_1 <= 1;
            end
        end    
    end
endmodule