def rotate_array(array)
  array[1..-1] + [array[0]]
end

def max_rotation(num)
  if num / 10 == 0
    num
  else
    num = rotate_array(num.to_s.chars)
    num[1..-1] = max_rotation(num[1..-1].join.to_i).to_s.chars
    num.join.to_i
  end
end





p max_rotation(735291)