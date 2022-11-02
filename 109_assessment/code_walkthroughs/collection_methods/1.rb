p [1, 2, 3].any? do |num|
  num > 2
end

# What does the following code return? 
# What does it output? Why? What concept does it demonstrate?

=begin
  The following code returns `true` and outputs nothing. It demonstrates how the `#any?`
  method works; namely, `#any?` returns `true` or `false` depending on the 
  evaluation of the return value of the block it is called with for each element
  in the collection. If the block ever evaluates to `true`, then `true` is returned.
  Otherwise `false` is returned.# What values do `s` and `t` have? Why?
  

  In this example, each element of the Array `[1, 2, 3]` is run through the block `#any?`
  is called with. The first two elements are not greater than 2, and the block evaluates
  to `false` for each of them. The third element, however, is greater than `2`, so
  the invocation of `#any?` ultimately returns `true`.
=end