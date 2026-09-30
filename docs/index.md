# Horizon Kernel (AARCH64 Edition) Documentation

Welcome to the documentation for **Horizon Kernel (AARCH64 Edition)**.

## Overview

Horizon Kernel is an experimental operating system kernel targetting the AARCH64 architecture (64-bit ARM). It is written in [Zig](https://ziglang.org/) and built to run on bare-metal hardware or emulators like [QEMU](https://www.qemu.org/).

## Prerequisites & Installation (Linux)

To build and run Horizon Kernel on Linux:

1. **Install Dependencies**
   - **Zig (0.13.0+)**: Download from [ziglang.org](https://ziglang.org/download/) or install via package manager.
   - **QEMU AARCH64**: Install `qemu-system-aarch64` using your system's package manager:
     ```bash
     sudo apt-get update
     sudo apt-get install -y qemu-system-arm qemu-system-misc
     ```

2. **Building the Kernel**
   Run the standard Zig build command in the project root:
   ```bash
   zig build
   ```
   This will generate the kernel executable and `kernel8.img` in `zig-out/bin/`.

3. **Running in QEMU**
   Launch the kernel using the QEMU target in Zig:
   ```bash
   zig build run
   ```

## Project Structure

- `src/start.zig` - Kernel entry point (`_start`) and main loop.
- `src/mmio.zig` - Memory-mapped I/O helper routines (`write32`, `read32`, `write64`, `read64`).
- `build.zig` - Zig build script for cross-compiling to `aarch64-freestanding-none` and setting up QEMU targets.
- `kernel.ld` - Linker script defining physical load addresses and section alignments.
- `config.txt` - Configuration file for boot parameters.
- `docs/index.md` - GitHub Pages documentation source file.
