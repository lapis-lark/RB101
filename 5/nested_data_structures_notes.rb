# any(?) object can be nested inside an array, such as hashes
[{ a: 'ant' }, { b: 'bear' }]

arr = [{ a: 'ant' }, { b: 'bear' }]

arr[0][:c] = 'cat'
arr # => [{ :a => "ant", :c => "cat" }, { :b => "bear" }]

[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].minmax
# => [["a", "car", "d"], ["b", 2]]


# what happens to arr here?
a = [1, 3]
b = [2]
arr = [a, b]
arr # => [[1, 3], [2]]

a[1] = 5
arr # => [[1, 5], [2]]

# arr is changed because it contains a reference to a
# likewise, a's values can be changed accessing them through arr
arr[0][1] = 8
arr # => [[1, 8], [2]]
a   # => [1, 8]

VARIABLES_AS_POINTERS!!

# #dup and #clone (alias) create SHALLOW copies of an object;
# they only change the object_id of the object, not objects nested within it
irb(main):009:0> a = %w(a b c d e f)
irb(main):010:0> a
irb(main):011:0> a.object_id
=> 300
irb(main):012:0> b = a
=> ["a", "b", "c", "d", "e", "f"]
irb(main):013:0> b = a.dup
=> ["a", "b", "c", "d", "e", "f"]
irb(main):014:0> b.object_id
=> 320
irb(main):015:0> a[0] << 'zzz'
=> "azzz"
irb(main):016:0> a
=> ["azzz", "b", "c", "d", "e", "f"]
irb(main):017:0> b
=> ["azzz", "b", "c", "d", "e", "f"]

WATCH_OUT:

arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

arr1 # => ["a", "b", "c"]
arr2 # => ["A", "B", "C"]

arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.each do |char|
  char.upcase!
end

arr1 # => ["A", "B", "C"]
arr2 # => ["A", "B", "C"]

# #map! doesn't modify arr1 because it replaces each object in arr2 with a new one
# #each modifies arr1 because it modifies each object, objects shared with arr1



# main difference between #dup and #clone that clone maintains frozen status
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.clone
arr2 << "d"
# => RuntimeError: can't modify frozen Array
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.dup
arr2 << "d"

arr2 # => ["a", "b", "c", "d"]
arr1 # => ["a", "b", "c"]

# note that #freeze only applies to the object it is called on (not nested objects)
arr = [[1], [2], [3]].freeze
arr[2] << 4
arr # => [[1], [2], [3, 4]]

