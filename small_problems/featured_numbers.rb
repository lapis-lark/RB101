def featured(num)
  if num >= 9_999_999_999
    return "-> no featured nums this large"
  end

  next_f = ((num / 7) + 1) * 7
  next_f += 7 unless next_f.odd?

  loop do
    num_arr = next_f.digits.size
    unique = next_f.digits.uniq.size
    break next_f if num_arr == unique
    next_f += 14
  end
end

p featured(12) #== 21
p featured(20) #== 21
p featured(21) #== 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements