def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(num, span)
  num = num.to_s.chars
  num[-span..-1] = rotate_array(num[-span..-1])
  num.join.to_i
end

p rotate_rightmost_digits(73894264, 3)