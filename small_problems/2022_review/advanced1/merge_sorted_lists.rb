def merge(arr1, arr2)
  n_arr1, n_arr2 = arr1.clone, arr2.clone
  merged = []
  
  until n_arr1.empty? ||n_arr2.empty?
    merged << (n_arr1[0] < n_arr2[0] ? n_arr1.shift : n_arr2.shift)
  end
  merged + n_arr1 + n_arr2
end

def merge(arr1, arr2, merged = [])
  return merged + arr2 if arr1.empty?
  return merged + arr1 if arr2.empty?

  if arr1[0] < arr2[0]
    merge(arr1[1..-1], arr2, merged << arr1[0])
  else
    merge(arr1, arr2[1..-1], merged << arr2[0])
  end

end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]