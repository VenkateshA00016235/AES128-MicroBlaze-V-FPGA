# 2026-06-29T20:23:14.882159900
import vitis

client = vitis.create_client()
client.set_workspace(path="D:/AES128-MicroBlaze-V-FPGA")

comp = client.create_app_component(name="aes128_sw",platform = "$COMPONENT_LOCATION/../AES128_Platform/export/AES128_Platform/AES128_Platform.xpfm",domain = "standalone_microblaze_riscv_0")

