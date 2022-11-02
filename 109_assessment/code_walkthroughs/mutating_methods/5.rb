def fix(value)
  value[1] = 'x'
  value 
 end
 
 s = 'abc'
 p t = fix(s)

# What does the following code return? 
# What does it output? Why? What concept does it demonstrate?
# What values do `s` and `t` have? Why?

=begin
This code returns `'axc'` and outputs nothing. At the end of the program, local variable
`s` and `t` both reference the same String object, `'axc'`. This code is an example of
a mutating method, that is, a method that directly modifies the object referenced by the caller.

In this specific instance, `s` is passed into `#fix` as an argument on line 7.
With `#fix`, the parameter `value` references the same object as `s`. Thus,
when the mutating method `String#[]=` is called on `value` with String `'x'` as
an arguement, the object `value` references is mutated (the second element of the String
is replaced with `'x'`). `value` is then implicitly returned by `#fix` on the next line,
which `t` is then assigned to. As `value` referenced the same object as `s`, `t` now 
references that same object.
=end