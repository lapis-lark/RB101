def merge(arr1, arr2)
  n_arr1, nar_arr2 = arr1.clone, arr2.clone
  merged = []
  until n_arr1.empty? ||nar_arr2.empty?
    merged << (n_arr1[0] < nar_arr2[0] ? n_arr1.shift : nar_arr2.shift)
  end
  (merged << n_arr1 << nar_arr2).flatten
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]