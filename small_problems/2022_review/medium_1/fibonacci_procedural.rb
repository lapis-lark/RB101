def fibonacci(n)
fib = [1, 1]
(n - 2).times { fib.push(fib.shift + fib[-1]) }
fib[-1]
end

p fibonacci(2) == 1
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501