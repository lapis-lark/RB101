def fizzbuzz(start, last)
  (start..last).map do |i|
    result = ''
    result << 'Fizz' if i % 3 == 0
    result << 'Buzz' if i % 5 == 0
    result.empty? ? i : result
  end.join(', ')
end

puts fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz