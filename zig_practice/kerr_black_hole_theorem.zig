//black hole
// Solution: Introduced by Roy Kerr in 1963, this solution describes rotating black holes. The Kerr metric incorporates angular momentum and is expressed in terms of the mass
//M
//M and angular momentum per unit mass
//a
//a:
const std = @import("std");

const G: f64 = 1.0; // Gravitational constant (in natural units)
const M: f64 = 1.0; // Mass of the black hole (in natural units)
const a: f64 = 0.5; // Angular momentum per unit mass

fn P(r: f64, E: f64, Lz: f64) f64 {
    return E * (r * r + a * a) - a * Lz;
}

fn R(r: f64, E: f64, Lz: f64, mu: f64) f64 {
    const Delta = r * r - 2 * M * r + a * a;
    return P(r, E, Lz) * P(r, E, Lz) - Delta * (mu * mu * r * r + (Lz - a * E) * (Lz - a * E));
}

fn trajectory(r: f64, theta: f64, E: f64, Lz: f64, mu: f64) void {
    const dr_dlambda = std.math.sqrt(R(r, E, Lz, mu));
    const dtheta_dlambda = std.math.sqrt(mu - std.math.cos(theta) * std.math.cos(theta) * (a * a * (mu - E * E) + Lz * Lz));

    std.debug.print("dr/dlambda: {f}, dtheta/dlambda: {f}\n", .{ dr_dlambda, dtheta_dlambda });
}

pub fn main() void {
    const E: f64 = 1.0; // Energy per unit mass
    const Lz: f64 = 1.0; // Angular momentum per unit mass
    const mu: f64 = 1.0; // Rest mass of the particle

    // Initial conditions
    const r: f64 = 3.0; // Initial radial coordinate
    const theta: f64 = 0.5; // Initial polar angle

    trajectory(r, theta, E, Lz, mu);
}
