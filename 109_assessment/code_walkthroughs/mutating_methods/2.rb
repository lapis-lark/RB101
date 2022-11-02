def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)

p s
p t

# What does the following code return? 
# What does it output? Why? What concept does it demonstrate?

=begin
The following code outputs nothing and returns `'HELLO!'`. It demonstrates
mutating methods and how they modify the contents of an existing address space
rather than creating a new object in a new address space. 

In this case, local variable `s` is assigned to teh String `'hello'` on line 7 before
being passed into `#fix` as an argument on line 8. Within `#fix`, the parameter `value` now
references the same object as `s`. Accordingly, when the mutating methods `#upcase!`
and `#concat` are called on `value`, they are modifying the address space that both
`s` and `value` reference. `#fix` returns a reference to this address space, and local
variable `t` is assigned to this same object. `s` and `t` now reference the same object,
String `'HELLO!'`.
=end