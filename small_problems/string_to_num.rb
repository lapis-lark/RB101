NUMS = {"0"=>0, "1"=>1, "2"=>2, "3"=>3, "4"=>4,
        "5"=>5, "6"=>6, "7"=>7, "8"=>8, "9"=>9,
        'a'=>10, 'b'=>11, 'c'=>12, 'd'=>13,
        'e'=>14, 'f'=>15}

def hexa_to_integer str
  total = 0
  digits = str.chars.map {|x| NUMS[x.downcase] }
  digits.each {|n| total = total * 16 + n}
  total
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p hexa_to_integer('4D9f') == 19871