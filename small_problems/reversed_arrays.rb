def reversal(array)
  left = 0
  right = -1

  while left < array.size / 2
    array[left], array[right] = array[right], array[left]
    left += 1
    right -= 1
  end

  array
end

list = [1,2,3,4]
result = reversal(list)
p result #== [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
p reversal(list) #== ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reversal(list) == ["abc"] # true
list == ["abc"] # true

list = []
reversal(list) == [] # true
list == [] # true