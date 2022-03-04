def rotate90(matrix)
  new_matrix = Array.new(matrix[0].size) { Array.new(matrix.size) }

  new_matrix.size.times do |y|
    new_matrix[0].size.times do |x|
      new_matrix[y][x] = matrix[-1 - x][y]
    end
  end

  new_matrix
end

def rotatex(matrix, deg)
  new_matrix = matrix
  (deg / 90).times { new_matrix = rotate90(new_matrix) }
  new_matrix
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

p rotatex(matrix1, 90) == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p rotatex(matrix1, 180)
p rotatex(matrix1, 270)
p rotatex(matrix2, 360) == rotate90(rotate90(rotate90(rotate90(matrix2))))