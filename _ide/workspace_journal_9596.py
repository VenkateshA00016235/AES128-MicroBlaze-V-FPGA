# 2026-06-17T21:05:01.557469800
import vitis

client = vitis.create_client()
client.set_workspace(path="D:/AES128-MicroBlaze-V-FPGA")

platform = client.create_platform_component(name = "AES128_Platform",hw_design = "$COMPONENT_LOCATION/../04_Vivado_Project/project_1/AES128_System_wrapper.xsa",os = "standalone",cpu = "microblaze_riscv_0",domain_name = "standalone_microblaze_riscv_0",compiler = "gcc")

platform = client.get_component(name="AES128_Platform")
status = platform.build()

vitis.dispose()

