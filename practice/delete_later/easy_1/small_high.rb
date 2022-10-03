def reverse_words(str)
  str = str.split
  str.map { |word| word.size > 4 ? word.reverse : word }.reverse.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS