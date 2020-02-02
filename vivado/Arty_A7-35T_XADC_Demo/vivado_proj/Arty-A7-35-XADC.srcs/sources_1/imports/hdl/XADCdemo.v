`timescale 10ns / 100ps
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
   input [2:0] ck_an_p,
   input [2:0] ck_an_n,
   input vp_in,
   input vn_in,
   output [2:1] ck_io
 );
    parameter DIVIDER_WIDTH = 10; //13;
    
    parameter CLK_OUT_PIN = 0;
    parameter SLO_CLK_OUT_PIN = 1;
    parameter SIGNAL_OUT_PIN = 2;

    parameter ADC_BUS_WIDTH = 16;
    parameter ADC_BITS = 16;
    
    parameter DC_BIAS = 'h0200;
    
    reg [ADC_BITS - 1:0] counter =  {(ADC_BITS){1'b0}};
    reg [ADC_BITS - 1:0] highDuration =  {(ADC_BITS){1'b0}};
    reg [ADC_BITS - 1:0] lowDuration =  {(ADC_BITS){1'b0}};

    reg [ADC_BITS - 1:0] tmpAdc = {(ADC_BITS){1'b0}};
    wire [ADC_BUS_WIDTH-1:0] adcBus;
    wire [ADC_BITS-1:0] adcData = adcBus[ADC_BITS-1:0];  
    
    reg  outputReg = 1'b0;
    reg [DIVIDER_WIDTH-1:0] dividerReg = {DIVIDER_WIDTH{1'b0}};
    
    reg bad_address = 1'b0;  
    reg [6:0] Address_in;     

    reg _ready = 1'b0;
    
    wire divider = dividerReg[DIVIDER_WIDTH-1];
    
//    wire clk8192KHz;

    wire enable;
    wire ready;

    //assign ck_io[CLK_OUT_PIN] = clk8192KHz;
    //assign ck_io[SLO_CLK_OUT_PIN] = divider;
    assign ck_io[SLO_CLK_OUT_PIN] = dividerReg[DIVIDER_WIDTH-2];
    assign ck_io[SIGNAL_OUT_PIN] = outputReg;
/**
   clk_wiz_0 CLK_8192KHz(
    .clk_8192KHz(clk8192KHz),
    .resetn(ck_rst),
    .sys_clk_in(CLK100MHZ));
**/
   //xadc instantiation connect the eoc_out .den_in to get continuous conversion

    xadc_wiz_0 xadc
        (
        .daddr_in(Address_in),            // Address bus for the dynamic reconfiguration port
        .dclk_in(CLK100MHZ),             // Clock input for the dynamic reconfiguration port
        .den_in(enable & ~bad_address),              // Enable Signal for the dynamic reconfiguration port
        .di_in(0),               // Input data bus for the dynamic reconfiguration port
        .dwe_in(0),              // Write Enable for the dynamic reconfiguration port
        .reset_in(0),            // Reset signal for the System Monitor control logic
        .busy_out(),            // ADC Busy signal
        .channel_out(),         // Channel Selection Outputs
        .do_out(adcBus),              // Output data bus for dynamic reconfiguration port
        .eoc_out(enable),             // End of Conversion Signal
        .eos_out(),             // End of Sequence Signal
        .alarm_out(),           // OR'ed output of all the Alarms  
        .drdy_out(ready),            // Data ready signal for the dynamic reconfiguration port
        
        .vp_in(0),
        .vn_in(0),
        .vauxp4(ck_an_p[0]),              
        .vauxn4(ck_an_n[0]),
        .vauxp5(ck_an_p[1]),              
        .vauxn5(ck_an_n[1]),
        .vauxp6(ck_an_p[2]),             
        .vauxn6(ck_an_n[2])
    );

    always @(posedge CLK100MHZ) _ready <= ready;

    always @(posedge CLK100MHZ) 
    begin      
        tmpAdc <= adcData;  
        casex({outputReg, ready, _ready})
            3'b101: Address_in <= 8'h14;
            3'b001: Address_in <= 8'h15;
            3'b11x: highDuration <= tmpAdc < DC_BIAS? 0 : tmpAdc - DC_BIAS;
            3'b01x: lowDuration <= tmpAdc < DC_BIAS? 0 : tmpAdc - DC_BIAS;
            default: ;
        endcase
    end
     
//    always @(posedge clk8192KHz) _divider <= divider;
    reg [ADC_BITS-1:0] highTime = 0;
    reg [ADC_BITS-1:0] lowTime = 0;
    always @(posedge CLK100MHZ) 
    begin
        dividerReg <= dividerReg + 1'b1; 
        if(divider == 1)
        begin
            counter <= counter + 1'b1;
            if(outputReg && counter >= highTime) 
            begin
                counter <= {ADC_BITS{1'b0}};
                outputReg <= 1'b0;
                lowTime <= lowDuration;
            end 
            else if(!outputReg && counter >= lowTime) 
            begin 
                counter <= {ADC_BITS{1'b0}};
                outputReg <= 1'b1;
                highTime <= highDuration;
            end
            dividerReg <= {DIVIDER_WIDTH{1'b0}};
        end
/**
        counter <= counter + 1;  
        casex({outputReg, counter >= highDuration, counter >= lowDuration})
            3'b11x: begin
                outputReg = 1'b0;
                counter <= 16'b0;
            end
            3'b0x1: begin
                outputReg = 1'b1;
                counter <= 16'b0;
            end
        endcase
**/
    end
endmodule
