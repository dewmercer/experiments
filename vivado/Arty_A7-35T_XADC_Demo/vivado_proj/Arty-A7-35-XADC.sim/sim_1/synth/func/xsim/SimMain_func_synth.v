// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Sat Jan 25 01:27:40 2020
// Host        : home-debian-1 running 64-bit Debian GNU/Linux 10 (buster)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               /home/dmercer/src/experiments/vivado/Arty_A7-35T_XADC_Demo/vivado_proj/Arty-A7-35-XADC.sim/sim_1/synth/func/xsim/SimMain_func_synth.v
// Design      : XADCdemo
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CLK_OUT_PIN = "0" *) (* DIVIDER_WIDTH = "13" *) (* SCALE_FACTOR = "1024" *) 
(* SIGNAL_OUT_PIN = "2" *) (* SLO_CLK_OUT_PIN = "1" *) 
(* NotValidForBitStream *)
module XADCdemo
   (CLK100MHZ,
    ck_an_p,
    ck_an_n,
    vp_in,
    vn_in,
    ck_io);
  input CLK100MHZ;
  input [8:0]ck_an_p;
  input [8:0]ck_an_n;
  input vp_in;
  input vn_in;
  output [2:0]ck_io;

  wire [0:0]Address_in;
  wire \Address_in[0]_i_1_n_0 ;
  wire CLK100MHZ;
  wire CLK100MHZ_IBUF;
  wire _ready;
  wire [8:0]ck_an_n;
  wire [8:0]ck_an_n_IBUF;
  wire [8:0]ck_an_p;
  wire [8:0]ck_an_p_IBUF;
  wire [2:0]ck_io;
  wire [2:0]ck_io_OBUF;
  wire counter;
  wire counter0;
  wire counter1;
  wire counter2;
  wire \counter[0]_i_11_n_0 ;
  wire \counter[0]_i_13_n_0 ;
  wire \counter[0]_i_14_n_0 ;
  wire \counter[0]_i_15_n_0 ;
  wire \counter[0]_i_16_n_0 ;
  wire \counter[0]_i_17_n_0 ;
  wire \counter[0]_i_18_n_0 ;
  wire \counter[0]_i_19_n_0 ;
  wire \counter[0]_i_20_n_0 ;
  wire \counter[0]_i_22_n_0 ;
  wire \counter[0]_i_23_n_0 ;
  wire \counter[0]_i_24_n_0 ;
  wire \counter[0]_i_25_n_0 ;
  wire \counter[0]_i_26_n_0 ;
  wire \counter[0]_i_27_n_0 ;
  wire \counter[0]_i_28_n_0 ;
  wire \counter[0]_i_29_n_0 ;
  wire \counter[0]_i_31_n_0 ;
  wire \counter[0]_i_32_n_0 ;
  wire \counter[0]_i_33_n_0 ;
  wire \counter[0]_i_34_n_0 ;
  wire \counter[0]_i_35_n_0 ;
  wire \counter[0]_i_36_n_0 ;
  wire \counter[0]_i_37_n_0 ;
  wire \counter[0]_i_38_n_0 ;
  wire \counter[0]_i_39_n_0 ;
  wire \counter[0]_i_40_n_0 ;
  wire \counter[0]_i_41_n_0 ;
  wire \counter[0]_i_42_n_0 ;
  wire \counter[0]_i_43_n_0 ;
  wire \counter[0]_i_44_n_0 ;
  wire \counter[0]_i_45_n_0 ;
  wire \counter[0]_i_46_n_0 ;
  wire \counter[0]_i_6_n_0 ;
  wire \counter[0]_i_7_n_0 ;
  wire \counter[0]_i_8_n_0 ;
  wire [15:0]counter_reg;
  wire \counter_reg[0]_i_10_n_0 ;
  wire \counter_reg[0]_i_10_n_1 ;
  wire \counter_reg[0]_i_10_n_2 ;
  wire \counter_reg[0]_i_10_n_3 ;
  wire \counter_reg[0]_i_10_n_4 ;
  wire \counter_reg[0]_i_10_n_5 ;
  wire \counter_reg[0]_i_10_n_6 ;
  wire \counter_reg[0]_i_10_n_7 ;
  wire \counter_reg[0]_i_12_n_0 ;
  wire \counter_reg[0]_i_12_n_1 ;
  wire \counter_reg[0]_i_12_n_2 ;
  wire \counter_reg[0]_i_12_n_3 ;
  wire \counter_reg[0]_i_21_n_0 ;
  wire \counter_reg[0]_i_21_n_1 ;
  wire \counter_reg[0]_i_21_n_2 ;
  wire \counter_reg[0]_i_21_n_3 ;
  wire \counter_reg[0]_i_30_n_1 ;
  wire \counter_reg[0]_i_30_n_2 ;
  wire \counter_reg[0]_i_30_n_3 ;
  wire \counter_reg[0]_i_30_n_4 ;
  wire \counter_reg[0]_i_30_n_5 ;
  wire \counter_reg[0]_i_30_n_6 ;
  wire \counter_reg[0]_i_30_n_7 ;
  wire \counter_reg[0]_i_3_n_0 ;
  wire \counter_reg[0]_i_3_n_1 ;
  wire \counter_reg[0]_i_3_n_2 ;
  wire \counter_reg[0]_i_3_n_3 ;
  wire \counter_reg[0]_i_3_n_4 ;
  wire \counter_reg[0]_i_3_n_5 ;
  wire \counter_reg[0]_i_3_n_6 ;
  wire \counter_reg[0]_i_3_n_7 ;
  wire \counter_reg[0]_i_4_n_1 ;
  wire \counter_reg[0]_i_4_n_2 ;
  wire \counter_reg[0]_i_4_n_3 ;
  wire \counter_reg[0]_i_5_n_1 ;
  wire \counter_reg[0]_i_5_n_2 ;
  wire \counter_reg[0]_i_5_n_3 ;
  wire \counter_reg[0]_i_9_n_0 ;
  wire \counter_reg[0]_i_9_n_1 ;
  wire \counter_reg[0]_i_9_n_2 ;
  wire \counter_reg[0]_i_9_n_3 ;
  wire \counter_reg[0]_i_9_n_4 ;
  wire \counter_reg[0]_i_9_n_5 ;
  wire \counter_reg[0]_i_9_n_6 ;
  wire \counter_reg[0]_i_9_n_7 ;
  wire \counter_reg[12]_i_1_n_1 ;
  wire \counter_reg[12]_i_1_n_2 ;
  wire \counter_reg[12]_i_1_n_3 ;
  wire \counter_reg[12]_i_1_n_4 ;
  wire \counter_reg[12]_i_1_n_5 ;
  wire \counter_reg[12]_i_1_n_6 ;
  wire \counter_reg[12]_i_1_n_7 ;
  wire \counter_reg[4]_i_1_n_0 ;
  wire \counter_reg[4]_i_1_n_1 ;
  wire \counter_reg[4]_i_1_n_2 ;
  wire \counter_reg[4]_i_1_n_3 ;
  wire \counter_reg[4]_i_1_n_4 ;
  wire \counter_reg[4]_i_1_n_5 ;
  wire \counter_reg[4]_i_1_n_6 ;
  wire \counter_reg[4]_i_1_n_7 ;
  wire \counter_reg[8]_i_1_n_0 ;
  wire \counter_reg[8]_i_1_n_1 ;
  wire \counter_reg[8]_i_1_n_2 ;
  wire \counter_reg[8]_i_1_n_3 ;
  wire \counter_reg[8]_i_1_n_4 ;
  wire \counter_reg[8]_i_1_n_5 ;
  wire \counter_reg[8]_i_1_n_6 ;
  wire \counter_reg[8]_i_1_n_7 ;
  wire [15:0]data;
  wire \divider[0]_i_2_n_0 ;
  wire [11:0]divider_reg;
  wire \divider_reg[0]_i_1_n_0 ;
  wire \divider_reg[0]_i_1_n_1 ;
  wire \divider_reg[0]_i_1_n_2 ;
  wire \divider_reg[0]_i_1_n_3 ;
  wire \divider_reg[0]_i_1_n_4 ;
  wire \divider_reg[0]_i_1_n_5 ;
  wire \divider_reg[0]_i_1_n_6 ;
  wire \divider_reg[0]_i_1_n_7 ;
  wire \divider_reg[12]_i_1_n_7 ;
  wire \divider_reg[4]_i_1_n_0 ;
  wire \divider_reg[4]_i_1_n_1 ;
  wire \divider_reg[4]_i_1_n_2 ;
  wire \divider_reg[4]_i_1_n_3 ;
  wire \divider_reg[4]_i_1_n_4 ;
  wire \divider_reg[4]_i_1_n_5 ;
  wire \divider_reg[4]_i_1_n_6 ;
  wire \divider_reg[4]_i_1_n_7 ;
  wire \divider_reg[8]_i_1_n_0 ;
  wire \divider_reg[8]_i_1_n_1 ;
  wire \divider_reg[8]_i_1_n_2 ;
  wire \divider_reg[8]_i_1_n_3 ;
  wire \divider_reg[8]_i_1_n_4 ;
  wire \divider_reg[8]_i_1_n_5 ;
  wire \divider_reg[8]_i_1_n_6 ;
  wire \divider_reg[8]_i_1_n_7 ;
  wire enable;
  wire [15:0]highDuration;
  wire \highDuration[15]_i_1_n_0 ;
  wire [15:0]lowDuration;
  wire \lowDuration[15]_i_1_n_0 ;
  wire \outputReg[0]_i_1_n_0 ;
  wire ready;
  wire vn_in;
  wire vn_in_IBUF;
  wire vp_in;
  wire vp_in_IBUF;
  wire [3:0]\NLW_counter_reg[0]_i_12_O_UNCONNECTED ;
  wire [3:0]\NLW_counter_reg[0]_i_21_O_UNCONNECTED ;
  wire [3:3]\NLW_counter_reg[0]_i_30_CO_UNCONNECTED ;
  wire [3:0]\NLW_counter_reg[0]_i_4_O_UNCONNECTED ;
  wire [3:0]\NLW_counter_reg[0]_i_5_O_UNCONNECTED ;
  wire [3:3]\NLW_counter_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_divider_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_divider_reg[12]_i_1_O_UNCONNECTED ;
  wire NLW_xadc_alarm_out_UNCONNECTED;
  wire NLW_xadc_busy_out_UNCONNECTED;
  wire NLW_xadc_eos_out_UNCONNECTED;
  wire [4:0]NLW_xadc_channel_out_UNCONNECTED;

  LUT4 #(
    .INIT(16'hF704)) 
    \Address_in[0]_i_1 
       (.I0(ck_io_OBUF[2]),
        .I1(_ready),
        .I2(ready),
        .I3(Address_in),
        .O(\Address_in[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Address_in_reg[0] 
       (.C(CLK100MHZ_IBUF),
        .CE(1'b1),
        .D(\Address_in[0]_i_1_n_0 ),
        .Q(Address_in),
        .R(1'b0));
  (* OPT_INSERTED *) 
  (* OPT_MODIFIED = "MLO" *) 
  IBUF CLK100MHZ_IBUF_inst
       (.I(CLK100MHZ),
        .O(CLK100MHZ_IBUF));
  (* IMPORTED_FROM = "/home/dmercer/src/experiments/vivado/Arty_A7-35T_XADC_Demo/vivado_proj/Arty-A7-35-XADC.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.dcp" *) 
  (* IMPORTED_TYPE = "CHECKPOINT" *) 
  (* IS_IMPORTED *) 
  clk_wiz_0 CLK_8192KHz
       (.clk_8192KHz(ck_io_OBUF[0]),
        .resetn(1'b1),
        .sys_clk_in(CLK100MHZ_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    _ready_reg
       (.C(CLK100MHZ_IBUF),
        .CE(1'b1),
        .D(ready),
        .Q(_ready),
        .R(1'b0));
  IBUF \ck_an_n_IBUF[0]_inst 
       (.I(ck_an_n[0]),
        .O(ck_an_n_IBUF[0]));
  IBUF \ck_an_n_IBUF[1]_inst 
       (.I(ck_an_n[1]),
        .O(ck_an_n_IBUF[1]));
  IBUF \ck_an_n_IBUF[2]_inst 
       (.I(ck_an_n[2]),
        .O(ck_an_n_IBUF[2]));
  IBUF \ck_an_n_IBUF[3]_inst 
       (.I(ck_an_n[3]),
        .O(ck_an_n_IBUF[3]));
  IBUF \ck_an_n_IBUF[4]_inst 
       (.I(ck_an_n[4]),
        .O(ck_an_n_IBUF[4]));
  IBUF \ck_an_n_IBUF[5]_inst 
       (.I(ck_an_n[5]),
        .O(ck_an_n_IBUF[5]));
  IBUF \ck_an_n_IBUF[6]_inst 
       (.I(ck_an_n[6]),
        .O(ck_an_n_IBUF[6]));
  IBUF \ck_an_n_IBUF[7]_inst 
       (.I(ck_an_n[7]),
        .O(ck_an_n_IBUF[7]));
  IBUF \ck_an_n_IBUF[8]_inst 
       (.I(ck_an_n[8]),
        .O(ck_an_n_IBUF[8]));
  IBUF \ck_an_p_IBUF[0]_inst 
       (.I(ck_an_p[0]),
        .O(ck_an_p_IBUF[0]));
  IBUF \ck_an_p_IBUF[1]_inst 
       (.I(ck_an_p[1]),
        .O(ck_an_p_IBUF[1]));
  IBUF \ck_an_p_IBUF[2]_inst 
       (.I(ck_an_p[2]),
        .O(ck_an_p_IBUF[2]));
  IBUF \ck_an_p_IBUF[3]_inst 
       (.I(ck_an_p[3]),
        .O(ck_an_p_IBUF[3]));
  IBUF \ck_an_p_IBUF[4]_inst 
       (.I(ck_an_p[4]),
        .O(ck_an_p_IBUF[4]));
  IBUF \ck_an_p_IBUF[5]_inst 
       (.I(ck_an_p[5]),
        .O(ck_an_p_IBUF[5]));
  IBUF \ck_an_p_IBUF[6]_inst 
       (.I(ck_an_p[6]),
        .O(ck_an_p_IBUF[6]));
  IBUF \ck_an_p_IBUF[7]_inst 
       (.I(ck_an_p[7]),
        .O(ck_an_p_IBUF[7]));
  IBUF \ck_an_p_IBUF[8]_inst 
       (.I(ck_an_p[8]),
        .O(ck_an_p_IBUF[8]));
  OBUF \ck_io_OBUF[0]_inst 
       (.I(ck_io_OBUF[0]),
        .O(ck_io[0]));
  OBUF \ck_io_OBUF[1]_inst 
       (.I(ck_io_OBUF[1]),
        .O(ck_io[1]));
  OBUF \ck_io_OBUF[2]_inst 
       (.I(ck_io_OBUF[2]),
        .O(ck_io[2]));
  LUT6 #(
    .INIT(64'h00000000000000E2)) 
    \counter[0]_i_1 
       (.I0(counter1),
        .I1(ck_io_OBUF[2]),
        .I2(counter2),
        .I3(\counter[0]_i_6_n_0 ),
        .I4(\counter[0]_i_7_n_0 ),
        .I5(\counter[0]_i_8_n_0 ),
        .O(counter));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_11 
       (.I0(counter_reg[0]),
        .O(\counter[0]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \counter[0]_i_13 
       (.I0(counter_reg[15]),
        .I1(lowDuration[15]),
        .I2(counter_reg[14]),
        .I3(lowDuration[14]),
        .O(\counter[0]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \counter[0]_i_14 
       (.I0(counter_reg[13]),
        .I1(lowDuration[13]),
        .I2(counter_reg[12]),
        .I3(lowDuration[12]),
        .O(\counter[0]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \counter[0]_i_15 
       (.I0(counter_reg[11]),
        .I1(lowDuration[11]),
        .I2(counter_reg[10]),
        .I3(lowDuration[10]),
        .O(\counter[0]_i_15_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \counter[0]_i_16 
       (.I0(counter_reg[9]),
        .I1(lowDuration[9]),
        .I2(counter_reg[8]),
        .I3(lowDuration[8]),
        .O(\counter[0]_i_16_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \counter[0]_i_17 
       (.I0(lowDuration[15]),
        .I1(counter_reg[15]),
        .I2(lowDuration[14]),
        .I3(counter_reg[14]),
        .O(\counter[0]_i_17_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \counter[0]_i_18 
       (.I0(lowDuration[13]),
        .I1(counter_reg[13]),
        .I2(lowDuration[12]),
        .I3(counter_reg[12]),
        .O(\counter[0]_i_18_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \counter[0]_i_19 
       (.I0(lowDuration[11]),
        .I1(counter_reg[11]),
        .I2(lowDuration[10]),
        .I3(counter_reg[10]),
        .O(\counter[0]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040000000)) 
    \counter[0]_i_2 
       (.I0(\counter[0]_i_6_n_0 ),
        .I1(\counter_reg[0]_i_9_n_6 ),
        .I2(\counter_reg[0]_i_9_n_5 ),
        .I3(\counter_reg[0]_i_10_n_4 ),
        .I4(\counter_reg[0]_i_9_n_7 ),
        .I5(\counter[0]_i_8_n_0 ),
        .O(counter0));
  LUT4 #(
    .INIT(16'h9009)) 
    \counter[0]_i_20 
       (.I0(lowDuration[9]),
        .I1(counter_reg[9]),
        .I2(lowDuration[8]),
        .I3(counter_reg[8]),
        .O(\counter[0]_i_20_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \counter[0]_i_22 
       (.I0(counter_reg[15]),
        .I1(highDuration[15]),
        .I2(counter_reg[14]),
        .I3(highDuration[14]),
        .O(\counter[0]_i_22_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \counter[0]_i_23 
       (.I0(counter_reg[13]),
        .I1(highDuration[13]),
        .I2(counter_reg[12]),
        .I3(highDuration[12]),
        .O(\counter[0]_i_23_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \counter[0]_i_24 
       (.I0(counter_reg[11]),
        .I1(highDuration[11]),
        .I2(counter_reg[10]),
        .I3(highDuration[10]),
        .O(\counter[0]_i_24_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \counter[0]_i_25 
       (.I0(counter_reg[9]),
        .I1(highDuration[9]),
        .I2(counter_reg[8]),
        .I3(highDuration[8]),
        .O(\counter[0]_i_25_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \counter[0]_i_26 
       (.I0(highDuration[15]),
        .I1(counter_reg[15]),
        .I2(highDuration[14]),
        .I3(counter_reg[14]),
        .O(\counter[0]_i_26_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \counter[0]_i_27 
       (.I0(highDuration[13]),
        .I1(counter_reg[13]),
        .I2(highDuration[12]),
        .I3(counter_reg[12]),
        .O(\counter[0]_i_27_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \counter[0]_i_28 
       (.I0(highDuration[11]),
        .I1(counter_reg[11]),
        .I2(highDuration[10]),
        .I3(counter_reg[10]),
        .O(\counter[0]_i_28_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \counter[0]_i_29 
       (.I0(highDuration[9]),
        .I1(counter_reg[9]),
        .I2(highDuration[8]),
        .I3(counter_reg[8]),
        .O(\counter[0]_i_29_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \counter[0]_i_31 
       (.I0(counter_reg[7]),
        .I1(lowDuration[7]),
        .I2(counter_reg[6]),
        .I3(lowDuration[6]),
        .O(\counter[0]_i_31_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \counter[0]_i_32 
       (.I0(counter_reg[5]),
        .I1(lowDuration[5]),
        .I2(counter_reg[4]),
        .I3(lowDuration[4]),
        .O(\counter[0]_i_32_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \counter[0]_i_33 
       (.I0(counter_reg[3]),
        .I1(lowDuration[3]),
        .I2(counter_reg[2]),
        .I3(lowDuration[2]),
        .O(\counter[0]_i_33_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \counter[0]_i_34 
       (.I0(counter_reg[1]),
        .I1(lowDuration[1]),
        .I2(counter_reg[0]),
        .I3(lowDuration[0]),
        .O(\counter[0]_i_34_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \counter[0]_i_35 
       (.I0(lowDuration[7]),
        .I1(counter_reg[7]),
        .I2(lowDuration[6]),
        .I3(counter_reg[6]),
        .O(\counter[0]_i_35_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \counter[0]_i_36 
       (.I0(lowDuration[5]),
        .I1(counter_reg[5]),
        .I2(lowDuration[4]),
        .I3(counter_reg[4]),
        .O(\counter[0]_i_36_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \counter[0]_i_37 
       (.I0(lowDuration[3]),
        .I1(counter_reg[3]),
        .I2(lowDuration[2]),
        .I3(counter_reg[2]),
        .O(\counter[0]_i_37_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \counter[0]_i_38 
       (.I0(lowDuration[1]),
        .I1(counter_reg[1]),
        .I2(lowDuration[0]),
        .I3(counter_reg[0]),
        .O(\counter[0]_i_38_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \counter[0]_i_39 
       (.I0(counter_reg[7]),
        .I1(highDuration[7]),
        .I2(counter_reg[6]),
        .I3(highDuration[6]),
        .O(\counter[0]_i_39_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \counter[0]_i_40 
       (.I0(counter_reg[5]),
        .I1(highDuration[5]),
        .I2(counter_reg[4]),
        .I3(highDuration[4]),
        .O(\counter[0]_i_40_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \counter[0]_i_41 
       (.I0(counter_reg[3]),
        .I1(highDuration[3]),
        .I2(counter_reg[2]),
        .I3(highDuration[2]),
        .O(\counter[0]_i_41_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \counter[0]_i_42 
       (.I0(counter_reg[1]),
        .I1(highDuration[1]),
        .I2(counter_reg[0]),
        .I3(highDuration[0]),
        .O(\counter[0]_i_42_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \counter[0]_i_43 
       (.I0(highDuration[7]),
        .I1(counter_reg[7]),
        .I2(highDuration[6]),
        .I3(counter_reg[6]),
        .O(\counter[0]_i_43_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \counter[0]_i_44 
       (.I0(highDuration[5]),
        .I1(counter_reg[5]),
        .I2(highDuration[4]),
        .I3(counter_reg[4]),
        .O(\counter[0]_i_44_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \counter[0]_i_45 
       (.I0(highDuration[3]),
        .I1(counter_reg[3]),
        .I2(highDuration[2]),
        .I3(counter_reg[2]),
        .O(\counter[0]_i_45_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \counter[0]_i_46 
       (.I0(highDuration[1]),
        .I1(counter_reg[1]),
        .I2(highDuration[0]),
        .I3(counter_reg[0]),
        .O(\counter[0]_i_46_n_0 ));
  LUT5 #(
    .INIT(32'hDFFFFFFF)) 
    \counter[0]_i_6 
       (.I0(\counter_reg[0]_i_10_n_7 ),
        .I1(divider_reg[0]),
        .I2(\counter_reg[0]_i_30_n_4 ),
        .I3(\counter_reg[0]_i_10_n_5 ),
        .I4(\counter_reg[0]_i_10_n_6 ),
        .O(\counter[0]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \counter[0]_i_7 
       (.I0(\counter_reg[0]_i_9_n_7 ),
        .I1(\counter_reg[0]_i_10_n_4 ),
        .I2(\counter_reg[0]_i_9_n_5 ),
        .I3(\counter_reg[0]_i_9_n_6 ),
        .O(\counter[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \counter[0]_i_8 
       (.I0(\counter_reg[0]_i_30_n_7 ),
        .I1(\counter_reg[0]_i_9_n_4 ),
        .I2(\counter_reg[0]_i_30_n_5 ),
        .I3(\counter_reg[0]_i_30_n_6 ),
        .O(\counter[0]_i_8_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(ck_io_OBUF[0]),
        .CE(counter0),
        .D(\counter_reg[0]_i_3_n_7 ),
        .Q(counter_reg[0]),
        .R(counter));
  CARRY4 \counter_reg[0]_i_10 
       (.CI(1'b0),
        .CO({\counter_reg[0]_i_10_n_0 ,\counter_reg[0]_i_10_n_1 ,\counter_reg[0]_i_10_n_2 ,\counter_reg[0]_i_10_n_3 }),
        .CYINIT(divider_reg[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[0]_i_10_n_4 ,\counter_reg[0]_i_10_n_5 ,\counter_reg[0]_i_10_n_6 ,\counter_reg[0]_i_10_n_7 }),
        .S(divider_reg[4:1]));
  CARRY4 \counter_reg[0]_i_12 
       (.CI(1'b0),
        .CO({\counter_reg[0]_i_12_n_0 ,\counter_reg[0]_i_12_n_1 ,\counter_reg[0]_i_12_n_2 ,\counter_reg[0]_i_12_n_3 }),
        .CYINIT(1'b1),
        .DI({\counter[0]_i_31_n_0 ,\counter[0]_i_32_n_0 ,\counter[0]_i_33_n_0 ,\counter[0]_i_34_n_0 }),
        .O(\NLW_counter_reg[0]_i_12_O_UNCONNECTED [3:0]),
        .S({\counter[0]_i_35_n_0 ,\counter[0]_i_36_n_0 ,\counter[0]_i_37_n_0 ,\counter[0]_i_38_n_0 }));
  CARRY4 \counter_reg[0]_i_21 
       (.CI(1'b0),
        .CO({\counter_reg[0]_i_21_n_0 ,\counter_reg[0]_i_21_n_1 ,\counter_reg[0]_i_21_n_2 ,\counter_reg[0]_i_21_n_3 }),
        .CYINIT(1'b1),
        .DI({\counter[0]_i_39_n_0 ,\counter[0]_i_40_n_0 ,\counter[0]_i_41_n_0 ,\counter[0]_i_42_n_0 }),
        .O(\NLW_counter_reg[0]_i_21_O_UNCONNECTED [3:0]),
        .S({\counter[0]_i_43_n_0 ,\counter[0]_i_44_n_0 ,\counter[0]_i_45_n_0 ,\counter[0]_i_46_n_0 }));
  CARRY4 \counter_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\counter_reg[0]_i_3_n_0 ,\counter_reg[0]_i_3_n_1 ,\counter_reg[0]_i_3_n_2 ,\counter_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\counter_reg[0]_i_3_n_4 ,\counter_reg[0]_i_3_n_5 ,\counter_reg[0]_i_3_n_6 ,\counter_reg[0]_i_3_n_7 }),
        .S({counter_reg[3:1],\counter[0]_i_11_n_0 }));
  CARRY4 \counter_reg[0]_i_30 
       (.CI(\counter_reg[0]_i_9_n_0 ),
        .CO({\NLW_counter_reg[0]_i_30_CO_UNCONNECTED [3],\counter_reg[0]_i_30_n_1 ,\counter_reg[0]_i_30_n_2 ,\counter_reg[0]_i_30_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[0]_i_30_n_4 ,\counter_reg[0]_i_30_n_5 ,\counter_reg[0]_i_30_n_6 ,\counter_reg[0]_i_30_n_7 }),
        .S({ck_io_OBUF[1],divider_reg[11:9]}));
  CARRY4 \counter_reg[0]_i_4 
       (.CI(\counter_reg[0]_i_12_n_0 ),
        .CO({counter1,\counter_reg[0]_i_4_n_1 ,\counter_reg[0]_i_4_n_2 ,\counter_reg[0]_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI({\counter[0]_i_13_n_0 ,\counter[0]_i_14_n_0 ,\counter[0]_i_15_n_0 ,\counter[0]_i_16_n_0 }),
        .O(\NLW_counter_reg[0]_i_4_O_UNCONNECTED [3:0]),
        .S({\counter[0]_i_17_n_0 ,\counter[0]_i_18_n_0 ,\counter[0]_i_19_n_0 ,\counter[0]_i_20_n_0 }));
  CARRY4 \counter_reg[0]_i_5 
       (.CI(\counter_reg[0]_i_21_n_0 ),
        .CO({counter2,\counter_reg[0]_i_5_n_1 ,\counter_reg[0]_i_5_n_2 ,\counter_reg[0]_i_5_n_3 }),
        .CYINIT(1'b0),
        .DI({\counter[0]_i_22_n_0 ,\counter[0]_i_23_n_0 ,\counter[0]_i_24_n_0 ,\counter[0]_i_25_n_0 }),
        .O(\NLW_counter_reg[0]_i_5_O_UNCONNECTED [3:0]),
        .S({\counter[0]_i_26_n_0 ,\counter[0]_i_27_n_0 ,\counter[0]_i_28_n_0 ,\counter[0]_i_29_n_0 }));
  CARRY4 \counter_reg[0]_i_9 
       (.CI(\counter_reg[0]_i_10_n_0 ),
        .CO({\counter_reg[0]_i_9_n_0 ,\counter_reg[0]_i_9_n_1 ,\counter_reg[0]_i_9_n_2 ,\counter_reg[0]_i_9_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[0]_i_9_n_4 ,\counter_reg[0]_i_9_n_5 ,\counter_reg[0]_i_9_n_6 ,\counter_reg[0]_i_9_n_7 }),
        .S(divider_reg[8:5]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[10] 
       (.C(ck_io_OBUF[0]),
        .CE(counter0),
        .D(\counter_reg[8]_i_1_n_5 ),
        .Q(counter_reg[10]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[11] 
       (.C(ck_io_OBUF[0]),
        .CE(counter0),
        .D(\counter_reg[8]_i_1_n_4 ),
        .Q(counter_reg[11]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[12] 
       (.C(ck_io_OBUF[0]),
        .CE(counter0),
        .D(\counter_reg[12]_i_1_n_7 ),
        .Q(counter_reg[12]),
        .R(counter));
  CARRY4 \counter_reg[12]_i_1 
       (.CI(\counter_reg[8]_i_1_n_0 ),
        .CO({\NLW_counter_reg[12]_i_1_CO_UNCONNECTED [3],\counter_reg[12]_i_1_n_1 ,\counter_reg[12]_i_1_n_2 ,\counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[12]_i_1_n_4 ,\counter_reg[12]_i_1_n_5 ,\counter_reg[12]_i_1_n_6 ,\counter_reg[12]_i_1_n_7 }),
        .S(counter_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[13] 
       (.C(ck_io_OBUF[0]),
        .CE(counter0),
        .D(\counter_reg[12]_i_1_n_6 ),
        .Q(counter_reg[13]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[14] 
       (.C(ck_io_OBUF[0]),
        .CE(counter0),
        .D(\counter_reg[12]_i_1_n_5 ),
        .Q(counter_reg[14]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[15] 
       (.C(ck_io_OBUF[0]),
        .CE(counter0),
        .D(\counter_reg[12]_i_1_n_4 ),
        .Q(counter_reg[15]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(ck_io_OBUF[0]),
        .CE(counter0),
        .D(\counter_reg[0]_i_3_n_6 ),
        .Q(counter_reg[1]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(ck_io_OBUF[0]),
        .CE(counter0),
        .D(\counter_reg[0]_i_3_n_5 ),
        .Q(counter_reg[2]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(ck_io_OBUF[0]),
        .CE(counter0),
        .D(\counter_reg[0]_i_3_n_4 ),
        .Q(counter_reg[3]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(ck_io_OBUF[0]),
        .CE(counter0),
        .D(\counter_reg[4]_i_1_n_7 ),
        .Q(counter_reg[4]),
        .R(counter));
  CARRY4 \counter_reg[4]_i_1 
       (.CI(\counter_reg[0]_i_3_n_0 ),
        .CO({\counter_reg[4]_i_1_n_0 ,\counter_reg[4]_i_1_n_1 ,\counter_reg[4]_i_1_n_2 ,\counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[4]_i_1_n_4 ,\counter_reg[4]_i_1_n_5 ,\counter_reg[4]_i_1_n_6 ,\counter_reg[4]_i_1_n_7 }),
        .S(counter_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(ck_io_OBUF[0]),
        .CE(counter0),
        .D(\counter_reg[4]_i_1_n_6 ),
        .Q(counter_reg[5]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(ck_io_OBUF[0]),
        .CE(counter0),
        .D(\counter_reg[4]_i_1_n_5 ),
        .Q(counter_reg[6]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(ck_io_OBUF[0]),
        .CE(counter0),
        .D(\counter_reg[4]_i_1_n_4 ),
        .Q(counter_reg[7]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(ck_io_OBUF[0]),
        .CE(counter0),
        .D(\counter_reg[8]_i_1_n_7 ),
        .Q(counter_reg[8]),
        .R(counter));
  CARRY4 \counter_reg[8]_i_1 
       (.CI(\counter_reg[4]_i_1_n_0 ),
        .CO({\counter_reg[8]_i_1_n_0 ,\counter_reg[8]_i_1_n_1 ,\counter_reg[8]_i_1_n_2 ,\counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[8]_i_1_n_4 ,\counter_reg[8]_i_1_n_5 ,\counter_reg[8]_i_1_n_6 ,\counter_reg[8]_i_1_n_7 }),
        .S(counter_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(ck_io_OBUF[0]),
        .CE(counter0),
        .D(\counter_reg[8]_i_1_n_6 ),
        .Q(counter_reg[9]),
        .R(counter));
  LUT1 #(
    .INIT(2'h1)) 
    \divider[0]_i_2 
       (.I0(divider_reg[0]),
        .O(\divider[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \divider_reg[0] 
       (.C(ck_io_OBUF[0]),
        .CE(1'b1),
        .D(\divider_reg[0]_i_1_n_7 ),
        .Q(divider_reg[0]),
        .R(1'b0));
  CARRY4 \divider_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\divider_reg[0]_i_1_n_0 ,\divider_reg[0]_i_1_n_1 ,\divider_reg[0]_i_1_n_2 ,\divider_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\divider_reg[0]_i_1_n_4 ,\divider_reg[0]_i_1_n_5 ,\divider_reg[0]_i_1_n_6 ,\divider_reg[0]_i_1_n_7 }),
        .S({divider_reg[3:1],\divider[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \divider_reg[10] 
       (.C(ck_io_OBUF[0]),
        .CE(1'b1),
        .D(\divider_reg[8]_i_1_n_5 ),
        .Q(divider_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divider_reg[11] 
       (.C(ck_io_OBUF[0]),
        .CE(1'b1),
        .D(\divider_reg[8]_i_1_n_4 ),
        .Q(divider_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divider_reg[12] 
       (.C(ck_io_OBUF[0]),
        .CE(1'b1),
        .D(\divider_reg[12]_i_1_n_7 ),
        .Q(ck_io_OBUF[1]),
        .R(1'b0));
  CARRY4 \divider_reg[12]_i_1 
       (.CI(\divider_reg[8]_i_1_n_0 ),
        .CO(\NLW_divider_reg[12]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_divider_reg[12]_i_1_O_UNCONNECTED [3:1],\divider_reg[12]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,ck_io_OBUF[1]}));
  FDRE #(
    .INIT(1'b0)) 
    \divider_reg[1] 
       (.C(ck_io_OBUF[0]),
        .CE(1'b1),
        .D(\divider_reg[0]_i_1_n_6 ),
        .Q(divider_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divider_reg[2] 
       (.C(ck_io_OBUF[0]),
        .CE(1'b1),
        .D(\divider_reg[0]_i_1_n_5 ),
        .Q(divider_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divider_reg[3] 
       (.C(ck_io_OBUF[0]),
        .CE(1'b1),
        .D(\divider_reg[0]_i_1_n_4 ),
        .Q(divider_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divider_reg[4] 
       (.C(ck_io_OBUF[0]),
        .CE(1'b1),
        .D(\divider_reg[4]_i_1_n_7 ),
        .Q(divider_reg[4]),
        .R(1'b0));
  CARRY4 \divider_reg[4]_i_1 
       (.CI(\divider_reg[0]_i_1_n_0 ),
        .CO({\divider_reg[4]_i_1_n_0 ,\divider_reg[4]_i_1_n_1 ,\divider_reg[4]_i_1_n_2 ,\divider_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\divider_reg[4]_i_1_n_4 ,\divider_reg[4]_i_1_n_5 ,\divider_reg[4]_i_1_n_6 ,\divider_reg[4]_i_1_n_7 }),
        .S(divider_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \divider_reg[5] 
       (.C(ck_io_OBUF[0]),
        .CE(1'b1),
        .D(\divider_reg[4]_i_1_n_6 ),
        .Q(divider_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divider_reg[6] 
       (.C(ck_io_OBUF[0]),
        .CE(1'b1),
        .D(\divider_reg[4]_i_1_n_5 ),
        .Q(divider_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divider_reg[7] 
       (.C(ck_io_OBUF[0]),
        .CE(1'b1),
        .D(\divider_reg[4]_i_1_n_4 ),
        .Q(divider_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divider_reg[8] 
       (.C(ck_io_OBUF[0]),
        .CE(1'b1),
        .D(\divider_reg[8]_i_1_n_7 ),
        .Q(divider_reg[8]),
        .R(1'b0));
  CARRY4 \divider_reg[8]_i_1 
       (.CI(\divider_reg[4]_i_1_n_0 ),
        .CO({\divider_reg[8]_i_1_n_0 ,\divider_reg[8]_i_1_n_1 ,\divider_reg[8]_i_1_n_2 ,\divider_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\divider_reg[8]_i_1_n_4 ,\divider_reg[8]_i_1_n_5 ,\divider_reg[8]_i_1_n_6 ,\divider_reg[8]_i_1_n_7 }),
        .S(divider_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \divider_reg[9] 
       (.C(ck_io_OBUF[0]),
        .CE(1'b1),
        .D(\divider_reg[8]_i_1_n_6 ),
        .Q(divider_reg[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    \highDuration[15]_i_1 
       (.I0(ck_io_OBUF[2]),
        .I1(ready),
        .O(\highDuration[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \highDuration_reg[0] 
       (.C(CLK100MHZ_IBUF),
        .CE(\highDuration[15]_i_1_n_0 ),
        .D(data[0]),
        .Q(highDuration[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \highDuration_reg[10] 
       (.C(CLK100MHZ_IBUF),
        .CE(\highDuration[15]_i_1_n_0 ),
        .D(data[10]),
        .Q(highDuration[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \highDuration_reg[11] 
       (.C(CLK100MHZ_IBUF),
        .CE(\highDuration[15]_i_1_n_0 ),
        .D(data[11]),
        .Q(highDuration[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \highDuration_reg[12] 
       (.C(CLK100MHZ_IBUF),
        .CE(\highDuration[15]_i_1_n_0 ),
        .D(data[12]),
        .Q(highDuration[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \highDuration_reg[13] 
       (.C(CLK100MHZ_IBUF),
        .CE(\highDuration[15]_i_1_n_0 ),
        .D(data[13]),
        .Q(highDuration[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \highDuration_reg[14] 
       (.C(CLK100MHZ_IBUF),
        .CE(\highDuration[15]_i_1_n_0 ),
        .D(data[14]),
        .Q(highDuration[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \highDuration_reg[15] 
       (.C(CLK100MHZ_IBUF),
        .CE(\highDuration[15]_i_1_n_0 ),
        .D(data[15]),
        .Q(highDuration[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \highDuration_reg[1] 
       (.C(CLK100MHZ_IBUF),
        .CE(\highDuration[15]_i_1_n_0 ),
        .D(data[1]),
        .Q(highDuration[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \highDuration_reg[2] 
       (.C(CLK100MHZ_IBUF),
        .CE(\highDuration[15]_i_1_n_0 ),
        .D(data[2]),
        .Q(highDuration[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \highDuration_reg[3] 
       (.C(CLK100MHZ_IBUF),
        .CE(\highDuration[15]_i_1_n_0 ),
        .D(data[3]),
        .Q(highDuration[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \highDuration_reg[4] 
       (.C(CLK100MHZ_IBUF),
        .CE(\highDuration[15]_i_1_n_0 ),
        .D(data[4]),
        .Q(highDuration[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \highDuration_reg[5] 
       (.C(CLK100MHZ_IBUF),
        .CE(\highDuration[15]_i_1_n_0 ),
        .D(data[5]),
        .Q(highDuration[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \highDuration_reg[6] 
       (.C(CLK100MHZ_IBUF),
        .CE(\highDuration[15]_i_1_n_0 ),
        .D(data[6]),
        .Q(highDuration[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \highDuration_reg[7] 
       (.C(CLK100MHZ_IBUF),
        .CE(\highDuration[15]_i_1_n_0 ),
        .D(data[7]),
        .Q(highDuration[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \highDuration_reg[8] 
       (.C(CLK100MHZ_IBUF),
        .CE(\highDuration[15]_i_1_n_0 ),
        .D(data[8]),
        .Q(highDuration[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \highDuration_reg[9] 
       (.C(CLK100MHZ_IBUF),
        .CE(\highDuration[15]_i_1_n_0 ),
        .D(data[9]),
        .Q(highDuration[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \lowDuration[15]_i_1 
       (.I0(ready),
        .I1(ck_io_OBUF[2]),
        .O(\lowDuration[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \lowDuration_reg[0] 
       (.C(CLK100MHZ_IBUF),
        .CE(\lowDuration[15]_i_1_n_0 ),
        .D(data[0]),
        .Q(lowDuration[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lowDuration_reg[10] 
       (.C(CLK100MHZ_IBUF),
        .CE(\lowDuration[15]_i_1_n_0 ),
        .D(data[10]),
        .Q(lowDuration[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lowDuration_reg[11] 
       (.C(CLK100MHZ_IBUF),
        .CE(\lowDuration[15]_i_1_n_0 ),
        .D(data[11]),
        .Q(lowDuration[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lowDuration_reg[12] 
       (.C(CLK100MHZ_IBUF),
        .CE(\lowDuration[15]_i_1_n_0 ),
        .D(data[12]),
        .Q(lowDuration[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lowDuration_reg[13] 
       (.C(CLK100MHZ_IBUF),
        .CE(\lowDuration[15]_i_1_n_0 ),
        .D(data[13]),
        .Q(lowDuration[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lowDuration_reg[14] 
       (.C(CLK100MHZ_IBUF),
        .CE(\lowDuration[15]_i_1_n_0 ),
        .D(data[14]),
        .Q(lowDuration[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lowDuration_reg[15] 
       (.C(CLK100MHZ_IBUF),
        .CE(\lowDuration[15]_i_1_n_0 ),
        .D(data[15]),
        .Q(lowDuration[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lowDuration_reg[1] 
       (.C(CLK100MHZ_IBUF),
        .CE(\lowDuration[15]_i_1_n_0 ),
        .D(data[1]),
        .Q(lowDuration[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lowDuration_reg[2] 
       (.C(CLK100MHZ_IBUF),
        .CE(\lowDuration[15]_i_1_n_0 ),
        .D(data[2]),
        .Q(lowDuration[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lowDuration_reg[3] 
       (.C(CLK100MHZ_IBUF),
        .CE(\lowDuration[15]_i_1_n_0 ),
        .D(data[3]),
        .Q(lowDuration[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lowDuration_reg[4] 
       (.C(CLK100MHZ_IBUF),
        .CE(\lowDuration[15]_i_1_n_0 ),
        .D(data[4]),
        .Q(lowDuration[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lowDuration_reg[5] 
       (.C(CLK100MHZ_IBUF),
        .CE(\lowDuration[15]_i_1_n_0 ),
        .D(data[5]),
        .Q(lowDuration[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lowDuration_reg[6] 
       (.C(CLK100MHZ_IBUF),
        .CE(\lowDuration[15]_i_1_n_0 ),
        .D(data[6]),
        .Q(lowDuration[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lowDuration_reg[7] 
       (.C(CLK100MHZ_IBUF),
        .CE(\lowDuration[15]_i_1_n_0 ),
        .D(data[7]),
        .Q(lowDuration[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lowDuration_reg[8] 
       (.C(CLK100MHZ_IBUF),
        .CE(\lowDuration[15]_i_1_n_0 ),
        .D(data[8]),
        .Q(lowDuration[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lowDuration_reg[9] 
       (.C(CLK100MHZ_IBUF),
        .CE(\lowDuration[15]_i_1_n_0 ),
        .D(data[9]),
        .Q(lowDuration[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFDFFFD00030000)) 
    \outputReg[0]_i_1 
       (.I0(counter2),
        .I1(\counter[0]_i_8_n_0 ),
        .I2(\counter[0]_i_7_n_0 ),
        .I3(\counter[0]_i_6_n_0 ),
        .I4(counter1),
        .I5(ck_io_OBUF[2]),
        .O(\outputReg[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \outputReg_reg[0] 
       (.C(ck_io_OBUF[0]),
        .CE(1'b1),
        .D(\outputReg[0]_i_1_n_0 ),
        .Q(ck_io_OBUF[2]),
        .R(1'b0));
  IBUF vn_in_IBUF_inst
       (.I(vn_in),
        .O(vn_in_IBUF));
  IBUF vp_in_IBUF_inst
       (.I(vp_in),
        .O(vp_in_IBUF));
  (* IMPORTED_FROM = "/home/dmercer/src/experiments/vivado/Arty_A7-35T_XADC_Demo/vivado_proj/Arty-A7-35-XADC.srcs/xadc_wiz_0/ip/xadc_wiz_0/xadc_wiz_0.dcp" *) 
  (* IMPORTED_TYPE = "CHECKPOINT" *) 
  (* IS_IMPORTED *) 
  xadc_wiz_0 xadc
       (.alarm_out(NLW_xadc_alarm_out_UNCONNECTED),
        .busy_out(NLW_xadc_busy_out_UNCONNECTED),
        .channel_out(NLW_xadc_channel_out_UNCONNECTED[4:0]),
        .daddr_in({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,Address_in}),
        .dclk_in(CLK100MHZ_IBUF),
        .den_in(enable),
        .di_in({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .do_out(data),
        .drdy_out(ready),
        .dwe_in(1'b0),
        .eoc_out(enable),
        .eos_out(NLW_xadc_eos_out_UNCONNECTED),
        .reset_in(1'b0),
        .vauxn0(ck_an_n_IBUF[5]),
        .vauxn12(ck_an_n_IBUF[6]),
        .vauxn13(ck_an_n_IBUF[7]),
        .vauxn14(ck_an_n_IBUF[8]),
        .vauxn15(ck_an_n_IBUF[4]),
        .vauxn4(ck_an_n_IBUF[0]),
        .vauxn5(ck_an_n_IBUF[1]),
        .vauxn6(ck_an_n_IBUF[2]),
        .vauxn7(ck_an_n_IBUF[3]),
        .vauxp0(ck_an_p_IBUF[5]),
        .vauxp12(ck_an_p_IBUF[6]),
        .vauxp13(ck_an_p_IBUF[7]),
        .vauxp14(ck_an_p_IBUF[8]),
        .vauxp15(ck_an_p_IBUF[4]),
        .vauxp4(ck_an_p_IBUF[0]),
        .vauxp5(ck_an_p_IBUF[1]),
        .vauxp6(ck_an_p_IBUF[2]),
        .vauxp7(ck_an_p_IBUF[3]),
        .vn_in(vn_in_IBUF),
        .vp_in(vp_in_IBUF));
endmodule

module clk_wiz_0
   (clk_8192KHz,
    resetn,
    sys_clk_in);
  output clk_8192KHz;
  input resetn;
  input sys_clk_in;

  wire clk_8192KHz;
  wire resetn;
  (* IBUF_LOW_PWR *) wire sys_clk_in;

  clk_wiz_0_clk_wiz_0_clk_wiz inst
       (.clk_8192KHz(clk_8192KHz),
        .resetn(resetn),
        .sys_clk_in(sys_clk_in));
endmodule

(* ORIG_REF_NAME = "clk_wiz_0_clk_wiz" *) 
module clk_wiz_0_clk_wiz_0_clk_wiz
   (clk_8192KHz,
    resetn,
    sys_clk_in);
  output clk_8192KHz;
  input resetn;
  input sys_clk_in;

  wire clk_8192KHz;
  wire clk_8192KHz_clk_wiz_0;
  wire clkfbout_clk_wiz_0;
  wire reset_high;
  wire resetn;
  wire sys_clk_in;
  wire NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT1_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED;
  wire NLW_mmcm_adv_inst_DRDY_UNCONNECTED;
  wire NLW_mmcm_adv_inst_LOCKED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_PSDONE_UNCONNECTED;
  wire [15:0]NLW_mmcm_adv_inst_DO_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG clkout1_buf
       (.I(clk_8192KHz_clk_wiz_0),
        .O(clk_8192KHz));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  MMCME2_ADV #(
    .BANDWIDTH("HIGH"),
    .CLKFBOUT_MULT_F(8.875000),
    .CLKFBOUT_PHASE(0.000000),
    .CLKFBOUT_USE_FINE_PS("FALSE"),
    .CLKIN1_PERIOD(10.000000),
    .CLKIN2_PERIOD(0.000000),
    .CLKOUT0_DIVIDE_F(108.375000),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT0_USE_FINE_PS("FALSE"),
    .CLKOUT1_DIVIDE(1),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(0.000000),
    .CLKOUT1_USE_FINE_PS("FALSE"),
    .CLKOUT2_DIVIDE(1),
    .CLKOUT2_DUTY_CYCLE(0.500000),
    .CLKOUT2_PHASE(0.000000),
    .CLKOUT2_USE_FINE_PS("FALSE"),
    .CLKOUT3_DIVIDE(1),
    .CLKOUT3_DUTY_CYCLE(0.500000),
    .CLKOUT3_PHASE(0.000000),
    .CLKOUT3_USE_FINE_PS("FALSE"),
    .CLKOUT4_CASCADE("FALSE"),
    .CLKOUT4_DIVIDE(1),
    .CLKOUT4_DUTY_CYCLE(0.500000),
    .CLKOUT4_PHASE(0.000000),
    .CLKOUT4_USE_FINE_PS("FALSE"),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT5_DUTY_CYCLE(0.500000),
    .CLKOUT5_PHASE(0.000000),
    .CLKOUT5_USE_FINE_PS("FALSE"),
    .CLKOUT6_DIVIDE(1),
    .CLKOUT6_DUTY_CYCLE(0.500000),
    .CLKOUT6_PHASE(0.000000),
    .CLKOUT6_USE_FINE_PS("FALSE"),
    .COMPENSATION("INTERNAL"),
    .DIVCLK_DIVIDE(1),
    .IS_CLKINSEL_INVERTED(1'b0),
    .IS_PSEN_INVERTED(1'b0),
    .IS_PSINCDEC_INVERTED(1'b0),
    .IS_PWRDWN_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .REF_JITTER1(0.010000),
    .REF_JITTER2(0.010000),
    .SS_EN("FALSE"),
    .SS_MODE("CENTER_HIGH"),
    .SS_MOD_PERIOD(10000),
    .STARTUP_WAIT("FALSE")) 
    mmcm_adv_inst
       (.CLKFBIN(clkfbout_clk_wiz_0),
        .CLKFBOUT(clkfbout_clk_wiz_0),
        .CLKFBOUTB(NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED),
        .CLKFBSTOPPED(NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED),
        .CLKIN1(sys_clk_in),
        .CLKIN2(1'b0),
        .CLKINSEL(1'b1),
        .CLKINSTOPPED(NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED),
        .CLKOUT0(clk_8192KHz_clk_wiz_0),
        .CLKOUT0B(NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED),
        .CLKOUT1(NLW_mmcm_adv_inst_CLKOUT1_UNCONNECTED),
        .CLKOUT1B(NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED),
        .CLKOUT2(NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED),
        .CLKOUT2B(NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED),
        .CLKOUT3(NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED),
        .CLKOUT3B(NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED),
        .CLKOUT4(NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED),
        .CLKOUT5(NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED),
        .CLKOUT6(NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED),
        .DADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DO(NLW_mmcm_adv_inst_DO_UNCONNECTED[15:0]),
        .DRDY(NLW_mmcm_adv_inst_DRDY_UNCONNECTED),
        .DWE(1'b0),
        .LOCKED(NLW_mmcm_adv_inst_LOCKED_UNCONNECTED),
        .PSCLK(1'b0),
        .PSDONE(NLW_mmcm_adv_inst_PSDONE_UNCONNECTED),
        .PSEN(1'b0),
        .PSINCDEC(1'b0),
        .PWRDWN(1'b0),
        .RST(reset_high));
  LUT1 #(
    .INIT(2'h1)) 
    mmcm_adv_inst_i_1
       (.I0(resetn),
        .O(reset_high));
endmodule

module xadc_wiz_0
   (daddr_in,
    dclk_in,
    den_in,
    di_in,
    dwe_in,
    reset_in,
    vauxp0,
    vauxn0,
    vauxp4,
    vauxn4,
    vauxp5,
    vauxn5,
    vauxp6,
    vauxn6,
    vauxp7,
    vauxn7,
    vauxp12,
    vauxn12,
    vauxp13,
    vauxn13,
    vauxp14,
    vauxn14,
    vauxp15,
    vauxn15,
    busy_out,
    channel_out,
    do_out,
    drdy_out,
    eoc_out,
    eos_out,
    alarm_out,
    vp_in,
    vn_in);
  input [6:0]daddr_in;
  input dclk_in;
  input den_in;
  input [15:0]di_in;
  input dwe_in;
  input reset_in;
  input vauxp0;
  input vauxn0;
  input vauxp4;
  input vauxn4;
  input vauxp5;
  input vauxn5;
  input vauxp6;
  input vauxn6;
  input vauxp7;
  input vauxn7;
  input vauxp12;
  input vauxn12;
  input vauxp13;
  input vauxn13;
  input vauxp14;
  input vauxn14;
  input vauxp15;
  input vauxn15;
  output busy_out;
  output [4:0]channel_out;
  output [15:0]do_out;
  output drdy_out;
  output eoc_out;
  output eos_out;
  output alarm_out;
  input vp_in;
  input vn_in;

  wire alarm_out;
  wire busy_out;
  wire [4:0]channel_out;
  wire [6:0]daddr_in;
  wire dclk_in;
  wire den_in;
  wire [15:0]di_in;
  wire [15:0]do_out;
  wire drdy_out;
  wire dwe_in;
  wire eoc_out;
  wire eos_out;
  wire reset_in;
  wire vauxn0;
  wire vauxn12;
  wire vauxn13;
  wire vauxn14;
  wire vauxn15;
  wire vauxn4;
  wire vauxn5;
  wire vauxn6;
  wire vauxn7;
  wire vauxp0;
  wire vauxp12;
  wire vauxp13;
  wire vauxp14;
  wire vauxp15;
  wire vauxp4;
  wire vauxp5;
  wire vauxp6;
  wire vauxp7;
  wire vn_in;
  wire vp_in;
  wire NLW_inst_JTAGBUSY_UNCONNECTED;
  wire NLW_inst_JTAGLOCKED_UNCONNECTED;
  wire NLW_inst_JTAGMODIFIED_UNCONNECTED;
  wire NLW_inst_OT_UNCONNECTED;
  wire [6:0]NLW_inst_ALM_UNCONNECTED;
  wire [4:0]NLW_inst_MUXADDR_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  XADC #(
    .INIT_40(16'h0000),
    .INIT_41(16'h21AF),
    .INIT_42(16'h0400),
    .INIT_43(16'h0000),
    .INIT_44(16'h0000),
    .INIT_45(16'h0000),
    .INIT_46(16'h0000),
    .INIT_47(16'h0000),
    .INIT_48(16'h0800),
    .INIT_49(16'hF0F1),
    .INIT_4A(16'h0000),
    .INIT_4B(16'h0000),
    .INIT_4C(16'h0000),
    .INIT_4D(16'h0000),
    .INIT_4E(16'h0000),
    .INIT_4F(16'h0000),
    .INIT_50(16'hB5ED),
    .INIT_51(16'h57E4),
    .INIT_52(16'hA147),
    .INIT_53(16'hCA33),
    .INIT_54(16'hA93A),
    .INIT_55(16'h52C6),
    .INIT_56(16'h9555),
    .INIT_57(16'hAE4E),
    .INIT_58(16'h5999),
    .INIT_59(16'h0000),
    .INIT_5A(16'h0000),
    .INIT_5B(16'h0000),
    .INIT_5C(16'h5111),
    .INIT_5D(16'h0000),
    .INIT_5E(16'h0000),
    .INIT_5F(16'h0000),
    .IS_CONVSTCLK_INVERTED(1'b0),
    .IS_DCLK_INVERTED(1'b0),
    .SIM_DEVICE("7SERIES"),
    .SIM_MONITOR_FILE("design.txt")) 
    inst
       (.ALM({alarm_out,NLW_inst_ALM_UNCONNECTED[6:0]}),
        .BUSY(busy_out),
        .CHANNEL(channel_out),
        .CONVST(1'b0),
        .CONVSTCLK(1'b0),
        .DADDR(daddr_in),
        .DCLK(dclk_in),
        .DEN(den_in),
        .DI(di_in),
        .DO(do_out),
        .DRDY(drdy_out),
        .DWE(dwe_in),
        .EOC(eoc_out),
        .EOS(eos_out),
        .JTAGBUSY(NLW_inst_JTAGBUSY_UNCONNECTED),
        .JTAGLOCKED(NLW_inst_JTAGLOCKED_UNCONNECTED),
        .JTAGMODIFIED(NLW_inst_JTAGMODIFIED_UNCONNECTED),
        .MUXADDR(NLW_inst_MUXADDR_UNCONNECTED[4:0]),
        .OT(NLW_inst_OT_UNCONNECTED),
        .RESET(reset_in),
        .VAUXN({vauxn15,vauxn14,vauxn13,vauxn12,1'b0,1'b0,1'b0,1'b0,vauxn7,vauxn6,vauxn5,vauxn4,1'b0,1'b0,1'b0,vauxn0}),
        .VAUXP({vauxp15,vauxp14,vauxp13,vauxp12,1'b0,1'b0,1'b0,1'b0,vauxp7,vauxp6,vauxp5,vauxp4,1'b0,1'b0,1'b0,vauxp0}),
        .VN(vn_in),
        .VP(vp_in));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
