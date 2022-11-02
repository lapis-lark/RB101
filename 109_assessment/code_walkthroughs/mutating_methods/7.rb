num = 3

num = 2 * num

# What does the following code return? 
# What does it output? Why? What concept does it demonstrate?

=begin
This code returns 6 and outputs nothing. It can be seen as an example of Integers
being immutable in ruby.

Specifically, local variable `num` is assigned to `3` on line 1.
On line 2, `num` is reassigned to the return value of `Integer#*` called on `2` with
an argument of `num` (`6`). `num` now actually references a different address space,
for not only is assignment a non-mutating method, but Integers are immutable. That is to
say, each Integer has a fixed address space assigned to it, and the contents of that 
address space cannot be changed. 
=end