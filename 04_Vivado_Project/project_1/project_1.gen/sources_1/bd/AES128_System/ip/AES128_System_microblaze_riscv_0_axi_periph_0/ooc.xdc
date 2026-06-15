# aclk {FREQ_HZ 100000000 CLK_DOMAIN AES128_System_clk_wiz_1_0_clk_out1 PHASE 0.0} aclk1 {FREQ_HZ 100000000 CLK_DOMAIN AES128_System_processing_system7_0_0_FCLK_CLK0 PHASE 0.0}
# Clock Domain: AES128_System_clk_wiz_1_0_clk_out1
create_clock -name aclk -period 10.000 [get_ports aclk]
# Clock Domain: AES128_System_processing_system7_0_0_FCLK_CLK0
create_clock -name aclk1 -period 10.000 [get_ports aclk1]
# Generated clocks
