# 2026-06-17T21:03:13.603337300
import vitis

client = vitis.create_client()
client.set_workspace(path="01_Software_AES128")

vitis.dispose()

