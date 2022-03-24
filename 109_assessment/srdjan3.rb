# mutating/non-mutating methods
a = 'hello'

puts a # -> hello
puts a.object_id # -> 70368527757720 (this number will be different for you)

a.upcase! 

puts a # -> HELLO
puts a.object_id  # -> 70368527757720 (this number will be the same as the one above)
=begin
  local var a is assigned to the String 'hello' on line 1. on line 7, a mutating method,
  #upcase!, is called on local var a. this method mutates the String object 'hello',
  changing the data stored at 'hello' in the cpu's memory. a non-mutating method, such as
  #upcase, would create a NEW String, 'HELLO', at a new memory location. the #object_id
  invocations on lines 5 and 10 show that #upcase! is indeed mutating the original String
  and not creating a new one. if a new string were created, it would have a different object id,
  but the object id remains the same for 'hello' even as it is mutated to 'HELLO'.
=end

# mutatable vs non-mutatable
a = 'name'
b = 'name'
c = 'name'

# Are these three local variables pointing to the same object?

puts a.object_id
puts b.object_id
puts c.object_id

# And when we add these two lines of code... ?

a = c
b = a

puts a.object_id
puts b.object_id
puts c.object_id

# What about now?
a = 5
b = 5
c = 5

puts a.object_id
puts b.object_id
puts c.object_id
=begin
  1. no, local vars a, b, and c do not point to the same object. each time a local var is assigned to 'name', a new String with the value name is created 
  2. now all three local vars point to the String that local var c was assigned to. all object id's will be the same. local var a was reassigned to point to the same String c was assigned to,
     and then local var b was reassigned to the same String as a, which is the same String as c.
  3. all local vars assigned to the Integer 5 have the same object id. this is because all integers have their own fixed object id and are immutable.
     if they were mutable, a variety of problems would result. for example, the object id of 5 is 11. if 5 were mutated to be 6, the integer that is supposed to hold object id 11 is different, meaning 
     that 6 would be used instead of 5 at times when the program should be using 5.
=end

# reassignment is not mutation
a = 'hello '
puts a
puts a.object_id

a += 'world'
puts a
puts a.object_id
=begin
  this example demonstrates that reassignment is not mutation.
  on L61, local var a is assigned to the String 'hello '. on L65, the string object
  a references calls #+ with String 'world' passed in as an argument.
  this method returns a new string, 'hello world'. local var a is reassigned to reference
  this new string. because reassignment is not mutation, the new string a is assigned to
  has a new object_id and a new place in physical memory.
=end

