array = [1, 2, 3, 4, 5]

p (array.select do |num|
   puts num if num.odd?
end)

# What does the following code return? 
# What does it output? Why? What concept does it demonstrate?

=begin
The following code returns an empty array and outputs `1`, `3`, `5`.
This concept demonstrates how `Array#select` works; `it returns an 
array of the elements of the array 
that, when passed into the block `Array#select` is called with, evaluate to true.

In this case, the return value of the block on each iteration is the same, `nil`,
and as `nil` evaluates to `false`, an empty array is returned. When the element 
passed into the block with the parameter `num` is odd, `#puts` outputs the element
and returns `nil`. `nil` is also returned when no clause of an `if` statement is evaluated
as happens here when an even number is passed into the block.
=end