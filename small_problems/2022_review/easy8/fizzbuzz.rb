def fizzbuzz(n1, n2)
  (n1..n2).map do |n|
    case 
    when (n % 5 == 0 && n % 3 == 0) then 'FizzBuzz'
    when (n % 5 == 0) then 'Buzz'
    when (n % 3 == 0) then 'Fizz'
    else n
    end
  end
end

p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz