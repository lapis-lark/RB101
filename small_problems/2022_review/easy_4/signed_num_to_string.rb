DIGITS = { 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6',
           7 => '7', 8 => '8', 9 => '9', 0 => '0' }

def integer_to_string(int)
  int.digits.inject('') { |str, digit| str.prepend(DIGITS[digit]) }
end

def signed_integer_to_string(num)
  sign = case num <=> 0
         when 1 then '+'
         when -1 then '-'
         else ''
         end
  sign + integer_to_string(num.abs)
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
