def signed_integer_to_string int
  str = int.abs.digits.reverse.join
  case int <=> 0
  when -1 then '-' + str
  when 0 then str
  when 1 then '+' + str end
end



p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'