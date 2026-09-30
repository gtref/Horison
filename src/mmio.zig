pub fn write32(addr: usize, value: u32) void {
    const ptr: *volatile u32 = @ptrFromInt(addr);
    ptr.* = value;
}

pub fn read32(addr: usize) u32 {
    const ptr: *volatile u32 = @ptrFromInt(addr);
    return ptr.*;
}

pub fn write64(addr: usize, value: u64) void {
    const ptr: *volatile u64 = @ptrFromInt(addr);
    ptr.* = value;
}

pub fn read64(addr: usize) u64 {
    const ptr: *volatile u64 = @ptrFromInt(addr);
    return ptr.*;
}
