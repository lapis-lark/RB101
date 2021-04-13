def word_sizes(string)
  word_hash = Hash.new(0)
  string = string.delete('^A-Za-z')
  string.split(' ').each do |word|
    clean_word = word.delete('^A-Za-z')
    word_hash[word.size] += 1
  end
  word_hash
end

p word_sizes('Four score and seven.') #== { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') #== { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") #f== { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}