def sum_of_sums(arr)
  sum = 0
  size = arr.size
  i = 0
  until i == size
    sum += arr[i] * (size - i)
    i += 1
  end
  sum
end

def sum_of_sums(arr)
  sum_arr = []
  arr.size.times do |i|
    sum_arr << arr[0..i]
  end
  sum_arr.flatten.inject(:+)
end

def sum_of_sums(arr)
  arr.map.with_index do |num, i|
    arr[0..i]
  end.flatten.inject(:+)
end

p sum_of_sums([3, 5, 2]) #== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) #== (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35