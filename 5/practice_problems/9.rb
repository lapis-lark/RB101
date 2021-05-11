arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

new_arr = arr.map { |arr| arr.sort { |a, b| b <=> a }}

p new_arr
p arr.object_id
p new_arr.object_id