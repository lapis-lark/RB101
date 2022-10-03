loop do       
  puts a      # => 1
  a = a + 1   # "a" is re-assigned to a new value
  break       # necessary to prevent infinite loop
end
=begin
  the do..end block following the invocation of the `loop` method on line 1 creates an inner scope
=end


greeting = 'Hello'
# The local variable `greeting` is assigned to the String 'Hello' on line 1.

puts greeting
=begin
The puts method is called on line 8 with the variable greeting passed to it as an
 argument; since greeting is now assigned to 'Hi', this is what is output. 
=end

def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

=begin
the method `example` is defined between lines 20-27. It accepts one parameter, `str`.
=end
i -= 1
=begin
Integer#- is called on local variable `i` with an argument of 1.
`i` is then reassigned to the return value of this method.
=end