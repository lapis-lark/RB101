def leading(str)
  str.chars.map.with_index { |c, i| str[0..i] }
end

def substrings(str)
  substrings = []
  str.size.times { |i| substrings += leading(str[i..-1]) }
  substrings
end

def palindromes(str)
  substrings(str).select do |sub_string|
    sub_string == sub_string.reverse
  end
end

p substrings('puppy')
