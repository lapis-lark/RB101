NUMS = {"0"=>0, "1"=>1, "2"=>2, "3"=>3, "4"=>4,
        "5"=>5, "6"=>6, "7"=>7, "8"=>8, "9"=>9}
=begin
def string_to_signed_integer str
  total = 0
  negative = (str[0] == '-')
  str[0] = '' if %w(+ -).include?(str[0])
  digits = str.chars.map {|x| NUMS[x] }
  digits.each {|n| total = total * 10 + n}
  negative ? total * -1 : total
end
=end

def string_to_integer str
  total = 0
  digits = str.chars.map {|x| NUMS[x] }
  digits.each {|n| total = total * 10 + n}
  total
end

def string_to_signed_integer str
  sign = str[0] == '-' ? -1 : 1
  str = str[1..-1] if %w(+ -).include?(str[0])
  sign * string_to_integer(str)
end


p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100