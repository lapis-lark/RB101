def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)

# What does the following code return? 
# What does it output? Why? What concept does it demonstrate?

=begin
The following code returns `'HELLOXYZ!'` and outputs nothing. It demonstrates how 
both mutating and non-mutating functions work; specifically, that mutating methods alter
the objects they are invoked on whereas non-mutating methods create a new object
in a new address space without altering the memory space that the object they were invoked
on references.

In this case, local variable `s` is assigned to the String `'hello'` on line 7.
Then, `s` is passed as an argument into `#fix` on lin 8. Within `#fix`, the parameter
`value` now references the same address space as `s`. Accordingly, when the mutating
method `#<<` is called on `value`, the object `value` references has `'xyz'` concatenated
onto it. On the next line, however, non-mutating method `#upcase` is called on `value`,
creating a new object, `'HELLOXYZ'`, that `value` is then reassigned to. Finally, 
mutating method `#concat` is called on `value`, concatenating `'!'` to the object
referenced by `value`.

As `value` and `s` now reference different objects, however, `s` remains unchanged.
`#fix` returns a reference to `HELLOXYZ!` which local variabel `t` is then assigned to.
Ultimately, `s` references the String `'helloxyz'`, whereas `t` references `'HELLOXYZ!'`
=end