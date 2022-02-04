# LS solution for generating a valid number is easier to read
def featured(num)
  valid = ((num / 7) + 1) * 7
  valid += 7 unless valid.odd?

  loop do
    break valid if valid.digits.uniq == valid.digits
    break "no possible featured number" if valid > 9_876_543_210
    valid += 14
  end
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements