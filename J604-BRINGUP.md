# J604 experimental bring-up

Branch: `experimental/j604-bringup`. Aurora base: `91ac7e2cd8688f7b13d27200817bea34e1fc2065`.

Mesa driver source is unchanged. contrib/j604/build.sh records the tested shared-LLVM build with asahi,llvmpipe,softpipe. The original Fedora image used softpipe; the rebuilt library reports llvmpipe (LLVM 22.1.8, 128 bits). This is software rendering, not native J604 GPU acceleration.

The owner confirmed Fedora boot, internal NVMe, keyboard/trackpad, Wi-Fi, Bluetooth and usable desktop responsiveness on J604 on 2026-10-22 with the SID0 + llvmpipe boot bundle. This branch preserves the local source/configuration work; it does not assert that a fresh build of every component has been requalified. Native DCP/GPU, audio/camera/external display and Linux thermal policy remain further work. Speakers stay disabled until the specified safety validation.

## Sources and attribution

Aurora upstream: https://github.com/aurora-silicon/mesa.git

GravityLinux source reuse was explicitly authorized by the owner. NVMMU/PCIe/SID0 comparisons use GravityLinux/linux commit 4fc326f6c25ccceb7515e2635c22e01fde5d3bac:
- https://github.com/GravityLinux/linux/blob/4fc326f6c25ccceb7515e2635c22e01fde5d3bac/arch/arm64/boot/dts/apple/t8132.dtsi
- https://github.com/GravityLinux/linux/blob/4fc326f6c25ccceb7515e2635c22e01fde5d3bac/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
- https://github.com/GravityLinux/linux/blob/4fc326f6c25ccceb7515e2635c22e01fde5d3bac/drivers/nvme/host/apple.c

U-Boot cold-boot/queue/polling/reset comparisons: https://github.com/GravityLinux/u-boot/commit/a2f6913694ff26908c16948af3f8372429782263 and the inline cited commits 49840d5797, ec49c9d70e, 61d4b40d3f and 4b738f4f51. This does not replace the working live U-Boot-to-Linux handoff with the superseded cold-shutdown experiment.

M4 raw boot-object alignment rule: https://github.com/GravityLinux/installer/commit/6420623289fe7544cb8589b658355e57f0290fcc

Local device-tree observations and the owner-supplied behavioral specification also informed these changes. No Apple binary disassembly was used. Existing source licenses apply. Firmware, calibration, machine captures, disk images, installed-machine configuration and credentials are not included.
