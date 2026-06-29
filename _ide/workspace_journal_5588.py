# 2026-06-29T20:23:14.882159900
import vitis

client = vitis.create_client()
client.set_workspace(path="D:/AES128-MicroBlaze-V-FPGA")

comp = client.create_app_component(name="aes128_sw",platform = "$COMPONENT_LOCATION/../AES128_Platform/export/AES128_Platform/AES128_Platform.xpfm",domain = "standalone_microblaze_riscv_0")

platform = client.get_component(name="AES128_Platform")
status = platform.build()

status = platform.build()

status = platform.build()

comp = client.get_component(name="aes128_sw")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

vitis.dispose()

