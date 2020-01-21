set_property SRC_FILE_INFO {cfile:/home/dmercer/src/experiments/vivado/Arty_A7-35T_XADC_Demo/vivado_proj/Arty-A7-35-XADC.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc rfile:../../../Arty-A7-35-XADC.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports sys_clk_in]] 0.1
