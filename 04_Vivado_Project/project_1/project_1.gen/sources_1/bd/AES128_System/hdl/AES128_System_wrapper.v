//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
//Date        : Fri May 22 22:58:47 2026
//Host        : DESKTOP-A3QFNGL running 64-bit major release  (build 9200)
//Command     : generate_target AES128_System_wrapper.bd
//Design      : AES128_System_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module AES128_System_wrapper
   (diff_clock_rtl_clk_n,
    diff_clock_rtl_clk_p,
    reset_rtl);
  input diff_clock_rtl_clk_n;
  input diff_clock_rtl_clk_p;
  input reset_rtl;

  wire diff_clock_rtl_clk_n;
  wire diff_clock_rtl_clk_p;
  wire reset_rtl;

  AES128_System AES128_System_i
       (.diff_clock_rtl_clk_n(diff_clock_rtl_clk_n),
        .diff_clock_rtl_clk_p(diff_clock_rtl_clk_p),
        .reset_rtl(reset_rtl));
endmodule
