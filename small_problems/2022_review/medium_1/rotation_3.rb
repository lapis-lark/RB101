=begin
def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(int, r)
  arr = int.digits.reverse
  rotated = arr[0...-r] + rotate_array(arr[-r..-1])
  rotated.join.to_i
end

def max_rotation(int)
  length = int.digits.length
  until length == 1
  int = rotate_rightmost_digits(int, length)
  length -=1
  end
  
  int
end

def max_rotation(int)
  length = int.digits.length
  length.downto(2) { |i| int = rotate_rightmost_digits(int, i) }
  int
end
=end

# further: preserve zeroes

def rotate_str(str)
  str[1..-1] + str[0]
end

def rotate_rightmost_chars(str, r)
  str[0...-r] + rotate_str(str[-r..-1])
end

def max_rotation(int)
  str = int.to_s
  length = str.size
  length.downto(2) { |i| str = rotate_rightmost_chars(str, i) }
  str
end

puts max_rotation(735291) #== 321579
p max_rotation(3) #== 3
p max_rotation(35) #== 53
puts max_rotation(105) #== 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) #== 7_321_609_845