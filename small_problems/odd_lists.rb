=begin
def oddities arr
  new_arr = []
  arr.each_with_index { |x, i| i.even? ? new_arr << x : next }
  new_arr
end
=end

def oddities(arr)
  new_arr = []
  (0...arr.size).step(2) { |i| new_arr << arr[i] }
  new_arr
end

p oddities([2, 3, 4, 5, 6])
p oddities([1, 2, 3, 4, 5, 6])
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
