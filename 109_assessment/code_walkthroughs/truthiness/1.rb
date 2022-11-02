a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end

# What does the following code return? 
# What does it output? Why? What concept does it demonstrate?

=begin
  The following code returns `nil` and outputs `'Hello is truthy'`. 
  This code demonstrates that objects that are not `false` or `nil` evaluate
  to `true` in ruby. 

  In the case of this code specifically, local variable `a` is assigned to the String `Hello`
  on line 1. On line 3, the `if` statement evaluates `a` into either `true` or `false`.
  Because the object `a` references is neither `false` nor `nil`, it evaluates to `true`,
  and `'Hello is truthy'` is output. If it evaluated to false, the `else` clause
  would have run. 
  =end