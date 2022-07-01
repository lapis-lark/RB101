a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b

=begin
This code prints 5 to the console twice, then prints 4, then 2. It returns nil.
This code is an example of variable shadowing. When a new inner inner scope with
parameter `a` is created on line 4, local var `a` created on line 1 is not accessible
within it. Usually local variables are available within inner scopes, but because a
parameter with the same name is declared for this inner scope, local variable `a` is
inaccessible and unmodifiable. Thus, when `a` is reassigned to 5 on line 5, it is not local
var `a` from the outer scope that is reassigned, but the inner local var `a` which was declared
as a parameter of the inner scope. When the inner scope ends, the inner scope `a` is 
no longer accessible, and the outer scope local variable `a` is printed to the screen
on line 9. 
=end