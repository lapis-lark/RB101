# the sort method manages to sort ints, strs, etc. by using the <=> (spaceship) operator

2 <=> 1 # => 1
1 <=> 2 # => -1
2 <=> 2 # => 0
'b' <=> 'a' # => 1
'a' <=> 'b' # => -1
'b' <=> 'b' # => 0
1 <=> 'a' # => nil ; throws an ArgumentError in #sort

# to sort a type of object, it must have an implementation of <=>

# implementation varies by type, such as str using ASCIIbetical orrder
'A' <=> 'a' # => -1
'!' <=> 'A' # => -1

#use #ord to determine ASCII position
'b'.ord # => 98
'}'.ord # => 125

# if first char of each string the same, second char compared

['arc', 'bat', 'cape', 'ants', 'cap'].sort
# => ["ants", "arc", "bat", "cap", "cape"]

# length is only considered in this sort of case
'abc' <=> 'ab' # => 1

# arrays compare first values of each, then second
# afterwards size is compared
[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort
# => [["a", "car", "d"], ["a", "car", "d", 3], ["a", "cat", "b", "c"], ["b", 2]]

# the integers above would have caused an error if compared to a string, 
# but they didn't need to be directly compared

# hashes can also be sorted with #sort_by; can be sorted by key or value

people.sort_by do |_, age|
  age
end
# => [[:Mike, 18], [:john, 25], [:Kate, 27]]

# Symbol's implementation of <=> first converts symbols to strings
# in this case, Symbols's #capitalize method is needed to circumvent ASCII weirdness

people.sort_by do |name, _|
  name.capitalize
end
# => [[:john, 25], [:Kate, 27], [:Mike, 18]]

# watch out for #sort! and #sort_by! too


#some other interesting comparison methods:
#min, #max, #minmax, #min_by, #max_by, #minmax_by

