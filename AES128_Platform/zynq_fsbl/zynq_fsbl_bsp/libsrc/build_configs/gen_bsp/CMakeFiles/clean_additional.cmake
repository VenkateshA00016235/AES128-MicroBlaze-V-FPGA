# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "D:\\AES128-MicroBlaze-V-FPGA\\AES128_Platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\diskio.h"
  "D:\\AES128-MicroBlaze-V-FPGA\\AES128_Platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\ff.h"
  "D:\\AES128-MicroBlaze-V-FPGA\\AES128_Platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\ffconf.h"
  "D:\\AES128-MicroBlaze-V-FPGA\\AES128_Platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\sleep.h"
  "D:\\AES128-MicroBlaze-V-FPGA\\AES128_Platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xilffs.h"
  "D:\\AES128-MicroBlaze-V-FPGA\\AES128_Platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xilffs_config.h"
  "D:\\AES128-MicroBlaze-V-FPGA\\AES128_Platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xilrsa.h"
  "D:\\AES128-MicroBlaze-V-FPGA\\AES128_Platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xiltimer.h"
  "D:\\AES128-MicroBlaze-V-FPGA\\AES128_Platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xtimer_config.h"
  "D:\\AES128-MicroBlaze-V-FPGA\\AES128_Platform\\zynq_fsbl\\zynq_fsbl_bsp\\lib\\libxilffs.a"
  "D:\\AES128-MicroBlaze-V-FPGA\\AES128_Platform\\zynq_fsbl\\zynq_fsbl_bsp\\lib\\libxilrsa.a"
  "D:\\AES128-MicroBlaze-V-FPGA\\AES128_Platform\\zynq_fsbl\\zynq_fsbl_bsp\\lib\\libxiltimer.a"
  )
endif()
