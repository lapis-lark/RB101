def factorial(num)
  ans = 0
  if (num - 1 == 1)
    num
  else
    num * factorial(num - 1)
  end
end

(5..8).each do |i|
  puts factorial(i)
end