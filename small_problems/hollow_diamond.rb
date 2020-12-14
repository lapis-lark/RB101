def print_line grid_size, distance_from_center
  num_spaces = grid_size - (distance_from_center * 2) - 2
  if num_spaces < 1
    puts '*'.center(grid_size)
  else
    spaces = ' ' * num_spaces
    puts ('*' + spaces + '*').center(grid_size)
  end
end

def diamond grid_size
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) {|distance| print_line(grid_size, distance)}
  1.upto(max_distance) {|distance| print_line(grid_size, distance)}
end

diamond 11