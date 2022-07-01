def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]   