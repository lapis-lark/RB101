=begin
def integer_to_string int
  array = []
  loop do
    array.unshift(int % 10)
    int /= 10
    break if int == 0
  end
  array.join
end
=end

def integer_to_string(int)
  int.digits.reverse.join
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
p integer_to_string(0o050)
