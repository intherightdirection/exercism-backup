const std = @import("std");
const mem = std.mem;
const AutoHashMap = std.hash_map.AutoHashMap;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    var products = AutoHashMap(u32, bool).init(allocator);
    defer products.deinit();

    var total: u64 = 0;

    for (factors) |factor| {
        if (factor == 0) continue;

        var accumulation = factor;
        
        while (accumulation < limit ) : (accumulation += factor) {

            if (!products.contains(accumulation)) {
                try products.put(accumulation, true);
                total += accumulation;
            }
        }
    }

    return total;
}
