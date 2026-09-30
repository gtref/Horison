const std = @import("std");
const Build = @import("Build.zig");

// Your custom Target struct must exist somewhere in your project.
// Example:
pub const Target = struct {
    arch: std.Target.Cpu.Arch,
    os: std.Target.Os.Tag,
};

pub fn build(b: *std.Build) void {
    // Initialize your custom build context
    var ctx = Build.Context.init(b);

    // Use your custom Target type (no zig.zig)
    const target = Target{
        .arch = .aarch64,
        .os = .freestanding,
    };

    const exe = ctx.addExecutable(.{
        .name = "kernel",
        .root = "src/start.zig",
        .target = target,
        .opt = .ReleaseSmall,
    });

    exe.setLinker("kernel.ld");
    exe.emitBin("kernel8.img");

    ctx.install(exe);

    // QEMU run step
    const run_step = b.step("run", "Run kernel in QEMU");
    run_step.dependOn(&exe.step);

    const qemu_cmd = b.addSystemCommand(&.{
        "qemu-system-aarch64",
        "-M",
        "virt",
        "-cpu",
        "cortex-a57",
        "-m",
        "1024",
        "-kernel",
        "kernel8.img",
        "-nographic",
    });

    run_step.dependOn(&qemu_cmd.step);
}
