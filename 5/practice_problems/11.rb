arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

new_arr = arr.map do |arr| 
  arr.select { |ele| ele % 3 == 0 }
end
p new_arr