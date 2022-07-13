n = 10

1.times do |n|
  n = 11
end

puts n

=begin
This code returns nil and outputs 10. This is because local variable `n` is assigned to
the integer `10` on line 1. Although local variable `n` would usually be available within
the inner scope of the do..end block spanning lines 3-5, this block is called with 
a parameter of the same name, `n`, preventing local variable `n` from being accessed
in the inner scope. Thus, when `n` is assigned to the integer `11` on line 4, it is 
not local variable `n` that is reassigned, but the inner scope parameter `n`. 
This code example demonstrates how variable shadowing works in Ruby. 
=end