def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(num, digits)
   num = num.digits.reverse
   num = num[0...-digits] + rotate_array(num[-digits..-1])
   num.join.to_i
end

def max_rotation(num)
  num.digits.size.downto(2) do |i|
    num = rotate_rightmost_digits(num, i)
  end
  num
end

p max_rotation(735291) #== 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845