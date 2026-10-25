const std = @import("std");

pub fn twoFer(buffer: []u8, name: ?[]const u8) ![]u8 {
    if (name) |named| {
        return std.fmt.bufPrint(buffer, "One for {s}, one for me.", .{ named });
    }
    return std.fmt.bufPrint(buffer, "One for you, one for me.", .{});
}
