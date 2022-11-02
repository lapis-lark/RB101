animal = "dog"

loop do |animal|
  animal = "cat"
  break
end

puts animal

# What does the following code return? 
# What does it output? Why? What concept does it demonstrate?

=begin
This code outputs `'dog'` and returns `nil`. It demonstrates the property of variable
shadowing in Ruby; namely, that when a block's parameter shares the same name as an
outer scope variable, the outer scope variable is inaccessible within the block.

Therefore, the local variable `animal` assigned to the String `'dog'` on line 1
is innaccesible within the block spanning lines 3-6 because that block has a parameter
of the same name. Therefore, when `animal` is assigned to the String `'cat'` on line 4, 
it is actually the block's parameter is being assigned to this String, not the outer 
local variable `animal`. Accordingly, when `#puts`` is called on line 8, it is not `'cat'`
that is output but `'dog'`.
=end