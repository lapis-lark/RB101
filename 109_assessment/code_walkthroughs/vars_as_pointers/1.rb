a = "hi there"
b = a
a = "not here"

=begin
  This code returns  the string `not here` and outputs `hi there`. local var `a`
  is assigned to String `hi there` on line 1. On line 2, local var `b` is assigned to the
  same string, meaning that it points to the physical memory location storing the string
  'hi there' just as `a` does. On line 3, local var `a` is reassigned to the string
  `goodbye`, pointing to a new memory location storing this string. `b` remains pointing at
  'hi there'. This code demonstrates that assignment is non-mutating. Therefore, 
  when `a` is reassigned to `not here` on line 3, it begins to point to a different 
  lcoation in memory with another string stored there rather than changing what data is
  stored at the memory location it originally pointed to. 
=end
