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

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
