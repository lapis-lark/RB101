def penultimate(str)
  str.split[-2]
end

def middle(str)
  words = str.split
  str.empty? ? '' : words[words.size / 2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
p middle('last word') == 'word'
p middle('Launch School is great!') == 'is'
p middle('') == ''
p middle('hey') == 'hey'