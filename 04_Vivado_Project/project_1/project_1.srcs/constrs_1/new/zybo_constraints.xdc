# Clock 125MHz differential input
set_property PACKAGE_PIN L16 [get_ports diff_clock_rtl_clk_p]
set_property IOSTANDARD DIFF_SSTL135 [get_ports diff_clock_rtl_clk_p]
set_property PACKAGE_PIN K16 [get_ports diff_clock_rtl_clk_n]
set_property IOSTANDARD DIFF_SSTL135 [get_ports diff_clock_rtl_clk_n]

# Reset button (BTN0)
set_property PACKAGE_PIN R18 [get_ports reset_rtl]
set_property IOSTANDARD LVCMOS33 [get_ports reset_rtl]

# USB-UART TX - Zybo onboard USB-UART
set_property PACKAGE_PIN A9 [get_ports uart_rtl_txd]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rtl_txd]

# USB-UART RX - Zybo onboard USB-UART
set_property PACKAGE_PIN B9 [get_ports uart_rtl_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rtl_rxd]

# Downgrade UCIO and NSTD to warnings only
set_property SEVERITY {Warning} [get_drc_checks UCIO-1]
set_property SEVERITY {Warning} [get_drc_checks NSTD-1]