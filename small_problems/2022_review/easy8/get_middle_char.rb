def center_of(str)
  size = str.size
  size.even? ? str[(size / 2 - 1), 2] : str[size / 2]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'