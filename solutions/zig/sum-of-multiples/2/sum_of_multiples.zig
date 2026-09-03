const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    var multiples = try allocator.alloc(bool, limit);
    defer allocator.free(multiples);
    @memset(multiples, false);

    var total: u64 = 0;

    for (factors) |factor| {
        if (factor == 0) continue;

        var accumulation = factor;
        
    while (accumulation < limit ) : (accumulation += factor) {

            if (!multiples[accumulation]) {
                multiples[accumulation] = true;
                total += accumulation;
            }
        }
    }

    return total;
}
