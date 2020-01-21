// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Mon Jan 20 23:39:25 2020
// Host        : home-debian-1 running 64-bit Debian GNU/Linux 10 (buster)
// Command     : write_verilog -force -mode synth_stub
//               /home/dmercer/src/experiments/vivado/Arty_A7-35T_XADC_Demo/vivado_proj/Arty-A7-35-XADC.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_5MHz, resetn, sys_clk_in)
/* synthesis syn_black_box black_box_pad_pin="clk_5MHz,resetn,sys_clk_in" */;
  output clk_5MHz;
  input resetn;
  input sys_clk_in;
endmodule
