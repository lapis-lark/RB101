def find_fibonacci_index_by_length(digits)
  index = 1

  n1 = 0
  n2 = 1
  fib = 1
  
  until fib.digits.size == digits
    fib = n1 + n2
    n1 = n2
    n2 = fib
    index += 1
  end

index
end

p find_fibonacci_index_by_length(2) #== 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) #== 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) #== 45
p find_fibonacci_index_by_length(100) #== 476
p find_fibonacci_index_by_length(1000) #== 4782
p find_fibonacci_index_by_length(10000) #== 47847