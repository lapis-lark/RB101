def halvsies(arr)
  mid = (arr.size / 2.0).ceil
  [arr[0...mid], arr[mid..-1]]
end

def halvsies(arr)
  arr.partition.with_index { |_e, i| i < (arr.size / 2.0) }
end

p halvsies([1, 2, 3, 4]) #== [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
halvsies([]) == [[], []]
