statement = "The Flintstones Rock"
p (statement.chars.each_with_object({}) do |letter, hash|
  hash.key?(letter) ? hash[letter] += 1 : hash[letter] = 1
end)
