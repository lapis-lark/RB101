puts 'how many lights?'
lights = gets.to_i

l_arr = []

1.upto(lights) do |i|
  (i..lights).step(i) do |num|
    l_arr.include?(num) ? l_arr.delete(num) : l_arr << num
  end
end

p l_arr
