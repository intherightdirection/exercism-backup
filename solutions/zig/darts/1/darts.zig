const sqrt = @import("std").math.sqrt;
pub const Coordinate = struct {
    // This struct, as well as its fields and methods, needs to be implemented.
    x: f32,
    y: f32,

    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return Coordinate{
            .x = x_coord,
            .y = y_coord,
        };
    }
    pub fn score(self: Coordinate) usize {
        const radius: f32 = (self.x * self.x) + (self.y * self.y);
        const outer_rad = 10; // 1pt
        const mid_rad = 5; // 5pt
        const inner_rad = 1; // 10 pts

        if (radius <= (inner_rad * inner_rad)) {
            return 10;
        } else if (radius <= mid_rad * mid_rad) {
            return 5;
        } else if (radius <= outer_rad * outer_rad) {
            return 1;
        } else {
            return 0;
        }
    }
};
