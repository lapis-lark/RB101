def add_name(arr, name)
  p arr.object_id
  arr = arr << name
  p arr.object_id
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names

# What does the following code return? 
# What does it output? Why? What concept does it demonstrate?

=begin
This code returns nil and outputs `'bob'`, `'kim'`, `'jim'`. It is an example of a 
mutating method mutating the caller. 

In this case, local variable `names` is assigned to an array of strings on line 5. 
On the next line, `#add_name` is invoked with `names` and the string `'jim'` as arguments.
Within `#add_name`, mutating method `Array#<<` is called on the parameter `arr`
which references the same array as `names` with `name` (referencing the String `'jim'`)
as an argument. This appends `name` to ` `arr`, and then `arr` is reassigned to 
reference the original, now mutated array, which it already referenced. 

`#add_name` returns `arr`, and when `names` is printed by `#puts` on the next line, 
`jim` is the last name printed, for `name` and `arr` reference the same array. 
=end