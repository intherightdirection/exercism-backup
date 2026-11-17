// Please implement the `ComputationError.IllegalArgument` error.
pub const ComputationError = error{
    IllegalArgument,
};

pub fn steps(number: usize) ComputationError!usize {
    if (number < 1) return ComputationError.IllegalArgument;

    var step_count: usize = 0;
    var num: usize = number;

    while (num > 1) {
        if (num % 2 == 0) {
            num >>= 1;
        } else {
            num = num * 3 + 1;
        }
        step_count += 1;
    }

    return step_count;
}


