def reversal(array)
  midpoint = array.size / 2
  first = 0
  last = -1
  i = 0

  while i < midpoint
    array[first + i], array[last - i] = array[last - i], array[first + i]
    i += 1
  end

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