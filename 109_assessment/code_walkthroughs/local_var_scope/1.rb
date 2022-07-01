a = “Hello”
b = a
a = “Goodbye”
puts a
puts b

=begin
This code prints 'Goodbye' then 'Hello' to the console and returns nil. 
The string 'Hello' is assigned to local variable a on line 1, then local variable b
is assigned to the same string. Local variable a is then reassigned to the string 'Goodbye'.
This example demonstrates that assignment is non-mutating in Ruby. The string 'Hello'
remains unchanged and stored in the same place in memory; when a is reassigned, it points to
a new memory space containing 'Goodbye'; local var b continues to point to the memory space where 'Hello'
is stored. 
=end

