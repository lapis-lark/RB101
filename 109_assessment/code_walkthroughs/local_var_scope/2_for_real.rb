a = 4

loop do
  a = 5
  b = 3


  break
end

puts a
puts b

=begin
This code returns nil and outputs `5` before throwing a NameError for an undefined variable.
This code demonstrates that local variables defined within an inner scope are inaccessible
in outer scopes (and are also inaccessible in other inner scopes) and that outer scope
local variables are accessbile in inner scopes. Hence, outer scope local var `a`
is accessible in the do..end block spanning lines 3-9 and is able to be reassigned to 5
on line 4. However, local var `b` is unable to be referenced beyond the scope of this block,
throwing an error when this is attempted on line 12. 
=end