def fibonacci(n)  
  n > 2 ? fibonacci(n - 1) + fibonacci(n - 2) : 1
end

def fibonacci(n)
fib_arr = [1, 1]
  (n - 2).times do 
    fib_arr << fib_arr[-1] + fib_arr[-2]
  end
  fib_arr.last
end

p fibonacci(1) == 1
fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
#p fibonacci(100_001) # => 4202692702.....8285979669707537501