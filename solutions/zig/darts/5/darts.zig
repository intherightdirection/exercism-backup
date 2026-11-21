const Board = struct{
    const inner_rad: f32 = 1;
    const middle_rad: f32 = 5;
    const outer_rad: f32 = 10;
};

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
        const dart_sq: f32 = (self.x * self.x) + (self.y * self.y);
 
        const outer_pts = 1;
        const mid_pts = 5;
        const inner_pts = 10;

        const target_radii = [_]f32{
            Board.inner_rad,
            Board.middle_rad, 
            Board.outer_rad
        };

        const points = [_]usize{inner_pts, mid_pts, outer_pts,};
        
        for (target_radii, points) |target_rad, pts| {
            if (dart_sq <= target_rad * target_rad) return pts;
        }

        return 0;
    }
};
