def substrings(str)
  string_sets = []
  until str.size == 0
    str.size.times { |i| string_sets << str[0..i]}
    str.slice!(0)
  end
  string_sets
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]