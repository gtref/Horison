# Horizon Kernel AARCH64 Edition

Horizon Kernel is an operating system kernel written in Zig for the AARCH64 (64-bit ARM) architecture.

---

# Build Steps (Linux)

1. **Install QEMU**
   ```bash
   sudo apt update
   sudo apt install qemu-system-arm qemu-system-misc
   ```

2. **Install Zig**
   Download Zig 0.13.0 or later from [ziglang.org](https://ziglang.org/download/) and add it to your `PATH`.

3. **Build the kernel**
   ```bash
   zig build
   ```

4. **Run in QEMU**
   ```bash
   zig build run
   ```

---

# Build Steps (Windows)

1. Open an admin PowerShell prompt and install QEMU:
   ```powershell
   winget install --id SoftwareFreedomConservancy.QEMU -e
   ```
2. Add QEMU to PATH:
   ```powershell
   setx PATH "$($env:PATH);C:\Program Files\qemu"
   ```
3. Install Zig:
   ```powershell
   winget install --id zig.zig
   ```
4. Build and run:
   ```powershell
   zig build
   zig build run
   ```

---

# Documentation

Documentation is hosted on GitHub Pages in the `docs/` folder (`docs/index.md`).
