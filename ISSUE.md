# Issue Report: Build and Compile Errors in Horizon Kernel AARCH64

## Overview
During initial testing of the Horizon Kernel AARCH64 codebase on standard Zig 0.13.0 and QEMU environment, several compilation and build configuration errors were identified.

## Observed Errors

### 1. `build.zig` Build System Errors
* **Error**: `build.zig:2:23: error: unable to load '/app/Build.zig': FileNotFound`
  * **Cause**: `build.zig` attempts to `@import("Build.zig")` which does not exist in the project repository.
* **Deprecation / API Mismatches**:
  * Custom `Target` struct definition overrides standard Zig `std.Build` executable target parameters.
  * Non-existent methods on `b.addExecutable` / `ctx.addExecutable` (e.g. `.root`, `.opt`, `exe.setLinker`, `exe.emitBin`).
  * Target specification should use standard Zig `std.Target.Query` (`aarch64-freestanding-none`).

### 2. `src/start.zig` Source Code Errors
* **Error 1**: `src/start.zig:3:24: error: function declared 'noreturn' implicitly returns`
  * **Cause**: `_start()` is declared with return type `noreturn`, but `main()` returns `void`, causing `_start()` to reach the end of its body without returning `noreturn`.
* **Error 2**: `src/start.zig:8:12: error: expected type 'bool', found 'comptime_int'`
  * **Cause**: `main()` uses `while (1) {}` instead of `while (true) {}` which is required in Zig as condition expressions must evaluate to `bool`.

## Resolution Plan
* Refactor `build.zig` using standard Zig 0.13 `std.Build` API.
* Fix `src/start.zig` by calling `main()` within an infinite loop in `_start()` or marking `main()` as `noreturn`, and replacing `while (1)` with `while (true)`.
* Add Linux setup and build instructions ("the linux way") to `README.md`.
* Add `/docs/index.md` for GitHub Pages documentation without custom publishing workflows.
