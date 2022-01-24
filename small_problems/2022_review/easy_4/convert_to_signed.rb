NUM_HASH = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
             '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }

def string_to_integer(str)
  sum = 0
  place = 1

  str.chars.reverse_each do |n|
    sum += NUM_HASH[n] * place
    place *= 10
  end

  sum
end

def string_to_signed_integer(str)
  case str[0]
  when '0'..'9' then string_to_integer(str)
  when '+' then string_to_integer(str[1..-1])
  when '-' then string_to_integer(str[1..-1]) * -1
  end
end

def string_to_signed_integer(str)
  sign = ''
  sign = str.slice!(0) if ['+','-'].include?(str[0])
  int = string_to_integer(str)
  sign == '-' ? int * -1 : int
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100