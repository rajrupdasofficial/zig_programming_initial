//Use undefined to leave variables uninitialized:

const print = @import("std").debug.print;

pub fn main() !void {
    var x: i8 = undefined;
    x = 1;
    print("{d}", .{x});
}
