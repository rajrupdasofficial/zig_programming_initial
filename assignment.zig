//use the comsy key word to an identifier
const print = @import("std").debug.print;
const x = 1234;
fn foo() void {
    const y = 4555;
    y += 1;
}

pub fn main() void {
    foo();
}

//const applies to all of the bytes that the identifier immediately addresses. Pointers have their own const-ness.
