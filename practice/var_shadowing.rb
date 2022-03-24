n = 10

1.times do |n|
  n = 11
end

puts n

=begin
Local variable n is assigned to Integer 10 on line 3. On line 5, Integer#times is invoked with a do..end block between lines 5-7.
This block has one parameter, n. Blocks create a new inner scope in which outer scope variables are accessible.
However, because the block parameter local variable has the same name as an outer scope variable,
the outer scope local variable n is inaccessible within the inner scope. 
Thus, it is the inner scope variable n which is reassigned Integer 11 on line 4. 
When the block ends, inner scope variable n is no longer accessible.
When #puts is invoked with local variable n as an argument on line 7, it outputs 10.
This is the value of the outer scope variable n which has never been reassigned. 
=end

=begin
This code will print 10. While it appears that local variable n, defined on line 3, is reassigned to 11 on line 6 within a block,
this is actually a different local variable n that overshadows the outer scope n within the block.
Outer scope local variables of the same name as inner scope local variables are inaccessible within the inner scope, a concept known as variable shadowing.
It is actually inner scope local variable n that is reassigned on line 6.
=end