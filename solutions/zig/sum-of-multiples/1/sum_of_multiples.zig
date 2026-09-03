const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    var multiples = try allocator.alloc(bool, limit + 1);
    defer allocator.free(multiples);
    @memset(multiples, false);

    multiples[limit] = true;

    var total: u64 = 0;

    for (factors) |factor| {
        if (factor == 0) continue;
        if (factor > limit) continue;

        const end: u32 = limit / factor + 1;
        
        for (1..end) |i| {
            const product = factor * i;

            if (!multiples[product]) {
                multiples[product] = true;
                total += product;
            }
        }
    }

    return total;
}
