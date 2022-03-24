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

# MUTATING VS NON-MUTATING METHODS



# PASS-BY-REFERENCE/PASS-BY-VALUE


# WORKING WITH COLLECTIONS (ARRAY, HASH, STRING); 


# #EACH, #MAP, #SELECT WITH ARRAYS


# #EACH, #MAP, #SELECT WITH HASHES


# #[], #SLICE, OUT OF BOUNDS REFERENCES (#FETCH)


# VARIABLES AS POINTERS


# PUTS VS RETURN


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


# IMPLICIT RETURN VALUE OF METHODS AND BLOCKS


# ARRAY#SORT