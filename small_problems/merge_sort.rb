def split(arr)
  return arr if arr.size == 1

  mid = arr.size / 2
  [split(arr[0...mid]), split(arr[mid..-1])]
end

def merge(arr)
  return arr if arr.size == 1

  if merge(arr[0]) <= merge(arr[1])
    [arr[0], arr[1]]
  else
    [arr[1], arr[0]]
  end
end

def merge_sort(arr)
  merge(split(arr))
end

merge_sort([9, 5, 7, 1]) #== [1, 5, 7, 9]
merge_sort([5, 3]) #== [3, 5]
merge_sort([6, 2, 7, 1, 4]) #== [1, 2, 4, 6, 7]
merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) #== %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]