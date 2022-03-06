# split into individual words
# upcase first char in each string
# join 

words = "the flintstones rock"

def titleize(str)
  str.split.map { |word| word.capitalize }.join(' ')
end

p titleize(words)