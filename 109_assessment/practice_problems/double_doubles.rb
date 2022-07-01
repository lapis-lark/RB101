def twice(num)
  unless (num.to_s[0...(num.digits.size / 2)] * 2).to_i == num
    return num * 2
  end
  num
end

# test if double
# return n if double
# return n*2 if not
p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10
