def digit_list(num)
  num.digits.reverse
end

def digit_list(num)
  arr = []
  
  while num > 0
    arr << num % 10
    num /= 10
  end
  
  arr.reverse
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true