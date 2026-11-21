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
        const dart_rad: f32 = (self.x * self.x) + (self.y * self.y);
        const outer_rad = 10;
        const mid_rad = 5; 
        const inner_rad = 1; 
        const outer_pts = 1;
        const mid_pts = 5;
        const inner_pts = 10;

        const sq_radii = [_]f32{
            inner_rad * inner_rad,
            mid_rad * mid_rad,
            outer_rad * outer_rad,
        };

        const points = [_]u8{inner_pts, mid_pts, outer_pts,};
        
        for (sq_radii, points) |sq_rad, pts| {
            if (dart_rad <= sq_rad) return pts;
        }

        return 0;
    }
};
