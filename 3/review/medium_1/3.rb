def factors(number)
  return 0 if number <= 0
  divisor = number
  factors = []
  number.downto(1) do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end

  factors
end

p factors(10)