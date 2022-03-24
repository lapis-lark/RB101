# LOCAL VARIABLE SCOPE

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

=end

# Lesson 2 Section 18, Variable Scope
# peer scopes do not intersect
2.times do
  a = 'hi'
  puts a      
end

loop do
  puts a      # => NameError: undefined local variable or method `a' for main:Object
  break
end

puts a        # => NameError: undefined local variable or method `a' for main:Object
=begin

=end

# Lesson 2 Section 18, Variable Scope
# variable shadowing; outer scope var inaccessible in inner scope if there is shadowing
n = 10

[1, 2, 3].each do |n|
  puts n
end
=begin

=end

# Lesson 2 Section 18, Variable Scope
# methods can access objects passed but have a totally separate scope
def some_method(a)
  puts a
  puts y
end

x = 1
y = 2

some_method(x) # error thrown
=begin

=end


# MUTATING VS NON-MUTATING METHODS

# What is the difference between a mutating and non-mutating method?
=begin

=end

# What is the value of 's'? Of 't'? Do 's' and 't' reference the same object?
def fix(value)
  value.upcase!
  value.concat('!')
  value
ends = 'hello'
t = fix(s)
=begin

=end

# PASS-BY-REFERENCE/PASS-BY-VALUE
# Lesson 2 Section 20
# Ruby is essentially pass-by-reference, but because not all objects are mutable (i.e. integers, symbosl) and not all methods mutate the caller, it can sometimes behave like pass-by-value
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names.inspect          # => ["bob", "kim"]
=begin

=end

def add_name(arr, name)
  arr << name
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names.inspect          # => ["bob", "kim", "jim"]
=begin

=end

def add_one(n)
  n += 1
end

a = 3
add_one(a)
a # => 3
# Why is 'a' still 3? What is the return value of add_one?
=begin

=end


# #EACH, #MAP, #SELECT WITH ARRAYS


# #EACH, #MAP, #SELECT WITH HASHES


# #[], #SLICE, OUT OF BOUNDS REFERENCES (#FETCH)


# VARIABLES AS POINTERS

# Intro to Programming, More Stuff Chapter
# Explain why in the first example b != a but in the second b == a
# 1
a = "hi there"
b = a
a = "not here"

# 2
a = "hi there"
b = a
a << ", Bob"
=begin

=end

# PUTS VS RETURN
a = [1, 2, 3]

def mutate(array)
  array.pop
end

p a
p mutate(a)
p a
# Explain what each #p call will output and why
=begin

=end

# FALSE VS NIL, TRUTHINESS

# Lesson 2 Section 5, Truthiness
# everything but nil and false evaluate to true in a boolean context
num = 5

if num
  puts "valid number"
else
  puts "error!"
end
=begin

=end

3 == true # false; non-false non-nil objects are not true, they are truthy; they evaluate to true in boolean contexts
false.nil? # false; false is not nil, nil just evaluates to false


# METHOD DEFINITION, METHOD INVOCATION

# Lesson 2, Section 19, More Variable Scope
# method definition is defining a method using the def keyword
def greeting
  puts "Hello"
end

# method invocation is calling a method
greeting # Calling the greeting method outputs "Hello"

# calling a method with a block does not mean the block will execute; blocks ARE A PART of the method invocation
# Lesson 2, Section 19, More Variable Scope
def greetings
  yield
  puts "Goodbye"
end

word = "Hello"

greetings do
  puts word
end
=begin

=end
# What would the above code output without the 'yield' keyword?



# IMPLICIT RETURN VALUE OF METHODS AND BLOCKS

# Intro to Programming Book, Methods Chapter
# "Ruby methods ALWAYS return the evaluated result of the last line of the expression unless an explicit return comes before it."
def add_three(number)
  return number + 3
  number + 4
end

returned_value = add_three(4)
puts returned_value
=begin

=end
# What would the result be if the return keyword were removed?


# ARRAY#SORT

# Lesson 5 Section 2, Sorting
# Integers: What will the following #sort invocation return?
[2, 5, 3, 4, 1].sort # => 

# Strings: What will the following #sort invocation return?
['c', 'a', 'e', 'b', 'd'].sort # => 

# Strings: What will the following #sort invocation return?
%w(a A).sort

# Can you sort an array with objects of different types?
['a', 1].sort # => 

# How does the <=> operator work? What will each of the following expressions return?
2 <=> 1 # => 
1 <=> 2 # => 
2 <=> 2 # => 
'b' <=> 'a' # => 
'a' <=> 'b' # => 
'b' <=> 'b' # => 
1 <=> 'a' # => 