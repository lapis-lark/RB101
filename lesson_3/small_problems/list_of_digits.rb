def digit_list(num)
  num.to_s.split(//) {|x| x.to_i }
end

p digit_list(12334409)

def digit_list(num)
  num.to_s.chars.map(&:to_i)
end

p digit_list(124409)