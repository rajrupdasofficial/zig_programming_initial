const std = @import("std");

const Timestamp = struct {
    ///The number of seconds since the epoch (this is also a doc comment).
    ///
    seconds: i64, // signed so we can represent pre-1970 (not a doc comment)
    ///The number of nanoseconds past the second (doc comment)
    ///
    nanos: u32,
    /// retutns a timestamp struct representing the Unix epoch ; that is the
    /// moment of 1970 jan 1 00:00:00 UTC (this is a doc comment ).
    pub fn unixEpoch() Timestamp {
        return Timestamp{
            .seconds = 0,
            .nanos = 0,
        };
    }
};

pub fn main() !void {
    const epoch = Timestamp.unixEpoch();
    try std.io.getStdOut().writer().print("Unix epoch: {}\n", .{epoch});
}
