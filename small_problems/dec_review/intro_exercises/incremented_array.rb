arr = []
10.times { arr << rand(10) }

new_arr = arr.map { |i| i + 2 }

p arr
p new_arr