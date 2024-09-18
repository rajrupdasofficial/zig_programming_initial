//If you need a variable that you can modify, use the var keyword:

const print = @import("std").debug.print;

pub fn main() void {
    var y: i32 = 5362;
    y += 1;
    print("{d}", .{y});
    //var must be initialized

    // var x:i8;
    // x=1;
    // print("{d}",.{x});
}
