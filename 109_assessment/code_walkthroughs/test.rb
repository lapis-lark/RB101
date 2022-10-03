=begin
  This code demonstrates a property of locla variables; namely, that local variables
  declared in an outer scope are still accessible within inner scopes. In this case, 
  the String `'hello'` is assigned to the local variable `greeting` on line 1. A
  do..end block spanning lines 3-6 creates an inner scope, within which `greeting`
  is reassigned to the String `'Hi`. Thus, when `greeting`` is passed as an argument to 
  `#puts`, it is `'Hi'` that is output to the terminal. 
=end

=begin
