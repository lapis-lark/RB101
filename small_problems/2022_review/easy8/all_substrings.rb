def leading_substrings(str)
  str.chars.map.with_index { |_, i| str[0..i] }
end

def substrings(str)
  result = []
  str.size.times do |i|
    result << leading_substrings(str[i..-1])
  end

  result.flatten
end

def substrings(str)
  (0...str.size).map { |i| leading_substrings(str[i..-1]) }.flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]