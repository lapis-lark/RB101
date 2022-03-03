matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

def transpose(matrix)
  new_arr = Array.new(3) { Array.new(3) }
  matrix.size.times do |y|
    matrix.size.times do |x|
      new_arr[x][y] = matrix[y][x] 
    end
  end

  new_arr
end

def transpose!(matrix)
  matrix.size.times do |y|
    (y...matrix.size).each do |x|
      matrix[x][y], matrix[y][x] = matrix[y][x], matrix[x][y] 
    end
  end
end

new_matrix = transpose(matrix)

matrix.each { |line| p line}
puts ''
new_matrix.each { |line| p line}
puts ''

transpose!(matrix)
matrix.each { |line| p line}
