def stringy(num)
  binary = ''
  bool = true

  num.times do
    binary << (bool ? '1' : '0')
    bool = !bool
  end

binary
end

puts stringy(6) #== '101010'
puts stringy(9) #== '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'