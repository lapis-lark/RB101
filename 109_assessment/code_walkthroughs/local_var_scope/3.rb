a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b

# What does the following code return? 
# What does it output? Why? What concept does it demonstrate?

=begin
The following code outputs `3` then `2`.
This code demonstrates a property of local variable scope; namely, that 
the objects assigned to inner scope variables can still be accessed outside of
the inner scope if an outer scope variable also points at the object.
In this case, even though `c`, a variable initialized in an inner scope,
is itself no longer accessible in the outer scope, the 
object assigned to it is because `a`, an outer scope variable,
is reassigned to point at the same object on line 6.
=end

