def word_sizes(string)
  word_hash = Hash.new

  string.split(' ').each do |word|
    if word_hash.has_key?(word.size)
      word_hash[word.size] += 1
    else
      word_hash[word.size] = 1
    end
  end

  word_hash
end

# refactored
def word_sizes(string)
  word_hash = Hash.new(0)
  string.split(' ').each do |word|
      word_hash[word.size] += 1
  end
  word_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}