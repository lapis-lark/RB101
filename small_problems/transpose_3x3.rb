def transpose(arr)
  arr[0].zip(arr[1], arr[2])
end

def transpose(matrix)
  size = matrix.size
  rounds = size - 1

  rounds == 0 ? matrix : transpose(matrix)

  end
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]