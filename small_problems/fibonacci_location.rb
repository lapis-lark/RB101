def fibonacci(num)
  return 1 if num == 1 || num == 2
  return 0 if num < 1
  (fibonacci(num - 1) + fibonacci(num - 2))
end

def find_fibonacci_index_by_length(target)
  i = 1
  loop do
    ans = fibonacci(i)
    break i if ans.digits.size == target
    i += 1
  end
end

p find_fibonacci_index_by_length(2) #== 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) #== 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
# p find_fibonacci_index_by_length(100) == 476
# find_fibonacci_index_by_length(1000) == 4782
# find_fibonacci_index_by_length(10000) == 47847
