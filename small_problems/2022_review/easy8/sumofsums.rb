def sum_of_sums(arr)
  sum = 0
  arr.size.times { |i| sum += arr[0..i].sum }
  sum
end

def sum_of_sums(arr)
  arr.each_with_index.inject(0) { |sum, (ele, ind)| sum + arr[0..ind].sum }
end

def sum_of_sums(arr)
  arr.map.with_index { |ele, i| arr[0..i].sum }.sum
end


p sum_of_sums([3, 5, 2]) #== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) #== (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35