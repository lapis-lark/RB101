{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end

=begin
What will this method return?

This method will return the Boolen `true`. 
`#all?` is invoked on line 1 with a hash and block passed in as arguments.
Within the method, each key/value pair is passed into the block as its parameters `key` and `value`.
Within the block, `#length` is invoked with `value` as an argument. 
The Integer returned by `#length` is compared with the Integer 3 when `#>=` is invoked with these Integers as arguments.
`#all?` returns either `true` or `false` depending on how the block evaluates on each iteration through it.
If each evaluation of the block returns `true`, the return value of `#all?` is `true`. 


=end