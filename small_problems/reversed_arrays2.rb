def reverse(array)
  array.inject([]) { |new_arr, ele| new_arr.unshift(ele) }
end

p reverse([1, 2, 3, 4]) == [4, 3, 2, 1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2] # => [1, 3, 2]
new_list = reverse(list) # => [2, 3, 1]
p list.object_id != new_list.object_id # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true      # => true
