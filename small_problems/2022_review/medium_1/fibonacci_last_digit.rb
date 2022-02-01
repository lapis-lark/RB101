def fibonacci_last(n)
  fib = [1, 1]
  (n - 2).times { fib.push((fib.shift + fib[-1]) % 10) }
  
  fib[-1]
  end

# the LS solution is a little more elegant
  
p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4