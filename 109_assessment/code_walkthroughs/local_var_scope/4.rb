def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

# What does the following code return? 
# What does it output? Why? What concept does it demonstrate?

=begin
The code returns `nil`` implicitly (`nil` being the return value of break
when no explicit return value is specified), and it demonstrates a couple of properties
of local variables; namely, that local variables are accessible within inner scopes 
(in this case, the do..end block spanning lines 3-7 within the block) and that scoping
rules of local variables are exactly the same inside and outside of methods.

In this instance, the local variable `i` assigned to Integer `3` on line 2 is accessible
within the block directly below it. Therefore, it is able to reassigned to the return
value of Integer#- called with an argument of `1` each time the block repeats until
`i` is equal to zero and the `break` command breaks out of the loop.
=end
