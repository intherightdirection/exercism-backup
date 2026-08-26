pub const Planet = enum {
    mercury,
    venus,
    earth,
    mars,
    jupiter,
    saturn,
    uranus,
    neptune,

    pub fn age(self: Planet, seconds: usize) f64 {
        // seconds / (year_in_seconds * multiple)
        const YEAR_IN_SECONDS: f64 = 365.2524 * 24 * 60 * 60;
        const divisor: f64 = switch (self) {
            .mercury => 0.2408467,
            .venus => 0.61519726,
            .earth => 1.0,
            .mars => 1.8808158,
            .jupiter => 11.862615,
            .saturn => 29.447498,
            .uranus => 84.016846,
            .neptune => 164.79132,
        };
        const seconds_f: f64 = @floatFromInt(seconds);
        return @round(seconds_f / YEAR_IN_SECONDS / divisor * 100) / 100;
    }
};
