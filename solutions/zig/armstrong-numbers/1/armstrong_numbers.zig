const std = @import("std");

pub fn isArmstrongNumber(num: u128) bool {
    if (num < 10) return true;

    var work_num: u128 = num;
    var exponent: u8 = 0;

    while (work_num > 0) {
        work_num /= 10;
        exponent += 1;
    }

    work_num = num;
    var sum: u128 = 0;
    
    while(work_num > 0 and sum <= num) {
        sum += std.math.pow(u128,work_num % 10,exponent);
        work_num /= 10;
    }

    if (sum == num) return true;
    return false;
}
