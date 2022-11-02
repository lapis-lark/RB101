def fibonacci(i)
  return 0 if i == 0
  return 1 if i == 1

  fibonacci(i -1) + fibonacci(i - 2)
end

p fibonacci(1) #== 1
p fibonacci(2) #== 1
p fibonacci(3) #== 2
p fibonacci(4) #== 3
p fibonacci(5) #== 5
p fibonacci(12)# == 144
p fibonacci(20) #== 6765