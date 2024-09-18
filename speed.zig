const std = @import("std");
const net = std.net;
const fs = std.fs;

pub fn main() !void {
    const file_path = "test.txt";
    const file_size = 1024 * 1024; // 1 MB

    // Create a file with the specified size
    var file = try fs.cwd().createFile(file_path, .{});
    var buffer = try std.heap.page_allocator(u8, file_size);
    try file.write(buffer[0..file_size]);

    // Transfer the file over the network
    const server_addr = try net.Addr.fromIp("127.0.0.1", 8080);
    var conn = try net.connect(server_addr);

    var file_reader = std.io.File.open(file_path);
    var bytes_read = try file_reader.read(buffer, file_size);

    try conn.writeAll(buffer[0..bytes_read]);

    // Measure the network speed
    const start_time = std.time.monotonic();
    try conn.flush();
    const end_time = std.time.monotonic();

    const transfer_time = (end_time - start_time) * 1000; // in milliseconds
    const network_speed = (file_size / transfer_time) / 1024 / 1024; // in MB/s

    try conn.close();

    try std.io.getStdOut().writer().print("Network speed: {}\n", network_speed);
}
