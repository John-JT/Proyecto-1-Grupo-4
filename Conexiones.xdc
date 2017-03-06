## This file is a general .xdc for the Nexys4 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

##Clock signal
##Bank = 35, Pin name = IO_L12P_T1_MRCC_35,					Sch name = CLK100MHZ
set_property PACKAGE_PIN E3 [get_ports reloj]
set_property IOSTANDARD LVCMOS33 [get_ports reloj]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports reloj]

## Switches
##Bank = 34, Pin name = IO_L21P_T3_DQS_34,                    Sch name = SW0
set_property PACKAGE_PIN U9 [get_ports Boton_R]
set_property IOSTANDARD LVCMOS33 [get_ports Boton_R]
##Bank = 34, Pin name = IO_25_34,                            Sch name = SW1
set_property PACKAGE_PIN U8 [get_ports Boton_G]
set_property IOSTANDARD LVCMOS33 [get_ports Boton_G]
##Bank = 34, Pin name = IO_L23P_T3_34,                        Sch name = SW2
set_property PACKAGE_PIN R7 [get_ports Boton_B]
set_property IOSTANDARD LVCMOS33 [get_ports Boton_B]


##Buttons
##Bank = 15, Pin name = IO_L11N_T1_SRCC_15,					Sch name = BTNC
set_property PACKAGE_PIN E16 [get_ports resetM]
set_property IOSTANDARD LVCMOS33 [get_ports resetM]



##VGA Connector
##Bank = 35, Pin name = IO_L8N_T1_AD14N_35,					Sch name = VGA_R0
set_property PACKAGE_PIN A3 [get_ports {R[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {R[0]}]
##Bank = 35, Pin name = IO_L7N_T1_AD6N_35,					Sch name = VGA_R1
set_property PACKAGE_PIN B4 [get_ports {R[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {R[1]}]
##Bank = 35, Pin name = IO_L1N_T0_AD4N_35,					Sch name = VGA_R2
set_property PACKAGE_PIN C5 [get_ports {R[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {R[2]}]
##Bank = 35, Pin name = IO_L8P_T1_AD14P_35,					Sch name = VGA_R3
set_property PACKAGE_PIN A4 [get_ports {R[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {R[3]}]


##Bank = 35, Pin name = IO_L2P_T0_AD12P_35,					Sch name = VGA_B0
set_property PACKAGE_PIN B7 [get_ports {B[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[0]}]
##Bank = 35, Pin name = IO_L4N_T0_35,						Sch name = VGA_B1
set_property PACKAGE_PIN C7 [get_ports {B[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[1]}]
##Bank = 35, Pin name = IO_L6N_T0_VREF_35,					Sch name = VGA_B2
set_property PACKAGE_PIN D7 [get_ports {B[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[2]}]
##Bank = 35, Pin name = IO_L4P_T0_35,						Sch name = VGA_B3
set_property PACKAGE_PIN D8 [get_ports {B[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[3]}]


##Bank = 35, Pin name = IO_L1P_T0_AD4P_35,					Sch name = VGA_G0
set_property PACKAGE_PIN C6 [get_ports {G[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {G[0]}]
##Bank = 35, Pin name = IO_L3N_T0_DQS_AD5N_35,				Sch name = VGA_G1
set_property PACKAGE_PIN A5 [get_ports {G[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {G[1]}]
##Bank = 35, Pin name = IO_L2N_T0_AD12N_35,					Sch name = VGA_G2
set_property PACKAGE_PIN B6 [get_ports {G[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {G[2]}]
##Bank = 35, Pin name = IO_L3P_T0_DQS_AD5P_35,				Sch name = VGA_G3
set_property PACKAGE_PIN A6 [get_ports {G[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {G[3]}]


##Bank = 15, Pin name = IO_L4P_T0_15,						Sch name = VGA_HS
set_property PACKAGE_PIN B11 [get_ports H_Sync]
set_property IOSTANDARD LVCMOS33 [get_ports H_Sync]
##Bank = 15, Pin name = IO_L3N_T0_DQS_AD1N_15,				Sch name = VGA_VS
set_property PACKAGE_PIN B12 [get_ports V_Sync]
set_property IOSTANDARD LVCMOS33 [get_ports V_Sync]



set_property CONFIG_VOLTAGE 2.5 [current_design]
set_property CFGBVS VCCO [current_design]
