# generate an array of all substrings up to half the length of str
# concatenate each substring onto itself until it is the length of str
# test if any of the substrings in this arr == str

# input: string
# output: true/false ( true if string is composed of repeating substring)
# data: [array of strings]
# algo: 
  # generate an array of all substrings up to half the length of str
  # concatenate each substring onto itself until it is the length of str
  # test if any of the substrings in this arr == str


def repeated_substring_pattern(str)
  max_length = str.size / 2
  substrings = []

  (0..max_length).each do |index|
    (0..max_length).each do |length|
      substrings << str[index..(index + length)]
    end
  end

  substrings.uniq!
  substrings.map! do |substring|
    new_sub = substring.clone

    loop do
      new_sub << substring
      break if new_sub.size >= str.size
    end

    new_sub
  end
  substrings.any? { |s| s == str }
end

p repeated_substring_pattern('abab')
p repeated_substring_pattern('aba')
p repeated_substring_pattern('abababc')
p repeated_substring_pattern('abcabcabc')