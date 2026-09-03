const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    var products = try allocator.alloc(bool, limit);
    defer allocator.free(products);
    @memset(products, false);

    var total: u64 = 0;

    for (factors) |factor| {
        if (factor == 0) continue;

        var accumulation = factor;
        
        while (accumulation < limit ) : (accumulation += factor) {

            if (!products[accumulation]) {
                products[accumulation] = true;
                total += accumulation;
            }
        }
    }

    return total;
}
