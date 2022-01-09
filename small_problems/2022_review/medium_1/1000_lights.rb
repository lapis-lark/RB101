def how_many_lights(lights)
  l_arr = []

  1.upto(lights) do |round|
    (round..lights).step(round) do |l|
      l_arr.include?(l) ? l_arr.delete(l) : l_arr << l
    end
  end

  l_arr
end

p how_many_lights(5)
