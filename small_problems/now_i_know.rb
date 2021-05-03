# test if letter in sentence
# if not, return false
# true at bottom


PAIRS = [["B", "O"], ["X", "K"], ["D", "Q"],
         ["C", "P"], ["N", "A"], ["G", "T"],
         ["R", "E"], ["F", "S"], ["J", "W"], 
         ["H", "U"], ["V", "I"], ["L", "Y"], 
         ["Z", "M"]]

def block_word?(word)
  valid_pairs = PAIRS
  valid = valid_pairs.flatten
  word.upcase.chars.each do |c|
    return false unless valid.include?(c)
    valid_pairs.reject! { |pair| pair.include?(c) }
  end
  true
end

p block_word?('BATCH') #== true
p block_word?('BUTCH') #== false
p block_word?('jest') #== true
p block_word?('hello')
p block_word?('HELLO')
p block_word?('BACK')