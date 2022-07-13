def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)

=begin
This code returns `HELLO!` and has no output. The method `fix` is defined between lines
1-5 and takes one argument, `value`. On line 7, local var `s` is assigned to the string
`hello`, and on line 8, s is passed into the metod `fix` as an argument. Upon doing so,
the parameter `value` is assigned to the same string object as `s`. The mutating method
`#upcase!` is called on `value`, and then the mutating method `#concat` is called on
`value` with the argument `!`. These methods, being mutating methods, change the original
string object that value references. Therefore, when `value` is implicitly returned
on the last line of the method, it has been mutated to `HELLO!`. If non-mutating 
methods had been called on `value`, the string it references would still be `hello`.

This code example demonstrates how mutating methods change the objects they are called on.
=end