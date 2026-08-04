###############################################################################
# Original Digilent Zybo Rev. B
# Minimal MicroBlaze V constraints
###############################################################################

## 125 MHz programmable-logic clock
set_property PACKAGE_PIN L16 [get_ports sys_clock]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clock]

create_clock -add \
    -name sys_clock \
    -period 8.000 \
    -waveform {0.000 4.000} \
    [get_ports sys_clock]


## Active-high manual reset using BTN0
set_property PACKAGE_PIN R18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]


## AXI UART Lite through Pmod JE
## JE1: FPGA UART TX -> USB-UART adapter RX
## JE2: FPGA UART RX <- USB-UART adapter TX

set_property PACKAGE_PIN V12 [get_ports UART_txd]
set_property IOSTANDARD LVCMOS33 [get_ports UART_txd]

set_property PACKAGE_PIN W16 [get_ports UART_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports UART_rxd]