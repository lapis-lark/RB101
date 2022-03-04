require 'byebug'

def star(n)
  spaces = ' ' * (n / 2 - 1)
  line = "*#{spaces}*#{spaces}*"
  top_lines = [line]

  until spaces.empty?
    spaces.chop!
    line = "*#{spaces}*#{spaces}*".center(n)
    top_lines << line
  end

  puts [top_lines, ('*' * n), top_lines.reverse]
end

def diagonals(height)
  y_vals = (0...height).to_a + height.downto(-height + 1).to_a + (-height...0).to_a
  y_vals += y_vals until y_vals.size > 80
  y_vals.map! { |y| (y - height) * -1 }

  grid = []
  (height * 2 + 1 ).times { grid << (' ' * 80) }

  80.times do |x|
    #byebug
    grid[y_vals[x]][x] = '*'
  end

  grid.each { |line| puts line}
end

def sine_wave(height, freq)
  # generate grid of appropriate size
  grid = []
  (height * 2 + 1 ).times { grid << (' ' * 80) }

  y_vals = (0...80).map { |y| (height * Math.sin(y * freq)).round }
  # change representation of y values to match array index
  # the highest y value (height), for example, becomes 0 since this is the top line of the grid
  y_vals.map! { |y| (y - height) * -1 } 
  80.times { |x| grid[y_vals[x]][x] = '*' }

  grid.each { |line| puts line }
end

sine_wave(1, 0.5)
puts ''
puts ''
sine_wave(2, 0.25)
puts ''
puts ''
sine_wave(10, 0.1)
puts ''
puts ''
sine_wave(10, 0.05)
puts ''
puts ''
sine_wave(10, 0.2)
puts ''
puts ''
sine_wave(10, 0.3)
puts ''
puts ''
sine_wave(10, 0.4)

