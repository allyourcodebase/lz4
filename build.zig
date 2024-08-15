const std = @import("std");

pub fn build(b: *std.Build) void {
    const upstream = b.dependency("lz4", .{});
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const strip = b.option(bool, "strip", "Omit debug information");
    const pic = b.option(bool, "pie", "Produce Position Independent Code");

    const lz4 = b.addStaticLibrary(.{
        .name = "lz4",
        .target = target,
        .optimize = optimize,
        .pic = pic,
        .strip = strip,
        .link_libc = true,
    });
    b.installArtifact(lz4);
    lz4.addIncludePath(upstream.path("lib"));
    lz4.installHeader(upstream.path("lib/lz4.h"), "lz4/lz4.h");
    lz4.installHeader(upstream.path("lib/lz4hc.h"), "lz4/lz4hc.h");
    lz4.installHeader(upstream.path("lib/lz4frame.h"), "lz4/lz4frame.h");
    lz4.addCSourceFiles(.{
        .root = upstream.path("lib"),
        .files = &.{
            "lz4.c",
            "lz4file.c",
            "lz4frame.c",
            "lz4hc.c",
            "xxhash.c",
        },
    });
}
