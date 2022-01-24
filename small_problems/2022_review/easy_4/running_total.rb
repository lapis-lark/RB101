def running_total(arr)
sum = 0
arr.map { |ele| sum += ele }
end

# further
def running_total(arr)
  new_arr = []

  arr.inject(0) do |sum, n|
    new_arr << sum + n
    sum + n
  end

  new_arr
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []