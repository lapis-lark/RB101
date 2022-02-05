def multiply_list(arr1, arr2)
  arr1.map.with_index { |n, ix| n * arr2[ix] }
end

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |pair| pair.inject(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]