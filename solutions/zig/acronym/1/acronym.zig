const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var awaiting_word = true;
    var word_count: usize = 0;

    // First pass count words
    for (words) |char| {
        if (awaiting_word) {
            switch (char) {
                'a'...'z','A'...'Z' => {
                    word_count += 1;
                    awaiting_word = false;
                    continue;
                },
                else => {
                    continue;
                },
            }
        }
        switch (char) {
            ' ', '-' => awaiting_word = true,
            else => continue,
        }
    }

    var acronym = try allocator.alloc(u8, word_count);
    var write_count: u8 = 0;

    // Second pass writes to allocator 
    awaiting_word = true;

    for (words) |char| {
        if (awaiting_word) {
            switch (char) {
                'a'...'z','A'...'Z' => {
                    if (write_count < acronym.len) {
                        acronym[write_count] = std.ascii.toUpper(char);
                        write_count += 1;
                        awaiting_word = false;
                    }
                    continue;
                },
                else => {
                    continue;
                },
            }
        }
        switch (char) {
            ' ', '-' => awaiting_word = true,
            else => continue,
        }
    }

    return acronym;
}
