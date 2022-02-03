require 'benchmark'

def find_fibonacci_index_by_length(n)
  fib = [1, 1]
  location = 2

  until fib[-1] / 10**(n - 1) > 0
    fib.push(fib.shift + fib[-1])
    location += 1
  end

  location
end

def launch_solution(number_digits)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= number_digits

    first = second
    second = fibonacci
  end

  index
end

puts 'without type conversion or #size'
puts Benchmark.measure { 
  3.times do
    find_fibonacci_index_by_length(10000) == 47847
  end
}

puts 'with string conversion and #size'
puts Benchmark.measure { 
  3.times do
    launch_solution(10000) == 47847
  end
}