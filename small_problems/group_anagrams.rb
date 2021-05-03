def anagramize(arr)
  anagrams = Hash.new([])
  arr.each do |word|
    anagrams[word.chars.sort.join] << word
  end
  p anagrams.values
end

def anagramize(arr)
  anagrams = Hash.new([])
  arr.each do |word|
    key = word.chars.sort.join
    anagrams[key] += [word]
  end

  anagrams.values.each { |v| p v }
end

words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
         'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
         'flow', 'neon']

anagramize(words)
