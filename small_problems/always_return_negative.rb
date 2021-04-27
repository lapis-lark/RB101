def negative(num)
  num < 0 ? num : num * -1
end

def negative(num)
  num.abs * -1
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby