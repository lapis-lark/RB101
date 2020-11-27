require 'pry'

def stringy(num)
  result = ''
  1.upto(num) do |n|
    #binding.pry
    #parentheses necessary! << binds more tightly than ?:
    result << (n.even? ? '0' : '1')
  end
  result
end

puts stringy(6)
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'