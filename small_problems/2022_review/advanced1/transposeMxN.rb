def transpose(matrix)
  new_arr = Array.new(matrix[0].size) { Array.new(matrix.size) }
  matrix[0].size.times do |y|
    matrix.size.times { |x| new_arr[y][x] = matrix[x][y] }
  end
  new_arr
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]