def fibonacci(num)
  return 1 if num == 1 
  return 0 if num < 1
  return (fibonacci(num - 1) + fibonacci(num - 2))
end

(0..10).each {|n| p fibonacci(n) }