[![CI](https://github.com/allyourcodebase/lz4/actions/workflows/ci.yaml/badge.svg)](https://github.com/allyourcodebase/lz4/actions)

# lz4

This is [lz4](https://github.com/lz4/lz4), packaged for [Zig](https://ziglang.org/).

## Installation

First, update your `build.zig.zon`:

```
# Initialize a `zig build` project if you haven't already
zig init
zig fetch --save git+https://github.com/allyourcodebase/lz4.git#1.10.0-1
```

You can then import `lz4` in your `build.zig` with:

```zig
const lz4_dependency = b.dependency("lz4", .{
    .target = target,
    .optimize = optimize,
});
your_exe.linkLibrary(lz4_dependency.artifact("lz4"));
```
