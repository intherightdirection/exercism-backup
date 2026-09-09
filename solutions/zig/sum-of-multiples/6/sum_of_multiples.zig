const std = @import("std");
const mem = std.mem;
const DynamicBitSet = std.bit_set.DynamicBitSet;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    var products = try DynamicBitSet.initEmpty(allocator, limit);
    defer products.deinit();

    var total: u64 = 0;

    for (factors) |factor| {
        if (factor == 0) continue;

        var accumulation = factor;
        
        while (accumulation < limit ) : (accumulation += factor) {

            if (!products.isSet(accumulation)) {
                products.set(accumulation);
                total += accumulation;
            }
        }
    }

    return total;
}