def palindrome_caps string
  words = string.split
  words.each do |word|
    half_size = word.size / 2
    if word[0, half_size] == word[-half_size, half_size].reverse
      word.upcase!
    end
  end

  words.join(' ')
end

puts palindrome_caps 'I love my mom and dad . Oh, a racecar !'
