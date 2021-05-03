=begin
def rotate_array(array)
  a = array.dup
  a.push(a.shift)
end
=end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

x = [1, 2, 3, 4]
p rotate_array(x)
p x

def rotate_string(string)
  rotate_array(string.chars).join('')
end

p rotate_string('frappucino')

def rotate_integer(int)
  rotate_array(int.to_s.chars).join('')
end

p rotate_integer(1235654)
