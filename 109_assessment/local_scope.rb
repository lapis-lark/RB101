# 2 major areas of local var scope rules: method def and method invocation

# outer scope accessable by inner scope
# inner scope inaccessable by outer scope
a = 1

loop do
  a = 2
  b = 3

  puts a
  puts b
  break
end

puts a
puts b

=begin
  local variable a is initialized to an integer object, 1, on line 5
  #loop is invoked with a do..end block on line 7, creating an inner scope within the block
  within the inner scope, local var a is reassigned to reference a different integer object, 2, on line 8
  local var b is intialized to the integer 3 within the inner scope
  both variables are accessible within the inner scope, and puts outputs each variable to the terminal
  keyword break breaks out of the loop on line 13, returning the program to the outer scope
  on line 16, #puts is invoked with local var a passed to it as an argument, printing a to the terminal
  on line 17, #puts is invoked with local var b passed to it as an argument, but as b is inaccessible in outer scope (it being defined in an inner scope), an undefined variable error is thrown when the program rusn
=end