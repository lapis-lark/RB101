require 'byebug'

def merge_sort(arr)
  #byebug
  return arr if arr.size < 2
  nested = nest(arr)
  merge(nested[0], nested[1])
end

def nest(arr)
  size = arr.size
  return arr if size < 2
  [nest(arr[0...(size / 2)]), nest(arr[(size / 2)..-1])]
end

def merge(arr1, arr2)
  if [arr1[0].class, arr2[0].class].include?(Array) == false
    merged = []
    until arr1.empty? || arr2.empty?
      merged << (arr1[0] < arr2[0] ? arr1.shift : arr2.shift)
    end
    merged + arr1 + arr2

  elsif arr1[0].class != Array
    merge(arr1, merge(arr2[0], arr2[1]))
  elsif arr2[0].class != Array
    merge(merge(arr1[0], arr1[1]), arr2)
  else
    merge(merge(arr1[0], arr1[1]), merge(arr2[0], arr2[1]))
  end
end

















p merge_sort([9, 5, 7, 1, 6, 4]) #== [1, 5, 7, 9]
p merge_sort([5, 3]) #== [3, 5]
p merge_sort([])
p merge_sort([8])
p merge_sort([6, 2, 7, 1, 4]) #== [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]