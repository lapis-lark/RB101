def reverse(arr)
  arr = arr.clone
  (arr.size / 2).times { |i| arr[i], arr[-1 - i] = arr[-1 - i], arr[i] }
  arr
end

def reverse(arr)
  new_arr = []
  arr.size.times { |i| new_arr << arr[-1 - i] }
  new_arr
end

def reverse(arr)
  arr.inject([]) { |memo, ele| memo.unshift(ele) }
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true