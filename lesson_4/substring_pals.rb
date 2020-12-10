def palindrome_substrings string
  pals = []
  subs = substrings(string)
  subs.each do |word|
    pals << word if palindrome?(word)
  end
  pals.sort
end

def substrings string
  subs = []
  size = string.size
  (2...size).each do |range|
    temp = string.dup
    # binding.pry
    while temp.size > 0
      break unless temp[0, range].size == range
      subs.push(temp[0, range])
      temp.slice!(0)
    end
  end
  subs
end

def palindrome? word
    half_size = word.size / 2
    word[0, half_size] == word[-half_size, half_size].reverse
end


puts palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
puts palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
puts palindrome_substrings("palindrome") == []
puts palindrome_substrings("") == []