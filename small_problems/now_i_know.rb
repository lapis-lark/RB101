# test if letter in sentence
# if not, return false
# true at bottom


PAIRS = [["B", "O"], ["X", "K"], ["D", "Q"],
         ["C", "P"], ["N", "A"], ["G", "T"],
         ["R", "E"], ["F", "S"], ["J", "W"], 
         ["H", "U"], ["V", "I"], ["L", "Y"], 
         ["Z", "M"]]

def block_word?(word)
  valid = PAIRS
  word.upcase.chars.each do |c|
    return false unless valid.flatten.include?(c)
    valid.reject! { |pair| pair.include?(c) }
  end
  true
end

p block_word?('BATCH') #== true
p block_word?('BUTCH') #== false
p block_word?('jest') #== true