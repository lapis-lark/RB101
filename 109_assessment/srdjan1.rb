a = 'hello'
b = a
a = 'goodbye'
=begin
  local var a is initialized to the string 'hello' on line 1
  local var b is initialized to reference the same string as local var a, 'hello', on line 2
  local var a is reassigned to reference a new string, 'goodbye', on line 3
  this example provides insight into how variable assignment and referencing work in Ruby
  specifically, it shows that assignment is non-mutating, because b still references the string 'hello', and this string remains unchanged after reassignment
=end

def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

example('hello')

=begin
  a method #example is defined on lines 12-19; this method requires one parameter, str.
  on line 13, local var i is initialized to the integer 3
  on 14, #loop is invoked with a do..end block (lines 14-18)
  #puts is invoked with local var str, outputting str to the terminal
  on line 16, local var i is invoked with Integer#- with integer 1 passed in as an argument; i is reassigned to reference the return value of this
  #loop is broken out of with keyword break if local var i references integer 0
  on line 21, #example is invoked with string 'hello' as an argument passed into it
  'hello' is printed to the terminal 3 times, and the return value is nil (the default return value of break)
  this example demonstrates how outer scope is accessible within inner scope
=end

a = 4

loop do
  a = 5
  b = 3
  break
end

puts a
puts b

=begin
  local var a is initialized to integer 4 on L35
  #loop is invoked with a do..end block spanning lines 37-41 on L37
  local var a is reassigned to reference integer 5 on L38
  local var b is initialized to integer 3 on L39
  keyword break breaks out of teh loop on L40
  #puts is invoked with local var a passed in as an argument; 5 is printed to the terminal, return value is nil
  #puts is invoked iwth lcoal var b passed in as an argument; however, b was initialized within an inner scope and is not accessible in this outer scope; an undefinded local variable error is thrown
  this example shows how variable scoping with local variables works; specifically, variables defined in an inner scope are inaccessible in an outer scope, but variables defined in an outer scope are accessible in inner scopes
=end

