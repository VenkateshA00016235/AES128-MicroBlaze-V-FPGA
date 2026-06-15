//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
//Date        : Mon Jun 15 20:45:53 2026
//Host        : DESKTOP-A3QFNGL running 64-bit major release  (build 9200)
//Command     : generate_target AES128_System.bd
//Design      : AES128_System
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "AES128_System,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=AES128_System,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=15,numReposBlks=14,numNonXlnxBlks=0,numHierBlks=1,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=2,da_board_cnt=4,da_microblaze_riscv_cnt=1,da_ps7_cnt=1,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "AES128_System.hwdef" *) 
module AES128_System
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    diff_clock_rtl_clk_n,
    diff_clock_rtl_clk_p,
    reset_rtl,
    uart_rtl_rxd,
    uart_rtl_txd);
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ADDR" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DDR, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250" *) inout [14:0]DDR_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR BA" *) inout [2:0]DDR_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CAS_N" *) inout DDR_cas_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_N" *) inout DDR_ck_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_P" *) inout DDR_ck_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CKE" *) inout DDR_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CS_N" *) inout DDR_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DM" *) inout [3:0]DDR_dm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQ" *) inout [31:0]DDR_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_N" *) inout [3:0]DDR_dqs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_P" *) inout [3:0]DDR_dqs_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ODT" *) inout DDR_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RAS_N" *) inout DDR_ras_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RESET_N" *) inout DDR_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR WE_N" *) inout DDR_we_n;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false" *) inout FIXED_IO_ddr_vrn;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP" *) inout FIXED_IO_ddr_vrp;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO" *) inout [53:0]FIXED_IO_mio;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK" *) inout FIXED_IO_ps_clk;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB" *) inout FIXED_IO_ps_porb;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB" *) inout FIXED_IO_ps_srstb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 diff_clock_rtl CLK_N" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME diff_clock_rtl, CAN_DEBUG false, FREQ_HZ 100000000" *) input diff_clock_rtl_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 diff_clock_rtl CLK_P" *) input diff_clock_rtl_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_RTL RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_RTL, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset_rtl;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 uart_rtl RxD" *) (* X_INTERFACE_MODE = "Master" *) input uart_rtl_rxd;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 uart_rtl TxD" *) output uart_rtl_txd;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire clk_wiz_1_locked;
  wire diff_clock_rtl_clk_n;
  wire diff_clock_rtl_clk_p;
  wire mdm_1_debug_sys_rst;
  wire microblaze_riscv_0_Clk;
  wire [31:0]microblaze_riscv_0_axi_dp_ARADDR;
  wire [2:0]microblaze_riscv_0_axi_dp_ARPROT;
  wire microblaze_riscv_0_axi_dp_ARREADY;
  wire microblaze_riscv_0_axi_dp_ARVALID;
  wire [31:0]microblaze_riscv_0_axi_dp_AWADDR;
  wire [2:0]microblaze_riscv_0_axi_dp_AWPROT;
  wire microblaze_riscv_0_axi_dp_AWREADY;
  wire microblaze_riscv_0_axi_dp_AWVALID;
  wire microblaze_riscv_0_axi_dp_BREADY;
  wire [1:0]microblaze_riscv_0_axi_dp_BRESP;
  wire microblaze_riscv_0_axi_dp_BVALID;
  wire [31:0]microblaze_riscv_0_axi_dp_RDATA;
  wire microblaze_riscv_0_axi_dp_RREADY;
  wire [1:0]microblaze_riscv_0_axi_dp_RRESP;
  wire microblaze_riscv_0_axi_dp_RVALID;
  wire [31:0]microblaze_riscv_0_axi_dp_WDATA;
  wire microblaze_riscv_0_axi_dp_WREADY;
  wire [3:0]microblaze_riscv_0_axi_dp_WSTRB;
  wire microblaze_riscv_0_axi_dp_WVALID;
  wire [3:0]microblaze_riscv_0_axi_periph_M02_AXI_ARADDR;
  wire microblaze_riscv_0_axi_periph_M02_AXI_ARREADY;
  wire microblaze_riscv_0_axi_periph_M02_AXI_ARVALID;
  wire [3:0]microblaze_riscv_0_axi_periph_M02_AXI_AWADDR;
  wire microblaze_riscv_0_axi_periph_M02_AXI_AWREADY;
  wire microblaze_riscv_0_axi_periph_M02_AXI_AWVALID;
  wire microblaze_riscv_0_axi_periph_M02_AXI_BREADY;
  wire [1:0]microblaze_riscv_0_axi_periph_M02_AXI_BRESP;
  wire microblaze_riscv_0_axi_periph_M02_AXI_BVALID;
  wire [31:0]microblaze_riscv_0_axi_periph_M02_AXI_RDATA;
  wire microblaze_riscv_0_axi_periph_M02_AXI_RREADY;
  wire [1:0]microblaze_riscv_0_axi_periph_M02_AXI_RRESP;
  wire microblaze_riscv_0_axi_periph_M02_AXI_RVALID;
  wire [31:0]microblaze_riscv_0_axi_periph_M02_AXI_WDATA;
  wire microblaze_riscv_0_axi_periph_M02_AXI_WREADY;
  wire [3:0]microblaze_riscv_0_axi_periph_M02_AXI_WSTRB;
  wire microblaze_riscv_0_axi_periph_M02_AXI_WVALID;
  wire microblaze_riscv_0_debug_CAPTURE;
  wire microblaze_riscv_0_debug_CLK;
  wire microblaze_riscv_0_debug_DISABLE;
  wire [0:7]microblaze_riscv_0_debug_REG_EN;
  wire microblaze_riscv_0_debug_RST;
  wire microblaze_riscv_0_debug_SHIFT;
  wire microblaze_riscv_0_debug_TDI;
  wire microblaze_riscv_0_debug_TDO;
  wire microblaze_riscv_0_debug_UPDATE;
  wire [0:31]microblaze_riscv_0_dlmb_1_ABUS;
  wire microblaze_riscv_0_dlmb_1_ADDRSTROBE;
  wire [0:3]microblaze_riscv_0_dlmb_1_BE;
  wire microblaze_riscv_0_dlmb_1_CE;
  wire [0:31]microblaze_riscv_0_dlmb_1_READDBUS;
  wire microblaze_riscv_0_dlmb_1_READSTROBE;
  wire microblaze_riscv_0_dlmb_1_READY;
  wire microblaze_riscv_0_dlmb_1_UE;
  wire microblaze_riscv_0_dlmb_1_WAIT;
  wire [0:31]microblaze_riscv_0_dlmb_1_WRITEDBUS;
  wire microblaze_riscv_0_dlmb_1_WRITESTROBE;
  wire [0:31]microblaze_riscv_0_ilmb_1_ABUS;
  wire microblaze_riscv_0_ilmb_1_ADDRSTROBE;
  wire microblaze_riscv_0_ilmb_1_CE;
  wire [0:31]microblaze_riscv_0_ilmb_1_READDBUS;
  wire microblaze_riscv_0_ilmb_1_READSTROBE;
  wire microblaze_riscv_0_ilmb_1_READY;
  wire microblaze_riscv_0_ilmb_1_UE;
  wire microblaze_riscv_0_ilmb_1_WAIT;
  wire [8:0]microblaze_riscv_0_intc_axi_ARADDR;
  wire microblaze_riscv_0_intc_axi_ARREADY;
  wire microblaze_riscv_0_intc_axi_ARVALID;
  wire [8:0]microblaze_riscv_0_intc_axi_AWADDR;
  wire microblaze_riscv_0_intc_axi_AWREADY;
  wire microblaze_riscv_0_intc_axi_AWVALID;
  wire microblaze_riscv_0_intc_axi_BREADY;
  wire [1:0]microblaze_riscv_0_intc_axi_BRESP;
  wire microblaze_riscv_0_intc_axi_BVALID;
  wire [31:0]microblaze_riscv_0_intc_axi_RDATA;
  wire microblaze_riscv_0_intc_axi_RREADY;
  wire [1:0]microblaze_riscv_0_intc_axi_RRESP;
  wire microblaze_riscv_0_intc_axi_RVALID;
  wire [31:0]microblaze_riscv_0_intc_axi_WDATA;
  wire microblaze_riscv_0_intc_axi_WREADY;
  wire [3:0]microblaze_riscv_0_intc_axi_WSTRB;
  wire microblaze_riscv_0_intc_axi_WVALID;
  wire [0:1]microblaze_riscv_0_interrupt_ACK;
  wire [31:0]microblaze_riscv_0_interrupt_ADDRESS;
  wire microblaze_riscv_0_interrupt_INTERRUPT;
  wire [1:0]microblaze_riscv_0_intr;
  wire [3:0]microblaze_riscv_0_mdm_axi_ARADDR;
  wire microblaze_riscv_0_mdm_axi_ARREADY;
  wire microblaze_riscv_0_mdm_axi_ARVALID;
  wire [3:0]microblaze_riscv_0_mdm_axi_AWADDR;
  wire microblaze_riscv_0_mdm_axi_AWREADY;
  wire microblaze_riscv_0_mdm_axi_AWVALID;
  wire microblaze_riscv_0_mdm_axi_BREADY;
  wire [1:0]microblaze_riscv_0_mdm_axi_BRESP;
  wire microblaze_riscv_0_mdm_axi_BVALID;
  wire [31:0]microblaze_riscv_0_mdm_axi_RDATA;
  wire microblaze_riscv_0_mdm_axi_RREADY;
  wire [1:0]microblaze_riscv_0_mdm_axi_RRESP;
  wire microblaze_riscv_0_mdm_axi_RVALID;
  wire [31:0]microblaze_riscv_0_mdm_axi_WDATA;
  wire microblaze_riscv_0_mdm_axi_WREADY;
  wire [3:0]microblaze_riscv_0_mdm_axi_WSTRB;
  wire microblaze_riscv_0_mdm_axi_WVALID;
  wire processing_system7_0_FCLK_CLK0;
  wire [31:0]processing_system7_0_M_AXI_GP0_ARADDR;
  wire [1:0]processing_system7_0_M_AXI_GP0_ARBURST;
  wire [3:0]processing_system7_0_M_AXI_GP0_ARCACHE;
  wire [11:0]processing_system7_0_M_AXI_GP0_ARID;
  wire [3:0]processing_system7_0_M_AXI_GP0_ARLEN;
  wire [1:0]processing_system7_0_M_AXI_GP0_ARLOCK;
  wire [2:0]processing_system7_0_M_AXI_GP0_ARPROT;
  wire [3:0]processing_system7_0_M_AXI_GP0_ARQOS;
  wire processing_system7_0_M_AXI_GP0_ARREADY;
  wire [2:0]processing_system7_0_M_AXI_GP0_ARSIZE;
  wire processing_system7_0_M_AXI_GP0_ARVALID;
  wire [31:0]processing_system7_0_M_AXI_GP0_AWADDR;
  wire [1:0]processing_system7_0_M_AXI_GP0_AWBURST;
  wire [3:0]processing_system7_0_M_AXI_GP0_AWCACHE;
  wire [11:0]processing_system7_0_M_AXI_GP0_AWID;
  wire [3:0]processing_system7_0_M_AXI_GP0_AWLEN;
  wire [1:0]processing_system7_0_M_AXI_GP0_AWLOCK;
  wire [2:0]processing_system7_0_M_AXI_GP0_AWPROT;
  wire [3:0]processing_system7_0_M_AXI_GP0_AWQOS;
  wire processing_system7_0_M_AXI_GP0_AWREADY;
  wire [2:0]processing_system7_0_M_AXI_GP0_AWSIZE;
  wire processing_system7_0_M_AXI_GP0_AWVALID;
  wire [11:0]processing_system7_0_M_AXI_GP0_BID;
  wire processing_system7_0_M_AXI_GP0_BREADY;
  wire [1:0]processing_system7_0_M_AXI_GP0_BRESP;
  wire processing_system7_0_M_AXI_GP0_BVALID;
  wire [31:0]processing_system7_0_M_AXI_GP0_RDATA;
  wire [11:0]processing_system7_0_M_AXI_GP0_RID;
  wire processing_system7_0_M_AXI_GP0_RLAST;
  wire processing_system7_0_M_AXI_GP0_RREADY;
  wire [1:0]processing_system7_0_M_AXI_GP0_RRESP;
  wire processing_system7_0_M_AXI_GP0_RVALID;
  wire [31:0]processing_system7_0_M_AXI_GP0_WDATA;
  wire [11:0]processing_system7_0_M_AXI_GP0_WID;
  wire processing_system7_0_M_AXI_GP0_WLAST;
  wire processing_system7_0_M_AXI_GP0_WREADY;
  wire [3:0]processing_system7_0_M_AXI_GP0_WSTRB;
  wire processing_system7_0_M_AXI_GP0_WVALID;
  wire reset_rtl;
  wire [0:0]rst_clk_wiz_1_100M_bus_struct_reset;
  wire rst_clk_wiz_1_100M_mb_reset;
  wire [0:0]rst_clk_wiz_1_100M_peripheral_aresetn;
  wire uart_rtl_rxd;
  wire uart_rtl_txd;

  AES128_System_axi_uartlite_0_0 axi_uartlite_0
       (.rx(uart_rtl_rxd),
        .s_axi_aclk(microblaze_riscv_0_Clk),
        .s_axi_araddr(microblaze_riscv_0_axi_periph_M02_AXI_ARADDR),
        .s_axi_aresetn(rst_clk_wiz_1_100M_peripheral_aresetn),
        .s_axi_arready(microblaze_riscv_0_axi_periph_M02_AXI_ARREADY),
        .s_axi_arvalid(microblaze_riscv_0_axi_periph_M02_AXI_ARVALID),
        .s_axi_awaddr(microblaze_riscv_0_axi_periph_M02_AXI_AWADDR),
        .s_axi_awready(microblaze_riscv_0_axi_periph_M02_AXI_AWREADY),
        .s_axi_awvalid(microblaze_riscv_0_axi_periph_M02_AXI_AWVALID),
        .s_axi_bready(microblaze_riscv_0_axi_periph_M02_AXI_BREADY),
        .s_axi_bresp(microblaze_riscv_0_axi_periph_M02_AXI_BRESP),
        .s_axi_bvalid(microblaze_riscv_0_axi_periph_M02_AXI_BVALID),
        .s_axi_rdata(microblaze_riscv_0_axi_periph_M02_AXI_RDATA),
        .s_axi_rready(microblaze_riscv_0_axi_periph_M02_AXI_RREADY),
        .s_axi_rresp(microblaze_riscv_0_axi_periph_M02_AXI_RRESP),
        .s_axi_rvalid(microblaze_riscv_0_axi_periph_M02_AXI_RVALID),
        .s_axi_wdata(microblaze_riscv_0_axi_periph_M02_AXI_WDATA),
        .s_axi_wready(microblaze_riscv_0_axi_periph_M02_AXI_WREADY),
        .s_axi_wstrb(microblaze_riscv_0_axi_periph_M02_AXI_WSTRB),
        .s_axi_wvalid(microblaze_riscv_0_axi_periph_M02_AXI_WVALID),
        .tx(uart_rtl_txd));
  AES128_System_clk_wiz_1_0 clk_wiz_1
       (.clk_in1_n(diff_clock_rtl_clk_n),
        .clk_in1_p(diff_clock_rtl_clk_p),
        .clk_out1(microblaze_riscv_0_Clk),
        .locked(clk_wiz_1_locked),
        .reset(mdm_1_debug_sys_rst));
  AES128_System_mdm_1_0 mdm_1
       (.Dbg_Capture_0(microblaze_riscv_0_debug_CAPTURE),
        .Dbg_Clk_0(microblaze_riscv_0_debug_CLK),
        .Dbg_Disable_0(microblaze_riscv_0_debug_DISABLE),
        .Dbg_Reg_En_0(microblaze_riscv_0_debug_REG_EN),
        .Dbg_Rst_0(microblaze_riscv_0_debug_RST),
        .Dbg_Shift_0(microblaze_riscv_0_debug_SHIFT),
        .Dbg_TDI_0(microblaze_riscv_0_debug_TDI),
        .Dbg_TDO_0(microblaze_riscv_0_debug_TDO),
        .Dbg_Update_0(microblaze_riscv_0_debug_UPDATE),
        .Debug_SYS_Rst(mdm_1_debug_sys_rst),
        .S_AXI_ACLK(microblaze_riscv_0_Clk),
        .S_AXI_ARADDR(microblaze_riscv_0_mdm_axi_ARADDR),
        .S_AXI_ARESETN(rst_clk_wiz_1_100M_peripheral_aresetn),
        .S_AXI_ARREADY(microblaze_riscv_0_mdm_axi_ARREADY),
        .S_AXI_ARVALID(microblaze_riscv_0_mdm_axi_ARVALID),
        .S_AXI_AWADDR(microblaze_riscv_0_mdm_axi_AWADDR),
        .S_AXI_AWREADY(microblaze_riscv_0_mdm_axi_AWREADY),
        .S_AXI_AWVALID(microblaze_riscv_0_mdm_axi_AWVALID),
        .S_AXI_BREADY(microblaze_riscv_0_mdm_axi_BREADY),
        .S_AXI_BRESP(microblaze_riscv_0_mdm_axi_BRESP),
        .S_AXI_BVALID(microblaze_riscv_0_mdm_axi_BVALID),
        .S_AXI_RDATA(microblaze_riscv_0_mdm_axi_RDATA),
        .S_AXI_RREADY(microblaze_riscv_0_mdm_axi_RREADY),
        .S_AXI_RRESP(microblaze_riscv_0_mdm_axi_RRESP),
        .S_AXI_RVALID(microblaze_riscv_0_mdm_axi_RVALID),
        .S_AXI_WDATA(microblaze_riscv_0_mdm_axi_WDATA),
        .S_AXI_WREADY(microblaze_riscv_0_mdm_axi_WREADY),
        .S_AXI_WSTRB(microblaze_riscv_0_mdm_axi_WSTRB),
        .S_AXI_WVALID(microblaze_riscv_0_mdm_axi_WVALID));
  (* BMM_INFO_PROCESSOR = "riscv > AES128_System microblaze_riscv_0_local_memory/dlmb_bram_if_cntlr" *) 
  (* KEEP_HIERARCHY = "YES" *) 
  AES128_System_microblaze_riscv_0_0 microblaze_riscv_0
       (.Byte_Enable(microblaze_riscv_0_dlmb_1_BE),
        .Clk(microblaze_riscv_0_Clk),
        .DCE(microblaze_riscv_0_dlmb_1_CE),
        .DReady(microblaze_riscv_0_dlmb_1_READY),
        .DUE(microblaze_riscv_0_dlmb_1_UE),
        .DWait(microblaze_riscv_0_dlmb_1_WAIT),
        .D_AS(microblaze_riscv_0_dlmb_1_ADDRSTROBE),
        .Data_Addr(microblaze_riscv_0_dlmb_1_ABUS),
        .Data_Read(microblaze_riscv_0_dlmb_1_READDBUS),
        .Data_Write(microblaze_riscv_0_dlmb_1_WRITEDBUS),
        .Dbg_Capture(microblaze_riscv_0_debug_CAPTURE),
        .Dbg_Clk(microblaze_riscv_0_debug_CLK),
        .Dbg_Disable(microblaze_riscv_0_debug_DISABLE),
        .Dbg_Reg_En(microblaze_riscv_0_debug_REG_EN),
        .Dbg_Shift(microblaze_riscv_0_debug_SHIFT),
        .Dbg_TDI(microblaze_riscv_0_debug_TDI),
        .Dbg_TDO(microblaze_riscv_0_debug_TDO),
        .Dbg_Trig_Ack_In({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .Dbg_Trig_Out({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .Dbg_Update(microblaze_riscv_0_debug_UPDATE),
        .Debug_Rst(microblaze_riscv_0_debug_RST),
        .ICE(microblaze_riscv_0_ilmb_1_CE),
        .IFetch(microblaze_riscv_0_ilmb_1_READSTROBE),
        .IReady(microblaze_riscv_0_ilmb_1_READY),
        .IUE(microblaze_riscv_0_ilmb_1_UE),
        .IWAIT(microblaze_riscv_0_ilmb_1_WAIT),
        .I_AS(microblaze_riscv_0_ilmb_1_ADDRSTROBE),
        .Instr(microblaze_riscv_0_ilmb_1_READDBUS),
        .Instr_Addr(microblaze_riscv_0_ilmb_1_ABUS),
        .Interrupt(microblaze_riscv_0_interrupt_INTERRUPT),
        .Interrupt_Ack(microblaze_riscv_0_interrupt_ACK),
        .Interrupt_Address({microblaze_riscv_0_interrupt_ADDRESS[31],microblaze_riscv_0_interrupt_ADDRESS[30],microblaze_riscv_0_interrupt_ADDRESS[29],microblaze_riscv_0_interrupt_ADDRESS[28],microblaze_riscv_0_interrupt_ADDRESS[27],microblaze_riscv_0_interrupt_ADDRESS[26],microblaze_riscv_0_interrupt_ADDRESS[25],microblaze_riscv_0_interrupt_ADDRESS[24],microblaze_riscv_0_interrupt_ADDRESS[23],microblaze_riscv_0_interrupt_ADDRESS[22],microblaze_riscv_0_interrupt_ADDRESS[21],microblaze_riscv_0_interrupt_ADDRESS[20],microblaze_riscv_0_interrupt_ADDRESS[19],microblaze_riscv_0_interrupt_ADDRESS[18],microblaze_riscv_0_interrupt_ADDRESS[17],microblaze_riscv_0_interrupt_ADDRESS[16],microblaze_riscv_0_interrupt_ADDRESS[15],microblaze_riscv_0_interrupt_ADDRESS[14],microblaze_riscv_0_interrupt_ADDRESS[13],microblaze_riscv_0_interrupt_ADDRESS[12],microblaze_riscv_0_interrupt_ADDRESS[11],microblaze_riscv_0_interrupt_ADDRESS[10],microblaze_riscv_0_interrupt_ADDRESS[9],microblaze_riscv_0_interrupt_ADDRESS[8],microblaze_riscv_0_interrupt_ADDRESS[7],microblaze_riscv_0_interrupt_ADDRESS[6],microblaze_riscv_0_interrupt_ADDRESS[5],microblaze_riscv_0_interrupt_ADDRESS[4],microblaze_riscv_0_interrupt_ADDRESS[3],microblaze_riscv_0_interrupt_ADDRESS[2],microblaze_riscv_0_interrupt_ADDRESS[1],microblaze_riscv_0_interrupt_ADDRESS[0]}),
        .M_AXI_DP_ARADDR(microblaze_riscv_0_axi_dp_ARADDR),
        .M_AXI_DP_ARPROT(microblaze_riscv_0_axi_dp_ARPROT),
        .M_AXI_DP_ARREADY(microblaze_riscv_0_axi_dp_ARREADY),
        .M_AXI_DP_ARVALID(microblaze_riscv_0_axi_dp_ARVALID),
        .M_AXI_DP_AWADDR(microblaze_riscv_0_axi_dp_AWADDR),
        .M_AXI_DP_AWPROT(microblaze_riscv_0_axi_dp_AWPROT),
        .M_AXI_DP_AWREADY(microblaze_riscv_0_axi_dp_AWREADY),
        .M_AXI_DP_AWVALID(microblaze_riscv_0_axi_dp_AWVALID),
        .M_AXI_DP_BREADY(microblaze_riscv_0_axi_dp_BREADY),
        .M_AXI_DP_BRESP(microblaze_riscv_0_axi_dp_BRESP),
        .M_AXI_DP_BVALID(microblaze_riscv_0_axi_dp_BVALID),
        .M_AXI_DP_RDATA(microblaze_riscv_0_axi_dp_RDATA),
        .M_AXI_DP_RREADY(microblaze_riscv_0_axi_dp_RREADY),
        .M_AXI_DP_RRESP(microblaze_riscv_0_axi_dp_RRESP),
        .M_AXI_DP_RVALID(microblaze_riscv_0_axi_dp_RVALID),
        .M_AXI_DP_WDATA(microblaze_riscv_0_axi_dp_WDATA),
        .M_AXI_DP_WREADY(microblaze_riscv_0_axi_dp_WREADY),
        .M_AXI_DP_WSTRB(microblaze_riscv_0_axi_dp_WSTRB),
        .M_AXI_DP_WVALID(microblaze_riscv_0_axi_dp_WVALID),
        .Read_Strobe(microblaze_riscv_0_dlmb_1_READSTROBE),
        .Reset(rst_clk_wiz_1_100M_mb_reset),
        .Write_Strobe(microblaze_riscv_0_dlmb_1_WRITESTROBE));
  AES128_System_microblaze_riscv_0_axi_intc_0 microblaze_riscv_0_axi_intc
       (.interrupt_address(microblaze_riscv_0_interrupt_ADDRESS),
        .intr(microblaze_riscv_0_intr),
        .irq(microblaze_riscv_0_interrupt_INTERRUPT),
        .processor_ack({microblaze_riscv_0_interrupt_ACK[0],microblaze_riscv_0_interrupt_ACK[1]}),
        .processor_clk(microblaze_riscv_0_Clk),
        .processor_rst(rst_clk_wiz_1_100M_mb_reset),
        .s_axi_aclk(microblaze_riscv_0_Clk),
        .s_axi_araddr(microblaze_riscv_0_intc_axi_ARADDR),
        .s_axi_aresetn(rst_clk_wiz_1_100M_peripheral_aresetn),
        .s_axi_arready(microblaze_riscv_0_intc_axi_ARREADY),
        .s_axi_arvalid(microblaze_riscv_0_intc_axi_ARVALID),
        .s_axi_awaddr(microblaze_riscv_0_intc_axi_AWADDR),
        .s_axi_awready(microblaze_riscv_0_intc_axi_AWREADY),
        .s_axi_awvalid(microblaze_riscv_0_intc_axi_AWVALID),
        .s_axi_bready(microblaze_riscv_0_intc_axi_BREADY),
        .s_axi_bresp(microblaze_riscv_0_intc_axi_BRESP),
        .s_axi_bvalid(microblaze_riscv_0_intc_axi_BVALID),
        .s_axi_rdata(microblaze_riscv_0_intc_axi_RDATA),
        .s_axi_rready(microblaze_riscv_0_intc_axi_RREADY),
        .s_axi_rresp(microblaze_riscv_0_intc_axi_RRESP),
        .s_axi_rvalid(microblaze_riscv_0_intc_axi_RVALID),
        .s_axi_wdata(microblaze_riscv_0_intc_axi_WDATA),
        .s_axi_wready(microblaze_riscv_0_intc_axi_WREADY),
        .s_axi_wstrb(microblaze_riscv_0_intc_axi_WSTRB),
        .s_axi_wvalid(microblaze_riscv_0_intc_axi_WVALID));
  AES128_System_microblaze_riscv_0_axi_periph_0 microblaze_riscv_0_axi_periph
       (.M00_AXI_araddr(microblaze_riscv_0_intc_axi_ARADDR),
        .M00_AXI_arready(microblaze_riscv_0_intc_axi_ARREADY),
        .M00_AXI_arvalid(microblaze_riscv_0_intc_axi_ARVALID),
        .M00_AXI_awaddr(microblaze_riscv_0_intc_axi_AWADDR),
        .M00_AXI_awready(microblaze_riscv_0_intc_axi_AWREADY),
        .M00_AXI_awvalid(microblaze_riscv_0_intc_axi_AWVALID),
        .M00_AXI_bready(microblaze_riscv_0_intc_axi_BREADY),
        .M00_AXI_bresp(microblaze_riscv_0_intc_axi_BRESP),
        .M00_AXI_bvalid(microblaze_riscv_0_intc_axi_BVALID),
        .M00_AXI_rdata(microblaze_riscv_0_intc_axi_RDATA),
        .M00_AXI_rready(microblaze_riscv_0_intc_axi_RREADY),
        .M00_AXI_rresp(microblaze_riscv_0_intc_axi_RRESP),
        .M00_AXI_rvalid(microblaze_riscv_0_intc_axi_RVALID),
        .M00_AXI_wdata(microblaze_riscv_0_intc_axi_WDATA),
        .M00_AXI_wready(microblaze_riscv_0_intc_axi_WREADY),
        .M00_AXI_wstrb(microblaze_riscv_0_intc_axi_WSTRB),
        .M00_AXI_wvalid(microblaze_riscv_0_intc_axi_WVALID),
        .M01_AXI_araddr(microblaze_riscv_0_mdm_axi_ARADDR),
        .M01_AXI_arready(microblaze_riscv_0_mdm_axi_ARREADY),
        .M01_AXI_arvalid(microblaze_riscv_0_mdm_axi_ARVALID),
        .M01_AXI_awaddr(microblaze_riscv_0_mdm_axi_AWADDR),
        .M01_AXI_awready(microblaze_riscv_0_mdm_axi_AWREADY),
        .M01_AXI_awvalid(microblaze_riscv_0_mdm_axi_AWVALID),
        .M01_AXI_bready(microblaze_riscv_0_mdm_axi_BREADY),
        .M01_AXI_bresp(microblaze_riscv_0_mdm_axi_BRESP),
        .M01_AXI_bvalid(microblaze_riscv_0_mdm_axi_BVALID),
        .M01_AXI_rdata(microblaze_riscv_0_mdm_axi_RDATA),
        .M01_AXI_rready(microblaze_riscv_0_mdm_axi_RREADY),
        .M01_AXI_rresp(microblaze_riscv_0_mdm_axi_RRESP),
        .M01_AXI_rvalid(microblaze_riscv_0_mdm_axi_RVALID),
        .M01_AXI_wdata(microblaze_riscv_0_mdm_axi_WDATA),
        .M01_AXI_wready(microblaze_riscv_0_mdm_axi_WREADY),
        .M01_AXI_wstrb(microblaze_riscv_0_mdm_axi_WSTRB),
        .M01_AXI_wvalid(microblaze_riscv_0_mdm_axi_WVALID),
        .M02_AXI_araddr(microblaze_riscv_0_axi_periph_M02_AXI_ARADDR),
        .M02_AXI_arready(microblaze_riscv_0_axi_periph_M02_AXI_ARREADY),
        .M02_AXI_arvalid(microblaze_riscv_0_axi_periph_M02_AXI_ARVALID),
        .M02_AXI_awaddr(microblaze_riscv_0_axi_periph_M02_AXI_AWADDR),
        .M02_AXI_awready(microblaze_riscv_0_axi_periph_M02_AXI_AWREADY),
        .M02_AXI_awvalid(microblaze_riscv_0_axi_periph_M02_AXI_AWVALID),
        .M02_AXI_bready(microblaze_riscv_0_axi_periph_M02_AXI_BREADY),
        .M02_AXI_bresp(microblaze_riscv_0_axi_periph_M02_AXI_BRESP),
        .M02_AXI_bvalid(microblaze_riscv_0_axi_periph_M02_AXI_BVALID),
        .M02_AXI_rdata(microblaze_riscv_0_axi_periph_M02_AXI_RDATA),
        .M02_AXI_rready(microblaze_riscv_0_axi_periph_M02_AXI_RREADY),
        .M02_AXI_rresp(microblaze_riscv_0_axi_periph_M02_AXI_RRESP),
        .M02_AXI_rvalid(microblaze_riscv_0_axi_periph_M02_AXI_RVALID),
        .M02_AXI_wdata(microblaze_riscv_0_axi_periph_M02_AXI_WDATA),
        .M02_AXI_wready(microblaze_riscv_0_axi_periph_M02_AXI_WREADY),
        .M02_AXI_wstrb(microblaze_riscv_0_axi_periph_M02_AXI_WSTRB),
        .M02_AXI_wvalid(microblaze_riscv_0_axi_periph_M02_AXI_WVALID),
        .S00_AXI_araddr(microblaze_riscv_0_axi_dp_ARADDR),
        .S00_AXI_arprot(microblaze_riscv_0_axi_dp_ARPROT),
        .S00_AXI_arready(microblaze_riscv_0_axi_dp_ARREADY),
        .S00_AXI_arvalid(microblaze_riscv_0_axi_dp_ARVALID),
        .S00_AXI_awaddr(microblaze_riscv_0_axi_dp_AWADDR),
        .S00_AXI_awprot(microblaze_riscv_0_axi_dp_AWPROT),
        .S00_AXI_awready(microblaze_riscv_0_axi_dp_AWREADY),
        .S00_AXI_awvalid(microblaze_riscv_0_axi_dp_AWVALID),
        .S00_AXI_bready(microblaze_riscv_0_axi_dp_BREADY),
        .S00_AXI_bresp(microblaze_riscv_0_axi_dp_BRESP),
        .S00_AXI_bvalid(microblaze_riscv_0_axi_dp_BVALID),
        .S00_AXI_rdata(microblaze_riscv_0_axi_dp_RDATA),
        .S00_AXI_rready(microblaze_riscv_0_axi_dp_RREADY),
        .S00_AXI_rresp(microblaze_riscv_0_axi_dp_RRESP),
        .S00_AXI_rvalid(microblaze_riscv_0_axi_dp_RVALID),
        .S00_AXI_wdata(microblaze_riscv_0_axi_dp_WDATA),
        .S00_AXI_wready(microblaze_riscv_0_axi_dp_WREADY),
        .S00_AXI_wstrb(microblaze_riscv_0_axi_dp_WSTRB),
        .S00_AXI_wvalid(microblaze_riscv_0_axi_dp_WVALID),
        .S01_AXI_araddr(processing_system7_0_M_AXI_GP0_ARADDR),
        .S01_AXI_arburst(processing_system7_0_M_AXI_GP0_ARBURST),
        .S01_AXI_arcache(processing_system7_0_M_AXI_GP0_ARCACHE),
        .S01_AXI_arid(processing_system7_0_M_AXI_GP0_ARID),
        .S01_AXI_arlen(processing_system7_0_M_AXI_GP0_ARLEN),
        .S01_AXI_arlock(processing_system7_0_M_AXI_GP0_ARLOCK),
        .S01_AXI_arprot(processing_system7_0_M_AXI_GP0_ARPROT),
        .S01_AXI_arqos(processing_system7_0_M_AXI_GP0_ARQOS),
        .S01_AXI_arready(processing_system7_0_M_AXI_GP0_ARREADY),
        .S01_AXI_arsize(processing_system7_0_M_AXI_GP0_ARSIZE),
        .S01_AXI_arvalid(processing_system7_0_M_AXI_GP0_ARVALID),
        .S01_AXI_awaddr(processing_system7_0_M_AXI_GP0_AWADDR),
        .S01_AXI_awburst(processing_system7_0_M_AXI_GP0_AWBURST),
        .S01_AXI_awcache(processing_system7_0_M_AXI_GP0_AWCACHE),
        .S01_AXI_awid(processing_system7_0_M_AXI_GP0_AWID),
        .S01_AXI_awlen(processing_system7_0_M_AXI_GP0_AWLEN),
        .S01_AXI_awlock(processing_system7_0_M_AXI_GP0_AWLOCK),
        .S01_AXI_awprot(processing_system7_0_M_AXI_GP0_AWPROT),
        .S01_AXI_awqos(processing_system7_0_M_AXI_GP0_AWQOS),
        .S01_AXI_awready(processing_system7_0_M_AXI_GP0_AWREADY),
        .S01_AXI_awsize(processing_system7_0_M_AXI_GP0_AWSIZE),
        .S01_AXI_awvalid(processing_system7_0_M_AXI_GP0_AWVALID),
        .S01_AXI_bid(processing_system7_0_M_AXI_GP0_BID),
        .S01_AXI_bready(processing_system7_0_M_AXI_GP0_BREADY),
        .S01_AXI_bresp(processing_system7_0_M_AXI_GP0_BRESP),
        .S01_AXI_bvalid(processing_system7_0_M_AXI_GP0_BVALID),
        .S01_AXI_rdata(processing_system7_0_M_AXI_GP0_RDATA),
        .S01_AXI_rid(processing_system7_0_M_AXI_GP0_RID),
        .S01_AXI_rlast(processing_system7_0_M_AXI_GP0_RLAST),
        .S01_AXI_rready(processing_system7_0_M_AXI_GP0_RREADY),
        .S01_AXI_rresp(processing_system7_0_M_AXI_GP0_RRESP),
        .S01_AXI_rvalid(processing_system7_0_M_AXI_GP0_RVALID),
        .S01_AXI_wdata(processing_system7_0_M_AXI_GP0_WDATA),
        .S01_AXI_wid(processing_system7_0_M_AXI_GP0_WID),
        .S01_AXI_wlast(processing_system7_0_M_AXI_GP0_WLAST),
        .S01_AXI_wready(processing_system7_0_M_AXI_GP0_WREADY),
        .S01_AXI_wstrb(processing_system7_0_M_AXI_GP0_WSTRB),
        .S01_AXI_wvalid(processing_system7_0_M_AXI_GP0_WVALID),
        .aclk(microblaze_riscv_0_Clk),
        .aclk1(processing_system7_0_FCLK_CLK0),
        .aresetn(rst_clk_wiz_1_100M_peripheral_aresetn));
  microblaze_riscv_0_local_memory_imp_1RH6F80 microblaze_riscv_0_local_memory
       (.DLMB_abus(microblaze_riscv_0_dlmb_1_ABUS),
        .DLMB_addrstrobe(microblaze_riscv_0_dlmb_1_ADDRSTROBE),
        .DLMB_be(microblaze_riscv_0_dlmb_1_BE),
        .DLMB_ce(microblaze_riscv_0_dlmb_1_CE),
        .DLMB_readdbus(microblaze_riscv_0_dlmb_1_READDBUS),
        .DLMB_readstrobe(microblaze_riscv_0_dlmb_1_READSTROBE),
        .DLMB_ready(microblaze_riscv_0_dlmb_1_READY),
        .DLMB_ue(microblaze_riscv_0_dlmb_1_UE),
        .DLMB_wait(microblaze_riscv_0_dlmb_1_WAIT),
        .DLMB_writedbus(microblaze_riscv_0_dlmb_1_WRITEDBUS),
        .DLMB_writestrobe(microblaze_riscv_0_dlmb_1_WRITESTROBE),
        .ILMB_abus(microblaze_riscv_0_ilmb_1_ABUS),
        .ILMB_addrstrobe(microblaze_riscv_0_ilmb_1_ADDRSTROBE),
        .ILMB_ce(microblaze_riscv_0_ilmb_1_CE),
        .ILMB_readdbus(microblaze_riscv_0_ilmb_1_READDBUS),
        .ILMB_readstrobe(microblaze_riscv_0_ilmb_1_READSTROBE),
        .ILMB_ready(microblaze_riscv_0_ilmb_1_READY),
        .ILMB_ue(microblaze_riscv_0_ilmb_1_UE),
        .ILMB_wait(microblaze_riscv_0_ilmb_1_WAIT),
        .LMB_Clk(microblaze_riscv_0_Clk),
        .SYS_Rst(rst_clk_wiz_1_100M_bus_struct_reset));
  assign microblaze_riscv_0_intr = {1'b0, 1'b0};
  AES128_System_processing_system7_0_0 processing_system7_0
       (.DDR_Addr(DDR_addr),
        .DDR_BankAddr(DDR_ba),
        .DDR_CAS_n(DDR_cas_n),
        .DDR_CKE(DDR_cke),
        .DDR_CS_n(DDR_cs_n),
        .DDR_Clk(DDR_ck_p),
        .DDR_Clk_n(DDR_ck_n),
        .DDR_DM(DDR_dm),
        .DDR_DQ(DDR_dq),
        .DDR_DQS(DDR_dqs_p),
        .DDR_DQS_n(DDR_dqs_n),
        .DDR_DRSTB(DDR_reset_n),
        .DDR_ODT(DDR_odt),
        .DDR_RAS_n(DDR_ras_n),
        .DDR_VRN(FIXED_IO_ddr_vrn),
        .DDR_VRP(FIXED_IO_ddr_vrp),
        .DDR_WEB(DDR_we_n),
        .FCLK_CLK0(processing_system7_0_FCLK_CLK0),
        .MIO(FIXED_IO_mio),
        .M_AXI_GP0_ACLK(processing_system7_0_FCLK_CLK0),
        .M_AXI_GP0_ARADDR(processing_system7_0_M_AXI_GP0_ARADDR),
        .M_AXI_GP0_ARBURST(processing_system7_0_M_AXI_GP0_ARBURST),
        .M_AXI_GP0_ARCACHE(processing_system7_0_M_AXI_GP0_ARCACHE),
        .M_AXI_GP0_ARID(processing_system7_0_M_AXI_GP0_ARID),
        .M_AXI_GP0_ARLEN(processing_system7_0_M_AXI_GP0_ARLEN),
        .M_AXI_GP0_ARLOCK(processing_system7_0_M_AXI_GP0_ARLOCK),
        .M_AXI_GP0_ARPROT(processing_system7_0_M_AXI_GP0_ARPROT),
        .M_AXI_GP0_ARQOS(processing_system7_0_M_AXI_GP0_ARQOS),
        .M_AXI_GP0_ARREADY(processing_system7_0_M_AXI_GP0_ARREADY),
        .M_AXI_GP0_ARSIZE(processing_system7_0_M_AXI_GP0_ARSIZE),
        .M_AXI_GP0_ARVALID(processing_system7_0_M_AXI_GP0_ARVALID),
        .M_AXI_GP0_AWADDR(processing_system7_0_M_AXI_GP0_AWADDR),
        .M_AXI_GP0_AWBURST(processing_system7_0_M_AXI_GP0_AWBURST),
        .M_AXI_GP0_AWCACHE(processing_system7_0_M_AXI_GP0_AWCACHE),
        .M_AXI_GP0_AWID(processing_system7_0_M_AXI_GP0_AWID),
        .M_AXI_GP0_AWLEN(processing_system7_0_M_AXI_GP0_AWLEN),
        .M_AXI_GP0_AWLOCK(processing_system7_0_M_AXI_GP0_AWLOCK),
        .M_AXI_GP0_AWPROT(processing_system7_0_M_AXI_GP0_AWPROT),
        .M_AXI_GP0_AWQOS(processing_system7_0_M_AXI_GP0_AWQOS),
        .M_AXI_GP0_AWREADY(processing_system7_0_M_AXI_GP0_AWREADY),
        .M_AXI_GP0_AWSIZE(processing_system7_0_M_AXI_GP0_AWSIZE),
        .M_AXI_GP0_AWVALID(processing_system7_0_M_AXI_GP0_AWVALID),
        .M_AXI_GP0_BID(processing_system7_0_M_AXI_GP0_BID),
        .M_AXI_GP0_BREADY(processing_system7_0_M_AXI_GP0_BREADY),
        .M_AXI_GP0_BRESP(processing_system7_0_M_AXI_GP0_BRESP),
        .M_AXI_GP0_BVALID(processing_system7_0_M_AXI_GP0_BVALID),
        .M_AXI_GP0_RDATA(processing_system7_0_M_AXI_GP0_RDATA),
        .M_AXI_GP0_RID(processing_system7_0_M_AXI_GP0_RID),
        .M_AXI_GP0_RLAST(processing_system7_0_M_AXI_GP0_RLAST),
        .M_AXI_GP0_RREADY(processing_system7_0_M_AXI_GP0_RREADY),
        .M_AXI_GP0_RRESP(processing_system7_0_M_AXI_GP0_RRESP),
        .M_AXI_GP0_RVALID(processing_system7_0_M_AXI_GP0_RVALID),
        .M_AXI_GP0_WDATA(processing_system7_0_M_AXI_GP0_WDATA),
        .M_AXI_GP0_WID(processing_system7_0_M_AXI_GP0_WID),
        .M_AXI_GP0_WLAST(processing_system7_0_M_AXI_GP0_WLAST),
        .M_AXI_GP0_WREADY(processing_system7_0_M_AXI_GP0_WREADY),
        .M_AXI_GP0_WSTRB(processing_system7_0_M_AXI_GP0_WSTRB),
        .M_AXI_GP0_WVALID(processing_system7_0_M_AXI_GP0_WVALID),
        .PS_CLK(FIXED_IO_ps_clk),
        .PS_PORB(FIXED_IO_ps_porb),
        .PS_SRSTB(FIXED_IO_ps_srstb),
        .SDIO0_WP(1'b0),
        .USB0_VBUS_PWRFAULT(1'b0));
  AES128_System_rst_clk_wiz_1_100M_0 rst_clk_wiz_1_100M
       (.aux_reset_in(1'b1),
        .bus_struct_reset(rst_clk_wiz_1_100M_bus_struct_reset),
        .dcm_locked(clk_wiz_1_locked),
        .ext_reset_in(reset_rtl),
        .mb_debug_sys_rst(mdm_1_debug_sys_rst),
        .mb_reset(rst_clk_wiz_1_100M_mb_reset),
        .peripheral_aresetn(rst_clk_wiz_1_100M_peripheral_aresetn),
        .slowest_sync_clk(microblaze_riscv_0_Clk));
endmodule

module microblaze_riscv_0_local_memory_imp_1RH6F80
   (DLMB_abus,
    DLMB_addrstrobe,
    DLMB_be,
    DLMB_ce,
    DLMB_readdbus,
    DLMB_readstrobe,
    DLMB_ready,
    DLMB_ue,
    DLMB_wait,
    DLMB_writedbus,
    DLMB_writestrobe,
    ILMB_abus,
    ILMB_addrstrobe,
    ILMB_ce,
    ILMB_readdbus,
    ILMB_readstrobe,
    ILMB_ready,
    ILMB_ue,
    ILMB_wait,
    LMB_Clk,
    SYS_Rst);
  input [0:31]DLMB_abus;
  input DLMB_addrstrobe;
  input [0:3]DLMB_be;
  output DLMB_ce;
  output [0:31]DLMB_readdbus;
  input DLMB_readstrobe;
  output DLMB_ready;
  output DLMB_ue;
  output DLMB_wait;
  input [0:31]DLMB_writedbus;
  input DLMB_writestrobe;
  input [0:31]ILMB_abus;
  input ILMB_addrstrobe;
  output ILMB_ce;
  output [0:31]ILMB_readdbus;
  input ILMB_readstrobe;
  output ILMB_ready;
  output ILMB_ue;
  output ILMB_wait;
  input LMB_Clk;
  input SYS_Rst;

  wire [0:31]DLMB_abus;
  wire DLMB_addrstrobe;
  wire [0:3]DLMB_be;
  wire DLMB_ce;
  wire [0:31]DLMB_readdbus;
  wire DLMB_readstrobe;
  wire DLMB_ready;
  wire DLMB_ue;
  wire DLMB_wait;
  wire [0:31]DLMB_writedbus;
  wire DLMB_writestrobe;
  wire [0:31]ILMB_abus;
  wire ILMB_addrstrobe;
  wire ILMB_ce;
  wire [0:31]ILMB_readdbus;
  wire ILMB_readstrobe;
  wire ILMB_ready;
  wire ILMB_ue;
  wire ILMB_wait;
  wire LMB_Clk;
  wire SYS_Rst;
  wire [0:31]microblaze_riscv_0_dlmb_bus_ABUS;
  wire microblaze_riscv_0_dlmb_bus_ADDRSTROBE;
  wire [0:3]microblaze_riscv_0_dlmb_bus_BE;
  wire microblaze_riscv_0_dlmb_bus_CE;
  wire [0:31]microblaze_riscv_0_dlmb_bus_READDBUS;
  wire microblaze_riscv_0_dlmb_bus_READSTROBE;
  wire microblaze_riscv_0_dlmb_bus_READY;
  wire microblaze_riscv_0_dlmb_bus_UE;
  wire microblaze_riscv_0_dlmb_bus_WAIT;
  wire [0:31]microblaze_riscv_0_dlmb_bus_WRITEDBUS;
  wire microblaze_riscv_0_dlmb_bus_WRITESTROBE;
  wire [0:31]microblaze_riscv_0_dlmb_cntlr_ADDR;
  wire microblaze_riscv_0_dlmb_cntlr_CLK;
  wire [0:31]microblaze_riscv_0_dlmb_cntlr_DIN;
  wire [31:0]microblaze_riscv_0_dlmb_cntlr_DOUT;
  wire microblaze_riscv_0_dlmb_cntlr_EN;
  wire microblaze_riscv_0_dlmb_cntlr_RST;
  wire [0:3]microblaze_riscv_0_dlmb_cntlr_WE;
  wire [0:31]microblaze_riscv_0_ilmb_bus_ABUS;
  wire microblaze_riscv_0_ilmb_bus_ADDRSTROBE;
  wire [0:3]microblaze_riscv_0_ilmb_bus_BE;
  wire microblaze_riscv_0_ilmb_bus_CE;
  wire [0:31]microblaze_riscv_0_ilmb_bus_READDBUS;
  wire microblaze_riscv_0_ilmb_bus_READSTROBE;
  wire microblaze_riscv_0_ilmb_bus_READY;
  wire microblaze_riscv_0_ilmb_bus_UE;
  wire microblaze_riscv_0_ilmb_bus_WAIT;
  wire [0:31]microblaze_riscv_0_ilmb_bus_WRITEDBUS;
  wire microblaze_riscv_0_ilmb_bus_WRITESTROBE;
  wire [0:31]microblaze_riscv_0_ilmb_cntlr_ADDR;
  wire microblaze_riscv_0_ilmb_cntlr_CLK;
  wire [0:31]microblaze_riscv_0_ilmb_cntlr_DIN;
  wire [31:0]microblaze_riscv_0_ilmb_cntlr_DOUT;
  wire microblaze_riscv_0_ilmb_cntlr_EN;
  wire microblaze_riscv_0_ilmb_cntlr_RST;
  wire [0:3]microblaze_riscv_0_ilmb_cntlr_WE;

  (* BMM_INFO_ADDRESS_SPACE = "byte  0x00000000 32 > AES128_System microblaze_riscv_0_local_memory/lmb_bram" *) 
  (* KEEP_HIERARCHY = "YES" *) 
  AES128_System_dlmb_bram_if_cntlr_0 dlmb_bram_if_cntlr
       (.BRAM_Addr_A(microblaze_riscv_0_dlmb_cntlr_ADDR),
        .BRAM_Clk_A(microblaze_riscv_0_dlmb_cntlr_CLK),
        .BRAM_Din_A({microblaze_riscv_0_dlmb_cntlr_DOUT[31],microblaze_riscv_0_dlmb_cntlr_DOUT[30],microblaze_riscv_0_dlmb_cntlr_DOUT[29],microblaze_riscv_0_dlmb_cntlr_DOUT[28],microblaze_riscv_0_dlmb_cntlr_DOUT[27],microblaze_riscv_0_dlmb_cntlr_DOUT[26],microblaze_riscv_0_dlmb_cntlr_DOUT[25],microblaze_riscv_0_dlmb_cntlr_DOUT[24],microblaze_riscv_0_dlmb_cntlr_DOUT[23],microblaze_riscv_0_dlmb_cntlr_DOUT[22],microblaze_riscv_0_dlmb_cntlr_DOUT[21],microblaze_riscv_0_dlmb_cntlr_DOUT[20],microblaze_riscv_0_dlmb_cntlr_DOUT[19],microblaze_riscv_0_dlmb_cntlr_DOUT[18],microblaze_riscv_0_dlmb_cntlr_DOUT[17],microblaze_riscv_0_dlmb_cntlr_DOUT[16],microblaze_riscv_0_dlmb_cntlr_DOUT[15],microblaze_riscv_0_dlmb_cntlr_DOUT[14],microblaze_riscv_0_dlmb_cntlr_DOUT[13],microblaze_riscv_0_dlmb_cntlr_DOUT[12],microblaze_riscv_0_dlmb_cntlr_DOUT[11],microblaze_riscv_0_dlmb_cntlr_DOUT[10],microblaze_riscv_0_dlmb_cntlr_DOUT[9],microblaze_riscv_0_dlmb_cntlr_DOUT[8],microblaze_riscv_0_dlmb_cntlr_DOUT[7],microblaze_riscv_0_dlmb_cntlr_DOUT[6],microblaze_riscv_0_dlmb_cntlr_DOUT[5],microblaze_riscv_0_dlmb_cntlr_DOUT[4],microblaze_riscv_0_dlmb_cntlr_DOUT[3],microblaze_riscv_0_dlmb_cntlr_DOUT[2],microblaze_riscv_0_dlmb_cntlr_DOUT[1],microblaze_riscv_0_dlmb_cntlr_DOUT[0]}),
        .BRAM_Dout_A(microblaze_riscv_0_dlmb_cntlr_DIN),
        .BRAM_EN_A(microblaze_riscv_0_dlmb_cntlr_EN),
        .BRAM_Rst_A(microblaze_riscv_0_dlmb_cntlr_RST),
        .BRAM_WEN_A(microblaze_riscv_0_dlmb_cntlr_WE),
        .LMB_ABus(microblaze_riscv_0_dlmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_riscv_0_dlmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_riscv_0_dlmb_bus_BE),
        .LMB_Clk(LMB_Clk),
        .LMB_ReadStrobe(microblaze_riscv_0_dlmb_bus_READSTROBE),
        .LMB_Rst(SYS_Rst),
        .LMB_WriteDBus(microblaze_riscv_0_dlmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_riscv_0_dlmb_bus_WRITESTROBE),
        .Sl_CE(microblaze_riscv_0_dlmb_bus_CE),
        .Sl_DBus(microblaze_riscv_0_dlmb_bus_READDBUS),
        .Sl_Ready(microblaze_riscv_0_dlmb_bus_READY),
        .Sl_UE(microblaze_riscv_0_dlmb_bus_UE),
        .Sl_Wait(microblaze_riscv_0_dlmb_bus_WAIT));
  AES128_System_dlmb_v10_0 dlmb_v10
       (.LMB_ABus(microblaze_riscv_0_dlmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_riscv_0_dlmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_riscv_0_dlmb_bus_BE),
        .LMB_CE(DLMB_ce),
        .LMB_Clk(LMB_Clk),
        .LMB_ReadDBus(DLMB_readdbus),
        .LMB_ReadStrobe(microblaze_riscv_0_dlmb_bus_READSTROBE),
        .LMB_Ready(DLMB_ready),
        .LMB_UE(DLMB_ue),
        .LMB_Wait(DLMB_wait),
        .LMB_WriteDBus(microblaze_riscv_0_dlmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_riscv_0_dlmb_bus_WRITESTROBE),
        .M_ABus(DLMB_abus),
        .M_AddrStrobe(DLMB_addrstrobe),
        .M_BE(DLMB_be),
        .M_DBus(DLMB_writedbus),
        .M_ReadStrobe(DLMB_readstrobe),
        .M_WriteStrobe(DLMB_writestrobe),
        .SYS_Rst(SYS_Rst),
        .Sl_CE(microblaze_riscv_0_dlmb_bus_CE),
        .Sl_DBus(microblaze_riscv_0_dlmb_bus_READDBUS),
        .Sl_Ready(microblaze_riscv_0_dlmb_bus_READY),
        .Sl_UE(microblaze_riscv_0_dlmb_bus_UE),
        .Sl_Wait(microblaze_riscv_0_dlmb_bus_WAIT));
  AES128_System_ilmb_bram_if_cntlr_0 ilmb_bram_if_cntlr
       (.BRAM_Addr_A(microblaze_riscv_0_ilmb_cntlr_ADDR),
        .BRAM_Clk_A(microblaze_riscv_0_ilmb_cntlr_CLK),
        .BRAM_Din_A({microblaze_riscv_0_ilmb_cntlr_DOUT[31],microblaze_riscv_0_ilmb_cntlr_DOUT[30],microblaze_riscv_0_ilmb_cntlr_DOUT[29],microblaze_riscv_0_ilmb_cntlr_DOUT[28],microblaze_riscv_0_ilmb_cntlr_DOUT[27],microblaze_riscv_0_ilmb_cntlr_DOUT[26],microblaze_riscv_0_ilmb_cntlr_DOUT[25],microblaze_riscv_0_ilmb_cntlr_DOUT[24],microblaze_riscv_0_ilmb_cntlr_DOUT[23],microblaze_riscv_0_ilmb_cntlr_DOUT[22],microblaze_riscv_0_ilmb_cntlr_DOUT[21],microblaze_riscv_0_ilmb_cntlr_DOUT[20],microblaze_riscv_0_ilmb_cntlr_DOUT[19],microblaze_riscv_0_ilmb_cntlr_DOUT[18],microblaze_riscv_0_ilmb_cntlr_DOUT[17],microblaze_riscv_0_ilmb_cntlr_DOUT[16],microblaze_riscv_0_ilmb_cntlr_DOUT[15],microblaze_riscv_0_ilmb_cntlr_DOUT[14],microblaze_riscv_0_ilmb_cntlr_DOUT[13],microblaze_riscv_0_ilmb_cntlr_DOUT[12],microblaze_riscv_0_ilmb_cntlr_DOUT[11],microblaze_riscv_0_ilmb_cntlr_DOUT[10],microblaze_riscv_0_ilmb_cntlr_DOUT[9],microblaze_riscv_0_ilmb_cntlr_DOUT[8],microblaze_riscv_0_ilmb_cntlr_DOUT[7],microblaze_riscv_0_ilmb_cntlr_DOUT[6],microblaze_riscv_0_ilmb_cntlr_DOUT[5],microblaze_riscv_0_ilmb_cntlr_DOUT[4],microblaze_riscv_0_ilmb_cntlr_DOUT[3],microblaze_riscv_0_ilmb_cntlr_DOUT[2],microblaze_riscv_0_ilmb_cntlr_DOUT[1],microblaze_riscv_0_ilmb_cntlr_DOUT[0]}),
        .BRAM_Dout_A(microblaze_riscv_0_ilmb_cntlr_DIN),
        .BRAM_EN_A(microblaze_riscv_0_ilmb_cntlr_EN),
        .BRAM_Rst_A(microblaze_riscv_0_ilmb_cntlr_RST),
        .BRAM_WEN_A(microblaze_riscv_0_ilmb_cntlr_WE),
        .LMB_ABus(microblaze_riscv_0_ilmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_riscv_0_ilmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_riscv_0_ilmb_bus_BE),
        .LMB_Clk(LMB_Clk),
        .LMB_ReadStrobe(microblaze_riscv_0_ilmb_bus_READSTROBE),
        .LMB_Rst(SYS_Rst),
        .LMB_WriteDBus(microblaze_riscv_0_ilmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_riscv_0_ilmb_bus_WRITESTROBE),
        .Sl_CE(microblaze_riscv_0_ilmb_bus_CE),
        .Sl_DBus(microblaze_riscv_0_ilmb_bus_READDBUS),
        .Sl_Ready(microblaze_riscv_0_ilmb_bus_READY),
        .Sl_UE(microblaze_riscv_0_ilmb_bus_UE),
        .Sl_Wait(microblaze_riscv_0_ilmb_bus_WAIT));
  AES128_System_ilmb_v10_0 ilmb_v10
       (.LMB_ABus(microblaze_riscv_0_ilmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_riscv_0_ilmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_riscv_0_ilmb_bus_BE),
        .LMB_CE(ILMB_ce),
        .LMB_Clk(LMB_Clk),
        .LMB_ReadDBus(ILMB_readdbus),
        .LMB_ReadStrobe(microblaze_riscv_0_ilmb_bus_READSTROBE),
        .LMB_Ready(ILMB_ready),
        .LMB_UE(ILMB_ue),
        .LMB_Wait(ILMB_wait),
        .LMB_WriteDBus(microblaze_riscv_0_ilmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_riscv_0_ilmb_bus_WRITESTROBE),
        .M_ABus(ILMB_abus),
        .M_AddrStrobe(ILMB_addrstrobe),
        .M_BE({1'b0,1'b0,1'b0,1'b0}),
        .M_DBus({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_ReadStrobe(ILMB_readstrobe),
        .M_WriteStrobe(1'b0),
        .SYS_Rst(SYS_Rst),
        .Sl_CE(microblaze_riscv_0_ilmb_bus_CE),
        .Sl_DBus(microblaze_riscv_0_ilmb_bus_READDBUS),
        .Sl_Ready(microblaze_riscv_0_ilmb_bus_READY),
        .Sl_UE(microblaze_riscv_0_ilmb_bus_UE),
        .Sl_Wait(microblaze_riscv_0_ilmb_bus_WAIT));
  AES128_System_lmb_bram_0 lmb_bram
       (.addra({microblaze_riscv_0_dlmb_cntlr_ADDR[0],microblaze_riscv_0_dlmb_cntlr_ADDR[1],microblaze_riscv_0_dlmb_cntlr_ADDR[2],microblaze_riscv_0_dlmb_cntlr_ADDR[3],microblaze_riscv_0_dlmb_cntlr_ADDR[4],microblaze_riscv_0_dlmb_cntlr_ADDR[5],microblaze_riscv_0_dlmb_cntlr_ADDR[6],microblaze_riscv_0_dlmb_cntlr_ADDR[7],microblaze_riscv_0_dlmb_cntlr_ADDR[8],microblaze_riscv_0_dlmb_cntlr_ADDR[9],microblaze_riscv_0_dlmb_cntlr_ADDR[10],microblaze_riscv_0_dlmb_cntlr_ADDR[11],microblaze_riscv_0_dlmb_cntlr_ADDR[12],microblaze_riscv_0_dlmb_cntlr_ADDR[13],microblaze_riscv_0_dlmb_cntlr_ADDR[14],microblaze_riscv_0_dlmb_cntlr_ADDR[15],microblaze_riscv_0_dlmb_cntlr_ADDR[16],microblaze_riscv_0_dlmb_cntlr_ADDR[17],microblaze_riscv_0_dlmb_cntlr_ADDR[18],microblaze_riscv_0_dlmb_cntlr_ADDR[19],microblaze_riscv_0_dlmb_cntlr_ADDR[20],microblaze_riscv_0_dlmb_cntlr_ADDR[21],microblaze_riscv_0_dlmb_cntlr_ADDR[22],microblaze_riscv_0_dlmb_cntlr_ADDR[23],microblaze_riscv_0_dlmb_cntlr_ADDR[24],microblaze_riscv_0_dlmb_cntlr_ADDR[25],microblaze_riscv_0_dlmb_cntlr_ADDR[26],microblaze_riscv_0_dlmb_cntlr_ADDR[27],microblaze_riscv_0_dlmb_cntlr_ADDR[28],microblaze_riscv_0_dlmb_cntlr_ADDR[29],microblaze_riscv_0_dlmb_cntlr_ADDR[30],microblaze_riscv_0_dlmb_cntlr_ADDR[31]}),
        .addrb({microblaze_riscv_0_ilmb_cntlr_ADDR[0],microblaze_riscv_0_ilmb_cntlr_ADDR[1],microblaze_riscv_0_ilmb_cntlr_ADDR[2],microblaze_riscv_0_ilmb_cntlr_ADDR[3],microblaze_riscv_0_ilmb_cntlr_ADDR[4],microblaze_riscv_0_ilmb_cntlr_ADDR[5],microblaze_riscv_0_ilmb_cntlr_ADDR[6],microblaze_riscv_0_ilmb_cntlr_ADDR[7],microblaze_riscv_0_ilmb_cntlr_ADDR[8],microblaze_riscv_0_ilmb_cntlr_ADDR[9],microblaze_riscv_0_ilmb_cntlr_ADDR[10],microblaze_riscv_0_ilmb_cntlr_ADDR[11],microblaze_riscv_0_ilmb_cntlr_ADDR[12],microblaze_riscv_0_ilmb_cntlr_ADDR[13],microblaze_riscv_0_ilmb_cntlr_ADDR[14],microblaze_riscv_0_ilmb_cntlr_ADDR[15],microblaze_riscv_0_ilmb_cntlr_ADDR[16],microblaze_riscv_0_ilmb_cntlr_ADDR[17],microblaze_riscv_0_ilmb_cntlr_ADDR[18],microblaze_riscv_0_ilmb_cntlr_ADDR[19],microblaze_riscv_0_ilmb_cntlr_ADDR[20],microblaze_riscv_0_ilmb_cntlr_ADDR[21],microblaze_riscv_0_ilmb_cntlr_ADDR[22],microblaze_riscv_0_ilmb_cntlr_ADDR[23],microblaze_riscv_0_ilmb_cntlr_ADDR[24],microblaze_riscv_0_ilmb_cntlr_ADDR[25],microblaze_riscv_0_ilmb_cntlr_ADDR[26],microblaze_riscv_0_ilmb_cntlr_ADDR[27],microblaze_riscv_0_ilmb_cntlr_ADDR[28],microblaze_riscv_0_ilmb_cntlr_ADDR[29],microblaze_riscv_0_ilmb_cntlr_ADDR[30],microblaze_riscv_0_ilmb_cntlr_ADDR[31]}),
        .clka(microblaze_riscv_0_dlmb_cntlr_CLK),
        .clkb(microblaze_riscv_0_ilmb_cntlr_CLK),
        .dina({microblaze_riscv_0_dlmb_cntlr_DIN[0],microblaze_riscv_0_dlmb_cntlr_DIN[1],microblaze_riscv_0_dlmb_cntlr_DIN[2],microblaze_riscv_0_dlmb_cntlr_DIN[3],microblaze_riscv_0_dlmb_cntlr_DIN[4],microblaze_riscv_0_dlmb_cntlr_DIN[5],microblaze_riscv_0_dlmb_cntlr_DIN[6],microblaze_riscv_0_dlmb_cntlr_DIN[7],microblaze_riscv_0_dlmb_cntlr_DIN[8],microblaze_riscv_0_dlmb_cntlr_DIN[9],microblaze_riscv_0_dlmb_cntlr_DIN[10],microblaze_riscv_0_dlmb_cntlr_DIN[11],microblaze_riscv_0_dlmb_cntlr_DIN[12],microblaze_riscv_0_dlmb_cntlr_DIN[13],microblaze_riscv_0_dlmb_cntlr_DIN[14],microblaze_riscv_0_dlmb_cntlr_DIN[15],microblaze_riscv_0_dlmb_cntlr_DIN[16],microblaze_riscv_0_dlmb_cntlr_DIN[17],microblaze_riscv_0_dlmb_cntlr_DIN[18],microblaze_riscv_0_dlmb_cntlr_DIN[19],microblaze_riscv_0_dlmb_cntlr_DIN[20],microblaze_riscv_0_dlmb_cntlr_DIN[21],microblaze_riscv_0_dlmb_cntlr_DIN[22],microblaze_riscv_0_dlmb_cntlr_DIN[23],microblaze_riscv_0_dlmb_cntlr_DIN[24],microblaze_riscv_0_dlmb_cntlr_DIN[25],microblaze_riscv_0_dlmb_cntlr_DIN[26],microblaze_riscv_0_dlmb_cntlr_DIN[27],microblaze_riscv_0_dlmb_cntlr_DIN[28],microblaze_riscv_0_dlmb_cntlr_DIN[29],microblaze_riscv_0_dlmb_cntlr_DIN[30],microblaze_riscv_0_dlmb_cntlr_DIN[31]}),
        .dinb({microblaze_riscv_0_ilmb_cntlr_DIN[0],microblaze_riscv_0_ilmb_cntlr_DIN[1],microblaze_riscv_0_ilmb_cntlr_DIN[2],microblaze_riscv_0_ilmb_cntlr_DIN[3],microblaze_riscv_0_ilmb_cntlr_DIN[4],microblaze_riscv_0_ilmb_cntlr_DIN[5],microblaze_riscv_0_ilmb_cntlr_DIN[6],microblaze_riscv_0_ilmb_cntlr_DIN[7],microblaze_riscv_0_ilmb_cntlr_DIN[8],microblaze_riscv_0_ilmb_cntlr_DIN[9],microblaze_riscv_0_ilmb_cntlr_DIN[10],microblaze_riscv_0_ilmb_cntlr_DIN[11],microblaze_riscv_0_ilmb_cntlr_DIN[12],microblaze_riscv_0_ilmb_cntlr_DIN[13],microblaze_riscv_0_ilmb_cntlr_DIN[14],microblaze_riscv_0_ilmb_cntlr_DIN[15],microblaze_riscv_0_ilmb_cntlr_DIN[16],microblaze_riscv_0_ilmb_cntlr_DIN[17],microblaze_riscv_0_ilmb_cntlr_DIN[18],microblaze_riscv_0_ilmb_cntlr_DIN[19],microblaze_riscv_0_ilmb_cntlr_DIN[20],microblaze_riscv_0_ilmb_cntlr_DIN[21],microblaze_riscv_0_ilmb_cntlr_DIN[22],microblaze_riscv_0_ilmb_cntlr_DIN[23],microblaze_riscv_0_ilmb_cntlr_DIN[24],microblaze_riscv_0_ilmb_cntlr_DIN[25],microblaze_riscv_0_ilmb_cntlr_DIN[26],microblaze_riscv_0_ilmb_cntlr_DIN[27],microblaze_riscv_0_ilmb_cntlr_DIN[28],microblaze_riscv_0_ilmb_cntlr_DIN[29],microblaze_riscv_0_ilmb_cntlr_DIN[30],microblaze_riscv_0_ilmb_cntlr_DIN[31]}),
        .douta(microblaze_riscv_0_dlmb_cntlr_DOUT),
        .doutb(microblaze_riscv_0_ilmb_cntlr_DOUT),
        .ena(microblaze_riscv_0_dlmb_cntlr_EN),
        .enb(microblaze_riscv_0_ilmb_cntlr_EN),
        .rsta(microblaze_riscv_0_dlmb_cntlr_RST),
        .rstb(microblaze_riscv_0_ilmb_cntlr_RST),
        .wea({microblaze_riscv_0_dlmb_cntlr_WE[0],microblaze_riscv_0_dlmb_cntlr_WE[1],microblaze_riscv_0_dlmb_cntlr_WE[2],microblaze_riscv_0_dlmb_cntlr_WE[3]}),
        .web({microblaze_riscv_0_ilmb_cntlr_WE[0],microblaze_riscv_0_ilmb_cntlr_WE[1],microblaze_riscv_0_ilmb_cntlr_WE[2],microblaze_riscv_0_ilmb_cntlr_WE[3]}));
endmodule
