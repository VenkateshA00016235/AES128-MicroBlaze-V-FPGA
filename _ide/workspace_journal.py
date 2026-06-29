# 2026-06-29T21:21:53.931150900
import vitis

client = vitis.create_client()
client.set_workspace(path="D:/AES128-MicroBlaze-V-FPGA")

platform = client.get_component(name="AES128_Platform")
status = platform.build()

comp = client.get_component(name="aes128_sw")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

