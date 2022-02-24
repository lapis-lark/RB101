def double_consonants(str)
  str.chars.map { |c| c =~ /[aeiou\W_\d]/ ? c : c * 2 }.join
end

def double_consonants(str)
  str.gsub(/./) { |c| c =~ /[aeiou\W_\d]/ ? c : c * 2 }
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""