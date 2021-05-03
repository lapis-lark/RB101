def twice(num)
  digits = num.digits
  mid = digits.size / 2

  return num * 2 if digits.size.odd?
  return num * 2 if digits[0...mid] != digits[mid..-1]
  num
end

# solution by Pierre-Emmanuel Roussel
def twice(num)
  first, second = num.divmod(10**(num.to_s.size / 2))
  first == second ? num : num * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
