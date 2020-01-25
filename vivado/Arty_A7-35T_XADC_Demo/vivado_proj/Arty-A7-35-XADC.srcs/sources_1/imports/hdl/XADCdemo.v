`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent inc.
// Engineer: Samuel Lowe
// Engineer Email: samuel.lowe@ni.com
// Create Date: 05/28/2015 03:26:51 PM
// Design Name: XADCdemo
// Module Name: XADCdemo: 
// Target Devices: ARTY
// Tool Versions: Vivado 15.1
// Description: A top level design for reading values off of the XADC Pmod port of the ARTY FPGA
// 
// Dependencies: 
// 
// Revision: 3/3/2015
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
 

module XADCdemo(
   input CLK100MHZ,
   input ck_rst,
   input [8:0] ck_an_p,
   input [8:0] ck_an_n,
   input vp_in,
   input vn_in,
   output [2:0] ck_io
 );
    localparam SCALE_FACTOR = 1024;   
    
    localparam DIVIDER_WIDTH = 13;
    
    localparam CLK_OUT_PIN = 0;
    localparam SLO_CLK_OUT_PIN = 1;
    localparam SIGNAL_OUT_PIN = 2;
    
    reg [0:0] outputReg = 1'b0;
    reg [DIVIDER_WIDTH-1:0] divider = {DIVIDER_WIDTH{1'b0}};
    
    reg [15:0] highDuration = 16'b0;
    reg [15:0] lowDuration = 16'b0;
    reg [15:0] counter = 16'b0;     

    reg [0:0] bad_address = 1'b0;  
    reg [6:0] Address_in;     

    reg _ready = 0;

    wire clk8192KHz;

    wire enable;
    wire ready;
    wire [15:0] data;   

    assign ck_io[CLK_OUT_PIN] = clk8192KHz;
    assign ck_io[SLO_CLK_OUT_PIN] = divider[DIVIDER_WIDTH-1];
    assign ck_io[SIGNAL_OUT_PIN] = outputReg[0];

   clk_wiz_0 CLK_8192KHz(
    .clk_8192KHz(clk8192KHz),
    .resetn(ck_rst),
    .sys_clk_in(CLK100MHZ));

   //xadc instantiation connect the eoc_out .den_in to get continuous conversion

    xadc_wiz_0 xadc
        (
        .daddr_in(Address_in),            // Address bus for the dynamic reconfiguration port
        .dclk_in(CLK100MHZ),             // Clock input for the dynamic reconfiguration port
        .den_in(enable & ~bad_address[0]),              // Enable Signal for the dynamic reconfiguration port
        .di_in(0),               // Input data bus for the dynamic reconfiguration port
        .dwe_in(0),              // Write Enable for the dynamic reconfiguration port
        .reset_in(0),            // Reset signal for the System Monitor control logic
        .busy_out(),            // ADC Busy signal
        .channel_out(),         // Channel Selection Outputs
        .do_out(data),              // Output data bus for dynamic reconfiguration port
        .eoc_out(enable),             // End of Conversion Signal
        .eos_out(),             // End of Sequence Signal
        .alarm_out(),           // OR'ed output of all the Alarms  
        .drdy_out(ready),            // Data ready signal for the dynamic reconfiguration port
        
        .vp_in(vp_in),               // Dedicated Analog Input Pair
        .vn_in(vn_in),
        .vauxp4(ck_an_p[0]),              // Auxiliary channel 0
        .vauxn4(ck_an_n[0]),
        .vauxp5(ck_an_p[1]),              // Auxiliary channel 5
        .vauxn5(ck_an_n[1]),
        .vauxp6(ck_an_p[2]),              // Auxiliary channel 5
        .vauxn6(ck_an_n[2]),
        .vauxp7(ck_an_p[3]),              // Auxiliary channel 6
        .vauxn7(ck_an_n[3]),
        .vauxp15(ck_an_p[4]),              // Auxiliary channel 7
        .vauxn15(ck_an_n[4]),
        .vauxp0(ck_an_p[5]),             // Auxiliary channel 12
        .vauxn0(ck_an_n[5]),
        .vauxp12(ck_an_p[6]),             // Auxiliary channel 13
        .vauxn12(ck_an_n[6]),
        .vauxp13(ck_an_p[7]),             // Auxiliary channel 14
        .vauxn13(ck_an_n[7]),
        .vauxp14(ck_an_p[8]),             // Auxiliary channel 15
        .vauxn14(ck_an_n[8])
    );

    always @(posedge CLK100MHZ) 
    begin            
        _ready <= ready;
        casex({outputReg[0], ready, _ready})
            3'b101: Address_in <= 8'h14;
            3'b001: Address_in <= 8'h15;
            3'b11x: highDuration <= data;
            3'b01x: lowDuration <= data;
            default: ;
        endcase
    end
     
    always @(posedge clk8192KHz) divider = divider + 1'b1; 
    
    always @(negedge clk8192KHz) 
    begin
        if(divider[DIVIDER_WIDTH-1])
        begin 
            if(outputReg[0] && counter >= highDuration) 
            begin
                counter = 16'b0;
                outputReg[0] = 1'b0;
            end 
            else if(!outputReg[0] && counter >= lowDuration) 
            begin 
                counter = 16'b0;
                outputReg[0] = 1'b1;
            end 
            else counter = counter + 1'b1;
        end
/**
        counter <= counter + 1;  
        casex({outputReg[0], counter >= highDuration, counter >= lowDuration})
            3'b11x: begin
                outputReg[0] = 1'b0;
                counter <= 16'b0;
            end
            3'b0x1: begin
                outputReg[0] = 1'b1;
                counter <= 16'b0;
            end
        endcase
**/
    end
endmodule
