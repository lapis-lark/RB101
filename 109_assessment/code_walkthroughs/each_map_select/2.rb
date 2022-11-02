arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.select { |n| n.odd? }

# What does the following code return? 
# What does it output? Why? What concept does it demonstrate?

=begin
 This code returns `[1,3,5,7,9]` and outputs nothing. It demonstrates the behavior of 
 `Array#select`; specifically, `Array#select` passes each element of the array it is
 called on into the block it is called with. If the return value of the block
 evalutes to true, then that element is appended to the array that the method returns.

 In this case, the block `#select` is called with evaluates to true if the element passed
into it is odd. Therefore, an array of consisting only of the odd elements of the 
array `#select` was called on is returned. 
=end