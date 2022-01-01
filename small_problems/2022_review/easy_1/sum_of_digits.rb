# using #digits
def sum(num)
  num.digits.sum
end

# no #digits
def sum(num)
  num.to_s.chars.map(&:to_i).sum # or .inject(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
