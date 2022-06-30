# What is the value of 's'? Of 't'? Do 's' and 't' reference the same object?

def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)
  


# check if line numbers required 

=begin
Upon completion of the program, `s` and `t` both reference the same `String` object `HELLO!`
On line 9, local variable `s` is assigned to the `String`` `hello`. Then on line 10, 
the method `#fix` is called with `s` passed in as an argument. Method parameter `value` references
the same object as `s` within the method. Within the method, `value` calls mutating method `#upcase!`, 
then calls mutating method `#concat` with String `'!'` passed in as an argument.
local variable `t` is then assigned to the return value of `#fix` which is the implicitly returned evaluation of the last line, `value`.
Thus, `t` references the same object as `s` as only mutating methods have been called. There has been no reassignment which is not mutating and would create a reference to a new object.
=end
