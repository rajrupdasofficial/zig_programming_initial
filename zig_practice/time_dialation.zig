const std = @import("std");

fn calculateTimeDilation(gamma: f64, t0: f64) f64 {
    return t0 / gamma; // Time dilation formula
}

fn calculateLengthContraction(gamma: f64, l0: f64) f64 {
    return l0 / gamma; // Length contraction formula
}

pub fn main() void {
    const v = 0.8; // Velocity as a fraction of the speed of light (0.8c)

    // Calculate gamma using the formula gamma = 1 / sqrt(1 - v^2)
    const gamma = 1.0 / std.math.sqrt(1.0 - v * v);

    const t0 = 10.0; // Time interval in the rest frame (seconds)
    const l0 = 100.0; // Length in the rest frame (meters)

    const t = calculateTimeDilation(gamma, t0);
    const l = calculateLengthContraction(gamma, l0);

    std.debug.print("Time dilation: {} seconds\n", .{t});
    std.debug.print("Length contraction: {} meters\n", .{l});
}
