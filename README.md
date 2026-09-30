# Horizon Kernel

>[!WARNING]
> This version of Horizon Kernel has not been compiled or tested so use at your own risk.

---

# Build steps

1. Use windows.
2. Open an admin powershell prompt and type this command in: `winget install --id SoftwareFreedomConservancy.QEMU -e`
3. Once that finnished run this command: `setx PATH "$($env:PATH);C:\Program Files\qemu"`
4. Install zig now with this command: `winget install --id zig.zig`
5. run : `zig build` or what ever.
6. Please report errors as an issue with the template compile time error.