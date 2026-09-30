const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.resolveTargetQuery(.{
        .cpu_arch = .aarch64,
        .os_tag = .freestanding,
        .abi = .none,
    });

    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "kernel",
        .root_source_file = b.path("src/start.zig"),
        .target = target,
        .optimize = optimize,
    });

    exe.setLinkerScript(b.path("kernel.ld"));

    const install_cmd = b.addInstallArtifact(exe, .{});
    b.getInstallStep().dependOn(&install_cmd.step);

    // Copy elf executable as kernel8.img into zig-out/bin
    const bin = b.addInstallBinFile(exe.getEmittedBin(), "kernel8.img");
    b.getInstallStep().dependOn(&bin.step);

    // QEMU run step
    const run_step = b.step("run", "Run kernel in QEMU");
    run_step.dependOn(&bin.step);

    const qemu_cmd = b.addSystemCommand(&.{
        "qemu-system-aarch64",
        "-M",
        "virt",
        "-cpu",
        "cortex-a57",
        "-m",
        "1024",
        "-kernel",
        "zig-out/bin/kernel8.img",
        "-nographic",
    });

    run_step.dependOn(&qemu_cmd.step);
}
