def palindrome?(str)
  half = str.size / 2
  str[0...half] == str[-half..-1].reverse
end

# derp, just use #reverse
def palindrome?(str)
  str == str.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true