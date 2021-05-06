def transpose(matrix)
  matrix[0].zip(matrix[1], matrix[2])
end

# further exploration; works for any size matrix
def transpose(arr)
  matrix = []
  size = matrix.size
  (size - 1).times do |y|
    ((y + 1)...size).each do |x|
      matrix[y][x], matrix[x][y] = matrix[x][y], matrix[y][x]
    end
  end
  matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]