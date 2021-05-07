def merge(arr)
  return arr if arr.size == 1

  left = merge(arr[0])
  right = merge(arr[1])
  merged = []

  a, b = 0, 0
  loop do
    if left.empty?
      right.each { |b| merged << b }
      return merged
    elsif right.empty?
      left.each { |a| merged << a }
      return merged
    elsif left[a] <= right[b]
      merged << left.slice!(a)
    else
      merged << right.slice!(b)
    end
  end
end

def split(arr)
  return arr if arr.size == 1

  mid = arr.size / 2
  [split(arr[0...mid]), split(arr[mid..-1])]
end

def merge_sort(arr)
  merge(split(arr))
end

p merge_sort([9, 5, 7, 1]) #== [1, 5, 7, 9]
p merge_sort([5, 3]) #== [3, 5]
p merge_sort([6, 2, 7, 1, 4]) #== [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) #== %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) #== [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]