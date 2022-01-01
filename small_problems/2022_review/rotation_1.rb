# modifies original array
def rotate_array(arr)
  arr.push(arr.shift)
end

# doesn't modify original array
def rotate_array(arr)
  new_arr = arr.clone
  new_arr.push(new_arr.shift)
end

# launch school's solution is cleaner, though! my solving was a little hasty
def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_string(str)
  str[1..-1] + str[0]
end

def rotate_int(int)
int_arr = int.digits.reverse
(int_arr[1..-1] + [int_arr[0]]).join('').to_i
end

p rotate_string('aloha')
p rotate_int(12345)


p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

p x = [1, 2, 3, [4]]
p rotate_array(x) == [2, 3, [4], 1]   # => true
p x == [1, 2, 3, [4]]                 # => true