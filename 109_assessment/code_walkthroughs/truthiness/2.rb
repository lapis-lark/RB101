def test
  puts "written assessment"
end

var = test

if var
  puts "written assessment"
else
  puts "interview"
end

# What does the following code return? 
# What does it output? Why? What concept does it demonstrate?

=begin
The following code outputs 'written assessment', then 'interview' and returns `nil`.
It demonstrates that `nil` evaluates to `false`, unlike all other objects in ruby
except for `false` itself.

The method `test` is declared on lines 1-3. `test` will always return `nil` since
this is the return value of `#puts` which is invoked on the last line of `test`. This value
is therefore always returned implicitly. Thus, when local variable `var` is assigned 
to the return value of `test` on line 5, it is being assigned to `nil`.

On line 7 when `var` is evaluated to a boolean by the if statement, it evaluates to `false`.
Accordingly, the `else` clause is the one to execute.`'interview'` is output, and `nil`
is returned by this `#puts` invocation as well. 

=end