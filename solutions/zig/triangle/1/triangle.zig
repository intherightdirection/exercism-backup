pub const TriangleError = error {
    Invalid,
};

pub const Triangle = struct {
    // This struct, as well as its fields and methods, needs to be implemented.

    a: f64,
    b: f64,
    c: f64,

    pub fn init(a: f64, b: f64, c: f64) TriangleError!Triangle {
        if (!(a > 0 and b > 0 and c > 0) or
            (a + b < c) or
            (a + c < b) or
            (b + c < a))
            return error.Invalid;

        return Triangle{
            .a = a,
            .b = b,
            .c = c,
        };
    }

    pub fn isEquilateral(self: Triangle) bool {
        return self.a == self.b and self.b == self.c;
    }

    pub fn isIsosceles(self: Triangle) bool {
        return self.a == self.b or self.b == self.c or self.a == self.c;
    }

    pub fn isScalene(self: Triangle) bool {
        return self.a != self.b and self.b != self.c and self.a != self.c;
    }
};
